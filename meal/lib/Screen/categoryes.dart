import 'package:flutter/material.dart';
import 'package:meal/Screen/meals.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/widget/category_grid.dart';
import 'package:meal/models/category.dart';
import 'package:meal/models/meal.dart';

class CartegoryScreen extends StatefulWidget {
  const CartegoryScreen({super.key, required this.avilableMeals});

  final List<Meal> avilableMeals;

  @override
  State<CartegoryScreen> createState() => _CartegoryScreenState();
}

class _CartegoryScreenState extends State<CartegoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animtionController;
  @override
  void initState() {
    _animtionController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 3),
        lowerBound: 0,
        upperBound: 1);
    super.initState();
    _animtionController.forward();
  }

  @override
  void dispose() {
    _animtionController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filterMeals = widget.avilableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealsSceen(
                  meals: filterMeals,
                  title: category.title,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animtionController,
        child: GridView(
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
        builder: (context, child) => SlideTransition(
            position:
                Tween(begin: const Offset(0, 0.3), end: const Offset(0, 0))
                    .animate(CurvedAnimation(
                        parent: _animtionController, curve: Curves.easeInOut)),
            child: child)
        // Padding(
        //       padding:
        //           EdgeInsets.only(top: 100 - _animtionController.value * 100),
        //       child: child,
        //     )
        );
  }
}
