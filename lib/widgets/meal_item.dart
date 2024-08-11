import 'package:flutter/material.dart';
import 'package:foodie/models/meal.dart';
import 'package:foodie/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onMealsDetails,
  });

  final Meal meal;

  // new function that will receive its data from the meals file
  final void Function(Meal meal) onMealsDetails;

  // Getter that will turn the first letter to a uppercase character
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      child: InkWell(
        onTap: () {
          // onMealsDetails is called in the anonymous function where it will be executed
          onMealsDetails(meal);
        },
        // Stack positions multiple widgets above each other
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              left: 0,
              child: Container(
                color: const Color.fromARGB(126, 1, 23, 61),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 39),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(203, 237, 237, 237),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.timelapse_outlined,
                          label: '${meal.duration} mins',
                        ),
                        const SizedBox(width: 10),
                        MealItemTrait(
                          icon: Icons.work_outline_sharp,
                          label: complexityText,
                        ),
                        const SizedBox(width: 10),
                        MealItemTrait(
                          icon: Icons.money,
                          label: affordabilityText,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// FlutterError
