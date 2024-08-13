import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegetarian = false;
  var _isVegan = false;

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
      body: Column(
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
            inactiveTrackColor: Theme.of(context).colorScheme.primaryContainer,
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
            inactiveTrackColor: Theme.of(context).colorScheme.primaryContainer,
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
            inactiveTrackColor: Theme.of(context).colorScheme.primaryContainer,
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
            inactiveTrackColor: Theme.of(context).colorScheme.primaryContainer,
            contentPadding: const EdgeInsets.only(left: 28, right: 18),
          )
        ],
      ),
      // drawer: ,
    );
  }
}

// FlutterError