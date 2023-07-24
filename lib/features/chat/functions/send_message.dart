import 'package:chat_app/constants.dart';
import 'package:chat_app/features/chat/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void>sendMessage(MessageModel message) async{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messages = firestore.collection(kcolectionmessages);
 await messages.add(message.tojson());
}
