// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'screens/home_screen.dart';
import 'providers/recipe_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => RecipeProvider(),
      child: MyApp(),
    ),
  );
}

// Custom scroll behavior to enable smooth (bouncy) scrolling.
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    // Using BouncingScrollPhysics for a smooth and natural scrolling effect.
    return const BouncingScrollPhysics();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final baseTextTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Recipe Book App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepOrange,
          titleTextStyle: GoogleFonts.roboto(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: GoogleFonts.robotoTextTheme(
          baseTextTheme.copyWith(
            headlineMedium: const TextStyle(
              fontSize: 26,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
            titleLarge: const TextStyle(
              fontSize: 22,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
            bodyLarge: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
            bodyMedium: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ),
        // Custom page transitions for smooth navigation.
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.fuchsia: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      ),
      // Apply the custom scroll behavior globally.
      scrollBehavior: MyCustomScrollBehavior(),
      home: HomeScreen(),
    );
  }
}
