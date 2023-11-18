// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';


class IngredientTile extends StatelessWidget {
  const IngredientTile({super.key, required this.ingredient, required this.measure});

  final String ingredient;
  final String measure;

  ingredientSerializer(String one, String two){
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
        Text(one, textAlign: TextAlign.left),
        Text(two, textAlign: TextAlign.right)
      ],);
  }

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.lightGreen[100],
      shadowColor: Colors.grey[500],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: Colors.lightGreen
        )
      ),
      child: ListTile(
                title: ingredientSerializer(ingredient, measure),
                        ),
        );
  }
}