import 'package:flutter/material.dart';
import 'package:foodie/models/meal.dart';
import 'package:foodie/screens/meal_details.dart';
import 'package:foodie/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.title,
    required this.meals,
  });

  final String title;
  final List<Meal> meals;

  // Function to navigate to the MealDetails screen when a meal is selected.
  void mealsDetails(BuildContext context, Meal meal) {
    // Use Navigator to push a new MaterialPageRoute onto the navigation stack.
    Navigator.of(context).push(
      MaterialPageRoute(
        // The builder function creates the MealDetails screen, passing the selected meal as an argument.
        builder: (ctx) => MealDetails(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(
        meal: meals[index],
        onMealsDetails: (meal) {
          mealsDetails(context, meal);
        },
      ),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'No data to be found!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              'Try any other category',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}

// FlutterError