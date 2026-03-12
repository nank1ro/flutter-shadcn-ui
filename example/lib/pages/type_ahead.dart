import 'package:example/common/base_scaffold.dart';
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

class TypeAheadPage extends StatefulWidget {
  const TypeAheadPage({super.key});

  @override
  State<TypeAheadPage> createState() => _TypeAheadPageState();
}

class _TypeAheadPageState extends State<TypeAheadPage> {
  final formKey = GlobalKey<ShadFormState>();

  Future<List<String>> _suggestFruits(String query) async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (query.isEmpty) return _fruits;
    return _fruits
        .where((f) => f.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Future<List<String>> _suggestFruitsWithError(String query) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (query.toLowerCase() == 'error') {
      throw Exception('Simulated error');
    }
    return _fruits
        .where((f) => f.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return BaseScaffold(
      appBarTitle: 'TypeAhead',
      children: [
        // Basic TypeAhead
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: ShadTypeAhead<String>(
            placeholder: const Text('Search a fruit...'),
            leading: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(
                LucideIcons.search,
                size: 16,
                color: theme.colorScheme.mutedForeground,
              ),
            ),
            suggestionsCallback: _suggestFruits,
            itemBuilder: (context, fruit) {
              return Text(fruit);
            },
            onSelected: (fruit) {
              // ignore: avoid_print
              print('Selected: $fruit');
            },
          ),
        ),
        const SizedBox(height: 32),

        // TypeAhead with custom builders (type "error" to trigger error)
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: ShadTypeAhead<String>(
            placeholder: const Text('Type "error" to test...'),
            suggestionsCallback: _suggestFruitsWithError,
            loadingBuilder: (context) {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: Text('Loading suggestions...')),
              );
            },
            emptyBuilder: (context) {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: Text('No fruits found.')),
              );
            },
            errorBuilder: (context, error) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    'Error: $error',
                    style: TextStyle(color: theme.colorScheme.destructive),
                  ),
                ),
              );
            },
            itemBuilder: (context, fruit) {
              return Text(fruit);
            },
          ),
        ),
        const SizedBox(height: 32),

        // TypeAhead Form Field
        ShadForm(
          key: formKey,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ShadTypeAheadFormField<String>(
                  id: 'fruit',
                  label: const Text('Favorite Fruit'),
                  placeholder: const Text('Search a fruit...'),
                  description: const Text('Select your favorite fruit.'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a fruit';
                    }
                    return null;
                  },
                  suggestionsCallback: _suggestFruits,
                  itemBuilder: (context, fruit) {
                    return Text(fruit);
                  },
                ),
                const SizedBox(height: 16),
                ShadButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    if (formKey.currentState!.saveAndValidate()) {
                      final value = formKey.currentState!.value;
                      // ignore: avoid_print
                      print('Form value: $value');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
