import 'package:flutter/material.dart';
import 'package:foodie/main.dart';

class MealDrawer extends StatelessWidget {
  const MealDrawer({super.key});

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
          )
        ],
      ),
    );
  }
}
