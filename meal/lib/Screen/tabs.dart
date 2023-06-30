import 'package:flutter/material.dart';
import 'package:meal/Screen/categoryes.dart';
import 'package:meal/Screen/filters.dart';
import 'package:meal/Screen/meals.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/widget/main_drawer.dart';

const KInitialFilters = {
  //used for globalisation
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegiterian: false
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favarotieMeal = [];
  Map<Filter, bool> _selectedFilter = KInitialFilters;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        // duration: Duration(seconds: 5),
        content: Text(message)));
  }

  void _toggleMealFAveritesSatus(Meal meal) {
    final isExisting = _favarotieMeal.contains(meal);
    if (isExisting) {
      setState(() {});
      _favarotieMeal.remove(meal);
      _showInfoMessage('Meal is no longer a Favorite');
    } else {
      setState(() {});
      _favarotieMeal.add(meal);
      _showInfoMessage('Add to favarote meal');
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    if (identifier == 'filters') {
      Navigator.of(context).pop();
      final result =
          await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
              builder: (ctx) => FilterScreen(
                    currentFilters: _selectedFilter,
                  )));
      setState(() {
        _selectedFilter = result ?? KInitialFilters;
      });
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final avilableMeal = dummyMeals.where((meal) {
      if (_selectedFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilter[Filter.vegiterian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CartegoryScreen(
      onToggleFavorite: _toggleMealFAveritesSatus,
      avilableMeals: avilableMeal,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activePage = MealsSceen(
        meals: _favarotieMeal,
        ontoggleFavorite: _toggleMealFAveritesSatus,
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
