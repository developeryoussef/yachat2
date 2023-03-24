// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, file_names, unused_import, unused_field, use_key_in_widget_constructors, unused_local_variable, avoid_unnecessary_containers, unnecessary_brace_in_string_interps, sort_child_properties_last, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yachat/controller/chatController.dart';
import 'package:yachat/screens/Users.dart';
import 'package:yachat/screens/chats_screen.dart';
import 'package:yachat/widgets/MessagesPart.dart';
import 'package:yachat/widgets/container.dart';
import 'package:yachat/widgets/imagemessage.dart';
import 'package:yachat/widgets/images.dart';
import 'package:yachat/widgets/textFields.dart';
import 'package:yachat/widgets/textmessage.dart';
import 'package:yachat/widgets/texts.dart';
import 'package:yachat/widgets/usersdata.dart';
import '../widgets/sizedbox.dart';

class MessageLine extends StatelessWidget {
  final dynamic data;
  final dynamic docid;
  MessageLine({required this.data, required this.docid});

  CollectionReference notesref =
      FirebaseFirestore.instance.collection('messages');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: data['type'] == 'image'
          ? ImageMessage(data: data, docid: docid)
          : TextMessage(data: data, docid: docid),
    );
  }
}
