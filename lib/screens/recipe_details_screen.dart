import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/recipe.dart';
import '../providers/cart_provider.dart';

class RecipeDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String? recipeId = ModalRoute.of(context)?.settings.arguments as String?;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cuisine: ${recipe.cuisine}'),
            Text('Meal Type: ${recipe.mealType}'),
            Text('Calories: ${recipe.calories}'),
            SizedBox(height: 16),
            Text('Ingredients: ${recipe.ingredients.join(', ')}'),
            SizedBox(height: 16),
            Text('Instructions: ${recipe.instructions}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false).addToCart(recipe);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${recipe.title} added to cart!')),
                );
              },
              child: Text('Add to Shopping List'),
            ),
          ],
        ),
      ),
    );
  }
}
