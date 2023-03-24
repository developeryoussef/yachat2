// ignore_for_file: unused_import, prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers, unused_local_variable, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yachat/controller/auth_controller.dart';
import 'package:yachat/screens/chats_screen.dart';
import 'package:yachat/screens/homepage.dart';
import 'package:yachat/screens/signin.dart';
import 'package:yachat/screens/signup.dart';

Widget? signUpScreenB = MaterialButton(
  child: Container(
    child: Center(
      child: Text(
        'Sign Up',
        style: TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.blue.shade900),
      ),
    ),
    width: 325,
    height: 65,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(35),
    ),
  ),
  onPressed: () {
    Get.to(SignUpS());
  },
);

Widget? signInScreenB = MaterialButton(
  child: Container(
    width: 328.5,
    height: 68.5,
    padding: EdgeInsets.all(3.5),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(35),
    ),
    child: Container(
      child: Center(
        child: Text(
          'Sign In',
          style: TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      width: 325,
      height: 65,
      decoration: BoxDecoration(
        color: Colors.blue.shade900,
        borderRadius: BorderRadius.circular(35),
      ),
    ),
  ),
  onPressed: () {
    Get.to(SignInS());
  },
);

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        return MaterialButton(
          child: Container(
            child: Center(
              child: Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            width: 325,
            height: 65,
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
              borderRadius: BorderRadius.circular(35),
            ),
          ),
          onPressed: () async {
            var response = await controller.signUp();
            if (response != null) {
              Get.to(ChatsScreen());
              await FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .set({
                'uid': FirebaseAuth.instance.currentUser!.uid,
                
              });
            }
          },
        );
      },
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        return MaterialButton(
          child: Container(
            child: Center(
              child: Text(
                'Sign In',
                style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            width: 325,
            height: 65,
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
              borderRadius: BorderRadius.circular(35),
            ),
          ),
          onPressed: () async {
            var response = await controller.signIn();
            if (response != null) {
              Get.to(ChatsScreen());
            }
          },
        );
      },
    );
  }
}

Widget? settingIcon = Padding(
  padding: const EdgeInsets.all(8.0),
  child: IconButton(
    onPressed: () async {
      await FirebaseAuth.instance.signOut();

      Get.to(HomePage());
    },
    icon: Icon(
      Icons.arrow_back_ios_new_rounded,
      color: Color.fromARGB(255, 255, 255, 255),
      size: 35,
    ),
  ),
);
