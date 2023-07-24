import 'package:flutter/material.dart';

class UserCustomAvatar extends StatelessWidget {
  const UserCustomAvatar({super.key, required this.avatar, required this.hieght, required this.width});
  final String avatar;
  final double hieght, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff00DFC5),
        borderRadius: BorderRadius.circular(22),
      ),
      height: hieght,
      width: width,
      child: Image.asset(avatar),
    );
  }
}
