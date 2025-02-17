import 'package:flutter/material.dart';
import '../models/recipe.dart';

class CartProvider with ChangeNotifier {
  // List to store recipes in the cart (deep copy of the original recipes)
  final List<Recipe> _recipesInCart = [];

  List<Recipe> get recipesInCart => _recipesInCart;

  // Add a recipe to the cart
  void addToCart(Recipe recipe) {
    // Create a deep copy of the recipe to avoid modifying the original recipe
    Recipe recipeCopy = Recipe(
      id: recipe.id,
      title: recipe.title,
      ingredients: List.from(recipe.ingredients), // Copy ingredients list
      instructions: recipe.instructions,
      calories: recipe.calories,
      cuisine: recipe.cuisine,
      dietary: recipe.dietary,
      meatType: recipe.meatType,
      mealType: recipe.mealType,
      preparationTime: recipe.preparationTime,
      cookingTime: recipe.cookingTime,
      imageUrl: recipe.imageUrl,
      rating: recipe.rating,
      tags: recipe.tags,
      isFavorite: recipe.isFavorite,
    );

    // Check if the recipe is already in the cart
    if (!_recipesInCart.contains(recipeCopy)) {
      _recipesInCart.add(recipeCopy);
      notifyListeners();
    }
  }

  // Remove a recipe from the cart
  void removeFromCart(Recipe recipe) {
    _recipesInCart.remove(recipe);
    notifyListeners();
  }

  void removeIngredientFromCart(Recipe recipe, String ingredientName) {
    int recipeIndex = _recipesInCart.indexOf(recipe);

    if (recipeIndex != -1) {
      // Remove the ingredient by matching the 'name' key in the map
      _recipesInCart[recipeIndex].ingredients.removeWhere(
            (ingredient) => ingredient['name'] == ingredientName,
      );

      // If no ingredients are left, remove the recipe from the cart
      if (_recipesInCart[recipeIndex].ingredients.isEmpty) {
        removeFromCart(recipe);
      }
      notifyListeners();
    }
  }


  // Clear the entire cart (remove all recipes)
  void clearCart() {
    _recipesInCart.clear();
    notifyListeners();
  }
}
