// lib/models/recipe.dart
class Recipe {
  final String title;
  final String description;
  final List<String> ingredients;
  final List<String> instructions;
  bool isFavorite;

  Recipe({
    required this.title,
    required this.description,
    required this.ingredients,
    required this.instructions,
    this.isFavorite = false,
  });
}
