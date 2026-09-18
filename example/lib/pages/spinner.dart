import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SpinnerPage extends StatefulWidget {
  const SpinnerPage({super.key});

  @override
  State<SpinnerPage> createState() => _SpinnerPageState();
}

class _SpinnerPageState extends State<SpinnerPage> {
  bool animate = true;
  double size = 16;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return BaseScaffold(
      appBarTitle: 'Spinner',
      editable: [
        MyBoolProperty(
          label: 'Animate',
          value: animate,
          onChanged: (value) => setState(() => animate = value),
        ),
        Column(
          children: [
            Text(
              'Size (${size.toStringAsFixed(0)})',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 200,
              child: ShadSlider(
                initialValue: size,
                min: 8,
                max: 64,
                onChanged: (value) => setState(() => size = value),
              ),
            ),
          ],
        ),
      ],
      children: [
        const Text('Default'),
        ShadSpinner(
          size: size,
          animate: animate,
          semanticsLabel: 'Loading',
        ),
        const Text('Colored'),
        ShadSpinner(
          size: size,
          animate: animate,
          color: theme.colorScheme.destructive,
        ),
        const Text('Inside a button'),
        ShadButton(
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              ShadSpinner(
                size: 16,
                animate: animate,
                color: theme.colorScheme.primaryForeground,
              ),
              const Text('Please wait'),
            ],
          ),
        ),
      ],
    );
  }
}
