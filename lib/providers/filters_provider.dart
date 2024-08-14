import 'package:flutter_riverpod/flutter_riverpod.dart';

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
