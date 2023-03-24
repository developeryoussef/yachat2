// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

// ignore: prefer_const_constructors
Widget? welcomeText = Center(
  child: Text(
    '''
yachat
  ''',
    style: TextStyle(
      fontSize: 55,
      fontWeight: FontWeight.w900,
      color: Color.fromARGB(255, 255, 255, 255),
      fontStyle: FontStyle.italic,
    ),
  ),
);
Widget? yachatText = Center(
  child: Text(
    '''
yachat
  ''',
    style: TextStyle(
      fontSize: 55,
      fontWeight: FontWeight.w900,
      color: Colors.blue.shade900,
      fontStyle: FontStyle.italic,
    ),
  ),
);

Widget? signUpText = Padding(
  padding: const EdgeInsets.all(20),
  child: Text(
    'Create your Account',
    style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w500,
    ),
  ),
);
Widget? signInText = Padding(
  padding: const EdgeInsets.all(20),
  child: Text(
    'Create your Account',
    style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w500,
    ),
  ),
);
