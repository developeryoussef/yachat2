// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yachat/screens/Users.dart';
import 'package:yachat/screens/search.dart';
import 'package:yachat/widgets/container.dart';
import 'package:yachat/widgets/sizedbox.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
        onPressed: () {
          Get.to(SearchingG());
        },
        child: Icon(
          Icons.search,
          color: Color.fromARGB(255, 255, 255, 255),
          size: 20,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          children: [
            HomePageAppBar(),
            hSizedBox10!,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(17),
                  child: Text(
                    'Chats',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            FriendsChat(),
          ],
        ),
      ),
    );
  }
}
