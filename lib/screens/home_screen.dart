import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/recipe.dart'; // Ensure this imports your recipe model

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Recipe> allRecipes = [];

  @override
  void initState() {
    super.initState();
    allRecipes = recipes; // Display all recipes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.home, color: Colors.white), // Home icon added
            SizedBox(width: 8), // Spacing between icon and text
            Text('Home', style: TextStyle(color: Colors.white)),
          ],
        ),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Welcome Banner
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              decoration: BoxDecoration(
                color: Colors.green.shade600,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                'Welcome to FoodCare!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                'Quick & Easy Recipes',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Prevent overflow by wrapping in a constrained container
            SizedBox(
              height: 340, // Prevents vertical overflow
              width: MediaQuery.of(context).size.width, // Prevents horizontal overflow
              child: CarouselSlider.builder(
                itemCount: allRecipes.length,
                itemBuilder: (context, index, realIndex) {
                  final recipe = allRecipes[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/recipeDetails',
                        arguments: recipe.id,
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85, // Ensures no side overflow
                      child: Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: Colors.green.shade50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                              child: Image.network(
                                recipe.imageUrl,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    recipe.title,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green.shade800,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '${recipe.cookingTime} mins | ${recipe.mealType}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 320,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  viewportFraction: 0.85, // Fix for side overflow
                  disableCenter: true, // Ensures correct alignment
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
