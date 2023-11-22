// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:foottery/components/recipe_ingredients.dart';
import 'package:foottery/components/recipe_instruction.dart';
import 'package:foottery/models/recipe_model.dart';

class SelectedRecipePage extends StatelessWidget {
  const SelectedRecipePage({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(recipe.name),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.lightGreen.shade400),
              child: TabBar(
                indicatorColor: Colors.lightGreenAccent,
                tabs: [
                  Tab(
                    icon: Icon(Icons.description),
                  ),
                  Tab(
                    icon: Icon(Icons.list),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                RecipeInstruction(instruction: recipe.instruction),
                RecipeIngredients(ingredients: recipe.ingredients, measures: recipe.measure),
                
              ]),
            )
          ],
        ),
      ),
    );
  }
}
