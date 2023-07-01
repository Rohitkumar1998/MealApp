import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/Screen/categoryes.dart';
import 'package:meal/Screen/filters.dart';
import 'package:meal/Screen/meals.dart';
// import 'package:meal/data/dummy_data.dart';

import 'package:meal/widget/main_drawer.dart';

import 'package:meal/providers/favMealProvider.dart';
import 'package:meal/providers/filter_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  // final List<Meal> _favarotieMeal = [];
  // Map<Filter, bool> _selectedFilter = KInitialFilters;

  // void _toggleMealFAveritesSatus(Meal meal) {
  //   final isExisting = _favarotieMeal.contains(meal);
  //   if (isExisting) {
  //     setState(() {});
  //     _favarotieMeal.remove(meal);
  //     _showInfoMessage('Meal is no longer a Favorite');
  //   } else {
  //     setState(() {});
  //     _favarotieMeal.add(meal);
  //     _showInfoMessage('Add to favarote meal');
  //   }
  // }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    if (identifier == 'filters') {
      Navigator.of(context).pop();

      await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(builder: (ctx) => FilterScreen()));
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final avilableMeals = ref.watch(filteredMealsProvider);
    Widget activePage = CartegoryScreen(
      avilableMeals: avilableMeals,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(faveroteMealProvider); //////
      activePage = MealsSceen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              label: 'Categories'), //this for category
          BottomNavigationBarItem(
              icon: Icon(Icons.star), label: 'Favorites'), //this for faverate
        ],
      ),
    );
  }
}
