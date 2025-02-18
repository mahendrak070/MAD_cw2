// lib/screens/details_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/recipe.dart';
import '../providers/recipe_provider.dart';

class DetailsScreen extends StatelessWidget {
  final Recipe recipe;

  const DetailsScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using Consumer so that any changes to the recipe's favorite status are reflected immediately.
    return Scaffold(
      appBar: AppBar(
        title: Text('${recipe.title} Details 🍽️'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(recipe.title, style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 8),
            Text(recipe.description, style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(height: 16),
            Text('Ingredients', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 8),
            ...recipe.ingredients.map((ingredient) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Text('• $ingredient', style: Theme.of(context).textTheme.bodyMedium),
                )),
            SizedBox(height: 16),
            Text('Instructions', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 8),
            ...recipe.instructions.asMap().entries.map((entry) {
              int idx = entry.key;
              String instruction = entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Text('${idx + 1}. $instruction', style: Theme.of(context).textTheme.bodyMedium),
              );
            }).toList(),
            SizedBox(height: 20),
            Center(
              child: Consumer<RecipeProvider>(
                builder: (context, recipeProvider, child) {
                  return ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      // Toggle the favorite status
                      recipeProvider.toggleFavorite(recipe);
                    },
                    icon: Icon(
                      recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.white,
                    ),
                    label: Text(
                      recipe.isFavorite ? 'Unmark Favorite ❌' : 'Mark as Favorite ❤️',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
