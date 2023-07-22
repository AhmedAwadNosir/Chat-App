import 'dart:developer';

import 'package:chat_app/cubits/register/register_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'avatars_list.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  late String email, password;
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autoValidateMode,
      child: Column(
        children: [
          // const CustomTextFormField(
          //   hintText: 'Enter your name',
          // ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: 'Enter your email',
            onSaved: (value) {
              email = value!;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: 'Enter your password',
            onSaved: (value) {
              password = value!;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const AvatarListWidget(),
          const SizedBox(
            height: 32,
          ),
          CustomButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                BlocProvider.of<RegisterCubit>(context)
                    .register(email: email, password: password);
              } else {
                setState(() {
                  _autoValidateMode = AutovalidateMode.always;
                });
              }
            },
            text: 'Login',
          ),
        ],
      ),
    );
  }
}
