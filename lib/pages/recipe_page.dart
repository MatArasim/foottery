// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foottery/components/recipe_info.dart';
import 'package:foottery/components/recipe_ingredients.dart';
import 'package:foottery/components/recipe_instruction.dart';
import 'package:foottery/models/recipe_model.dart';
import 'package:http/http.dart' as http;

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final List<Recipe> recipes = [];

  Future getRequest() async {
    List<String> ingredients = [];
    List<String> measure = [];

    var response =
        await http.get(Uri.https('themealdb.com', '/api/json/v1/1/random.php'));
    var data = jsonDecode(response.body.toString())['meals'][0];
    for (var i = 1; i <= 20; i++) {
      if (data['strIngredient$i'] != ' ' &&
          data['strIngredient$i'] != '' &&
          data['strIngredient$i'] != null &&
          data['strMeasure$i'] != ' ' &&
          data['strMeasure$i'] != '' &&
          data['strMeasure$i'] != null) {
        ingredients.add(data['strIngredient$i']);
        measure.add(data['strMeasure$i']);
      }
    }
    var recipe = Recipe(
      id: data["idMeal"],
      name: data['strMeal'],
      instruction: data['strInstructions'],
      imgUrl: data['strMealThumb'],
      ingredients: ingredients,
      measure: measure,
    );
    recipes.clear();
    recipes.add(recipe);
    FirebaseFirestore.instance.collection('recipies').add({
      'email': FirebaseAuth.instance.currentUser!.email,
      'id': recipes.last.id,
      'imgUrl': recipes.last.imgUrl,
      'name': recipes.last.name,
      'ingredients': recipes.last.ingredients,
      'measure': recipes.last.measure,
      'instruction': recipes.last.instruction,
      'liked': recipes.length,
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                setState(() {});
              },
              backgroundColor: Colors.lightGreen,
              child: Icon(Icons.refresh),
            ),
            appBar: AppBar(
                backgroundColor: Colors.lightGreen,
                title: TabBar(
                  indicatorColor: Colors.lightGreenAccent,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.dining_sharp),
                    ),
                    Tab(
                      icon: Icon(Icons.list),
                    ),
                    Tab(
                      icon: Icon(Icons.description),
                    )
                  ],
                )),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: FutureBuilder(
                future: getRequest(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return TabBarView(children: [
                      RecipeInfo(
                          name: recipes.last.name,
                          imgUrl: recipes.last.imgUrl.toString()),
                      RecipeIngredients(
                          ingredients: recipes.last.ingredients,
                          measures: recipes.last.measure),
                      Padding(
                          padding:
                              EdgeInsetsDirectional.only(top: 10, bottom: 75),
                          child: RecipeInstruction(
                              instruction: recipes.last.instruction))
                    ]);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.lightGreen,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ));
  }
}
