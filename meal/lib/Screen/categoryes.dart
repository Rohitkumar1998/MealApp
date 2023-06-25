import 'package:flutter/material.dart';
import 'package:meal/Screen/meals.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/widget/category_grid.dart';

class CartegoryScreen extends StatelessWidget {
  const CartegoryScreen({super.key});
  void _selectCategory(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealsSceen(meals: [], title: 'Some Title')));
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
                _selectCategory(context);
              },
            )
        ],
      ),
    );
  }
}
