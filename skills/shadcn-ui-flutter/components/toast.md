# Toast

A succinct message that is displayed temporarily.



```dart
ShadButton.outline(
  child: const Text('Add to calendar'),
  onPressed: () {
    ShadToaster.of(context).show(
      ShadToast(
        title: const Text('Scheduled: Catch up'),
        description:
            const Text('Friday, February 10, 2023 at 5:57 PM'),
        action: ShadButton.outline(
          child: const Text('Undo'),
          onPressed: () => ShadToaster.of(context).hide(),
        ),
      ),
    );
  },
),
```



## Simple



```dart
ShadButton.outline(
  child: const Text('Show Toast'),
  onPressed: () {
    ShadToaster.of(context).show(
      const ShadToast(
        description: Text('Your message has been sent.'),
      ),
    );
  },
),
```



## With Title



```dart
ShadButton.outline(
  child: const Text('Show Toast'),
  onPressed: () {
    ShadToaster.of(context).show(
      const ShadToast(
        title: Text('Uh oh! Something went wrong'),
        description:
            Text('There was a problem with your request'),
      ),
    );
  },
),
```



## With Action



```dart
ShadButton.outline(
  child: const Text('Show Toast'),
  onPressed: () {
    ShadToaster.of(context).show(
      ShadToast(
        title: const Text('Uh oh! Something went wrong'),
        description:
            const Text('There was a problem with your request'),
        action: ShadButton.outline(
          child: const Text('Try again'),
          onPressed: () => ShadToaster.of(context).hide(),
        ),
      ),
    );
  },
),
```



## Destructive



```dart
final theme = ShadTheme.of(context);

ShadButton.outline(
  child: const Text('Show Toast'),
  onPressed: () {
    ShadToaster.of(context).show(
      ShadToast.destructive(
        title: const Text('Uh oh! Something went wrong'),
        description:
            const Text('There was a problem with your request'),
        action: ShadButton.destructive(
          child: const Text('Try again'),
          decoration: ShadDecoration(
            border: ShadBorder.all(
              color: theme.colorScheme.destructiveForeground,
              width: 1,
            ),
          ),
          onPressed: () => ShadToaster.of(context).hide(),
        ),
      ),
    );
  },
),
```

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum Alignm {
  topRight,
  topLeft,
  bottomRight,
  bottomLeft,
  centerRight,
  centerLeft,
  center,
  topCenter,
  bottomCenter;

  Alignment toAlignment() {
    return switch (this) {
      topRight => Alignment.topRight,
      topLeft => Alignment.topLeft,
      bottomRight => Alignment.bottomRight,
      bottomLeft => Alignment.bottomLeft,
      centerRight => Alignment.centerRight,
      centerLeft => Alignment.centerLeft,
      center => Alignment.center,
      topCenter => Alignment.topCenter,
      bottomCenter => Alignment.bottomCenter,
    };
  }
}

class ToastPage extends StatefulWidget {
  const ToastPage({super.key});

  @override
  State<ToastPage> createState() => _ToastPageState();
}

class _ToastPageState extends State<ToastPage> {
  var alignment = Alignm.bottomRight;
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Toast',
      editable: [
        MyEnumProperty<Alignm>(
          label: 'Alignment',
          value: alignment,
          values: Alignm.values,
          onChanged: (v) {
            if (v != null) {
              setState(() {
                alignment = v;
              });
            }
          },
        ),
      ],
      children: [
        ShadButton.outline(
          child: const Text('Add to calendar'),
          onPressed: () {
            final toaster = ShadToaster.of(context);
            toaster.show(
              ShadToast(
                alignment: alignment.toAlignment(),
                title: const Text('Scheduled: Catch up'),
                description: const Text('Friday, February 10, 2023 at 5:57 PM'),
                action: ShadButton.outline(
                  child: const Text('Undo'),
                  onPressed: () => toaster.hide(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

```
