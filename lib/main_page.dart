// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foottery/models/recipe_model.dart';
import 'package:foottery/pages/history_list_page.dart';
import 'package:foottery/pages/login_page.dart';
import 'package:foottery/pages/recipe_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Recipe> history = [];

  callback(List<Recipe> loadedRecpies) {
    setState(() {
      history = loadedRecpies;
    });
  }

  int _selectedIndex = 0;

  void _navBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    RecipePage(),
    HistoryListPage(),
    LoginPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.lightGreen,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _navBottomBar,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'History'),
          ]),
    );
  }
}
