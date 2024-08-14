import 'package:flutter/material.dart';
import 'package:foodie/models/meal.dart';

// Page that is going to display new items on the loaded screen
class MealDetails extends StatelessWidget {
  const MealDetails({
    super.key,
    required this.meal,
    // required this.onToggleFavorite,
  });

  final Meal meal;
  // final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        // adding the action widget to handle adding favorite meal items
        // the function will be got from the tabs screen
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(meal);
            },
            icon: const Icon(Icons.star_border_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        //for scrollability and fit items
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
            ),
            const SizedBox(height: 14),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            // ignore: unused_local_variable
            for (final ingredients in meal.ingredients)
              Text(
                ingredients,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
            const SizedBox(height: 24),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            // ignore: unused_local_variable
            for (final steps in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                child: Text(
                  textAlign: TextAlign.center,
                  '> $steps',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
