// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:mealzy/models/meal.dart';
import 'package:mealzy/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category_meals';
  final List<Meal> availableMeals;
  const CategoryMealsScreen(this.availableMeals);
  // final String catergoryId;
  // final String categoryTitle;
  // const CategoryMealsScreen(
  //     {required this.categoryTitle, required this.catergoryId});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String? catergoryId = routeArgs['id'];
    final String? categoryTitle = routeArgs['title'];
    final categoryMeals = availableMeals
        .where((meals) => meals.categories.contains(catergoryId))
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle.toString()),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            var cat = categoryMeals[index];
            return MealsItem(
              id: cat.id,
              title: cat.title,
              affordability: cat.affordability,
              complexity: cat.complexity,
              duration: cat.duration,
              imageUrl: cat.imageUrl,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
