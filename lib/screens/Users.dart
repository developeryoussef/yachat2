// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, file_names, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yachat/screens/chats_screen.dart';
import 'package:yachat/widgets/texts.dart';
import 'package:yachat/widgets/usersdata.dart';
import '../widgets/sizedbox.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
            child: Column(children: [
          Row(
            children: [
              BackButton(
                onPressed: () {
                  Get.to(ChatsScreen());
                },
              ),
              Spacer(),
            ],
          ),
          hSizedBox60!,
          yachatText!,
          hSizedBox30!,
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 17.5, right: 17.5, bottom: 0),
            child: Container(
              child: UserData(),
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
            ),
          ),
        ])));
  }
}
