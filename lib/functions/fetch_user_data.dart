import 'dart:developer';

import 'package:chat_app/constants.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<UserModel> fetchUserData(UserCredential userCredential) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = firestore.collection(kcolectionusers);
  var user = await users.doc(userCredential.user!.uid).get();
  UserModel userModel = UserModel.fromjson(user.data() as Map<String, dynamic>);
  log(userModel.userName!);
  return userModel;
}
