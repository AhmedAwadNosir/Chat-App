import 'package:chat_app/constants.dart';
import 'package:chat_app/features/chat/models/message_model.dart';
import 'package:chat_app/features/chat/wedgits/create_message_container.dart';
import 'package:chat_app/features/chat/wedgits/user_iformation_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'chat_view_list.dart';

class ChatViwBody extends StatefulWidget {
  const ChatViwBody({super.key});

  @override
  State<ChatViwBody> createState() => _ChatViwBodyState();
}

class _ChatViwBodyState extends State<ChatViwBody> {
  final Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
      .collection(kcolectionmessages)
      .orderBy("messagetime", descending: true)
      .snapshots();

  late ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const UserInformatinContainer(),
          Expanded(
            child: StreamBuilder(
              stream: _messageStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<MessageModel> messages = [];
                  for (var docment in snapshot.data!.docs) {
                    messages.add(MessageModel.fromjson(
                        docment.data() as Map<String, dynamic>));
                  }
                  return ChatListView(
                    messages: messages,
                    scrollController: scrollController,
                  );
                } else {
                  return const Text("no messages");
                }
              },
            ),
          ),
          CreateMessageContainer(
            scrollController: scrollController,
          )
        ],
      ),
    );
  }
}
