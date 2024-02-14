import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MyEnumProperty<T extends Enum> extends StatelessWidget {
  const MyEnumProperty({
    super.key,
    required this.label,
    required this.value,
    required this.values,
    required this.onChanged,
  });

  final String label;
  final T value;
  final List<T> values;
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
        ShadSelect<T>(
          initialValue: value,
          options: values
              .map(
                (e) => ShadOption(
                  value: e,
                  child: Text(e.name.replaceAll('\$', '')),
                ),
              )
              .toList(),
          selectedOptionBuilder: (context, value) {
            return Text(value.name.replaceAll('\$', ''));
          },
          onChanged: onChanged,
        ),
      ],
    );
  }
}
