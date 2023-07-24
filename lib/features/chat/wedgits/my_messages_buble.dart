import 'package:flutter/material.dart';

import 'my_text_container.dart';

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({
    super.key,
    required this.messages,
  });

  final String messages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MyTextContainer(message: messages),
        ],
      ),
    );
  }
}
