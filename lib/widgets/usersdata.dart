// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, file_names, unused_import, unused_field, use_key_in_widget_constructors, unused_local_variable, avoid_unnecessary_containers, unnecessary_brace_in_string_interps

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yachat/screens/chats_screen.dart';
import 'package:yachat/widgets/texts.dart';
import '../widgets/sizedbox.dart';

class UserData extends StatelessWidget {
  final Stream<QuerySnapshot> usersData =
      FirebaseFirestore.instance.collection('users').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: usersData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Center(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    child: Icon(
                      Icons.person,
                      color: Colors.blue.shade900,
                    ),
                  ),
                  title: Text(
                    '${data['username']}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        }
        return Text('error');
      },
    );
  }
}
