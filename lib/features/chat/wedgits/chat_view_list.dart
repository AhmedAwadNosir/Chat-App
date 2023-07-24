import 'package:chat_app/features/chat/models/message_model.dart';
import 'package:chat_app/features/chat/wedgits/buble_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'my_messages_buble.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key, required this.messages, required this.scrollController});
  final List<MessageModel> messages;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      controller: scrollController,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        var uid = FirebaseAuth.instance.currentUser!.uid;
        if (messages[index].senderId == uid) {
          return MyMessageBubble(messages: messages[index].content);
        } else {
          return BubleMessage(message: messages[index]);
        }
      },
    );
  }
}
