import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/models/meal.dart';

class FavoritesNotifier extends StateNotifier<List<Meal>> {
  FavoritesNotifier() : super([]);
//whcich kind that pass in super so it used list
  bool toggleMealFavoritesStatus(Meal meal) {
    final mealIsaFavorite = state.contains(meal);
    if (mealIsaFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
    // /  // state = []; //state is globaly avilable state property
  }
}

final faveroteMealProvider =
    StateNotifierProvider<FavoritesNotifier, List<Meal>>((ref) {
  return FavoritesNotifier();
});
