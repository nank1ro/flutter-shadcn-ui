Contributing to Flutter Shadcn UI
=======================

_TL;DR_: join [Discord](https://discord.gg/ZhRMAPNh5Y), be courteous.

## Welcome

There are many ways to contribute, including writing code, filing issues on GitHub, helping to triage, reproduce, or
fix bugs that people have filed, adding to our documentation,
doing outreach about Flutter, or helping out in any other way.

We communicate primarily over GitHub and [Discord](https://discord.gg/ZhRMAPNh5Y).

### Helping out in the issue database

Triage is the process of going through bug reports and determining if they are valid, finding out
how to reproduce them, catching duplicate reports, and generally making our issues list
useful for our engineers.

If you want to help us triage, you are very welcome to do so!

See all the issues [here](https://github.com/nank1ro/flutter-shadcn-ui/issues)

## Quality Assurance

One of the most useful tasks, closely related to triage, is finding and filing bug reports. Testing
beta releases, looking for regressions, creating test cases, adding to our test suites, and
other work along these lines can really drive the quality of the product up. Creating tests
that increase our test coverage, writing tests for issues others have filed, all these tasks
are really valuable contributions to open source projects.

If this interests you, you can jump in and submit bug reports without needing anyone's permission!

If you want to contribute test cases, you can also submit PRs.

## Introducing new components

See the missing components in the [README.md](./README.md).

> The component you want to add must be present on [shadcn.com](https://ui.shadcn.com/docs/components/).

Create a new file in the `lib/src/components` directory and follow the structure of the other components.
The name of the file is the name of the component, for example `avatar.dart` or `dialog.dart`.

The name of the widget must be prefixed with `Shad`, so we have `ShadAvatar` and `ShadDialog`.

Each component should have a corresponding theme, which is put at the path `lib/src/theme/components` with the same name of the component you provided early.

The component and the component's theme must be exported from the `lib/shadcn_ui.dart` file.

The parameters of the component should be as customizable as possible, ideally they must be put in both the component and component's theme.

"Ideally" the parameter in the component must be retrieved in this way:

```dart
Widget build(BuildContext context) {
  final theme = ShadTheme.of(context);
  final effectivePadding = widget.padding ?? theme.avatarTheme.padding ?? {DEFAULT_PADDING_VALUE};
}
```

To make this work, both the padding parameter in the component and the padding parameter in the theme must be optional.

Another important step is the default component theme which is placed in the `lib/src/theme/themes/default_theme_variant` and `lib/src/theme/themes/default_theme_no_secondary_border_variant` files.

The difference between the two default themes is that the first one uses the secondary border in each component, while the second one does not use it.
The only difference between the two themes should be the `decoration` of the component parts, to handle or not the secondary border.

---

When the same component has multiple variants, create an enum, for example:

```dart
enum ShadAlertVariant {
  primary,
  destructive,
}
```

The constructors of the component should be like this:

```dart
// This is the primary constructor
const ShadAlert({
    super.key,
}) : variant = ShadAlertVariant.primary;

// This a specific variant constructor
const ShadAlert.destructive({
  super.key,
}) : variant = ShadAlertVariant.destructive;

// This is a generic constructor, which can be used to create any variant
const ShadAlert.raw({
  super.key,
  required this.variant,
 });

final ShadAlertVariant variant;
```

## Running example

The `example` folder is where you can add and manually test each component.
Copy a component from `lib/pages` and add the code to it.

The basic structure of an example component contains:

```dart
return BaseScaffold(
  appBarTitle: 'Alert',
  children: [
    ShadAlert(),
  ],
),
```

The `BaseScaffold` can contain an `editable` list of widgets, to apply customizations to the component from the right side of the screen.

For example:

```diff
BaseScaffold(
+  editable: [
+   MyBoolProperty(
+     label: 'Enabled',
+     value: enabled,
+     onChanged: (value) => setState(() => enabled = value),
+    ),
+ ],
),
```

You can see all the available properties in the `lib/common/properties` folder.
Feel free to propose a new property if you need it.

## Playground

The playground is used to show components from the documentation.
The directory of the playground is `playground`.

You can add a new component in the `lib/pages` directory.

To create the new component route, add a code like this in the `lib/main.dart` file:

```dart
final _router = GoRouter(
  routes: [
    ... // other routes
    GoRoute(
      path: '/alert',
      builder: (context, state) {
        final style =
            state.uri.queryParameters['style'] ?? ShadAlertVariant.primary.name;
        return AlertPage(
          style: ShadAlertVariant.values.byName(style),
        );
      },
    ),
]
```
## Last things

I wrote the documentation quickly, if you notice any problems let me know on Discord (find the link above) and I will be happy to improve this documentation.

