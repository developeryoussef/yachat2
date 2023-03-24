// ignore_for_file: unused_import, unnecessary_new, prefer_typing_uninitialized_variables, unused_local_variable, prefer_const_constructors, avoid_print, prefer_interpolation_to_compose_strings, file_names, await_only_futures, unnecessary_null_comparison, depend_on_referenced_packages, unused_element

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:yachat/screens/chats_screen.dart';
import 'package:yachat/screens/firstChatScreen.dart';
import 'package:yachat/widgets/container.dart';

class ChatController extends GetxController {
  TextEditingController? controller = TextEditingController();
  var message;
  var sender;
  File? file;
  String? imageURL;

  addGImage(BuildContext context) async {
    var imageP = await ImagePicker();
    var picked = await imageP.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Wait'),
            content: CircularProgressIndicator(),
          );
        },
      );

      file = File(picked.path);

      var imagename = p.basename(picked.path);
      Reference ref = await FirebaseStorage.instance.ref('GrpImages');
      await ref.putFile(file!);
      imageURL = await ref.getDownloadURL();
      await FirebaseFirestore.instance
          .collection('logo')
          .doc('mohanadlogo1102')
          .set({
        'imageUrl': imageURL,
      });

      Get.to(ChatsScreen());
    }
  }

  addImage() async {
    var random = Random().nextInt(100000000);

    var imageP = await ImagePicker();
    var picked = await imageP.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      file = File(picked.path);

      var imagename = p.basename(picked.path);
      imagename = '$random$imagename';
      Reference ref =
          await FirebaseStorage.instance.ref('images').child(imagename);
      await ref.putFile(file!);
      imageURL = await ref.getDownloadURL();
      await FirebaseFirestore.instance.collection('messages').add({
        'imageUrl': imageURL,
        'type': 'image',
        'sender': FirebaseAuth.instance.currentUser!.email,
        'time': FieldValue.serverTimestamp(),
      });
      Get.to(TchatScreen());
    }
  }

  clearMessage() {
    controller?.clear();
    update();
  }
}
