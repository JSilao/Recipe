import 'package:flutter/material.dart';
import '../models/recipe.dart'; // Import the Recipe model

class FilterDialog extends StatefulWidget {
  final List<String> selectedMealTypes;
  final List<String> selectedMeatTypes;
  final List<String> selectedDietary;
  final List<String> selectedTags;

  FilterDialog({
    required this.selectedMealTypes,
    required this.selectedMeatTypes,
    required this.selectedDietary,
    required this.selectedTags,
  });

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  late List<String> _mealTypes;
  late List<String> _meatTypes;
  late List<String> _dietaryPreferences;
  late List<String> _tags;

  late List<String> _availableMealTypes;
  late List<String> _availableMeatTypes;
  late List<String> _availableDietaryPreferences;
  late List<String> _availableTags;

  @override
  void initState() {
    super.initState();

    // Initialize with selected values from the parent widget
    _mealTypes = List.from(widget.selectedMealTypes);
    _meatTypes = List.from(widget.selectedMeatTypes);
    _dietaryPreferences = List.from(widget.selectedDietary);
    _tags = List.from(widget.selectedTags);

    // Extract filter options from the recipes data
    _availableMealTypes = _getUniqueMealTypes();
    _availableMeatTypes = _getUniqueMeatTypes();
    _availableDietaryPreferences = _getUniqueDietary(); // Corrected
    _availableTags = _getUniqueTags();
  }

  // Helper methods to get unique filter options from recipes
  List<String> _getUniqueMealTypes() {
    return recipes.map((r) => r.mealType).toSet().toList();
  }

  List<String> _getUniqueMeatTypes() {
    return recipes.map((r) => r.meatType).toSet().toList();
  }

  List<String> _getUniqueDietary() {
    return recipes.expand((r) => r.dietary).toSet().toList().cast<String>();
  }

  List<String> _getUniqueTags() {
    return recipes.expand((r) => r.tags).toSet().toList().cast<String>();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Filter Recipes', style: TextStyle(fontWeight: FontWeight.bold)),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filter by Meal Type
            Text('Meal Type', style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: _mealTypes.isNotEmpty ? _mealTypes.first : null,
              hint: Text("Select Meal Type"),
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    _mealTypes = [value]; // Replace the selected value
                  }
                });
              },
              items: _availableMealTypes.map((mealType) {
                return DropdownMenuItem<String>(
                  value: mealType,
                  child: Text(mealType),
                );
              }).toList(),
            ),

            // Filter by Meat Type
            Text('Meat Type', style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: _meatTypes.isNotEmpty ? _meatTypes.first : null,
              hint: Text("Select Meat Type"),
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    _meatTypes = [value]; // Replace the selected value
                  }
                });
              },
              items: _availableMeatTypes.map((meatType) {
                return DropdownMenuItem<String>(
                  value: meatType,
                  child: Text(meatType),
                );
              }).toList(),
            ),

            // Filter by Dietary Preferences
            Text('Dietary', style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: _dietaryPreferences.isNotEmpty ? _dietaryPreferences.first : null,
              hint: Text("Select Dietary Preference"),
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    _dietaryPreferences = [value]; // Replace the selected value
                  }
                });
              },
              items: _availableDietaryPreferences.map((diet) {
                return DropdownMenuItem<String>(
                  value: diet,
                  child: Text(diet),
                );
              }).toList(),
            ),

            // Filter by Tags
            Text('Tags', style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: _tags.isNotEmpty ? _tags.first : null,
              hint: Text("Select Tag"),
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    _tags = [value]; // Replace the selected value
                  }
                });
              },
              items: _availableTags.map((tag) {
                return DropdownMenuItem<String>(
                  value: tag,
                  child: Text(tag),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      actions: [
        // Apply Button
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop({
              'mealType': _mealTypes.join(', '),
              'meatType': _meatTypes.join(', '),
              'dietary': _dietaryPreferences,
              'tags': _tags,
            });
          },
          child: Text('Apply', style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // Button color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
            ),
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // Button padding
          ),
        ),

        // Cancel Button
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close without applying filters
          },
          child: Text('Cancel', style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey, // Cancel button color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
            ),
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // Button padding
          ),
        ),
      ],
    );
  }
}
