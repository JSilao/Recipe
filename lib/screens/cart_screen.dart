import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Track expanded state for each recipe
  Map<String, bool> expandedRecipes = {};

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Shopping List')),
      body: cart.recipesInCart.isEmpty
          ? Center(child: Text('No items in the shopping list'))
          : ListView.builder(
        itemCount: cart.recipesInCart.length,
        itemBuilder: (context, recipeIndex) {
          final recipe = cart.recipesInCart[recipeIndex];
          final isExpanded = expandedRecipes[recipe.title] ?? false;

          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                // Meal Title (Clickable to Expand)
                ListTile(
                  title: Text(
                    recipe.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                    overflow: TextOverflow.ellipsis, // Prevent overflow
                    maxLines: 1, // Allow only one line for the title
                  ),
                  trailing: Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.blueAccent,
                  ),
                  onTap: () {
                    setState(() {
                      expandedRecipes[recipe.title] = !isExpanded;
                    });
                  },
                ),

                // Ingredients List (Shown when Expanded)
                if (isExpanded)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: recipe.ingredients.map((ingredient) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "${ingredient['name']} - ${ingredient['measurement']}",
                                  style: TextStyle(fontSize: 18),
                                  overflow: TextOverflow.ellipsis, // Prevent overflow
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  cart.removeIngredientFromCart(recipe, ingredient['name']!);
                                },
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
