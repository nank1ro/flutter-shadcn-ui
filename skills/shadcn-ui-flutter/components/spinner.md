# Spinner

An indeterminate loading indicator, for async work whose completion amount is unknown.

It rotates `LucideIcons.loaderCircle` once per second. Pass `icon` to use a
different one, such as `LucideIcons.loader`.

For determinate progress, use [Progress](/flutter-shadcn-ui/components/progress/) instead.

## Default


 ```dart
const ShadSpinner(
  size: 32,
),
```


## Sizes


 ```dart
const Wrap(
  alignment: WrapAlignment.center,
  spacing: 32,
  runSpacing: 8,
  children: [
    ShadSpinner(size: 16),
    ShadSpinner(size: 24),
    ShadSpinner(size: 32),
    ShadSpinner(size: 48),
  ],
),
```


## Colors


 ```dart
final colorScheme = ShadTheme.of(context).colorScheme;

Wrap(
  alignment: WrapAlignment.center,
  spacing: 32,
  runSpacing: 8,
  children: [
    ShadSpinner(size: 32, color: colorScheme.primary),
    ShadSpinner(size: 32, color: colorScheme.mutedForeground),
    ShadSpinner(size: 32, color: colorScheme.destructive),
  ],
),
```


## Inside a button


 ```dart
ShadButton(
  onPressed: () {},
  child: Row(
    mainAxisSize: MainAxisSize.min,
    spacing: 8,
    children: [
      const ShadSpinner(size: 16),
      const Text('Please wait'),
    ],
  ),
),
```


## Inline


 ```dart
final theme = ShadTheme.of(context);

ConstrainedBox(
  constraints: const BoxConstraints(maxWidth: 320),
  child: ShadCard(
    width: double.infinity,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        ShadSpinner(size: 20, color: theme.colorScheme.mutedForeground),
        Flexible(
          child: Text('Fetching your data…', style: theme.textTheme.muted),
        ),
      ],
    ),
  ),
),
```


## Accessibility

The spinner uses a localized loading label by default and is marked as a live
region, so assistive technology announces it when it appears. Set
`semanticsLabel` to override the default when a more specific announcement is
needed. Custom labels are used as-is, so localize them in your app.

```dart
const ShadSpinner(semanticsLabel: 'Loading more results'),
```

## Disabling the animation

Set `animate` to `false` to render a static icon. The rotation duration is
themeable via `ShadSpinnerTheme.duration`.

This is not wired to the platform's "reduce motion" accessibility setting
automatically. To follow it:

```dart
ShadSpinner(animate: !MediaQuery.disableAnimationsOf(context)),
```

```dart
const ShadSpinner(animate: false),
```

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SpinnerPage extends StatefulWidget {
  const SpinnerPage({super.key});

  @override
  State<SpinnerPage> createState() => _SpinnerPageState();
}

class _SpinnerPageState extends State<SpinnerPage> {
  bool animate = true;
  double size = 16;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return BaseScaffold(
      appBarTitle: 'Spinner',
      editable: [
        MyBoolProperty(
          label: 'Animate',
          value: animate,
          onChanged: (value) => setState(() => animate = value),
        ),
        Column(
          children: [
            Text(
              'Size (${size.toStringAsFixed(0)})',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 200,
              child: ShadSlider(
                initialValue: size,
                min: 8,
                max: 64,
                onChanged: (value) => setState(() => size = value),
              ),
            ),
          ],
        ),
      ],
      children: [
        const Text('Default'),
        ShadSpinner(
          size: size,
          animate: animate,
        ),
        const Text('Colored'),
        ShadSpinner(
          size: size,
          animate: animate,
          color: theme.colorScheme.destructive,
        ),
        const Text('Inside a button'),
        ShadButton(
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              ShadSpinner(
                size: 16,
                animate: animate,
              ),
              const Text('Please wait'),
            ],
          ),
        ),
      ],
    );
  }
}

```
