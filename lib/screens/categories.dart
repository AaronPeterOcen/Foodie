import 'package:flutter/material.dart';
import 'package:foodie/data/dummy_data.dart';
import 'package:foodie/models/category.dart';
import 'package:foodie/models/meal.dart';
import 'package:foodie/screens/meals.dart';
import 'package:foodie/widgets/categories_grid_items.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
  });

  final void Function(Meal meal) onToggleFavorite;

  // using Navigator to allow switching btwn screens
  void _selectScreen(BuildContext context, Category category) {
    final sortedMeals = dummyMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: sortedMeals,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
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
              _selectScreen(context, category);
            },
          ),
      ],
    );
  }
}
