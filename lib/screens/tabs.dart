import 'package:flutter/material.dart';
import 'package:foodie/models/meal.dart';
import 'package:foodie/screens/categories.dart';
import 'package:foodie/screens/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPage = 0;

  // initialize a final variable that will hold an empty list value
  final List<Meal> _favoriteMeal = [];

  // function will handle addition of the selected meal to the list
  // based on whether the item is already in the list or not
  void _toggleSelectedMeal(Meal meal) {
    final isExisting = _favoriteMeal.contains(meal);

    if (isExisting) {
      _favoriteMeal.remove(meal);
    } else {
      _favoriteMeal.add(meal);
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleSelectedMeal,
    );
    var activePageTitle = 'Categories';

    if (_selectedPage == 1) {
      activePage = MealsScreen(
        meals: [],
        onToggleFavorite: _toggleSelectedMeal,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
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
