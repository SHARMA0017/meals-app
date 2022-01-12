// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:mealzy/models/meal.dart';
import 'package:mealzy/screens/categories_screen.dart';
import 'package:mealzy/screens/favorites_screen.dart';
import 'package:mealzy/widgets/mainDrawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  const TabsScreen(this.favouriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> _pages;
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favouriteMeals), 'title': 'Favorites'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Colors.red,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
              color: Colors.pinkAccent,
              fontSize: 15,
              fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          selectedItemColor: Colors.pinkAccent,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                activeIcon: const Icon(
                  Icons.category,
                  color: Colors.pinkAccent,
                  size: 30,
                ),
                backgroundColor: Colors.amber.shade100,
                icon: const Icon(
                  Icons.category,
                  color: Colors.white,
                ),
                label: 'Categories'),
            const BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  color: Colors.pinkAccent,
                  size: 30,
                ),
                icon: Icon(Icons.favorite, color: Colors.white),
                label: 'Favorite'),
          ]),
    );
  }
}
