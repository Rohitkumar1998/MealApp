import 'package:flutter/material.dart';
import 'package:meal/Screen/meal_detail.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/widget/meal_item.dart';

class MealsSceen extends StatelessWidget {
  const MealsSceen({super.key, required this.meals, required this.title});
  final String title;
  final List<Meal> meals;
  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => MealDetailsScreen(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
              meal: meals[index],
              onselectMeal: (context, meal) {
                selectMeal(context, meal);
              },
            ));
    if (meals.isEmpty) {
      content = Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh ho ... nothing here!',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Try Selcting adiffrent category !',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: content);
  }
}
