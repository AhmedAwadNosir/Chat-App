import 'package:bloc/bloc.dart';
import 'package:chat_app/functions/store_user_data.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  void register(
      {required UserModel userModel, required String password}) async {
    emit(RegisterLoding());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userModel.email!.trim(),
        password: password.trim(),
      );
      await storeUserData(credential, userModel);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure('The account already exists for that email.'));
      }
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}
