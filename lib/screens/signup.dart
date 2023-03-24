// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:yachat/controller/auth_controller.dart';
import 'package:yachat/screens/chats_screen.dart';
import 'package:yachat/widgets/buttons.dart';
import 'package:yachat/widgets/images.dart';
import 'package:yachat/widgets/sizedbox.dart';
import 'package:yachat/widgets/textFields.dart';
import 'package:yachat/widgets/texts.dart';

class SignUpS extends StatefulWidget {
  const SignUpS({super.key});

  @override
  State<SignUpS> createState() => _SignUpSState();
}

class _SignUpSState extends State<SignUpS> {
  getUser() async {
    var gg = await FirebaseAuth.instance.currentUser?.email;
    print(gg);
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return SafeArea(
            child: ListView(
              children: [
                hSizedBox90!,
                yachatText!,
                hSizedBox20!,
                signUpText!,
                Form(
                  key: controller.formState,
                  child: Column(
                    children: [
                      AuthTextFormField(
                        onSaved: (p0) {
                          controller.signUpName = p0;
                        },
                        keyboardType: TextInputType.name,
                        hint: 'name',
                        obscureText: false,
                      ),
                      hSizedBox30!,
                      AuthTextFormField(
                        onSaved: (p0) {
                          controller.signUpGmail = p0;
                        },
                        keyboardType: TextInputType.emailAddress,
                        hint: 'email',
                        obscureText: false,
                      ),
                      hSizedBox30!,
                      AuthTextFormField(
                        onSaved: (p0) {
                          controller.signUpPassword = p0;
                        },
                        keyboardType: TextInputType.text,
                        hint: 'password',
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                hSizedBox50!,
                SignUpButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}
