import 'package:flutter/material.dart';
import 'package:foodie/data/dummy_data.dart';
import 'package:foodie/screens/meals.dart';
import 'package:foodie/widgets/categories_grid_items.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  // using Navigator to allow switching btwn screens
  void _selectScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => const MealsScreen(
          title: 'meal',
          meals: [],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        // The grid delegate defines how the grid items should be arranged.
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // Number of columns in the grid.
          crossAxisCount: 2,

          // The aspect ratio (width/height) for each item in the grid.
          childAspectRatio: 1.5,

          // The horizontal space between the items.
          crossAxisSpacing: 20,

          // The vertical space between the items.
          mainAxisSpacing: 20,
        ),

        // The children of the GridView, which will be laid out according to the grid delegate.
        children: [
          // Each Text widget represents an item in the grid.
          for (final category in availableCategories)
            CategoriesGridItems(
              category: category,
              onSelectCategory: () {
                _selectScreen(context);
              },
            ),
        ],
      ),
    );
  }
}
