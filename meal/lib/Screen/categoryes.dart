import 'package:flutter/material.dart';
import 'package:meal/Screen/meals.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/widget/category_grid.dart';
import 'package:meal/models/category.dart';

class CartegoryScreen extends StatelessWidget {
  const CartegoryScreen({super.key});
  void _selectCategory(BuildContext context, Category category) {
    final filterMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) =>
                MealsSceen(meals: filterMeals, title: category.title)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
