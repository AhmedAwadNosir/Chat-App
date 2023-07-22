
import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/views/register_view.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
  runApp(const chatApp());
}

class chatApp extends StatelessWidget {
  const chatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: kPrimarySwatch,
          brightness: Brightness.dark,
          fontFamily: 'Inter',
        ),
        routes: {
          LoginView.id: (context) => const LoginView(),
          RegisterView.id: (context) => const RegisterView(),
        },
        initialRoute: LoginView.id);
  }
}
