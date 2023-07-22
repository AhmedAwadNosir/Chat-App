import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../cubits/login/login_cubit.dart';
import '../../functions/show_snackBar.dart';
import 'login_view_body.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          showSnackBar(context, message: state.errormessage);
        }
        if (state is LoginSuccess) {
          showSnackBar(context, message: "login complete");
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state ==LoginLoding ? true : false ,
          child:const LoginViewBody(),
        );
      },
    );
  }
}
