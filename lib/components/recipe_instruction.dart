// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeInstruction extends StatelessWidget {
  const RecipeInstruction({super.key, required this.instruction});

  final String instruction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Text(
              instruction,
              style: GoogleFonts.nunito(
                fontSize: 18,
              ),
            ),
          ),
        )
      ],
    );
  }
}
