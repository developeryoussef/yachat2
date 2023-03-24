// ignore_for_file: unused_import, unnecessary_new, prefer_typing_uninitialized_variables, unused_local_variable, prefer_const_constructors, avoid_print, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  TextEditingController? controller;
  GlobalKey<FormState> formState = new GlobalKey<FormState>();
  var signUpName;
  var signUpGmail;
  var signUpPassword;

  Future signUp() async {
    var formdata = formState.currentState;

    if (formdata!.validate()) {
      formdata.save();

      try {
        UserCredential credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: signUpGmail,
          password: signUpPassword,
        );
        return credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    } else {
      print('not validated');
    }
  }

  Future signIn() async {
    var formdata = formState.currentState;

    if (formdata!.validate()) {
      formdata.save();

      try {
        UserCredential credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signUpGmail,
          password: signUpPassword,
        );
        return credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    } else {
      print('not validated');
    }
  }
}
