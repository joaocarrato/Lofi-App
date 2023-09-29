// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class FieldCamps extends StatelessWidget {
  String text;
  bool isObscure;
  TextEditingController controller;
  FieldCamps({
    super.key,
    required this.text,
    required this.isObscure,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black54,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: text,
          hintStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 18,
          ),
        ),
        obscureText: isObscure,
      ),
    );
  }
}
