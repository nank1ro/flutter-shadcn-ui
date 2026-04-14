# Progress

Displays an indicator showing the completion progress of a task, typically displayed as a progress bar.

## Determinate


 ```dart
ConstrainedBox(
  constraints: BoxConstraints(
    maxWidth: MediaQuery.sizeOf(context).width * 0.6,
  ),
  child: const ShadProgress(value: 0.5),
),
```



## Indeterminate

 ```dart
ConstrainedBox(
  constraints: BoxConstraints(
    maxWidth: MediaQuery.sizeOf(context).width * 0.6,
  ),
  child: const ShadProgress(),
),
```

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  var value = 50;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Progress',
      children: [
        Text('Determinate Progress'),
        ShadProgress(
          value: value / 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShadIconButton.ghost(
              enabled: value != 0,
              onPressed: () => setState(() => value -= 10),
              icon: const Icon(Icons.remove),
            ),
            ShadIconButton.ghost(
              enabled: value != 100,
              onPressed: () => setState(() => value += 10),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        Text('Indeterminate Progress'),
        ShadProgress(),
      ],
    );
  }
}

```
