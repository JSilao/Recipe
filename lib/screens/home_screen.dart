import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/recipe.dart'; // Ensure this imports your recipe model

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Recipe> filteredRecipes = [];
  List<Recipe> quickAndEasyRecipes = [];
  String selectedMealType = 'all'; // Added state for selected meal type

  @override
  void initState() {
    super.initState();
    quickAndEasyRecipes = recipes.where((recipe) => recipe.cookingTime < 10).toList();
    filteredRecipes = recipes; // Default display all quick and easy recipes
  }

  // Filter recipes by meal type (Breakfast, Lunch, Dinner, etc.)
  void filterByMealType(String mealType) {
    setState(() {
      selectedMealType = mealType;
      if (mealType == 'all') {
        filteredRecipes = recipes; // Show all quick and easy recipes
      } else {
        filteredRecipes = recipes.where((recipe) => recipe.mealType == mealType).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WELCOME'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Quick & Easy Carousel Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  Text(
                    'Quick & Easy Recipes',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  CarouselSlider.builder(
                    itemCount: quickAndEasyRecipes.length,
                    itemBuilder: (context, index, realIndex) {
                      final recipe = quickAndEasyRecipes[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/recipeDetails',
                            arguments: recipe.id,
                          );
                        },
                        child: Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                child: Image.network(
                                  recipe.imageUrl,
                                  fit: BoxFit.cover,
                                  height: 150,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  recipe.title,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 250,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                    ),
                  ),
                ],
              ),
            ),

            // Meal Type Filter Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => filterByMealType('breakfast'),
                    child: Text('Breakfast'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedMealType == 'breakfast' ? Colors.blue : Colors.grey, // Blue when selected
                      foregroundColor: selectedMealType == 'breakfast' ? Colors.white : Colors.black, // White font when selected
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => filterByMealType('lunch'),
                    child: Text('Lunch'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedMealType == 'lunch' ? Colors.blue : Colors.grey, // Blue when selected
                      foregroundColor: selectedMealType == 'lunch' ? Colors.white : Colors.black, // White font when selected
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => filterByMealType('dinner'),
                    child: Text('Dinner'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedMealType == 'dinner' ? Colors.blue : Colors.grey, // Blue when selected
                      foregroundColor: selectedMealType == 'dinner' ? Colors.white : Colors.black, // White font when selected
                    ),
                  ),
                ],
              ),
            ),

            // Display filtered recipes horizontally as images
            filteredRecipes.isEmpty
                ? Center(child: Text('No recipes found for this meal type.'))
                : Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: filteredRecipes.map((recipe) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/recipeDetails',
                          arguments: recipe.id,
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                recipe.imageUrl,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              recipe.title,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
