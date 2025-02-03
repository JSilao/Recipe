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
        body: Center(
          child: Text(
            'Recipe not found',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    final Recipe recipe = recipes.firstWhere((r) => r.id == recipeId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          recipe.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recipe Image
              Center(
                child: Image.network(
                  recipe.imageUrl,
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),

              // Recipe Details Card
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildDetailRow('Cuisine', recipe.cuisine),
                      _buildDetailRow('Meal Type', recipe.mealType),
                      _buildDetailRow('Calories', '${recipe.calories} kcal'),
                      _buildDetailRow('Preparation Time', '${recipe.preparationTime} min'),
                      _buildDetailRow('Cooking Time', '${recipe.cookingTime} min'),
                      _buildDetailRow('Rating', '${recipe.rating} ⭐'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Ingredients List
              _buildSectionTitle('Ingredients'),
              _buildListView(recipe.ingredients),

              SizedBox(height: 20),

              // Instructions
              _buildSectionTitle('Instructions'),
              Text(
                recipe.instructions,
                style: TextStyle(fontSize: 18, height: 1.5),
              ),

              SizedBox(height: 20),

              // Add to Cart Button
              ElevatedButton(
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false).addToCart(recipe);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${recipe.title} added to cart!')),
                  );
                },
                child: Text(
                  'Add to Shopping List',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build detail row with title and value
  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  // Helper method to build section title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  // Helper method to build list view of ingredients
  Widget _buildListView(List<String> items) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                '• $item',
                style: TextStyle(fontSize: 18),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
