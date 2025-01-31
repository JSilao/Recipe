import 'package:flutter/material.dart';
import '../models/recipe.dart';

class MenuPlanScreen extends StatefulWidget {
  @override
  _MenuPlanScreenState createState() => _MenuPlanScreenState();
}

class _MenuPlanScreenState extends State<MenuPlanScreen> {
  List<Recipe> _menuPlan = [];

  void _handleAddToMenu(Recipe recipe) {
    setState(() {
      _menuPlan.add(recipe);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meal Plan')),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            title: Text(recipe.title),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _handleAddToMenu(recipe),
            ),
          );
        },
      ),
    );
  }
}
