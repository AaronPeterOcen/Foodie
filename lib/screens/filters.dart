import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.currentFilter,
  });

  final Map<Filter, bool> currentFilter;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegetarian = false;
  var _isVegan = false;

  @override
  void initState() {
    // changing the value of the selected filter item when the filter screen is selected to
    // show currently selected filter
    super.initState();
    _isGlutenFree = widget.currentFilter[Filter.glutenFree]!;
    _isLactoseFree = widget.currentFilter[Filter.lactoseFree]!;
    _isVegan = widget.currentFilter[Filter.vegan]!;
    _isVegetarian = widget.currentFilter[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MealDrawer(
      //   onScreenSelect: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context).pushReplacement(MaterialPageRoute(
      //         builder: (ctx) => const TabScreen(),
      //       ));
      //     }
      //   },
      // ),
      // ignore: deprecated_member_use
      body: PopScope(
        // onWillPop: () async {
        //   Navigator.of(context).pop({
        //     Filter.glutenFree: _isGlutenFree,
        //     Filter.lactoseFree: _isGlutenFree,
        //     Filter.vegan: _isVegan,
        //     Filter.vegetarian: _isVegetarian,
        //   });
        //   return false;
        //using PopScope to filter the items that will be selected by the filter choice
        canPop: false,
        // ignore: deprecated_member_use
        onPopInvokedWithResult: (bool didPop, result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _isGlutenFree,
            Filter.lactoseFree: _isGlutenFree,
            Filter.vegan: _isVegan,
            Filter.vegetarian: _isVegetarian,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              // hoverColor: Colors.blue,
              value: _isGlutenFree,
              onChanged: (isChanged) {
                setState(() {
                  _isGlutenFree = isChanged;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              subtitle: Text(
                'Only Gluten-free meals included.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.primaryContainer,
              inactiveTrackColor:
                  Theme.of(context).colorScheme.primaryContainer,
              contentPadding: const EdgeInsets.only(left: 28, right: 18),
            ),
            SwitchListTile(
              // hoverColor: Colors.blue,
              value: _isLactoseFree,
              onChanged: (isChanged) {
                setState(() {
                  _isLactoseFree = isChanged;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              subtitle: Text(
                'Only Lactose-free meals included.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.primaryContainer,
              inactiveTrackColor:
                  Theme.of(context).colorScheme.primaryContainer,
              contentPadding: const EdgeInsets.only(left: 28, right: 18),
            ),
            SwitchListTile(
              // hoverColor: Colors.blue,
              value: _isVegan,
              onChanged: (isChanged) {
                setState(() {
                  _isVegan = isChanged;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              subtitle: Text(
                'Only Vegan meals included.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.primaryContainer,
              inactiveTrackColor:
                  Theme.of(context).colorScheme.primaryContainer,
              contentPadding: const EdgeInsets.only(left: 28, right: 18),
            ),
            SwitchListTile(
              // hoverColor: Colors.blue,
              value: _isVegetarian,
              onChanged: (isChanged) {
                setState(() {
                  _isVegetarian = isChanged;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              subtitle: Text(
                'Only vegetarian meals included.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.primaryContainer,
              inactiveTrackColor:
                  Theme.of(context).colorScheme.primaryContainer,
              contentPadding: const EdgeInsets.only(left: 28, right: 18),
            )
          ],
        ),
      ),
      // drawer: ,
    );
  }
}

// FlutterError