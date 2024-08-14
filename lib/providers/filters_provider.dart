import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodie/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

// A StateNotifier class that manages the state of dietary filters.
class FiltersProvider extends StateNotifier<Map<Filter, bool>> {
  // The constructor initializes the state with default values for the filters.
  FiltersProvider()
      : super({
          // Each filter is initialized to 'false', meaning no filters are active by default.
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
        });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  // Method to update the state of a specific filter.
  void setFilter(Filter filter, bool isActive) {
    // Update the state by creating a new map with the updated filter value.
    state = {
      ...state, // Spread operator to keep the existing filter states.
      filter: isActive, // Set the specified filter to the new value.
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersProvider, Map<Filter, bool>>(
  (ref) => FiltersProvider(),
);

// A Provider that filters the meals based on the active dietary filters.
final filteredMealsProvider = Provider((ref) {
  // Watch the mealsProvider to get the current list of meals.
  final meals = ref.watch(mealsProvider);

  // Watch the filtersProvider to get the current state of active filters.
  final activeFilters = ref.watch(filtersProvider);

  // Filter the meals based on the active filters.
  return meals.where((meal) {
    // If the gluten-free filter is active and the meal is not gluten-free, exclude it.
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    // If the lactose-free filter is active and the meal is not lactose-free, exclude it.
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    // If the vegan filter is active and the meal is not vegan, exclude it.
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    // If the vegetarian filter is active and the meal is not vegetarian, exclude it.
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    // If the meal passes all the active filter checks, include it in the filtered list.
    return true;
  }).toList();
});
