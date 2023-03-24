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
import 'package:yachat/widgets/images.dart';
import 'package:yachat/widgets/textFields.dart';
import 'package:yachat/widgets/texts.dart';
import 'package:yachat/widgets/usersdata.dart';
import '../widgets/sizedbox.dart';

class TextMessage extends StatelessWidget {
  final dynamic data;
  final dynamic docid;
  TextMessage({required this.data, required this.docid});

  CollectionReference notesref =
      FirebaseFirestore.instance.collection('messages');

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Dismissible(
          onDismissed: (direction) async {
            await notesref.doc(docid).delete();
          },
          key: UniqueKey(),
          child: Column(
            crossAxisAlignment: currentUser == data['sender']
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 10),
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    topLeft: currentUser == data['sender']
                        ? Radius.circular(35)
                        : Radius.circular(0),
                    topRight: currentUser != data['sender']
                        ? Radius.circular(35)
                        : Radius.circular(0),
                  ),
                  color: currentUser == data['sender']
                      ? Color.fromARGB(255, 55, 143, 125)
                      : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: currentUser == data['sender']
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        currentUser != data['sender']
                            ? Text(
                                "${data['sender']}",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 55, 143, 125),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Text(
                                'Me',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${data['message']}',
                          style: TextStyle(
                            color: currentUser == data['sender']
                                ? Colors.white
                                : Color.fromARGB(255, 55, 143, 125),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
