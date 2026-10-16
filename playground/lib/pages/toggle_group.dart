import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum PlaygroundToggleGroupStyle {
  primary,
  outline,
  single,
  vertical,
  spacing,
  disabled,
}

class ToggleGroupPage extends StatelessWidget {
  const ToggleGroupPage({super.key, required this.style});

  final PlaygroundToggleGroupStyle style;

  @override
  Widget build(BuildContext context) {
    const items = [
      ShadToggleGroupItem(value: 'bold', child: Icon(LucideIcons.bold)),
      ShadToggleGroupItem(value: 'italic', child: Icon(LucideIcons.italic)),
      ShadToggleGroupItem(
        value: 'underline',
        child: Icon(LucideIcons.underline),
      ),
    ];

    return Scaffold(
      body: Center(
        child: switch (style) {
          PlaygroundToggleGroupStyle.primary =>
            ShadToggleGroup<String>.multiple(
              items: items,
            ),
          PlaygroundToggleGroupStyle.outline =>
            ShadToggleGroup<String>.multiple(
              variant: ShadToggleVariant.outline,
              items: items,
            ),
          PlaygroundToggleGroupStyle.single => ShadToggleGroup<String>(
            initialValue: 'center',
            items: const [
              ShadToggleGroupItem(
                value: 'left',
                child: Icon(LucideIcons.textAlignStart),
              ),
              ShadToggleGroupItem(
                value: 'center',
                child: Icon(LucideIcons.textAlignCenter),
              ),
              ShadToggleGroupItem(
                value: 'right',
                child: Icon(LucideIcons.textAlignEnd),
              ),
            ],
          ),
          PlaygroundToggleGroupStyle.vertical =>
            ShadToggleGroup<String>.multiple(
              variant: ShadToggleVariant.outline,
              axis: Axis.vertical,
              items: items,
            ),
          PlaygroundToggleGroupStyle.spacing =>
            ShadToggleGroup<String>.multiple(
              variant: ShadToggleVariant.outline,
              spacing: 8,
              items: items,
            ),
          PlaygroundToggleGroupStyle.disabled =>
            ShadToggleGroup<String>.multiple(
              enabled: false,
              items: items,
            ),
        },
      ),
    );
  }
}
