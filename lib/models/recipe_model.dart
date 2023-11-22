import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe {
  final String id;
  final String name;
  final String instruction;
  final String imgUrl;
  final List<String> ingredients;
  final List<String> measure;

  Recipe({
    required this.id,
    required this.name,
    required this.instruction,
    required this.imgUrl,
    required this.ingredients,
    required this.measure,
  });

  factory Recipe.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Recipe(
        id: data['id'].toString(),
        name: data['name'],
        instruction: data['instruction'],
        imgUrl: data['imgUrl'].toString(),
        ingredients: List<String>.from(data['ingredients']),
        measure: List<String>.from(data['measure'])
        );
  }
}
