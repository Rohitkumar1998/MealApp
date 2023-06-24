// import 'package:flutter/material.dart';
// import 'package:meal/Models/meals.dart';

// class MealsScreen extends StatelessWidget {
//   const MealsScreen({super.key, required this.meals, required this.title});
//   final String title;
//   final List<Meal> meals;

//   @override
//   Widget build(BuildContext context) {
//     Widget content =
//         ListView.builder(itemBuilder: (ctx, index) => Text(meals[index].title));
//     if (meals.isEmpty) {
//       content = Center(
//           child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//         Text('Uh oh..nothing here!'),
//         SizedBox(
//           height: 16,
//         ),
//         Text(
//           'Try selcting a diifrent Category',
//           style: Theme.of(context)
//               .textTheme
//               .bodyLarge!
//               .copyWith(color: Theme.of(context).colorScheme.onBackground),
//         )
//       ]));
//     }
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: content,
//     );
//   }
// }
