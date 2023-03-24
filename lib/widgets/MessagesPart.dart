// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, file_names, unused_import, unused_field, use_key_in_widget_constructors, unused_local_variable, avoid_unnecessary_containers, unnecessary_brace_in_string_interps, sort_child_properties_last, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yachat/controller/chatController.dart';
import 'package:yachat/screens/Users.dart';
import 'package:yachat/screens/chats_screen.dart';
import 'package:yachat/widgets/container.dart';
import 'package:yachat/widgets/images.dart';
import 'package:yachat/widgets/messageline.dart';
import 'package:yachat/widgets/textFields.dart';
import 'package:yachat/widgets/texts.dart';
import 'package:yachat/widgets/usersdata.dart';
import '../widgets/sizedbox.dart';

var currentUser = FirebaseAuth.instance.currentUser!.email;

class MessagesPart extends StatelessWidget {
  final String? did;
  MessagesPart({required this.did});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      init: ChatController(),
      builder: (controller) {
        return Expanded(
          flex: 35,
          child: Container(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('sessions')
                  .doc(did)
                  .collection('messages')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  return ListView(
                    reverse: true,
                    children: snapshot.data!.docs.reversed
                        .map((DocumentSnapshot document) {
                      return MessageLine(
                        docid: document.id,
                        data: document.data()! as Map<String, dynamic>,
                      );
                    }).toList(),
                  );
                }
                return Text(
                  'Hello',
                  style: TextStyle(color: Colors.white),
                );
              },
            ),
            decoration: BoxDecoration(color: Colors.blue
                // image: DecorationImage(
                //     fit: BoxFit.cover,
                //     image: NetworkImage(
                //         'https://w0.peakpx.com/wallpaper/508/606/HD-wallpaper-whatsapp-l-background-doodle-pattern-patterns.jpg'))
                ),
          ),
        );
      },
    );
  }
}
