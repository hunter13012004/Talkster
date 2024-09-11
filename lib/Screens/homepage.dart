import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talkster/controllers/authcontroller.dart';
import 'package:talkster/controllers/databasecontroller.dart';
import 'package:talkster/model/user_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

var _authcontroller = Get.put(Authcontroller());
var dbcontroller = Get.put(Databasecontroller());

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
      body: _buildUi(),
    );
  }

  Widget _buildUi() {
    return _chatlist();
  }

  Widget _chatlist() {
    return StreamBuilder(
      stream: dbcontroller.getUserProfiles(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error No data Found'),
          );
        }
        if (snapshot.hasData) {
          final users = snapshot.data!.docs;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              UserModel user = users[index].data();
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(user.pfp!),
                  ),
                  title: Text(
                    user.name!,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
