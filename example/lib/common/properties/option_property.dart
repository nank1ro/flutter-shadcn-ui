import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MyOptionProperty<T> extends StatelessWidget {
  const MyOptionProperty({
    super.key,
    required this.label,
    required this.initialOption,
    required this.options,
    required this.onChanged,
    required this.optionToString,
    this.maxWidth,
    this.minWidth,
    this.labelTextStyle,
  });

  final String label;
  final T initialOption;
  final List<T> options;
  final ValueChanged<T?> onChanged;
  final String Function(T option) optionToString;
  final double? minWidth;
  final double? maxWidth;
  final TextStyle? labelTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: labelTextStyle ?? const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 8),
        ShadSelect<T>(
          initialValue: initialOption,
          minWidth: minWidth,
          maxWidth: maxWidth,
          options: options
              .map(
                (e) => ShadOption(
                  value: e,
                  child: Text(optionToString(e)),
                ),
              )
              .toList(),
          selectedOptionBuilder: (context, value) {
            return Text(optionToString(value));
          },
          onChanged: onChanged,
        ),
      ],
    );
  }
}
