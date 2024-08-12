import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            // hoverColor: Colors.blue,
            value: _isGlutenFree,
            onChanged: (isChanged) {
              setState(() {
                _isGlutenFree = isChanged;
              });
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            subtitle: Text(
              'Only Gluten-free meals included.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.primaryContainer,
            inactiveTrackColor: Theme.of(context).colorScheme.primaryContainer,
            contentPadding: const EdgeInsets.only(left: 28, right: 18),
          )
        ],
      ),
      // drawer: ,
    );
  }
}

// FlutterError