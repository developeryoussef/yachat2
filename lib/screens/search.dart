// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, file_names, unused_import, unused_field, use_key_in_widget_constructors, unused_local_variable, avoid_unnecessary_containers, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yachat/controller/chatController.dart';
import 'package:yachat/screens/Users.dart';
import 'package:yachat/screens/chats_screen.dart';
import 'package:yachat/screens/firstChatScreen.dart';
import 'package:yachat/widgets/MessagesPart.dart';
import 'package:yachat/widgets/container.dart';
import 'package:yachat/widgets/images.dart';
import 'package:yachat/widgets/messageline.dart';
import 'package:yachat/widgets/textFields.dart';
import 'package:yachat/widgets/texts.dart';
import 'package:yachat/widgets/usersdata.dart';
import '../widgets/sizedbox.dart';

class SearchingG extends StatefulWidget {
  const SearchingG({super.key});

  @override
  State<SearchingG> createState() => _SearchingGState();
}

class _SearchingGState extends State<SearchingG> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchingSessions());
              },
              icon: Icon(Icons.search))
        ],
      ),
    );
  }
}

class SearchingSessions extends SearchDelegate {
  void showAlertDialog(
      BuildContext context, String password, String did, document) {
    TextEditingController _password = new TextEditingController();

    Get.bottomSheet(
      Container(
        height: 300,
        width: double.infinity,
        color: Colors.blueGrey,
        child: Column(
          children: [
            TextFormField(
              controller: _password,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: 'password',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
                onPressed: () async {
                  if (_password.text == password) {
                    Get.to(TchatScreen(
                      did: did,
                    ));
                    await FirebaseFirestore.instance
                        .collection('sessions')
                        .doc(did)
                        .collection('users')
                        .add({
                      'uid': FirebaseAuth.instance.currentUser!.uid,
                    });
                  }
                },
                child: Text('submit'))
          ],
        ),
      ),
    );
  }

  final Stream<QuerySnapshot> sessions =
      FirebaseFirestore.instance.collection('sessions').snapshots();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: sessions.asBroadcastStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return ListView(reverse: true, children: [
            ...snapshot.data!.docs
                .where((QueryDocumentSnapshot<Object?> element) =>
                    element['name']
                        .toString()
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                .map(((QueryDocumentSnapshot<Object?> documentSnapshot) {
              final String name = documentSnapshot['name'];
              final String password = documentSnapshot['password'];
              final String imageUrl = documentSnapshot['imageurl'];
              query = '';
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ListTile(
                      onTap: () {
                        showAlertDialog(context, documentSnapshot['password'],
                            documentSnapshot.id, documentSnapshot);
                      },
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                      subtitle: Text(password),
                      title: Text(name)),
                ),
              );
            }))
          ]);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text('data search'));
  }
}
