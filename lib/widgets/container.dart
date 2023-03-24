// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, depend_on_referenced_packages

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yachat/controller/chatController.dart';
import 'package:yachat/screens/Users.dart';
import 'package:yachat/screens/chats_screen.dart';
import 'package:yachat/screens/firstChatScreen.dart';
import 'package:yachat/screens/homepage.dart';
import 'package:yachat/widgets/buttons.dart';
import 'package:yachat/widgets/sizedbox.dart';
import 'package:path/path.dart' as p;

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 135,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 12, color: Colors.black.withOpacity(0.2)),
        ],
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(35)),
        color: Colors.blue.shade900,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              settingIcon!,
            ],
          ),
          Spacer(),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, bottom: 20),
              child: Text(
                'Messages',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}

class FriendsChat extends StatelessWidget {
  const FriendsChat({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(TchatScreen());
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 45,
              backgroundColor: Colors.grey.shade500,
              child: Icon(
                Icons.people,
                size: 35,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                'friends',
                style: TextStyle(
                    color: Color.fromARGB(255, 70, 70, 80),
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                '11:02',
                style: TextStyle(
                    color: Color.fromARGB(255, 70, 70, 80),
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
            ),
          ),
          hSizedBox10!,
          Divider(
            color: Color.fromARGB(255, 91, 91, 115),
            thickness: 1.2,
            endIndent: 5,
            indent: 5,
          )
        ],
      ),
    );
  }
}

class ChatAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      init: ChatController(),
      builder: (controller) {
        return Expanded(
          flex: 5,
          child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    BackButton(
                      onPressed: () {
                        Get.to(ChatsScreen());
                      },
                      color: Colors.black,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await controller.addGImage(context);
                      },
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.black,
                        backgroundImage: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/yachat-77ac7.appspot.com/o/GrpImages?alt=media&token=fac98e0f-a42d-433f-abed-2f9756577fb5'),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'friends',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
