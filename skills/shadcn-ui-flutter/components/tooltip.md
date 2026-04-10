# Tooltip

A popup that displays information related to an element when the element receives keyboard focus or the mouse hovers over it.


```dart
ShadTooltip(
  builder: (context) => const Text('Add to library'),
  child: ShadButton.outline(
    child: const Text('Hover/Focus'),
    onPressed: () {},
  ),
),
```


The tooltip works on hover only if the child uses a `ShadGestureDetector`. If you don't use a `ShadButton` or something similar that implements `ShadGestureDetector` hover will not work.
If, for example, you want to just show an image as child, wrap it with `ShadGestureDetector` to make it working.

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TooltipPage extends StatefulWidget {
  const TooltipPage({super.key});

  @override
  State<TooltipPage> createState() => _TooltipPageState();
}

class _TooltipPageState extends State<TooltipPage> {
  final focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Tooltip',
      children: [
        ShadTooltip(
          focusNode: focusNode,
          builder: (context) => const Text('Add to library'),
          child: ShadButton.outline(
            focusNode: focusNode,
            child: const Text('Hover/Focus'),
          ),
        ),
      ],
    );
  }
}

```
