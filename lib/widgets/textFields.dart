// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, file_names, unnecessary_import, implementation_imports, use_key_in_widget_constructors, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:yachat/controller/auth_controller.dart';
import 'package:yachat/controller/chatController.dart';

class AuthTextFormField extends StatelessWidget {
  final void Function(String?)? onSaved;
  final String? hint;
  final bool? obscureText;
  final TextInputType? keyboardType;
  const AuthTextFormField({
    required this.hint,
    required this.obscureText,
    required this.keyboardType,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 60,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(blurRadius: 5, color: Colors.black.withOpacity(0.2)),
              ],
            ),
            child: TextFormField(
              onSaved: onSaved,
              controller: controller.controller,
              obscureText: obscureText!,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                  hintText: hint,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    height: 1,
                  )),
            ),
          ),
        );
      },
    );
  }
}

class SignInTextFormField extends StatelessWidget {
  final void Function(String?)? onSaved;
  final String? hint;
  final bool? obscureText;
  final TextInputType? keyboardType;
  const SignInTextFormField({
    this.hint,
    this.obscureText,
    this.keyboardType,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 60,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.2)),
              ],
            ),
            child: TextFormField(
              onSaved: onSaved,
              controller: controller.controller,
              obscureText: obscureText!,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                  hintText: hint,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    height: 1,
                  )),
            ),
          ),
        );
      },
    );
  }
}

class ChatTextField extends StatefulWidget {
  const ChatTextField({super.key});

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controler = TextEditingController();
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<ChatController>(
      init: ChatController(),
      builder: (controller) {
        return Row(
          children: [
            Container(
              width: width - 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color.fromARGB(255, 246, 247, 255),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 14,
                      color: Colors.black.withOpacity(0.7),
                    )
                  ]),
              padding: EdgeInsets.only(left: 28, bottom: 8),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        onChanged: (message) {
                          controller.message = message;
                        },
                        controller: controller.controller,
                        decoration: InputDecoration(
                            hintText: 'message',
                            border: InputBorder.none,
                            hintStyle:
                                TextStyle(height: 4, color: Colors.black)),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                          onPressed: () async {
                            controller.addImage();
                          },
                          icon: Icon(Icons.image)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Center(
              child: FloatingActionButton(
                  backgroundColor: Color.fromARGB(255, 246, 247, 255),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 33,
                    shadows: [
                      BoxShadow(
                          blurRadius: 10, color: Colors.black.withOpacity(0.4))
                    ],
                  ),
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection('sessions')
                        .add({
                      'message': controller.message,
                      'sender': FirebaseAuth.instance.currentUser!.email,
                      'time': FieldValue.serverTimestamp(),
                      'type': 'text',
                    });
                    controller.clearMessage();
                  }),
            ),
          ],
        );
      },
    );
  }
}
