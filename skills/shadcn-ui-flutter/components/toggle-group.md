# Toggle Group

A set of two-state buttons that can be toggled on or off.

The group is a single Tab stop, entered on the first pressed item (or the last focused one): the arrow keys move the focus between the items and wrap around (a horizontal group uses all four arrows, like shadcn/ui, while a vertical group ignores Left and Right), Home/PageUp and End/PageDown move it to the first and last item, and disabled items are skipped. When the items are joined (`spacing` is 0), they draw the focus ring inside their bounds, because the next item would paint over a ring drawn around them.



```dart
ShadToggleGroup<String>.multiple(
  onChanged: (values) => print(values),
  items: const [
    ShadToggleGroupItem(
      value: 'bold',
      child: Icon(LucideIcons.bold, semanticLabel: 'Toggle bold'),
    ),
    ShadToggleGroupItem(
      value: 'italic',
      child: Icon(LucideIcons.italic, semanticLabel: 'Toggle italic'),
    ),
    ShadToggleGroupItem(
      value: 'underline',
      child: Icon(LucideIcons.underline, semanticLabel: 'Toggle underline'),
    ),
  ],
)
```



## Outline



```dart
ShadToggleGroup<String>.multiple(
  variant: ShadToggleVariant.outline,
  items: const [
    ShadToggleGroupItem(
      value: 'bold',
      child: Icon(LucideIcons.bold, semanticLabel: 'Toggle bold'),
    ),
    ShadToggleGroupItem(
      value: 'italic',
      child: Icon(LucideIcons.italic, semanticLabel: 'Toggle italic'),
    ),
    ShadToggleGroupItem(
      value: 'underline',
      child: Icon(LucideIcons.underline, semanticLabel: 'Toggle underline'),
    ),
  ],
)
```



## Single

At most one item can be pressed. Set `allowDeselection: false` so the pressed item can't be turned off, and pass an `initialValue` to keep one item pressed from the start.



```dart
ShadToggleGroup<String>(
  initialValue: 'center',
  onChanged: (value) => print(value),
  items: const [
    ShadToggleGroupItem(
      value: 'left',
      child: Icon(LucideIcons.textAlignStart, semanticLabel: 'Align left'),
    ),
    ShadToggleGroupItem(
      value: 'center',
      child: Icon(LucideIcons.textAlignCenter, semanticLabel: 'Align center'),
    ),
    ShadToggleGroupItem(
      value: 'right',
      child: Icon(LucideIcons.textAlignEnd, semanticLabel: 'Align right'),
    ),
  ],
)
```



## Vertical



```dart
ShadToggleGroup<String>.multiple(
  variant: ShadToggleVariant.outline,
  axis: Axis.vertical,
  items: const [
    ShadToggleGroupItem(
      value: 'bold',
      child: Icon(LucideIcons.bold, semanticLabel: 'Toggle bold'),
    ),
    ShadToggleGroupItem(
      value: 'italic',
      child: Icon(LucideIcons.italic, semanticLabel: 'Toggle italic'),
    ),
    ShadToggleGroupItem(
      value: 'underline',
      child: Icon(LucideIcons.underline, semanticLabel: 'Toggle underline'),
    ),
  ],
)
```



## Spacing



```dart
ShadToggleGroup<String>.multiple(
  variant: ShadToggleVariant.outline,
  spacing: 8,
  items: const [
    ShadToggleGroupItem(
      value: 'bold',
      child: Icon(LucideIcons.bold, semanticLabel: 'Toggle bold'),
    ),
    ShadToggleGroupItem(
      value: 'italic',
      child: Icon(LucideIcons.italic, semanticLabel: 'Toggle italic'),
    ),
    ShadToggleGroupItem(
      value: 'underline',
      child: Icon(LucideIcons.underline, semanticLabel: 'Toggle underline'),
    ),
  ],
)
```



## Disabled



