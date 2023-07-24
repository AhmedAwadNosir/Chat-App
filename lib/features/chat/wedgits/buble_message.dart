import 'package:chat_app/features/chat/wedgits/text_container.dart';
import 'package:chat_app/features/chat/wedgits/user_custom_avatar.dart';
import 'package:flutter/material.dart';

import '../models/message_model.dart';

class BubleMessage extends StatelessWidget {
  const BubleMessage({super.key, required this.message});
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 20, top: 20),
      child: Row(
        children: [
          UserCustomAvatar(avatar: message.avatar, hieght: 75, width: 75),
          TextContainer(message: message.content),
        ],
      ),
    );
  }
}
