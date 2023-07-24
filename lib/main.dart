import 'package:chat_app/features/chat/views/chat_view.dart';
import 'package:chat_app/features/Authintcation/views/login_view.dart';
import 'package:chat_app/features/Authintcation/views/register_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          ChatView.id:(context) =>const ChatView()
        },
        initialRoute: LoginView.id);
  }
}
