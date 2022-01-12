// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:mealzy/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListView(String title, IconData icon, Function()? onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed'),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            padding: const EdgeInsets.all(20),
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up !!',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListView('Meals', Icons.restaurant, () {
            Navigator.pushReplacementNamed(context, '/');
          }),
          buildListView('Filter', Icons.settings, () {
            Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
