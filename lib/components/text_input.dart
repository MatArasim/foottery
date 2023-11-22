// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({super.key, required this.controller, required this.hintText, required this.obscureText});
  
  final controller;
  final String hintText;
  final bool obscureText;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade600)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green)
          ),
          hintText: hintText,
        ),
      ),
      );
  }
}