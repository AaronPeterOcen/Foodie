import 'package:flutter/material.dart';
import 'package:foodie/models/meal.dart';

// Page that is going to display new items on the loaded screen
class MealDetails extends StatelessWidget {
  const MealDetails({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Image.network(
        meal.imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 300,
      ),
    );
  }
}
