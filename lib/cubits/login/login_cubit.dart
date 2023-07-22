import 'package:bloc/bloc.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  void login({required String email, required String password}) async {
    emit(LoginLoding());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure('Wrong password provided for that user.'));
      }
    }
  }
}
