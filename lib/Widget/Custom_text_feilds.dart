import 'package:flutter/material.dart';

class CustomTextFeilds extends StatelessWidget {
  final String title;
  final bool obscuretext;
  final TextEditingController controller;

  CustomTextFeilds(
      {super.key,
      required this.title,
      required this.obscuretext,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscuretext,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide()),
        hintText: title,
      ),
    );
  }
}
