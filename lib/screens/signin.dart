// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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

class SignInS extends StatelessWidget {
  const SignInS({super.key});

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
                signInText!,
                Form(
                  key: controller.formState,
                  child: Column(
                    children: [
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
                SignInButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}
