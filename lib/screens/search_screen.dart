import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:provider/provider.dart';
import '../models/recipe.dart';
import '../dialogs/filter_dialog.dart'; // Import the filter dialog

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Recipe> _filteredRecipes = recipes;
  List<String> _selectedHealth = [];
  String _selectedMeat = '';
  String _selectedMealType = '';

  // Function to handle the search input
  void _handleSearch() {
    List<Recipe> filtered = recipes;

    // Filter by search query
    if (_controller.text.isNotEmpty) {
      filtered = filtered.where((recipe) {
        return recipe.title.toLowerCase().contains(_controller.text.toLowerCase()) ||
            recipe.ingredients.any((ingredient) => ingredient.toLowerCase().contains(_controller.text.toLowerCase()));
      }).toList();
    }

    // Apply other filters here...
    // You can add logic for applying other filters like health, meal type, etc.

    setState(() {
      _filteredRecipes = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        actions: [
          // Bright red filter button
          IconButton(
            icon: Icon(Icons.filter_list),
            color: Colors.red, // Bright red color for the filter button
            onPressed: () async {
              final filters = await showDialog<Map<String, dynamic>>(
                context: context,
                builder: (context) => FilterDialog(
                  selectedMealTypes: _selectedMealType.isNotEmpty ? [_selectedMealType] : [],
                  selectedMeatTypes: _selectedMeat.isNotEmpty ? [_selectedMeat] : [],
                  selectedDietary: _selectedHealth,
                  selectedMaxPreparationTime: null, // Example: You can set default filter values here
                  selectedMaxCookingTime: null, // Example: Set max cooking time to null initially
                  selectedTags: [], // Example: Empty tags initially
                ),
              );

              if (filters != null) {
                // Apply the filters and update the recipe list
                setState(() {
                  _selectedMealType = filters['mealType'];
                  _selectedMeat = filters['meatType'];
                  _selectedHealth = List<String>.from(filters['dietary']);
                  // Apply other filters like preparation time, cooking time, tags, etc.
                  _filteredRecipes = recipes.where((recipe) {
                    bool matchesFilters = true;
                    // Implement filtering logic based on selected filters
                    if (_selectedMealType.isNotEmpty && recipe.mealType != _selectedMealType) {
                      matchesFilters = false;
                    }
                    if (_selectedMeat.isNotEmpty && recipe.meatType != _selectedMeat) {
                      matchesFilters = false;
                    }
                    if (_selectedHealth.isNotEmpty && !_selectedHealth.every((diet) => recipe.dietary.contains(diet))) {
                      matchesFilters = false;
                    }
                    return matchesFilters;
                  }).toList();
                });
              }
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Search'),
              onChanged: (_) => _handleSearch(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredRecipes.length,
              itemBuilder: (context, index) {
                final recipe = _filteredRecipes[index];
                return ListTile(
                  title: Text(recipe.title),
                  subtitle: Text(recipe.mealType),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/recipeDetails',
                      arguments: recipe.id,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
