 import 'package:chat_app/features/chat/wedgits/create_message_container.dart';
import 'package:chat_app/features/chat/wedgits/user_iformation_container.dart';
import 'package:flutter/material.dart';

import 'chat_view_list.dart';

class ChatViwBody extends StatelessWidget {
  const ChatViwBody({super.key});

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Column(
        children: [
          const UserInformatinContainer(),
          Expanded(
            child:  ChatListView(),
                  ),
         const CreateMessageContainer()
        ],
      ),
    );
  }
}


  
