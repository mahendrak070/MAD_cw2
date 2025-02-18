// lib/providers/recipe_provider.dart
import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeProvider extends ChangeNotifier {
  final List<Recipe> _recipes = [
    Recipe(
      title: "Butter Chicken 🍗",
      description: "Creamy tomato-based chicken curry.",
      ingredients: [
        "500g chicken pieces",
        "2 tbsp butter",
        "1 cup tomato puree",
        "1/2 cup heavy cream",
        "1 tsp garam masala",
        "1 tsp ginger garlic paste",
        "Salt and pepper to taste"
      ],
      instructions: [
        "Marinate chicken with salt, pepper, and ginger garlic paste.",
        "Sauté chicken in butter until lightly browned.",
        "Add tomato puree and spices.",
        "Simmer until chicken is cooked.",
        "Stir in heavy cream and heat through."
      ],
    ),
    Recipe(
      title: "Paneer Tikka 🍢",
      description: "Grilled paneer marinated in spiced yogurt.",
      ingredients: [
        "250g paneer, cubed",
        "1/2 cup yogurt",
        "1 tbsp tikka masala",
        "1 tsp ginger garlic paste",
        "1 tsp lemon juice",
        "Salt to taste"
      ],
      instructions: [
        "Mix yogurt, tikka masala, ginger garlic paste, lemon juice, and salt.",
        "Marinate paneer cubes for at least 1 hour.",
        "Skewer and grill or bake until edges are charred."
      ],
    ),
    Recipe(
      title: "Chole Bhature 🥘",
      description: "Spicy chickpea curry with fluffy fried bread.",
      ingredients: [
        "1 cup chickpeas, soaked overnight",
        "2 onions, finely chopped",
        "2 tomatoes, pureed",
        "1 tbsp chole masala",
        "2 tsp ginger garlic paste",
        "Flour for bhature",
        "Oil for frying"
      ],
      instructions: [
        "Pressure cook chickpeas until tender.",
        "Sauté onions, ginger garlic paste, and tomatoes with spices.",
        "Mix in chickpeas and simmer.",
        "Prepare bhature dough, roll out and deep-fry until puffed."
      ],
    ),
    Recipe(
      title: "Hyderabadi Biryani 🍛",
      description: "Flavorful layered rice dish with aromatic spices.",
      ingredients: [
        "2 cups basmati rice",
        "500g chicken/mutton/vegetables",
        "1/2 cup yogurt",
        "Saffron soaked in milk",
        "Mixed spices (cumin, coriander, garam masala)",
        "Fried onions"
      ],
      instructions: [
        "Marinate meat/vegetables with yogurt and spices.",
        "Parboil rice with whole spices.",
        "Layer meat and rice in a pot, add saffron milk and fried onions.",
        "Cook on low heat (dum) until flavors meld."
      ],
    ),
    Recipe(
      title: "Masala Dosa 🥞",
      description: "Crispy fermented crepe filled with spicy potato masala.",
      ingredients: [
        "Dosa batter",
        "3 potatoes, boiled and mashed",
        "1 onion, finely chopped",
        "Mustard seeds, turmeric, curry leaves",
        "Oil, salt"
      ],
      instructions: [
        "Prepare potato masala by sautéing onions, mustard seeds, turmeric, and curry leaves.",
        "Mix mashed potatoes with sautéed spices.",
        "Spread dosa batter thinly on a hot griddle.",
        "Fill with potato masala, fold and serve."
      ],
    ),
    Recipe(
      title: "Rogan Josh 🍖",
      description: "Aromatic lamb curry with rich flavors.",
      ingredients: [
        "500g lamb, cut into pieces",
        "1 cup yogurt",
        "2 onions, sliced",
        "2 tomatoes, chopped",
        "Garam masala, cardamom, cloves, ginger garlic paste",
        "Salt, oil"
      ],
      instructions: [
        "Brown lamb with onions and spices.",
        "Mix in yogurt and tomatoes.",
        "Simmer on low heat until lamb is tender and flavors develop."
      ],
    ),
    Recipe(
      title: "Palak Paneer 🍲",
      description: "Spinach and cottage cheese curry.",
      ingredients: [
        "500g spinach",
        "250g paneer, cubed",
        "1 onion, chopped",
        "1 tomato, chopped",
        "Ginger garlic paste, cumin seeds, salt, cream"
      ],
      instructions: [
        "Blanch spinach and blend to a smooth puree.",
        "Sauté onions, ginger garlic paste, and tomatoes with cumin seeds.",
        "Mix in spinach puree, add paneer cubes and cream, simmer briefly."
      ],
    ),
    Recipe(
      title: "Samosa 🥟",
      description: "Fried pastry with spiced potato filling.",
      ingredients: [
        "For filling: 3 potatoes, boiled and mashed, peas, spices, onions",
        "For dough: Flour, water, salt, oil",
        "Oil for deep-frying"
      ],
      instructions: [
        "Prepare dough by mixing flour, water, salt, and oil.",
        "Cook spiced potato and pea filling.",
        "Roll dough, cut into shapes, fill and fold into triangles.",
        "Deep-fry until golden and crisp."
      ],
    ),
    Recipe(
      title: "Aloo Gobi 🥔",
      description: "Delicious curry of potatoes and cauliflower.",
      ingredients: [
        "2 potatoes, cubed",
        "1 cauliflower, cut into florets",
        "1 tomato, chopped",
        "Onion, ginger garlic paste, turmeric, cumin, coriander",
        "Salt, oil"
      ],
      instructions: [
        "Sauté onions, ginger garlic paste, and spices.",
        "Add potatoes, cauliflower, and tomatoes.",
        "Cook until vegetables are tender."
      ],
    ),
    Recipe(
      title: "Dal Makhani 🍲",
      description: "Creamy lentil dish with rich flavors.",
      ingredients: [
        "1 cup whole black lentils (sabut urad)",
        "1/4 cup kidney beans (rajma)",
        "Butter, cream, tomatoes, ginger garlic paste, spices",
        "Salt, water"
      ],
      instructions: [
        "Soak lentils and kidney beans overnight.",
        "Pressure cook until soft.",
        "Sauté ginger garlic paste and tomatoes with spices.",
        "Mix in lentils, simmer with butter and cream for richness."
      ],
    ),
  ];

  List<Recipe> get recipes => _recipes;

  List<Recipe> get favoriteRecipes =>
      _recipes.where((recipe) => recipe.isFavorite).toList();

  void toggleFavorite(Recipe recipe) {
    recipe.isFavorite = !recipe.isFavorite;
    notifyListeners();
  }
}
