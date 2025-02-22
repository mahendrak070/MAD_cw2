// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/recipe_provider.dart';
import 'details_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Recipe Book 📖'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesScreen()),
              );
            },
            child: Text(
              'View Favorites',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: recipeProvider.recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipeProvider.recipes[index];
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
              trailing: Icon(
                recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.redAccent,
              ),
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
