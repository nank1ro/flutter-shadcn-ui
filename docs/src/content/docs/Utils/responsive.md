---
title: Responsive
sidebar:
  order: 5
---
In *shadcn_ui* the responsiveness is an important part of the library.

The `ShadTheme` supports a customizable set of breakpoints.

## Default

```dart
ShadThemeData(
  breakpoints: ShadBreakpoints(
    tn: 0, // tiny
    sm: 640, // small
    md: 768, // medium
    lg: 1024, // large
    xl: 1280, // extra large
    xxl: 1536, // extra extra large
  ),
);
```

## Current breakpoint

To get the current breakpoint you can use `ShadResponsiveBuilder` or `context.breakpoint`, eg:

```dart

ShadResponsiveBuilder(
  builder: (context, breakpoint) {
    final sm = breakpoint >= ShadTheme.of(context).breakpoints.sm;
    ...
  },
),
```

which is equivalent to:

```dart
final sm = context.breakpoint >= ShadTheme.of(context).breakpoints.sm;

```

In Tailwind CSS, it's common to say that *sm* is not for small screens, but will target also the largest sizes if you don't provide a larger breakpoint.

That's why I'm using the `>=` operator.

If you just want to check if you're in a specific breakpoint, use the `==` operator.

## Sealed class

The breakpoint returned is a sealed class so you can switch any size.

```dart

ShadResponsiveBuilder(
  builder: (context, breakpoint) {
    return switch (breakpoint) {
      ShadBreakpointTN() => const Text('Tiny'),
      ShadBreakpointSM() => const Text('Small'),
      ShadBreakpointMD() => const Text('Medium'),
      ShadBreakpointLG() => const Text('Large'),
      ShadBreakpointXL() => const Text('Extra Large'),
      ShadBreakpointXXL() => const Text('Extra Extra Large'),
    };
  },
),
```

