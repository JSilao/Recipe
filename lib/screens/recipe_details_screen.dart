import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String? recipeId = ModalRoute.of(context)?.settings.arguments as String?;

    // Handle the case when recipeId is null
    if (recipeId == null) {
      return Scaffold(
        body: Center(child: Text('Recipe not found')),
      );
    }

    final Recipe recipe = recipes.firstWhere((r) => r.id == recipeId);

    return Scaffold(
      appBar: AppBar(title: Text(recipe.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Cuisine: ${recipe.cuisine}'),
            Text('Meal Type: ${recipe.mealType}'),
            Text('Calories: ${recipe.calories}'),
            SizedBox(height: 16),
            Text('Ingredients: ${recipe.ingredients.join(', ')}'),
            SizedBox(height: 16),
            Text('Instructions: ${recipe.instructions}'),
            ElevatedButton(
              onPressed: () {
                // Add logic for saving to favorites
              },
              child: Text('Save to Favorites'),
            ),
          ],
        ),
      ),
    );
  }
}
