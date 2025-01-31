import 'package:flutter/material.dart';

class FilterDialog extends StatelessWidget {
  final List<String> selectedMealTypes;
  final List<String> selectedMeatTypes;
  final List<String> selectedDietary;
  final int? selectedMaxPreparationTime;
  final int? selectedMaxCookingTime;
  final List<String> selectedTags;

  FilterDialog({
    required this.selectedMealTypes,
    required this.selectedMeatTypes,
    required this.selectedDietary,
    required this.selectedMaxPreparationTime,
    required this.selectedMaxCookingTime,
    required this.selectedTags,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Filter Recipes'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filter by Meal Type
            Text('Meal Type'),
            CheckboxListTile(
              title: Text('Breakfast'),
              value: selectedMealTypes.contains('breakfast'),
              onChanged: (bool? value) {
                // Handle logic for updating selectedMealTypes
              },
            ),
            CheckboxListTile(
              title: Text('Lunch'),
              value: selectedMealTypes.contains('lunch'),
              onChanged: (bool? value) {
                // Handle logic for updating selectedMealTypes
              },
            ),
            // Add other filters similarly like dietary, meat type, etc.
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // You can pass back the filters if needed
          },
          child: Text('Apply'),
        ),
      ],
    );
  }
}
