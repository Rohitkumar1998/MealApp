import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/providers/meals.proveder.dart';

enum Filter { glutenFree, lactoseFree, vegan, vegiterian }

class FilterNotifer extends StateNotifier<Map<Filter, bool>> {
  FilterNotifer()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegiterian: false
        });
  void setFilter(Filter filter, bool isActive) {
    // state[filter] = isActive; //is not =>mutating state
    state = {...state, filter: isActive};
  }

  void setFiltered(Map<Filter, bool> choosenFilters) {
    state = choosenFilters;
  }
}

final filterProvider = StateNotifierProvider<FilterNotifer, Map<Filter, bool>>(
    (ref) => FilterNotifer());

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealProviders);
  final activeFilter = ref.watch(filterProvider);
  return meals.where((meal) {
    if (activeFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilter[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    if (activeFilter[Filter.vegiterian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
