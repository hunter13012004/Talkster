import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talkster/Widget/Custom_text_feilds.dart';
import 'package:talkster/controllers/authcontroller.dart';
import 'package:talkster/controllers/databasecontroller.dart';
import 'package:talkster/controllers/media_controller.dart';
import 'package:talkster/controllers/storagecontroller.dart';
import 'package:talkster/model/user_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

var authcontroller = Get.put(Authcontroller());
var mediacontroller = Get.put(MediaController());
var storagecontroller = Get.put(Storagecontroller());
var dbcontroller = Get.put(Databasecontroller());
File? selectedimage;

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUi(),
    );
  }

  Widget _buildUi() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Text('Hey There!'),
            const SizedBox(
              height: 20,
            ),
            _userProfilePic(),
            const SizedBox(
              height: 20,
            ),
            CustomTextFeilds(
                title: 'Name',
                obscuretext: false,
                controller: authcontroller.namecontroller),
            const SizedBox(
              height: 20,
            ),
            CustomTextFeilds(
                title: 'Email',
                obscuretext: false,
                controller: authcontroller.emailcontroller),
            const SizedBox(
              height: 20,
            ),
            CustomTextFeilds(
                title: 'password',
                obscuretext: true,
                controller: authcontroller.passwordcontroller),
            const SizedBox(
              height: 20,
            ),
            _SignUpButton()
          ],
        ),
      ),
    );
  }

  Widget _userProfilePic() {
    return GestureDetector(
      onTap: () async {
        File? _file = await mediacontroller.pickpfp();
        if (_file != null) {
          setState(() {
            selectedimage = _file;
          });
          print(selectedimage);
        }
      },
      child: CircleAvatar(
        radius: 80,
        backgroundImage: selectedimage != null
            ? FileImage(selectedimage!)
            : const NetworkImage(
                    'https://cdn5.vectorstock.com/i/1000x1000/52/64/default-placeholder-profile-icon-vector-14065264.jpg')
                as ImageProvider,
      ),
    );
  }

  Widget _SignUpButton() {
    return GestureDetector(
      onTap: () async {
        await authcontroller.RegisterUserWithEmailAndPassword();
        print('User Registered successfully');
        print('Data upload started ');

        String? userpfp = await storagecontroller.uploadProfilePic(
            uid: authcontroller.user!.uid, file: selectedimage!);
        print('Image upload success');
        print(userpfp);
        print('Database Creation started ');
        if (userpfp != null) {
          await dbcontroller.createUserProfile(
              usermodel: UserModel(
                  name: authcontroller.namecontroller.text.trim(),
                  uid: authcontroller.user!.uid,
                  pfp: userpfp));
          print('Databse Created successfully ');
        } else {
          return null;
        }
      },
      child: Center(
        child: Container(
          width: 150,
          height: 40,
          decoration: BoxDecoration(border: Border.all()),
          child: const Center(child: Text('Register')),
        ),
      ),
    );
  }
}
