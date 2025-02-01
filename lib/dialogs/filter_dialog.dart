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
    // Flatten and ensure the result is a List<String>
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
            Wrap(
              alignment: WrapAlignment.center, // Centers the chips
              spacing: 4.0, // Decreases spacing between chips
              children: _availableMealTypes.map((mealType) {
                return ChoiceChip(
                  label: Text(mealType),
                  selected: _mealTypes.contains(mealType),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _mealTypes.add(mealType);
                      } else {
                        _mealTypes.remove(mealType);
                      }
                    });
                  },
                );
              }).toList(),
            ),

            // Filter by Meat Type
            Text('Meat Type', style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              alignment: WrapAlignment.center, // Centers the chips
              spacing: 4.0, // Decreases spacing between chips
              children: _availableMeatTypes.map((meatType) {
                return ChoiceChip(
                  label: Text(meatType),
                  selected: _meatTypes.contains(meatType),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _meatTypes.add(meatType);
                      } else {
                        _meatTypes.remove(meatType);
                      }
                    });
                  },
                );
              }).toList(),
            ),

            // Filter by Dietary Preferences
            Text('Dietary', style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              alignment: WrapAlignment.center, // Centers the chips
              spacing: 4.0, // Decreases spacing between chips
              children: _availableDietaryPreferences.map((diet) {
                return ChoiceChip(
                  label: Text(diet),
                  selected: _dietaryPreferences.contains(diet),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _dietaryPreferences.add(diet);
                      } else {
                        _dietaryPreferences.remove(diet);
                      }
                    });
                  },
                );
              }).toList(),
            ),

            // Filter by Tags
            Text('Tags', style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              alignment: WrapAlignment.center, // Centers the chips
              spacing: 4.0, // Decreases spacing between chips
              children: _availableTags.map((tag) {
                return ChoiceChip(
                  label: Text(tag),
                  selected: _tags.contains(tag),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _tags.add(tag);
                      } else {
                        _tags.remove(tag);
                      }
                    });
                  },
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
