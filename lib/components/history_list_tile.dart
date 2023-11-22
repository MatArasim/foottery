// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foottery/models/recipe_model.dart';

class HistoryListTile extends StatelessWidget {
  const HistoryListTile({super.key, required this.recipe, required this.onTap});
  final Recipe recipe;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
            color: Colors.lightGreen,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.lightGreen)),
            child: ListTile(
              horizontalTitleGap: 5,
              title: Text(
                recipe.name,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(recipe.imgUrl),
              ),
              trailing: Icon(Icons.arrow_forward, color: Colors.white,),
            )),
      ),
    );
  }
}
