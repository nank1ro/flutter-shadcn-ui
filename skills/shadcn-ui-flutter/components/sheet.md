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

## Dynamic Sticky Title with List

Use a `ShadSheet` with `scrollable: false` and manage the scroll + title
yourself. The title bar sits outside the scroll view so it stays pinned,
and a `ScrollController` listener updates the title text based on which
section is currently visible.

```dart
showShadSheet(
  context: context,
  builder: (context) => const _ListSheetContent(),
);

class _ListSheetContent extends StatefulWidget {
  const _ListSheetContent();

  @override
  State<_ListSheetContent> createState() => _ListSheetContentState();
}

class _ListSheetContentState extends State<_ListSheetContent> {
  late final ScrollController _scrollController;
  String _currentSection = sections.first.title;
  late final List<double> _sectionOffsets;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(_onScroll);

    _sectionOffsets = [];
    double offset = 0;
    for (final s in sections) {
      _sectionOffsets.add(offset);
      offset += 48; // section header height
      offset += s.products.length * 72; // item height
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _scrollController.position.pixels;
    for (var i = _sectionOffsets.length - 1; i >= 0; i--) {
      if (offset >= _sectionOffsets[i] - 1) {
        if (_currentSection != sections[i].title) {
          setState(() => _currentSection = sections[i].title);
        }
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final s = sections;

    return ShadSheet(
      scrollable: false,
      expandable: true,
      initialSize: 1.0,
      minSize: 0.3,
      maxSize: 1.0,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          // Pinned title — outside the scroll view
          Container(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 12),
            decoration: BoxDecoration(
              color: theme.colorScheme.background,
              border: Border(
                bottom: BorderSide(
                  color: theme.colorScheme.border,
                ),
              ),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Text(
                _currentSection,
                key: ValueKey(_currentSection),
                style: theme.textTheme.large.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          // Scrollable list with section headers + items
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.zero,
              itemCount: s.fold<int>(
                0,
                (sum, sec) => sum + 1 + sec.products.length,
              ),
              itemBuilder: (context, index) {
                var remaining = index;
                for (final section in s) {
                  if (remaining == 0) {
                    // Section header
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      color: theme.colorScheme.muted
                          .withValues(alpha: 0.3),
                      child: Text(section.title),
                    );
                  }
                  remaining--;
                  if (remaining < section.products.length) {
                    // Product item
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      child: Text(
                        section.products[remaining].name,
                      ),
                    );
                  }
                  remaining -= section.products.length;
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
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
