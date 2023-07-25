import 'package:chat_app/features/chat/functions/send_message.dart';
import 'package:chat_app/features/chat/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../functions/get_my_avatar.dart';

class CreateMessageContainer extends StatefulWidget {
  const CreateMessageContainer({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  State<CreateMessageContainer> createState() => _CreateMessageContainerState();
}

class _CreateMessageContainerState extends State<CreateMessageContainer> {
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late String content;
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      color: const Color(0xff1F1F1F),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.attach_file,
                size: 35,
                color: Color(0xff5B0DA9),
              ),
            ),
            Container(
              width: 250,
              decoration: BoxDecoration(
                color: const Color(0xff252525),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                    hintText: "Tape your message",
                    hintStyle: const TextStyle(
                      color: Color(0xff444444),
                    ),
                    enabledBorder: border(
                      color: const Color(0xff252525),
                    ),
                    focusedBorder: border(color: const Color(0xff5B0DA9))),
                onChanged: (value) {
                  content = value;
                },
                onSubmitted: (value) async {
                  await onSubmitted(value);
                },
              ),
            ),
            Transform.rotate(
              angle: -45 / 70, // Rotate the icon by 45 degrees
              child: IconButton(
                onPressed: () async {
                  await onSubmitted(content);
                },
                icon: const Icon(
                  Icons.send,
                  size: 40,
                  color: Color(0xff5B0DA9),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onSubmitted(String value) async {
    MessageModel messageModel = MessageModel(
        content: value,
        avatar: await getMyAvatar(),
        messagetime: Timestamp.now(),
        senderId: FirebaseAuth.instance.currentUser!.uid);
    sendMessage(messageModel);
    widget.scrollController.animateTo(0.0,
        duration: const Duration(seconds: 1), curve: Curves.easeIn);
    textEditingController.clear();
  }
}

OutlineInputBorder border({required Color color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: color,
    ),
  );
}
