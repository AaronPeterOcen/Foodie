import 'package:flutter/material.dart';
// import 'package:foodie/main.dart';

class MealDrawer extends StatelessWidget {
  const MealDrawer({super.key, required this.onScreenSelect});

  final void Function(String identifier)
      onScreenSelect; // will be used to handle screen change when drawer item is touched

  @override
  Widget build(BuildContext context) {
    // using a new widget item the Drawer widget
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            // functionality to add the header of the drawer item
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.7)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood_outlined,
                  size: 50,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
                const SizedBox(width: 15),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
          // Adding drawer items
          ListTile(
            leading: Icon(
              Icons.restaurant_rounded,
              size: 26,
              color: Theme.of(context).colorScheme.onTertiaryContainer,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
            ),
            onTap: () {
              onScreenSelect('meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings_applications_outlined,
              size: 26,
              color: Theme.of(context).colorScheme.onTertiaryContainer,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
            ),
            onTap: () {
              onScreenSelect('filters');
            },
          )
        ],
      ),
    );
  }
}
