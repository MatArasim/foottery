// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class RecipeInfo extends StatefulWidget {
  const RecipeInfo({super.key, required this.name, required this.imgUrl});

  final String name;
  final String imgUrl;

  @override
  State<RecipeInfo> createState() => _RecipeInfoState();
}

class _RecipeInfoState extends State<RecipeInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.name,
                style: GoogleFonts.nunito(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(widget.imgUrl),
        ),
      ],
    );
  }
}
