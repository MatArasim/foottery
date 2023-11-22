// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foottery/components/ingredient_tile.dart';

class RecipeIngredients extends StatelessWidget {
  const RecipeIngredients(
      {super.key, required this.ingredients, required this.measures});

  final List<String> ingredients;
  final List<String> measures;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: ListView.builder(
              padding: EdgeInsetsDirectional.only(top: 10,bottom: 75),
              itemCount: ingredients.length,
              itemBuilder: (context, index) {
                return IngredientTile(
                    ingredient: ingredients[index], measure: measures[index]);
              }),
        ),
      ],
    );
  }
}
