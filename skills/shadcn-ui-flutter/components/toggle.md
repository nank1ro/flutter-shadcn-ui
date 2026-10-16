# Toggle

A two-state button that can be either on or off.



```dart
class ToggleExample extends StatefulWidget {
  const ToggleExample({super.key});

  @override
  State<ToggleExample> createState() => _ToggleExampleState();
}

class _ToggleExampleState extends State<ToggleExample> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return ShadToggle.outline(
      value: value,
      onChanged: (v) => setState(() => value = v),
      size: ShadButtonSize.sm,
      leading: BookmarkIcon(filled: value),
      child: const Text('Bookmark'),
    );
  }
}

/// Lucide's bookmark icon, filled with the icon color when [filled].
///
/// The Lucide icon font only has outlined glyphs, so the SVG is used to fill
/// it.
class BookmarkIcon extends StatelessWidget {
  const BookmarkIcon({super.key, required this.filled});

  final bool filled;

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    final size = iconTheme.size ?? 16;
    return SvgPicture.string(
      '''
<svg viewBox="0 0 24 24" fill="${filled ? 'currentColor' : 'none'}" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
  <path d="M17 3a2 2 0 0 1 2 2v15a1 1 0 0 1-1.496.868l-4.512-2.578a2 2 0 0 0-1.984 0l-4.512 2.578A1 1 0 0 1 5 20V5a2 2 0 0 1 2-2z"/>
</svg>''',
      width: size,
      height: size,
      theme: SvgTheme(currentColor: iconTheme.color ?? const Color(0xFF000000)),
    );
  }
}
```



## Outline



```dart
ShadToggle.outline(
  value: value,
  onChanged: (v) => setState(() => value = v),
  child: const Icon(LucideIcons.italic),
)
```



## With Text



```dart
ShadToggle(
  value: value,
  onChanged: (v) => setState(() => value = v),
  leading: const Icon(LucideIcons.italic),
  child: const Text('Italic'),
)
```



## Small



```dart
ShadToggle(
  value: value,
  onChanged: (v) => setState(() => value = v),
  size: ShadButtonSize.sm,
  child: const Icon(LucideIcons.italic),
)
```



## Large



```dart
ShadToggle(
  value: value,
  onChanged: (v) => setState(() => value = v),
  size: ShadButtonSize.lg,
  child: const Icon(LucideIcons.italic),
)
```



## Disabled



```dart
ShadToggle(
  value: value,
  onChanged: (v) => setState(() => value = v),
  enabled: false,
  child: const Icon(LucideIcons.underline),
)
```

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TogglePage extends StatefulWidget {
  const TogglePage({super.key});

  @override
  State<TogglePage> createState() => _TogglePageState();
}

class _TogglePageState extends State<TogglePage> {
  bool enabled = true;
  ShadToggleVariant variant = ShadToggleVariant.primary;
  ShadButtonSize size = ShadButtonSize.regular;
  bool bookmark = false;
  bool italic = true;
  bool bold = false;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Toggle',
      editable: [
        MyBoolProperty(
          label: 'Enabled',
          value: enabled,
          onChanged: (value) => setState(() => enabled = value),
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
      ],
      children: [
        ShadToggle.raw(
          variant: variant,
          size: size,
          enabled: enabled,
          value: bookmark,
          onChanged: (value) => setState(() => bookmark = value),
          leading: BookmarkIcon(filled: bookmark),
          child: const Text('Bookmark'),
        ),
        ShadToggle.raw(
          variant: variant,
          size: size,
          enabled: enabled,
          value: italic,
          onChanged: (value) => setState(() => italic = value),
          leading: const Icon(LucideIcons.italic),
          child: const Text('Italic'),
        ),
        ShadToggle.raw(
          variant: variant,
          size: size,
          enabled: enabled,
          value: bold,
          onChanged: (value) => setState(() => bold = value),
          child: const Icon(LucideIcons.bold),
        ),
      ],
    );
  }
}

/// Lucide's bookmark icon, filled with the icon color when [filled].
///
/// The Lucide icon font only has outlined glyphs, so the SVG is used to fill
/// it.
class BookmarkIcon extends StatelessWidget {
  const BookmarkIcon({super.key, required this.filled});

  final bool filled;

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    final size = iconTheme.size ?? 16;
    return SvgPicture.string(
      '''
<svg viewBox="0 0 24 24" fill="${filled ? 'currentColor' : 'none'}" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
  <path d="M17 3a2 2 0 0 1 2 2v15a1 1 0 0 1-1.496.868l-4.512-2.578a2 2 0 0 0-1.984 0l-4.512 2.578A1 1 0 0 1 5 20V5a2 2 0 0 1 2-2z"/>
</svg>''',
      width: size,
      height: size,
      theme: SvgTheme(currentColor: iconTheme.color ?? const Color(0xFF000000)),
    );
  }
}

```
