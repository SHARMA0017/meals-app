// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:mealzy/models/meal.dart';
import 'package:mealzy/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoritesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no Favorites added here !! '),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          var cat = favoriteMeals[index];
          return MealsItem(
            id: cat.id,
            title: cat.title,
            affordability: cat.affordability,
            complexity: cat.complexity,
            duration: cat.duration,
            imageUrl: cat.imageUrl,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
