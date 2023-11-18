// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foottery/components/recipe_info.dart';
import 'package:foottery/components/recipe_ingredients.dart';
import 'package:foottery/components/recipe_instruction.dart';
import 'package:foottery/models/recipe_model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
        name: data['strMeal'],
        instruction: data['strInstructions'],
        imgUrl: data['strMealThumb'],
        ingredients: ingredients,
        measure: measure);
    recipes.clear();
    recipes.add(recipe);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.lightGreen,
              unselectedItemColor: Colors.grey[500],
              items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await getRequest();
                setState((){});
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
            backgroundColor: Colors.white,
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
                      RecipeInstruction(instruction: recipes.last.instruction)
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
