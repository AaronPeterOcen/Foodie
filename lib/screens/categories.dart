import 'package:flutter/material.dart';
import 'package:foodie/data/dummy_data.dart';
import 'package:foodie/models/category.dart';
import 'package:foodie/models/meal.dart';
import 'package:foodie/screens/meals.dart';
import 'package:foodie/widgets/categories_grid_items.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    // required this.onToggleFavorite,
    required this.availableMeal,
  });

  // final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeal;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

// setting up the explicit animations controller
class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // using Navigator to allow switching btwn screens
  void _selectScreen(BuildContext context, Category category) {
    final sortedMeals = widget.availableMeal
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
          // onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
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
        ),
        builder: (context, child) => SlideTransition(
            position: Tween(
              begin: const Offset(0, 0.3),
              end: const Offset(0, 0),
            ).animate(CurvedAnimation(
                    parent: _animationController, curve: Curves.ease)
                //  _animationController.drive(),
                ),
            child: child));
  }
}
