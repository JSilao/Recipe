import 'package:flutter/material.dart';
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
  List<String> _selectedTags = [];
  int? _selectedMaxPreparationTime;
  int? _selectedMaxCookingTime;

  // Function to handle the search input
  void _handleSearch() {
    List<Recipe> filtered = recipes;

    // Filter by search query
    if (_controller.text.isNotEmpty) {
      filtered = filtered.where((recipe) {
        return recipe.title.toLowerCase().contains(_controller.text.toLowerCase()) ||
            recipe.ingredients.any((ingredient) =>
                ingredient['name']!.toLowerCase().contains(_controller.text.toLowerCase())
            );
      }).toList();
    }

    setState(() {
      _filteredRecipes = filtered;
    });
  }

  // Function to clear selected filters
  void _clearFilter(String filterType) {
    setState(() {
      if (filterType == 'mealType') {
        _selectedMealType = '';
      } else if (filterType == 'meatType') {
        _selectedMeat = '';
      } else if (filterType == 'dietary') {
        _selectedHealth = [];
      } else if (filterType == 'tags') {
        _selectedTags = [];
      } else if (filterType == 'preparationTime') {
        _selectedMaxPreparationTime = null;
      } else if (filterType == 'cookingTime') {
        _selectedMaxCookingTime = null;
      }

      _filteredRecipes = recipes.where((recipe) {
        bool matchesFilters = true;
        if (_selectedMealType.isNotEmpty && recipe.mealType != _selectedMealType) {
          matchesFilters = false;
        }
        if (_selectedMeat.isNotEmpty && recipe.meatType != _selectedMeat) {
          matchesFilters = false;
        }
        if (_selectedHealth.isNotEmpty && !_selectedHealth.every((diet) => recipe.dietary.contains(diet))) {
          matchesFilters = false;
        }
        if (_selectedMaxPreparationTime != null && recipe.preparationTime > _selectedMaxPreparationTime!) {
          matchesFilters = false;
        }
        if (_selectedMaxCookingTime != null && recipe.cookingTime > _selectedMaxCookingTime!) {
          matchesFilters = false;
        }
        if (_selectedTags.isNotEmpty && !_selectedTags.every((tag) => recipe.tags.contains(tag))) {
          matchesFilters = false;
        }
        return matchesFilters;
      }).toList();
    });
  }
  Widget _buildFilterChip(String label, String filterType) {
    return FilterChip(
      label: Text(
        label,
        style: TextStyle(fontSize: 14), // Consistent font size
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Soft rounded edges
      ),
      backgroundColor: Colors.blue[100], // Light background
      onSelected: (bool selected) {}, // Prevents toggling
      onDeleted: () => _clearFilter(filterType),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back button
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity, // Makes the search bar take up the full width
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Search',
                filled: true,
                fillColor: Colors.white, // Set search bar background to white
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 16), // Adjust the vertical padding for a smaller height
              ),
              style: TextStyle(fontSize: 18), // Increase font size for larger text
              onChanged: (_) => _handleSearch(),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          // Display selected filters
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: SizedBox(
              width: double.infinity, // Ensures full width
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
                children: [
                  if (_selectedMealType.isNotEmpty)
                    _buildFilterChip('Meal: $_selectedMealType', 'mealType'),
                  if (_selectedMeat.isNotEmpty)
                    _buildFilterChip('Meat: $_selectedMeat', 'meatType'),
                  if (_selectedHealth.isNotEmpty)
                    _buildFilterChip('Dietary: ${_selectedHealth.join(', ')}', 'dietary'),
                  if (_selectedTags.isNotEmpty)
                    _buildFilterChip('Tags: ${_selectedTags.join(', ')}', 'tags'),
                  if (_selectedMaxPreparationTime != null)
                    _buildFilterChip('Max Prep Time: $_selectedMaxPreparationTime', 'preparationTime'),
                  if (_selectedMaxCookingTime != null)
                    _buildFilterChip('Max Cook Time: $_selectedMaxCookingTime', 'cookingTime'),
                ].map((widget) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0), // Space between chips
                  child: widget,
                )).toList(),
              ),
            ),
          ),

          // Filter button section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight, // Align the button to the right
              child: ElevatedButton(
                onPressed: () async {
                  final filters = await showDialog<Map<String, dynamic>>(
                    context: context,
                    builder: (context) => FilterDialog(
                      selectedMealTypes: _selectedMealType.isNotEmpty ? [_selectedMealType] : [],
                      selectedMeatTypes: _selectedMeat.isNotEmpty ? [_selectedMeat] : [],
                      selectedDietary: _selectedHealth,
                      selectedTags: _selectedTags,
                    ),
                  );

                  if (filters != null) {
                    // Apply the filters and update the recipe list
                    setState(() {
                      _selectedMealType = filters['mealType'];
                      _selectedMeat = filters['meatType'];
                      _selectedHealth = List<String>.from(filters['dietary']);
                      _selectedMaxPreparationTime = filters['maxPreparationTime'];
                      _selectedMaxCookingTime = filters['maxCookingTime'];
                      _selectedTags = List<String>.from(filters['tags']);

                      _filteredRecipes = recipes.where((recipe) {
                        bool matchesFilters = true;
                        if (_selectedMealType.isNotEmpty && recipe.mealType != _selectedMealType) {
                          matchesFilters = false;
                        }
                        if (_selectedMeat.isNotEmpty && recipe.meatType != _selectedMeat) {
                          matchesFilters = false;
                        }
                        if (_selectedHealth.isNotEmpty && !_selectedHealth.every((diet) => recipe.dietary.contains(diet))) {
                          matchesFilters = false;
                        }
                        if (_selectedTags.isNotEmpty && !_selectedTags.every((tag) => recipe.tags.contains(tag))) {
                          matchesFilters = false;
                        }
                        return matchesFilters;
                      }).toList();
                    });
                  }
                },
                child: Text(
                  'Filter',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Green background for the filter button
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Rounded corners for the button
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Recipe list section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Padding around the list
              child: ListView.builder(
                itemCount: _filteredRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = _filteredRecipes[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/recipeDetails',
                        arguments: recipe.id,
                      );
                    },
                    child: Card(
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Display the image
                          Image.network(
                            recipe.imageUrl,
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Recipe title
                                Text(
                                  recipe.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // Meal type
                                Text(
                                  recipe.mealType,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // Display dietary tags (if any)
                                Wrap(
                                  spacing: 6,
                                  children: recipe.dietary.map((diet) {
                                    return Chip(
                                      label: Text(diet),
                                      backgroundColor: Colors.green[100],
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}