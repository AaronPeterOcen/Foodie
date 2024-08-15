import 'package:flutter/material.dart';
import 'package:foodie/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodie/providers/favorites_provider.dart';
// import 'package:foodie/providers/filters_provider.dart';

// Page that is going to display new items on the loaded screen
class MealDetails extends ConsumerWidget {
  const MealDetails({
    super.key,
    required this.meal,
    // required this.onToggleFavorite,
  });

  final Meal meal;
  // final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoritesProvider);

    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        // adding the action widget to handle adding favorite meal items
        // the function will be got from the tabs screen
        actions: [
          IconButton(
              onPressed: () {
                // Access the favoritesProvider's notifier to call its methods
                final wasAdded = ref
                    .read(favoritesProvider.notifier)
                    // Call the toggleFavoritesMealState method with the meal object
                    .toggleFavoritesMealState(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(wasAdded
                        ? 'Meal has been added as a favorite'
                        : 'Meal removed'),
                  ),
                );
              },
              icon: AnimatedSwitcher(
                //using animated switcher  to animate the icon
                duration: const Duration(milliseconds: 250),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: animation,
                    child: child,
                  );
                },
                child: Icon(
                  isFavorite
                      ? Icons.star_purple500_sharp
                      : Icons.star_border_outlined,
                ),
              ))
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
