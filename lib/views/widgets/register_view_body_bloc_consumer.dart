import 'package:chat_app/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../cubits/register/register_cubit.dart';
import '../../functions/show_snackBar.dart';

class RegisterViewBodyBlocConsumer extends StatelessWidget {
  const RegisterViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          showSnackBar(context, message: state.errorMessage);
        }
        if (state is RegisterSuccess) {
          showSnackBar(context, message: "Register Complete Pls LogIn");
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state == RegisterLoding ? true:false,
          child:const RegisterViewBody(),
        );
      },
    );
  }
}
