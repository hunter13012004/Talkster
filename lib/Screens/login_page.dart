import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talkster/Screens/register_page.dart';
import 'package:talkster/Widget/Custom_text_feilds.dart';
import 'package:talkster/controllers/authcontroller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

var authcontroller = Get.put(Authcontroller());

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUi(),
    );
  }
}

Widget _buildUi() {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome Back',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Glad you came back',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFeilds(
            title: 'Email',
            obscuretext: false,
            controller: authcontroller.emailcontroller,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFeilds(
            title: 'password',
            obscuretext: true,
            controller: authcontroller.passwordcontroller,
          ),
          const SizedBox(
            height: 20,
          ),
          _Submitbutton(),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account '),
              GestureDetector(
                onTap: () {
                  Get.to(() => RegisterPage());
                },
                child: Text(
                  'Sigup Now',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

Widget _Submitbutton() {
  return GestureDetector(
    onTap: () async {
      await authcontroller.loginWithEmailandPassword();
    },
    child: Center(
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(color: Colors.blue),
        child: Center(
            child: Text(
          'Login',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )),
      ),
    ),
  );
}
