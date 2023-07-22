import 'package:chat_app/cubits/register/register_cubit.dart';
import 'package:chat_app/views/widgets/register_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  static const id = 'register';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover),
            ),
            child: const RegisterViewBodyBlocConsumer(),
          ),
        ),
      ),
    );
  }
}

