import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/recipe.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Recipe> selectedRecipes = Provider.of<List<Recipe>>(context);

    List<String> getShoppingList() {
      List<String> list = [];
      selectedRecipes.forEach((recipe) {
        list.addAll(recipe.ingredients);
      });
      return list.toSet().toList();
    }

    return Scaffold(
      appBar: AppBar(title: Text('Shopping List')),
      body: ListView.builder(
        itemCount: getShoppingList().length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(getShoppingList()[index]));
        },
      ),
    );
  }
}
