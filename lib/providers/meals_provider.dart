import 'package:flutter_riverpod/flutter_riverpod.dart'; // Riverpod for state management
import 'package:foodie/data/dummy_data.dart'; // Importing the dummy data for meals

// Defining a Riverpod provider named 'mealsProvider'.
// The 'Provider' is a type of Riverpod provider that returns a value which doesn't change over time.
// In this case, it returns the 'dummyMeals' data.
final mealsProvider = Provider((ref) {
  // The function passed to 'Provider' returns the 'dummyMeals' list.
  return dummyMeals;
});
