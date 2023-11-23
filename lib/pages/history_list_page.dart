// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foottery/components/history_list_tile.dart';
import 'package:foottery/models/recipe_model.dart';
import 'package:foottery/pages/selected_recipe_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryListPage extends StatelessWidget {
  HistoryListPage({super.key});

  List<Recipe> history = [];

  Future<List<Recipe>> getUserHistory() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('recipies')
        .where('email',
            isEqualTo: FirebaseAuth.instance.currentUser!.email.toString())
        .get();

    final recipiesData =
        snapshot.docs.map((e) => Recipe.fromSnapshot(e)).toList();
    return history = recipiesData;
  }

  signOutUser() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
          title: Text(
        'History',
        style: GoogleFonts.nunito(fontSize: 30),
        textAlign: TextAlign.center,
      ),
        actions: [IconButton(onPressed: signOutUser, icon: Icon(Icons.logout))],
      ),
      body: FutureBuilder(
        future: getUserHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: history.length,
                          itemBuilder: (context, index) {
                            Recipe recipe = history[index];
                            return HistoryListTile(
                              recipe: recipe,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedRecipePage(
                                                recipe: recipe)));
                              },
                            );
                          }))
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.lightGreen,
              ),
            );
          }
        },
      ),
    );
  }
}
