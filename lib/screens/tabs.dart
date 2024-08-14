import 'package:flutter/material.dart';
// import 'package:foodie/data/dummy_data.dart';
// import 'package:foodie/models/meal.dart';d
import 'package:foodie/providers/favorites_provider.dart';
import 'package:foodie/providers/filters_provider.dart';
// import 'package:foodie/providers/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodie/screens/categories.dart';
import 'package:foodie/screens/filters.dart';
import 'package:foodie/screens/meals.dart';
import 'package:foodie/widgets/meal_drawer.dart';

// FiltersProvider

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

// Stateful widget will be replaced with the ConsumerStatefulWidget to use the flutter_riverpod package
class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedPage = 0;

  // initialize a final variable that will hold an empty list value
  // final List<Meal> _favoriteMeal = [];
  // ignore: unused_field
  // Map<Filter, bool> _selectedFilters = kInitialFilters;

  // function will handle addition of the selected meal to the list
  // based on whether the item is already in the list or not
  // void _toggleSelectedMeal(Meal meal) {
  //   final isExisting = _favoriteMeal.contains(meal);

  //   if (isExisting) {
  //     // using setState to update the ui when the meal is selected or deselected
  //     setState(() {
  //       _favoriteMeal.remove(meal);
  //     });
  //     _showInfoMessage('Meal removed from favorites');
  //   } else {
  //     setState(() {
  //       _favoriteMeal.add(meal);
  //     });
  //     _showInfoMessage('Meal added to favorites');
  //   }
  // }

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  // will handle Drawer functionality to change screen with onScreenSelect
  void _screenSelect(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(
              // currentFilter: _selectedFilters,
              ),
        ),
      );

      // setState(() {
      //   _selectedFilters = result ?? kInitialFilters;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    // mealsProvider

    final availableMeals = ref.watch(filteredMealsProvider);
    Widget activePage = CategoriesScreen(
      // onToggleFavorite: _toggleSelectedMeal,
      availableMeal: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPage == 1) {
      final favoriteMeals = ref.watch(favoritesProvider);
      activePage = MealsScreen(
        meals:
            favoriteMeals, //allowing the favorited meal to be seen on the favorites page
        // onToggleFavorite: _toggleSelectedMeal,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MealDrawer(
        onScreenSelect: _screenSelect,
      ), //
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPage,
        // selectedItemColor: Theme.of(context).highlightColor.withBlue(255),
        // The items property defines the list of tabs in the BottomNavigationBar.
        items: const [
          // The first BottomNavigationBarItem represents the 'Categories' tab.
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_outlined), // The icon for the tab.
            label: 'Categories', // The label displayed under the icon.
          ),

          // The second BottomNavigationBarItem represents the 'Favorites' tab.
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border_rounded), // The icon for the tab.
            label: 'Favorites', // The label displayed under the icon.
          ),
        ],
      ),
    );
  }
}
