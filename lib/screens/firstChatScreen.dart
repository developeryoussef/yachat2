// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, file_names, unused_import, unused_field, use_key_in_widget_constructors, unused_local_variable, avoid_unnecessary_containers, unnecessary_brace_in_string_interps

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:yachat/controller/chatController.dart';
import 'package:yachat/screens/Users.dart';
import 'package:yachat/screens/chats_screen.dart';
import 'package:yachat/widgets/MessagesPart.dart';
import 'package:yachat/widgets/container.dart';
import 'package:yachat/widgets/images.dart';
import 'package:yachat/widgets/textFields.dart';
import 'package:yachat/widgets/texts.dart';
import 'package:yachat/widgets/usersdata.dart';
import '../widgets/sizedbox.dart';
import 'package:flutter/material.dart';

class TchatScreen extends StatelessWidget {
  final String? did;
  const TchatScreen({this.did});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ChatController>(
        builder: (controller) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                ChatAppBar(),
                MessagesPart(did: did),
                Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
                Expanded(
                  flex: 3,
                  child: ChatTextField(),
                ),
                hSizedBox10!,
              ],
            ),
          );
        },
        init: ChatController(),
      ),
    );
  }
}
