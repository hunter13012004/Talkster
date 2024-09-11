import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talkster/controllers/authcontroller.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

var _authcontroller = Get.put(Authcontroller());

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Talkster'),
        actions: [
          IconButton(
              onPressed: () {
                _authcontroller.Logout();
              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
