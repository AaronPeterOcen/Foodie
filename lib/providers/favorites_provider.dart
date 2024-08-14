import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodie/models/meal.dart';

// A custom StateNotifier class that manages the list of favorite meals.
class FavoritesProviderNotifier extends StateNotifier<List<Meal>> {
  // The constructor initializes the state with an empty list of meals.
  FavoritesProviderNotifier() : super([]);

  // This method toggles the favorite status of a given meal.
  bool toggleFavoritesMealState(Meal meal) {
    // Check if the meal is already in the list of favorites.
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      // If the meal is already a favorite, remove it from the list.
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      // If the meal is not a favorite, add it to the list.
      state = [...state, meal];
      return true;
    }
  }
}

// Defining a StateNotifierProvider that manages a list of favorite meals.
// This provider allows widgets to interact with the FavoritesProviderNotifier.
final favoritesProvider =
    StateNotifierProvider<FavoritesProviderNotifier, List<Meal>>((ref) {
  // Return an instance of FavoritesProviderNotifier to handle the state.
  return FavoritesProviderNotifier();
});
