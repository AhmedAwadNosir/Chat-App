import 'package:flutter/material.dart';

import 'my_messages_buble.dart';

class ChatListView extends StatelessWidget {
  ChatListView({super.key});
  List<String> messages = [
    "ahmed alprens fuck your mother sun of dog ",
    "ahmed alprens fuck your mother sun of dog ",
    "ahmed alprens fuck your mother sun of dog ",
    "ahmed alprens fuck your mother sun of dog ",
    "ahmed alprens fuck your mother sun of dog ",
    "ahmed alprens fuck your mother sun of dog ",
    "ahmed alprens fuck your mother sun of dog ",
    "ahmed alprens fuck your mother sun of dog ",
    "ahmed alprens fuck your mother sun of dog ",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return MyMessageBubble(messages: messages[index]);
      },
    );
  }
}
