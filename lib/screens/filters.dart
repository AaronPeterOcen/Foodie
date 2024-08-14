import 'package:flutter/material.dart';
import 'package:foodie/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// FiltersProvider

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
    // required this.currentFilter,
  });

  // final Map<Filter, bool> currentFilter;

//   @override
//   ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
// }

// class _FiltersScreenState extends ConsumerState<FiltersScreen> {
//   var _isGlutenFree = false;
//   var _isLactoseFree = false;
//   var _isVegetarian = false;
//   var _isVegan = false;

  // @override
  // void initState() {
  // changing the value of the selected filter item when the filter screen is selected to
  // show currently selected filter
  // super.initState();
  // using read because the state is executed once only
  //   var activeFilter = ref.read(filtersProvider);
  //   _isGlutenFree = activeFilter[Filter.glutenFree]!;
  //   _isLactoseFree = activeFilter[Filter.lactoseFree]!;
  //   _isVegan = activeFilter[Filter.vegan]!;
  //   _isVegetarian = activeFilter[Filter.vegetarian]!;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // using the provider to outsource the state
    final activeFilter = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body:

          // Navigator.of(context).pop({});
          // return true
          Column(
        children: [
          SwitchListTile(
            // hoverColor: Colors.blue,
            value: activeFilter[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
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
          ),
          SwitchListTile(
            // hoverColor: Colors.blue,
            value: activeFilter[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            subtitle: Text(
              'Only Lactose-free meals included.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.primaryContainer,
            inactiveTrackColor: Theme.of(context).colorScheme.primaryContainer,
            contentPadding: const EdgeInsets.only(left: 28, right: 18),
          ),
          SwitchListTile(
            // hoverColor: Colors.blue,
            value: activeFilter[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            subtitle: Text(
              'Only Vegan meals included.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.primaryContainer,
            inactiveTrackColor: Theme.of(context).colorScheme.primaryContainer,
            contentPadding: const EdgeInsets.only(left: 28, right: 18),
          ),
          SwitchListTile(
            // hoverColor: Colors.blue,
            value: activeFilter[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            subtitle: Text(
              'Only vegetarian meals included.',
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
    );
    // drawer: ,
  }
}

// FlutterError