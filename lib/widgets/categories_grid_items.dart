import 'package:flutter/material.dart';
import 'package:foodie/models/category.dart';

class CategoriesGridItems extends StatelessWidget {
  const CategoriesGridItems({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: const Alignment(0.8, 1),
          colors: [
            category.color.withOpacity(0.5),
            category.color.withOpacity(0.90),
          ],
          tileMode: TileMode.mirror,
        ),
      ),
      child: Text(
        category.title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
    );
  }
}
