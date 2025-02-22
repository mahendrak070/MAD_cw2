// lib/screens/favorites_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/recipe_provider.dart';
import 'details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteRecipes = Provider.of<RecipeProvider>(context).favoriteRecipes;
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Recipes ❤️'),
      ),
      body: favoriteRecipes.isEmpty
          ? Center(child: Text('No favorite recipes yet.'))
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                final recipe = favoriteRecipes[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepOrange.shade100,
                      child: Text(recipe.title.substring(0, 1),
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    title: Text(recipe.title, style: Theme.of(context).textTheme.titleLarge),
                    subtitle: Text(recipe.description),
                    trailing: Icon(Icons.favorite, color: Colors.redAccent),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailsScreen(recipe: recipe)),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
