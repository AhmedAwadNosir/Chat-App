import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String content;
  final String avatar;
  final Timestamp messagetime;
  final String senderId;

  MessageModel({
    required this.content,
    required this.avatar,
    required this.messagetime,
    required this.senderId,
  });

  factory MessageModel.fromjson(Map<String, dynamic> json) {
    return MessageModel(
      content: json["content"],
      avatar: json["avatar"],
      messagetime: json["messagetime"],
      senderId: json["senderId"],
    );
  }
  Map<String, dynamic> tojson() {
    return {
      "content": content,
      "avatar": avatar,
      "messagetime": messagetime,
      "senderId": senderId,
    };
  }
}
