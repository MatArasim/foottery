// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  const BigButton({super.key, required this.onTap, required this.buttonText});

  final Function()? onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.lightGreen, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