```dart
ShadToggleGroup<String>.multiple(
  enabled: false,
  items: const [
    ShadToggleGroupItem(
      value: 'bold',
      child: Icon(LucideIcons.bold, semanticLabel: 'Toggle bold'),
    ),
    ShadToggleGroupItem(
      value: 'italic',
      child: Icon(LucideIcons.italic, semanticLabel: 'Toggle italic'),
    ),
    ShadToggleGroupItem(
      value: 'underline',
      child: Icon(LucideIcons.underline, semanticLabel: 'Toggle underline'),
    ),
  ],
)
```

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum TextFormat { bold, italic, underline }

enum TextAlignment { left, center, right }

class ToggleGroupPage extends StatefulWidget {
  const ToggleGroupPage({super.key});

  @override
  State<ToggleGroupPage> createState() => _ToggleGroupPageState();
}

class _ToggleGroupPageState extends State<ToggleGroupPage> {
  bool enabled = true;
  bool allowDeselection = true;
  ShadToggleVariant variant = ShadToggleVariant.primary;
  ShadButtonSize size = ShadButtonSize.regular;
  Axis axis = Axis.horizontal;
  bool spaced = false;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Toggle Group',
      editable: [
        MyBoolProperty(
          label: 'Enabled',
          value: enabled,
          onChanged: (value) => setState(() => enabled = value),
        ),
        MyBoolProperty(
          label: 'Allow deselection',
          value: allowDeselection,
          onChanged: (value) => setState(() => allowDeselection = value),
        ),
        MyBoolProperty(
          label: 'Spacing',
          value: spaced,
          onChanged: (value) => setState(() => spaced = value),
        ),
        MyEnumProperty(
          label: 'Variant',
          value: variant,
          values: ShadToggleVariant.values,
          onChanged: (value) {
            if (value != null) setState(() => variant = value);
          },
        ),
        MyEnumProperty(
          label: 'Size',
          value: size,
          values: ShadButtonSize.values,
          onChanged: (value) {
            if (value != null) setState(() => size = value);
          },
        ),
        MyEnumProperty(
          label: 'Axis',
          value: axis,
          values: Axis.values,
          onChanged: (value) {
            if (value != null) setState(() => axis = value);
          },
        ),
      ],
      children: [
        const Text('Multiple'),
        ShadToggleGroup<TextFormat>.multiple(
          enabled: enabled,
          variant: variant,
          size: size,
          axis: axis,
          spacing: spaced ? 8 : null,
          initialValues: const {TextFormat.bold},
          onChanged: (values) => debugPrint('Formats: $values'),
          items: const [
            ShadToggleGroupItem(
              value: TextFormat.bold,
              child: Icon(LucideIcons.bold, semanticLabel: 'Toggle bold'),
            ),
            ShadToggleGroupItem(
              value: TextFormat.italic,
              child: Icon(LucideIcons.italic, semanticLabel: 'Toggle italic'),
            ),
            ShadToggleGroupItem(
              value: TextFormat.underline,
              child: Icon(
                LucideIcons.underline,
                semanticLabel: 'Toggle underline',
              ),
            ),
          ],
        ),
        const Text('Single'),
        ShadToggleGroup<TextAlignment>(
          enabled: enabled,
          allowDeselection: allowDeselection,
          variant: variant,
          size: size,
          axis: axis,
          spacing: spaced ? 8 : null,
          initialValue: TextAlignment.left,
          onChanged: (value) => debugPrint('Alignment: $value'),
          items: const [
            ShadToggleGroupItem(
              value: TextAlignment.left,
              leading: Icon(LucideIcons.textAlignStart),
              child: Text('Left'),
            ),
            ShadToggleGroupItem(
              value: TextAlignment.center,
              leading: Icon(LucideIcons.textAlignCenter),
              child: Text('Center'),
            ),
            ShadToggleGroupItem(
              value: TextAlignment.right,
              enabled: false,
              leading: Icon(LucideIcons.textAlignEnd),
              child: Text('Right'),
            ),
          ],
        ),
      ],
    );
  }
}

```
