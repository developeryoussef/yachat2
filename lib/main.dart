// ignore_for_file: use_build_context_synchronously, unused_local_variable, avoid_print, avoid_function_literals_in_foreach_calls, prefer_const_constructors, unrelated_type_equality_checks, prefer_const_literals_to_create_immutables, unused_import, unnecessary_null_comparison, unnecessary_new, prefer_typing_uninitialized_variables

import 'dart:math';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:yachat/screens/chats_screen.dart';
import 'package:yachat/screens/firstChatScreen.dart';
import 'package:yachat/screens/homepage.dart';
import 'package:yachat/screens/signup.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

bool? isLogin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    isLogin = false;
  } else {
    isLogin = true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLogin == false ? HomePage() : ChatsScreen(),
    );
  }
}
