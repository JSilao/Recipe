import 'package:flutter/material.dart';
import '../models/recipe.dart';

class CartProvider with ChangeNotifier {
  final List<String> _shoppingList = [];

  List<String> get shoppingList => _shoppingList;

  void addToCart(Recipe recipe) {
    if (!_shoppingList.contains(recipe.title)) {
      _shoppingList.add(recipe.title);
      notifyListeners();
    }
  }

  void removeFromCart(String recipeTitle) {
    _shoppingList.remove(recipeTitle);
    notifyListeners();
  }

  void clearCart() {
    _shoppingList.clear();
    notifyListeners();
  }
}
