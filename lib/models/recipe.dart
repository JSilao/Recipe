class Recipe {
  final String id;
  final String title;
  final List<Map<String, String>> ingredients; // Updated to include measurements
  final String instructions;
  final int calories;
  final String cuisine;
  final List<String> dietary;
  final String meatType;
  final String mealType;
  final int preparationTime;
  final int cookingTime;
  final String imageUrl;
  final double rating;
  final List<String> tags;
  final bool isFavorite;

  Recipe({
    required this.id,
    required this.title,
    required this.ingredients,
    required this.instructions,
    required this.calories,
    required this.cuisine,
    required this.dietary,
    required this.meatType,
    required this.mealType,
    required this.preparationTime,
    required this.cookingTime,
    required this.imageUrl,
    required this.rating,
    required this.tags,
    required this.isFavorite,
  });
}

List<Recipe> recipes = [
  Recipe(
    id: '1',
    title: 'Chicken Stir Fry',
    ingredients: [
      {'name': 'Chicken', 'measurement': '200g'},
      {'name': 'Bell Peppers', 'measurement': '1 cup, sliced'},
      {'name': 'Soy Sauce', 'measurement': '2 tbsp'},
      {'name': 'Garlic', 'measurement': '2 cloves, minced'},
      {'name': 'Ginger', 'measurement': '1 tbsp, grated'}
    ],
    instructions: 'Stir-fry chicken with garlic and ginger. Add peppers and soy sauce.',
    calories: 300,
    cuisine: 'Asian',
    dietary: ['High-Protein', 'Low-Calorie'],
    meatType: 'chicken',
    mealType: 'dinner',
    preparationTime: 15,
    cookingTime: 20,
    imageUrl: 'https://www.budgetbytes.com/wp-content/uploads/2024/01/Chicken-Stir-Fry-Pan.jpg',
    rating: 4.5,
    tags: ['easy', 'quick', 'spicy'],
    isFavorite: false,
  ),
  Recipe(
    id: '2',
    title: 'Vegetable Pasta',
    ingredients: [
      {'name': 'Pasta', 'measurement': '200g'},
      {'name': 'Tomatoes', 'measurement': '1 cup, chopped'},
      {'name': 'Zucchini', 'measurement': '1/2 cup, diced'},
      {'name': 'Olive Oil', 'measurement': '2 tbsp'},
      {'name': 'Garlic', 'measurement': '1 clove, minced'},
      {'name': 'Parmesan', 'measurement': '1/4 cup, grated'}
    ],
    instructions: 'Cook pasta and sauté vegetables with garlic. Toss with pasta and top with Parmesan.',
    calories: 450,
    cuisine: 'Italian',
    dietary: ['Vegetarian', 'High-Carb'],
    meatType: 'none',
    mealType: 'lunch',
    preparationTime: 10,
    cookingTime: 15,
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-SSJCeuOMHXlN5IlA2oT39G758Ed8p0_OXg&s',
    rating: 4.7,
    tags: ['vegetarian', 'easy', 'healthy'],
    isFavorite: true,
  ),
  Recipe(
    id: '3',
    title: 'Beef Tacos',
    ingredients: [
      {'name': 'Ground Beef', 'measurement': '250g'},
      {'name': 'Taco Shells', 'measurement': '3 pieces'},
      {'name': 'Lettuce', 'measurement': '1/2 cup, shredded'},
      {'name': 'Tomato', 'measurement': '1, diced'},
      {'name': 'Cheese', 'measurement': '1/4 cup, shredded'},
      {'name': 'Sour Cream', 'measurement': '2 tbsp'}
    ],
    instructions: 'Cook beef and season with taco seasoning. Assemble in taco shells with toppings.',
    calories: 600,
    cuisine: 'Mexican',
    dietary: ['High-Protein'],
    meatType: 'beef',
    mealType: 'dinner',
    preparationTime: 10,
    cookingTime: 15,
    imageUrl: 'https://www.onceuponachef.com/images/2023/08/Beef-Tacos.jpg',
    rating: 4.2,
    tags: ['quick', 'spicy', 'comfort food'],
    isFavorite: false,
  ),
  Recipe(
    id: '4',
    title: 'Avocado Toast',
    ingredients: [
      {'name': 'Bread', 'measurement': '2 slices'},
      {'name': 'Avocado', 'measurement': '1, mashed'},
      {'name': 'Lemon', 'measurement': '1/2, juiced'},
      {'name': 'Salt', 'measurement': 'to taste'},
      {'name': 'Pepper', 'measurement': 'to taste'}
    ],
    instructions: 'Toast the bread, mash avocado with lemon juice, and spread on the toast.',
    calories: 350,
    cuisine: 'American',
    dietary: ['Vegetarian', 'Vegan'],
    meatType: 'none',
    mealType: 'breakfast',
    preparationTime: 5,
    cookingTime: 5,
    imageUrl: 'https://www.dinneratthezoo.com/wp-content/uploads/2018/12/avocado-toast-14.jpg',
    rating: 4.8,
    tags: ['vegan', 'easy', 'breakfast'],
    isFavorite: true,
  ),
  Recipe(
    id: '5',
    title: 'Grilled Salmon',
    ingredients: [
      {'name': 'Salmon', 'measurement': '200g'},
      {'name': 'Lemon', 'measurement': '1/2, sliced'},
      {'name': 'Garlic', 'measurement': '2 cloves, minced'},
      {'name': 'Olive Oil', 'measurement': '1 tbsp'},
      {'name': 'Parsley', 'measurement': '1 tbsp, chopped'}
    ],
    instructions: 'Grill salmon with garlic, olive oil, and lemon. Serve with a sprinkle of parsley.',
    calories: 500,
    cuisine: 'Mediterranean',
    dietary: ['High-Protein'],
    meatType: 'fish',
    mealType: 'dinner',
    preparationTime: 10,
    cookingTime: 15,
    imageUrl: 'https://www.allrecipes.com/thmb/CfocX_0yH5_hFxtbFkzoWXrlycs=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/ALR-12720-grilled-salmon-i-VAT-4x3-888cac0fb8a34f6fbde7bf836850cd1c.jpg',
    rating: 4.6,
    tags: ['healthy', 'quick', 'grilled'],
    isFavorite: false,
  ),
  Recipe(
    id: '6',
    title: 'Banana Pancakes',
    ingredients: [
      {'name': 'Banana', 'measurement': '1, mashed'},
      {'name': 'Egg', 'measurement': '1'},
      {'name': 'Flour', 'measurement': '1/2 cup'},
      {'name': 'Milk', 'measurement': '1/4 cup'},
      {'name': 'Baking Powder', 'measurement': '1 tsp'}
    ],
    instructions: 'Mix ingredients and cook pancakes on a non-stick pan.',
    calories: 350,
    cuisine: 'American',
    dietary: ['Vegetarian'],
    meatType: 'none',
    mealType: 'breakfast',
    preparationTime: 10,
    cookingTime: 10,
    imageUrl: 'https://feelgoodfoodie.net/wp-content/uploads/2022/05/Banana-Pancakes-08.jpg',
    rating: 4.7,
    tags: ['breakfast', 'easy', 'sweet'],
    isFavorite: false,
  ),
  Recipe(
    id: '7',
    title: 'Greek Salad',
    ingredients: [
      {'name': 'Cucumber', 'measurement': '1 cup, chopped'},
      {'name': 'Tomatoes', 'measurement': '1 cup, chopped'},
      {'name': 'Feta Cheese', 'measurement': '1/4 cup, crumbled'},
      {'name': 'Olives', 'measurement': '1/4 cup'},
      {'name': 'Olive Oil', 'measurement': '2 tbsp'}
    ],
    instructions: 'Mix all ingredients and drizzle with olive oil.',
    calories: 250,
    cuisine: 'Greek',
    dietary: ['Vegetarian', 'Low-Carb'],
    meatType: 'none',
    mealType: 'lunch',
    preparationTime: 10,
    cookingTime: 0,
    imageUrl: 'https://www.recipetineats.com/tachyon/2016/07/Greek-Salad_4-680x1019.jpg',
    rating: 4.8,
    tags: ['fresh', 'healthy', 'quick'],
    isFavorite: true,
  ),
  Recipe(
    id: '8',
    title: 'Shrimp Scampi',
    ingredients: [
      {'name': 'Shrimp', 'measurement': '200g'},
      {'name': 'Garlic', 'measurement': '2 cloves, minced'},
      {'name': 'Butter', 'measurement': '2 tbsp'},
      {'name': 'Lemon Juice', 'measurement': '2 tbsp'},
      {'name': 'Parsley', 'measurement': '1 tbsp, chopped'}
    ],
    instructions: 'Sauté shrimp with garlic and butter. Add lemon juice and parsley.',
    calories: 400,
    cuisine: 'Italian',
    dietary: ['High-Protein'],
    meatType: 'seafood',
    mealType: 'dinner',
    preparationTime: 10,
    cookingTime: 10,
    imageUrl: 'https://cafedelites.com/wp-content/uploads/2018/03/Garlic-Butter-Shrimp-IMAGE-15.jpg',
    rating: 4.6,
    tags: ['quick', 'seafood', 'garlicky'],
    isFavorite: false,
  ),
  Recipe(
    id: '9',
    title: 'Caprese Sandwich',
    ingredients: [
      {'name': 'Baguette', 'measurement': '1, sliced'},
      {'name': 'Mozzarella', 'measurement': '1/4 cup, sliced'},
      {'name': 'Tomato', 'measurement': '1, sliced'},
      {'name': 'Basil', 'measurement': '5 leaves'},
      {'name': 'Balsamic Glaze', 'measurement': '1 tbsp'}
    ],
    instructions: 'Layer mozzarella, tomato, and basil on baguette. Drizzle with balsamic glaze.',
    calories: 450,
    cuisine: 'Italian',
    dietary: ['Vegetarian'],
    meatType: 'none',
    mealType: 'lunch',
    preparationTime: 10,
    cookingTime: 0,
    imageUrl: 'https://ohsweetbasil.com/wp-content/uploads/balsamic-glaze-grilled-caprese-sandwich-recipe-8-770x1155.jpg',
    rating: 4.5,
    tags: ['vegetarian', 'fresh', 'sandwich'],
    isFavorite: true,
  ),
  Recipe(
    id: '10',
    title: 'Chili Con Carne',
    ingredients: [
      {'name': 'Ground Beef', 'measurement': '250g'},
      {'name': 'Kidney Beans', 'measurement': '1 cup, cooked'},
      {'name': 'Tomatoes', 'measurement': '1 cup, diced'},
      {'name': 'Onion', 'measurement': '1, chopped'},
      {'name': 'Chili Powder', 'measurement': '1 tbsp'}
    ],
    instructions: 'Cook beef with onions. Add beans, tomatoes, and chili powder. Simmer.',
    calories: 600,
    cuisine: 'Mexican',
    dietary: ['High-Protein'],
    meatType: 'beef',
    mealType: 'dinner',
    preparationTime: 15,
    cookingTime: 30,
    imageUrl: 'https://www.recipetineats.com/tachyon/2016/06/Chili-Con-Carne_8.jpg?resize=900%2C1260&zoom=0.72',
    rating: 4.7,
    tags: ['spicy', 'comfort food', 'hearty'],
    isFavorite: false,
  ),
  Recipe(
    id: '11',
    title: 'Teriyaki Chicken',
    ingredients: [
      {'name': 'Chicken Breast', 'measurement': '200g'},
      {'name': 'Soy Sauce', 'measurement': '3 tbsp'},
      {'name': 'Honey', 'measurement': '2 tbsp'},
      {'name': 'Garlic', 'measurement': '2 cloves, minced'},
      {'name': 'Ginger', 'measurement': '1 tbsp, grated'}
    ],
    instructions: 'Marinate chicken in soy sauce, honey, garlic, and ginger. Cook in a pan until done.',
    calories: 400,
    cuisine: 'Japanese',
    dietary: ['High-Protein'],
    meatType: 'chicken',
    mealType: 'dinner',
    preparationTime: 15,
    cookingTime: 20,
    imageUrl: 'https://www.budgetbytes.com/wp-content/uploads/2022/04/Teriyaki-Chicken-V1-768x1024.jpg',
    rating: 4.7,
    tags: ['sweet', 'savory', 'quick'],
    isFavorite: false,
  ),
  Recipe(
    id: '12',
    title: 'Lentil Soup',
    ingredients: [
      {'name': 'Lentils', 'measurement': '1 cup'},
      {'name': 'Carrot', 'measurement': '1, chopped'},
      {'name': 'Celery', 'measurement': '1 stalk, chopped'},
      {'name': 'Onion', 'measurement': '1, chopped'},
      {'name': 'Garlic', 'measurement': '2 cloves, minced'}
    ],
    instructions: 'Sauté vegetables, add lentils and water. Simmer until lentils are tender.',
    calories: 350,
    cuisine: 'Mediterranean',
    dietary: ['Vegetarian', 'High-Fiber'],
    meatType: 'none',
    mealType: 'dinner',
    preparationTime: 10,
    cookingTime: 30,
    imageUrl: 'https://www.recipetineats.com/tachyon/2017/03/Lentil-Soup-6-1.jpg?resize=900%2C1260&zoom=0.72',
    rating: 4.6,
    tags: ['healthy', 'comfort food', 'soup'],
    isFavorite: true,
  ),
  Recipe(
    id: '13',
    title: 'BBQ Ribs',
    ingredients: [
      {'name': 'Pork Ribs', 'measurement': '500g'},
      {'name': 'BBQ Sauce', 'measurement': '1/2 cup'},
      {'name': 'Garlic Powder', 'measurement': '1 tsp'},
      {'name': 'Salt', 'measurement': 'to taste'},
      {'name': 'Pepper', 'measurement': 'to taste'}
    ],
    instructions: 'Rub ribs with seasoning and bake for 2 hours. Baste with BBQ sauce and grill.',
    calories: 800,
    cuisine: 'American',
    dietary: ['High-Protein'],
    meatType: 'pork',
    mealType: 'dinner',
    preparationTime: 15,
    cookingTime: 120,
    imageUrl: 'https://www.recipetineats.com/tachyon/2016/01/Oven-Pork-Ribs-with-Barbecue-Sauce_4.jpg?resize=900%2C1260&zoom=0.72',
    rating: 4.8,
    tags: ['grilled', 'hearty', 'smoky'],
    isFavorite: false,
  ),
  Recipe(
    id: '14',
    title: 'Mango Smoothie',
    ingredients: [
      {'name': 'Mango', 'measurement': '1, chopped'},
      {'name': 'Milk', 'measurement': '1 cup'},
      {'name': 'Honey', 'measurement': '1 tbsp'},
      {'name': 'Ice', 'measurement': '1/2 cup'}
    ],
    instructions: 'Blend all ingredients until smooth.',
    calories: 250,
    cuisine: 'Tropical',
    dietary: ['Vegetarian', 'Gluten-Free'],
    meatType: 'none',
    mealType: 'snack',
    preparationTime: 5,
    cookingTime: 0,
    imageUrl: 'https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2018/08/Mango-Smoothie-4-2.jpg',
    rating: 4.7,
    tags: ['refreshing', 'sweet', 'quick'],
    isFavorite: true,
  ),
  Recipe(
    id: '15',
    title: 'Stuffed Bell Peppers',
    ingredients: [
      {'name': 'Bell Peppers', 'measurement': '3, hollowed'},
      {'name': 'Ground Turkey', 'measurement': '250g'},
      {'name': 'Rice', 'measurement': '1/2 cup, cooked'},
      {'name': 'Tomato Sauce', 'measurement': '1/2 cup'},
      {'name': 'Garlic', 'measurement': '2 cloves, minced'}
    ],
    instructions: 'Mix turkey, rice, and garlic. Stuff into peppers, bake at 375°F for 40 minutes.',
    calories: 500,
    cuisine: 'Mediterranean',
    dietary: ['High-Protein'],
    meatType: 'turkey',
    mealType: 'dinner',
    preparationTime: 15,
    cookingTime: 40,
    imageUrl: 'https://www.budgetbytes.com/wp-content/uploads/2023/08/Stuffed-Bell-Peppers-V2-768x1024.jpg',
    rating: 4.5,
    tags: ['baked', 'stuffed', 'savory'],
    isFavorite: false,
  ),
  Recipe(
    id: '16',
    title: 'Quinoa Salad',
    ingredients: [
      {'name': 'Quinoa', 'measurement': '1 cup, cooked'},
      {'name': 'Cherry Tomatoes', 'measurement': '1/2 cup, halved'},
      {'name': 'Cucumber', 'measurement': '1/2 cup, diced'},
      {'name': 'Feta Cheese', 'measurement': '1/4 cup, crumbled'},
      {'name': 'Olive Oil', 'measurement': '2 tbsp'},
      {'name': 'Lemon Juice', 'measurement': '1 tbsp'}
    ],
    instructions: 'Mix all ingredients together and toss with olive oil and lemon juice.',
    calories: 320,
    cuisine: 'Mediterranean',
    dietary: ['Vegetarian', 'Gluten-Free'],
    meatType: 'none',
    mealType: 'lunch',
    preparationTime: 10,
    cookingTime: 0,
    imageUrl: 'https://cookieandkate.com/images/2017/08/best-quinoa-salad-recipe-3.jpg',
    rating: 4.6,
    tags: ['healthy', 'light', 'fresh'],
    isFavorite: true,
  ),
  Recipe(
    id: '17',
    title: 'Shrimp Scampi',
    ingredients: [
      {'name': 'Shrimp', 'measurement': '200g'},
      {'name': 'Garlic', 'measurement': '3 cloves, minced'},
      {'name': 'Butter', 'measurement': '2 tbsp'},
      {'name': 'Lemon Juice', 'measurement': '2 tbsp'},
      {'name': 'Parsley', 'measurement': '1 tbsp, chopped'},
      {'name': 'Spaghetti', 'measurement': '200g'}
    ],
    instructions: 'Sauté shrimp in butter and garlic. Toss with lemon juice, parsley, and cooked spaghetti.',
    calories: 520,
    cuisine: 'Italian',
    dietary: ['High-Protein'],
    meatType: 'seafood',
    mealType: 'dinner',
    preparationTime: 10,
    cookingTime: 15,
    imageUrl: 'https://cafedelites.com/wp-content/uploads/2018/03/Garlic-Butter-Shrimp-IMAGE-15.jpg',
    rating: 4.8,
    tags: ['seafood', 'garlicky', 'quick'],
    isFavorite: false,
  ),
  Recipe(
    id: '18',
    title: 'Sweet Potato Fries',
    ingredients: [
      {'name': 'Sweet Potatoes', 'measurement': '2, cut into fries'},
      {'name': 'Olive Oil', 'measurement': '2 tbsp'},
      {'name': 'Paprika', 'measurement': '1 tsp'},
      {'name': 'Salt', 'measurement': 'to taste'},
      {'name': 'Pepper', 'measurement': 'to taste'}
    ],
    instructions: 'Toss sweet potato fries with olive oil and seasoning. Bake at 400°F for 25 minutes.',
    calories: 280,
    cuisine: 'American',
    dietary: ['Vegan', 'Gluten-Free'],
    meatType: 'none',
    mealType: 'snack',
    preparationTime: 10,
    cookingTime: 25,
    imageUrl: 'https://cookieandkate.com/images/2010/12/crispy-baked-sweet-potato-fries-with-ketchup-1.jpg',
    rating: 4.7,
    tags: ['baked', 'healthy', 'crispy'],
    isFavorite: true,
  ),
  Recipe(
    id: '19',
    title: 'Egg Fried Rice',
    ingredients: [
      {'name': 'Rice', 'measurement': '2 cups, cooked'},
      {'name': 'Eggs', 'measurement': '2, beaten'},
      {'name': 'Soy Sauce', 'measurement': '2 tbsp'},
      {'name': 'Green Onions', 'measurement': '1/4 cup, chopped'},
      {'name': 'Garlic', 'measurement': '2 cloves, minced'}
    ],
    instructions: 'Scramble eggs, add garlic and rice. Stir in soy sauce and green onions.',
    calories: 450,
    cuisine: 'Chinese',
    dietary: ['Vegetarian'],
    meatType: 'none',
    mealType: 'lunch',
    preparationTime: 10,
    cookingTime: 10,
    imageUrl: 'https://christieathome.com/wp-content/uploads/2022/06/Egg-Fried-Rice-3.jpg',
    rating: 4.6,
    tags: ['quick', 'savory', 'comfort food'],
    isFavorite: false,
  ),
  Recipe(
    id: '20',
    title: 'Chocolate Mug Cake',
    ingredients: [
      {'name': 'Flour', 'measurement': '4 tbsp'},
      {'name': 'Cocoa Powder', 'measurement': '2 tbsp'},
      {'name': 'Sugar', 'measurement': '2 tbsp'},
      {'name': 'Milk', 'measurement': '3 tbsp'},
      {'name': 'Baking Powder', 'measurement': '1/2 tsp'},
      {'name': 'Chocolate Chips', 'measurement': '1 tbsp'}
    ],
    instructions: 'Mix ingredients in a mug. Microwave for 1 minute.',
    calories: 350,
    cuisine: 'American',
    dietary: ['Vegetarian'],
    meatType: 'none',
    mealType: 'dessert',
    preparationTime: 5,
    cookingTime: 1,
    imageUrl: 'https://tastesbetterfromscratch.com/wp-content/uploads/2022/12/Chocolate-Mug-Cake-1.jpg',
    rating: 4.7,
    tags: ['quick', 'chocolate', 'dessert'],
    isFavorite: true,
  ),


];
