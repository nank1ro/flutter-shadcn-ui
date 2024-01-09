import 'package:flutter/material.dart';

class MyEnumProperty<T> extends StatelessWidget {
  const MyEnumProperty({
    super.key,
    required this.label,
    required this.value,
    required this.values,
    required this.onChanged,
  });

  final String label;
  final T value;
  final List<Enum> values;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 8),
        DropdownButton(
          value: value,
          items: values
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e.name.replaceAll('\$', '')),
                ),
              )
              .toList(),
          onChanged: (v) {
            if (v == null) return;
            onChanged(v as T);
          },
        ),
      ],
    );
  }
}
