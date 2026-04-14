# Badge

Displays a badge or a component that looks like a badge.

## Primary



```dart
ShadBadge(
  child: const Text('Primary'),
)
```



## Secondary



```dart
ShadBadge.secondary(
  child: const Text('Secondary'),
)
```



## Destructive



```dart
ShadBadge.destructive(
  child: const Text('Destructive'),
)
```



## Outline



```dart
ShadBadge.outline(
  child: const Text('Outline'),
)
```

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BadgePage extends StatelessWidget {
  const BadgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      appBarTitle: 'Badge',
      children: [
        ShadBadge(child: Text('Primary')),
        ShadBadge.secondary(child: Text('Secondary')),
        ShadBadge.destructive(child: Text('Destructive')),
        ShadBadge.outline(child: Text('Outline')),
      ],
    );
  }
}

```
