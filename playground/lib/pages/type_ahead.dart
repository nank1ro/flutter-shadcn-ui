import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

const _fruits = [
  'Apple',
  'Banana',
  'Blueberry',
  'Cherry',
  'Grapes',
  'Lemon',
  'Mango',
  'Orange',
  'Peach',
  'Pear',
  'Pineapple',
  'Plum',
  'Raspberry',
  'Strawberry',
  'Watermelon',
];

class TypeAheadPage extends StatelessWidget {
  const TypeAheadPage({super.key});

  Future<List<String>> _suggestFruits(String query) async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (query.isEmpty) return _fruits;
    return _fruits
        .where((f) => f.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: ShadTypeAhead<String>(
              placeholder: const Text('Search a fruit...'),
              suggestionsCallback: _suggestFruits,
              itemBuilder: (context, fruit) {
                return Text(fruit);
              },
            ),
          ),
        ),
      ),
    );
  }
}
