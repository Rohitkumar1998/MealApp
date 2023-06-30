import 'package:flutter/material.dart';

// import 'package:meal/Screen/tabs.dart';
// import 'package:meal/widget/main_drawer.dart';
enum Filter { glutenFree, lactoseFree, vegan, vegiterian }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutineFreeFilter = false;
  var _lactoseFreeFilter = false; //we can not use the current state
  // from the create state to state variable
  var _veganFilter = false;
  var _vegitarianFilter = false;
  @override
  void initState() {
    super.initState();
    _glutineFreeFilter = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilter = widget.currentFilters[Filter.lactoseFree]!;
    _veganFilter = widget.currentFilters[Filter.vegan]!;
    _vegitarianFilter = widget.currentFilters[Filter.vegiterian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filter'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifire) {
      //     //identifire a variable
      //     Navigator.of(context).pop();
      //     if (identifire == 'meals') {
      //       Navigator.of(context)
      //           .push(MaterialPageRoute(builder: (ctx) => TabsScreen()));
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutineFreeFilter,
            Filter.lactoseFree: _lactoseFreeFilter,
            Filter.vegan: _veganFilter,
            Filter.vegiterian: _vegitarianFilter
          });
          return false;
        },
        child: Column(children: [
          SwitchListTile(
            value: _glutineFreeFilter,
            onChanged: (isChecked) {
              setState(() {
                _glutineFreeFilter = isChecked;
              });
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include gultine-free meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _lactoseFreeFilter,
            onChanged: (isChecked) {
              setState(() {
                _lactoseFreeFilter = isChecked;
              });
            },
            title: Text(
              'Lactos-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include lactose-free meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _veganFilter,
            onChanged: (isChecked) {
              setState(() {
                _veganFilter = isChecked;
              });
            },
            title: Text(
              'Vegan',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include vegan meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _vegitarianFilter,
            onChanged: (isChecked) {
              setState(() {
                _vegitarianFilter = isChecked;
              });
            },
            title: Text(
              'Vegiterian',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include Vegiterian meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          )
        ]),
      ),
    );
  }
}
