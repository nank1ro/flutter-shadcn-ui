# Sheet

Extends the Dialog component to display content that complements the main content of the screen.



```dart
ShadButton.outline(
  child: const Text('Open'),
  onPressed: () => showShadSheet(
    side: ShadSheetSide.right,
    context: context,
    builder: (context) => const EditProfileSheet(),
  ),
),

final profile = [
  (title: 'Name', value: 'Alexandru'),
  (title: 'Username', value: 'nank1ro'),
];

class EditProfileSheet extends StatelessWidget {
  const EditProfileSheet({super.key, required this.side});

  final ShadSheetSide side;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ShadSheet(
      constraints: side == ShadSheetSide.left || side == ShadSheetSide.right
          ? const BoxConstraints(maxWidth: 512)
          : null,
      title: const Text('Edit Profile'),
      description: const Text(
          "Make changes to your profile here. Click save when you're done"),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: profile
              .map(
                (p) => Row(
                  children: [
                    Expanded(
                      child: Text(
                        p.title,
                        textAlign: TextAlign.end,
                        style: theme.textTheme.small,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 5,
                      child: ShadInput(initialValue: p.value),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
      actions: const [
        ShadButton(child: Text('Save changes')),
      ],
    );
  }
}
```



## Side

Use the `side` property to `showShadSheet` to indicate the edge of the screen where the component will appear. The values can be `top`, `right`, `bottom` or `left`.



```dart
Row(
  mainAxisSize: MainAxisSize.min,
  spacing: 16,
  children: [
    Column(
      spacing: 16,
      mainAxisSize: MainAxisSize.min,
      children: [
        ShadButton.outline(
          width: 100,
          child: const Text('Top'),
          onPressed: () => showShadSheet(
            side: ShadSheetSide.top,
            context: context,
            builder: (context) =>
                const EditProfileSheet(side: ShadSheetSide.top),
          ),
        ),
        ShadButton.outline(
          width: 100,
          child: const Text('Bottom'),
          onPressed: () => showShadSheet(
            side: ShadSheetSide.bottom,
            context: context,
            builder: (context) => const EditProfileSheet(
                side: ShadSheetSide.bottom),
          ),
        ),
      ],
    ),
    Column(
      spacing: 16,
      mainAxisSize: MainAxisSize.min,
      children: [
        ShadButton.outline(
          width: 100,
          child: const Text('Right'),
          onPressed: () => showShadSheet(
            side: ShadSheetSide.right,
            context: context,
            builder: (context) => const EditProfileSheet(
                side: ShadSheetSide.right),
          ),
        ),
        ShadButton.outline(
          width: 100,
          child: const Text('Left'),
          onPressed: () => showShadSheet(
            side: ShadSheetSide.left,
            context: context,
            builder: (context) => const EditProfileSheet(
                side: ShadSheetSide.left),
          ),
        ),
      ],
    ),
  ],
),

// See EditProfileSheet code in the previous code example
```

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:example/common/extensions.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final profile = [
  (title: 'Name', value: 'Alexandru'),
  (title: 'Username', value: 'nank1ro'),
];

class SheetPage extends StatefulWidget {
  const SheetPage({super.key});

  @override
  State<SheetPage> createState() => _SheetPageState();
}

class _SheetPageState extends State<SheetPage> {
  var side = ShadSheetSide.bottom;
  var draggable = false;
  var titlePinned = false;
  var descriptionPinned = false;
  var actionsPinned = true;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return BaseScaffold(
      appBarTitle: 'Sheet',
      editable: [
        MyEnumProperty(
          label: 'Side',
          value: side,
          values: ShadSheetSide.values,
          onChanged: (value) {
            if (value != null) {
              setState(() {
                side = value;
              });
            }
          },
        ),
        MyBoolProperty(
          label: 'Draggable',
          value: draggable,
          onChanged: (value) => setState(() => draggable = value),
        ),
        MyBoolProperty(
          label: 'titlePinned',
          value: titlePinned,
          onChanged: (v) => setState(() => titlePinned = v),
        ),
        MyBoolProperty(
          label: 'descriptionPinned',
          value: descriptionPinned,
          onChanged: (v) => setState(() => descriptionPinned = v),
        ),
        MyBoolProperty(
          label: 'actionsPinned',
          value: actionsPinned,
          onChanged: (v) => setState(() => actionsPinned = v),
        ),
      ],
      children: [
        ShadButton.outline(
          child: const Text('Open'),
          onPressed: () {
            showShadSheet(
              context: context,
              side: side,
              builder: (context) {
                return ShadSheet(
                  draggable: draggable,
                  constraints:
                      side == ShadSheetSide.left || side == ShadSheetSide.right
                      ? const BoxConstraints(maxWidth: 512)
                      : null,
                  title: const Text('Edit Profile'),
                  description: const Text(
                    "Make changes to your profile here. Click save when you're done",
                  ),
                  actions: const [ShadButton(child: Text('Save changes'))],
                  titlePinned: titlePinned,
                  descriptionPinned: descriptionPinned,
                  actionsPinned: actionsPinned,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 16,
                      children:
                          (profile.map(
                                    (p) => Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            p.title,
                                            textAlign: TextAlign.end,
                                            style: theme.textTheme.small,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          flex: 5,
                                          child: ShadInput(
                                            initialValue: p.value,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ) *
                                  20)
                              .toList(),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

```
