// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:mealzy/dummy_data.dart';
import 'package:mealzy/models/meal.dart';
import 'package:mealzy/screens/categories_screen.dart';
import 'package:mealzy/screens/category_meals_screen.dart';
import 'package:mealzy/screens/filters_screen.dart';
import 'package:mealzy/screens/meal_detail_screen.dart';
import 'package:mealzy/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _avialablemals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];
  void _setfilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _avialablemals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toogleFavorite(String mealId) {
    final existingIndex =
        favoriteMeals.indexWhere((meal) => mealId == meal.id);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => mealId == meal.id));
      });
    }
  }
  bool _isMealFav(String id)
{
  return favoriteMeals.any((meal) => meal.id == id);
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Mealzy',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          // ignore: deprecated_member_use
          accentColor: Colors.amber,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline1: const TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(favoriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_avialablemals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_isMealFav,_toogleFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setfilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}
