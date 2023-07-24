import 'package:flutter/material.dart';

class MyTextContainer extends StatelessWidget {
  const MyTextContainer({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
      ),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.70,
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xff8817F9), Color(0xffA650FB)]),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            softWrap: true,
            message,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
