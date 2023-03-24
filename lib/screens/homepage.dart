// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:yachat/widgets/buttons.dart';
import 'package:yachat/widgets/images.dart';
import 'package:yachat/widgets/sizedbox.dart';
import 'package:yachat/widgets/texts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            hSizedBox170!,
            welcomeText!,
            hSizedBox120!,
            signUpScreenB!,
            hSizedBox30!,
            signInScreenB!,
          ],
        ),
      ),
    );
  }
}
