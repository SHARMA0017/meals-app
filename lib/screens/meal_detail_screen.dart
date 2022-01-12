// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:mealzy/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toogleFavMeal;
  final Function isMealFav;
  const MealDetailScreen(this.isMealFav, this.toogleFavMeal);

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget buildContainer({required Widget child}) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients', context),
            buildContainer(
              child: ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 15,
                        child: Text(
                          '${(index + 1)}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(selectedMeal.ingredients[index]),
                    ),
                    const Divider(
                      color: Colors.pinkAccent,
                    ),
                  ],
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle('Steps', context),
            buildContainer(
              child: ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 15,
                        child: Text(
                          '${(index + 1)}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    const Divider(
                      color: Colors.pinkAccent,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toogleFavMeal(mealId);
        },
        child: isMealFav(mealId)
            ? const Icon(
                Icons.favorite,
                color: Colors.pinkAccent,
              )
            : const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
      ),
    );
  }
}
