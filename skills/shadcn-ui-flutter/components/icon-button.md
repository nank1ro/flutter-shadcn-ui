# IconButton

Displays an icon button or a component that looks like a button with an icon.

## Primary



```dart
ShadIconButton(
  onPressed: () => print('Primary'),
  icon: const Icon(LucideIcons.rocket),
)
```



## Secondary



```dart
ShadIconButton.secondary(
  icon: const Icon(LucideIcons.rocket),
  onPressed: () => print('Secondary'),
)
```



## Destructive



```dart
ShadIconButton.destructive(
  icon: const Icon(LucideIcons.rocket),
  onPressed: () => print('Destructive'),
)
```



## Outline



```dart
ShadIconButton.outline(
  icon: const Icon(LucideIcons.rocket),
  onPressed: () => print('Outline'),
)
```



## Ghost



```dart
ShadIconButton.ghost(
  icon: const Icon(LucideIcons.rocket),
  onPressed: () => print('Ghost'),
)
```



## Loading



```dart
ShadIconButton(
  icon: SizedBox.square(
    dimension: 16,
    child: CircularProgressIndicator(
      strokeWidth: 2,
      color: ShadTheme.of(context).colorScheme.primaryForeground,
    ),
  ),
)
```



## Gradient and Shadow



```dart
ShadIconButton(
  gradient: const LinearGradient(colors: [
    Colors.cyan,
    Colors.indigo,
  ]),
  shadows: [
    BoxShadow(
      color: Colors.blue.withValues(alpha: .4),
      spreadRadius: 4,
      blurRadius: 10,
      offset: const Offset(0, 2),
    ),
  ],
  icon: const Icon(LucideIcons.rocket),
)
```

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class IconButtonPage extends StatefulWidget {
  const IconButtonPage({super.key});

  @override
  State<IconButtonPage> createState() => _IconButtonPageState();
}

class _IconButtonPageState extends State<IconButtonPage> {
  var enabled = true;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return FocusTraversalGroup(
      policy: WidgetOrderTraversalPolicy(),
      child: BaseScaffold(
        appBarTitle: 'IconButton',
        editable: [
          MyBoolProperty(
            label: 'Enabled',
            value: enabled,
            onChanged: (value) => setState(() => enabled = value),
          ),
        ],
        children: [
          ShadIconButton(
            enabled: enabled,
            onPressed: () => print('Primary'),
            icon: const Icon(LucideIcons.rocket),
          ),
          ShadIconButton.secondary(
            enabled: enabled,
            icon: const Icon(LucideIcons.rocket),
            onPressed: () => print('Secondary'),
          ),
          ShadIconButton.destructive(
            enabled: enabled,
            icon: const Icon(LucideIcons.rocket),
            onPressed: () => print('Destructive'),
          ),
          ShadIconButton.outline(
            enabled: enabled,
            icon: const Icon(LucideIcons.rocket),
            onPressed: () => print('Outline'),
          ),
          ShadIconButton.ghost(
            enabled: enabled,
            icon: const Icon(LucideIcons.rocket),
            onPressed: () => print('Ghost'),
          ),
          ShadIconButton(
            enabled: enabled,
            gradient: const LinearGradient(
              colors: [
                Colors.cyan,
                Colors.indigo,
              ],
            ),
            shadows: [
              BoxShadow(
                color: Colors.blue.withValues(alpha: .4),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
            icon: const Icon(LucideIcons.rocket),
          ),
          ShadIconButton(
            enabled: enabled,
            icon: SizedBox.square(
              dimension: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: theme.colorScheme.primaryForeground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

```
