// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talkster/Screens/homepage.dart';
import 'package:talkster/Screens/login_page.dart';

class Authcontroller extends GetxController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? user;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();

  Future loginWithEmailandPassword() async {
    final String email = emailcontroller.text.trim();
    final String password = passwordcontroller.text.trim();

    final UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    Get.offAll(() => Homepage());
    if (userCredential != null) {
      user = userCredential.user;

      emailcontroller.clear();
      passwordcontroller.clear();
    } else {
      return null;
    }

    // return user.user!.uid;
  }

  Future RegisterUserWithEmailAndPassword() async {
    final String email = emailcontroller.text.trim();
    final String password = passwordcontroller.text.trim();

    final UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    if (userCredential != null) {
      user = userCredential.user;
      Get.offAll(() => Homepage());

      emailcontroller.clear();
      passwordcontroller.clear();
      namecontroller.clear();
    } else {
      return null;
    }
  }

  Future Logout() async {
    await _firebaseAuth.signOut();
    Get.offAll(() => LoginPage());
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    namecontroller.dispose();
    super.dispose();
  }
}
