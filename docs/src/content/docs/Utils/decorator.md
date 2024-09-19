---
title: Decorator
sidebar:
  order: 5
---

Decorates most of the components of the library using a `ShadDecoration` handled by the `ShadDecorator` component.

## Default

```dart
ShadDecoration(
  secondaryBorder: ShadBorder.all(
    padding: const EdgeInsets.all(4),
    width: 0,
  ),
  secondaryFocusedBorder: ShadBorder.all(
    width: 2,
    color: colorScheme.ring,
    radius: radius.add(radius / 2),
    padding: const EdgeInsets.all(2),
  ),
  labelStyle: textTheme.muted.copyWith(
    fontWeight: FontWeight.w500,
    color: colorScheme.foreground,
  ),
  errorStyle: textTheme.muted.copyWith(
    fontWeight: FontWeight.w500,
    color: colorScheme.destructive,
  ),
  labelPadding: const EdgeInsets.only(bottom: 8),
  descriptionStyle: textTheme.muted,
  descriptionPadding: const EdgeInsets.only(top: 8),
  errorPadding: const EdgeInsets.only(top: 8),
  errorLabelStyle: textTheme.muted.copyWith(
    fontWeight: FontWeight.w500,
    color: colorScheme.destructive,
  ),
);
```

## Secondary Border

By default, a secondary border is drawn around the focusable components.
If you want to disable it and instead make bolder the primary border, you just need to add the `disableSecondaryBorder` property to the theme.

```dart
ShadThemeData(
  // Disables the secondary border
  disableSecondaryBorder: true,
),
```
