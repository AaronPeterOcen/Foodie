import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose category'),
      ),
      body: GridView(
        // The grid delegate defines how the grid items should be arranged.
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // Number of columns in the grid.
          crossAxisCount: 2,

          // The aspect ratio (width/height) for each item in the grid.
          childAspectRatio: 1.5,

          // The horizontal space between the items.
          crossAxisSpacing: 20,

          // The vertical space between the items.
          mainAxisSpacing: 20,
        ),

        // The children of the GridView, which will be laid out according to the grid delegate.
        children: const [
          // Each Text widget represents an item in the grid.
          Text('data'),
          Text('data1'),
          Text('data2'),
          Text('data3'),
          Text('data4'),
          Text('data5'),
        ],
      ),
    );
  }
}
