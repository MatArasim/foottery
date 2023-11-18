// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeInfo extends StatelessWidget {
  const RecipeInfo({super.key, required this.name, required this.imgUrl});

  final String name;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          style: GoogleFonts.nunito(fontSize: 30),
          textAlign: TextAlign.center,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(imgUrl),
        ),
      ],
    );
  }
}
