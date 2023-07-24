import 'package:chat_app/cubits/login/login_cubit.dart';
import 'package:chat_app/features/Authintcation/functions/show_snackBar.dart';
import 'package:chat_app/features/Authintcation/widgets/login_view_body.dart';
import 'package:chat_app/features/Authintcation/widgets/login_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const id = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover),
            ),
            child: const LoginViewBodyBlocConsumer(),
          ),
        ),
      ),
    );
  }
}

