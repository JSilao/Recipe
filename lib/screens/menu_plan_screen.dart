import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/recipe.dart'; // Adjust the import path according to your project structure
import 'package:provider/provider.dart'; // Add this import at the top of your file
import '../providers/cart_provider.dart';

class MenuPlanScreen extends StatefulWidget {
  @override
  _MenuPlanScreenState createState() => _MenuPlanScreenState();
}

class _MenuPlanScreenState extends State<MenuPlanScreen> {
  DateTime _startOfWeek = DateTime(2024, 2, 3); // Initial start date (Feb 3, 2024)

  // Store weekly meal plans
  Map<String, Map<String, Map<String, List<Recipe>>>> yearlyMealPlans = {};

  void _changeWeek(int direction) {
    setState(() {
      _startOfWeek = _startOfWeek.add(Duration(days: 7 * direction)); // Move forward or backward by a week
    });
  }

  String _getWeekRange() {
    DateTime endOfWeek = _startOfWeek.add(Duration(days: 6));
    return "${DateFormat('MMM d').format(_startOfWeek)} - ${DateFormat('MMM d').format(endOfWeek)}";
  }

  Map<String, Map<String, List<Recipe>>> _getCurrentWeekMeals() {
    String weekKey = _getWeekRange();

    if (!yearlyMealPlans.containsKey(weekKey)) {
      yearlyMealPlans[weekKey] = {
        "Monday": {"Breakfast": [], "Lunch": [], "Dinner": []},
        "Tuesday": {"Breakfast": [], "Lunch": [], "Dinner": []},
        "Wednesday": {"Breakfast": [], "Lunch": [], "Dinner": []},
        "Thursday": {"Breakfast": [], "Lunch": [], "Dinner": []},
        "Friday": {"Breakfast": [], "Lunch": [], "Dinner": []},
        "Saturday": {"Breakfast": [], "Lunch": [], "Dinner": []},
        "Sunday": {"Breakfast": [], "Lunch": [], "Dinner": []},
      };
    }

    return yearlyMealPlans[weekKey]!;
  }

  void _handleAddToMeal(String day, String mealType, Recipe recipe) {
    setState(() {
      _getCurrentWeekMeals()[day]?[mealType]?.add(recipe);
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentWeekMeals = _getCurrentWeekMeals();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Meal Plan", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 8),
            Icon(Icons.restaurant_menu),
          ],
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          // Week Navigation
          Container(
            color: Colors.green[200],
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: Icon(Icons.arrow_back), onPressed: () => _changeWeek(-1)),
                Text(
                  _getWeekRange(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(icon: Icon(Icons.arrow_forward), onPressed: () => _changeWeek(1)),
              ],
            ),
          ),

          // Meal Plan List
          Expanded(
            child: ListView.builder(
              itemCount: currentWeekMeals.keys.length,
              itemBuilder: (context, index) {
                String day = currentWeekMeals.keys.elementAt(index);
                return MealDayCard(
                  day: day,
                  meals: currentWeekMeals[day]!,
                  onAddMeal: _handleAddToMeal,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MealDayCard extends StatelessWidget {
  final String day;
  final Map<String, List<Recipe>> meals;
  final Function(String, String, Recipe) onAddMeal;

  MealDayCard({required this.day, required this.meals, required this.onAddMeal});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(day, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Divider(),
            ...meals.keys.map((mealType) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mealType, style: TextStyle(fontWeight: FontWeight.bold)),
                ...meals[mealType]!.map((recipe) => ListTile(
                  leading: recipe.imageUrl != null
                      ? Image.network(recipe.imageUrl!, width: 50, height: 50, fit: BoxFit.cover)
                      : Icon(Icons.fastfood),
                  title: Text("• ${recipe.title}"),
                )).toList(),
                TextButton(
                  onPressed: () {
                    // Show meal selection dialog
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => MealSelectionSheet(
                        day: day,
                        mealType: mealType,
                        onAddMeal: onAddMeal,
                      ),
                    );
                  },
                  child: Text("+ Add Meal"),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

class MealSelectionSheet extends StatelessWidget {
  final String day;
  final String mealType;
  final Function(String, String, Recipe) onAddMeal;

  MealSelectionSheet({required this.day, required this.mealType, required this.onAddMeal});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 300,
      child: Column(
        children: [
          Text("Select a meal for $mealType", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView.builder(
              itemCount: recipes.length, // Assuming you have a `recipes` list
              itemBuilder: (context, index) {
                final recipe = recipes[index]; // Replace `recipes` with your actual data source
                return ListTile(
                  leading: recipe.imageUrl != null
                      ? Image.network(recipe.imageUrl!, width: 50, height: 50, fit: BoxFit.cover)
                      : Icon(Icons.fastfood),
                  title: Text(recipe.title),
                  trailing: IconButton(
                    icon: Icon(Icons.add, color: Colors.green),
                    onPressed: () {
                      onAddMeal(day, mealType, recipe);
                      // Add ingredients to the cart
                      final cartProvider = Provider.of<CartProvider>(context, listen: false);
                      cartProvider.addToCart(recipe); // Store ingredients in the cart
                      Navigator.pop(context); // Close the bottom sheet
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
