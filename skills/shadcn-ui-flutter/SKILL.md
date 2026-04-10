---
name: shadcn-ui-flutter
description: A comprehensive Flutter UI library inspired by shadcn/ui. Provides high-quality, customizable, and accessible components including Buttons, Cards, Forms, and more. Use this skill when building Flutter UIs, implementing design systems, or needing specific component usage examples.
---

# Shadcn UI for Flutter

This skill provides documentation and examples for using the `shadcn_ui` package in Flutter.

## Theming and Customization
Shadcn UI for Flutter provides a powerful theming system. You can use built-in color schemes (blue, gray, green, neutral, orange, red, rose, slate, stone, violet, yellow, zinc) or create your own.

### Applying a Theme
Use `ShadThemeData` within `ShadApp` to define your light and dark themes.

### Detailed Guides
- [Theming](guides/theming.md)
- [Typography](guides/typography.md)
- [Material & Cupertino Interop](guides/interop.md)
- [Responsive](guides/responsive.md)
- [Decorator](guides/decorator.md)

## Components
| Name | Description | Reference |
| :--- | :--- | :--- |
| Accordion | A vertically stacked set of interactive headings that each reveal a section of content. | [accordion.md](components/accordion.md) |
| Alert | Displays a callout for user attention. | [alert.md](components/alert.md) |
| Avatar | An image element with a placeholder for representing the user. | [avatar.md](components/avatar.md) |
| Badge | Displays a badge or a component that looks like a badge. | [badge.md](components/badge.md) |
| Breadcrumb | Displays the path to the current resource using a hierarchy of links. | [breadcrumb.md](components/breadcrumb.md) |
| Button | Displays a button or a component that looks like a button. | [button.md](components/button.md) |
| Calendar | A date field component that allows users to enter and edit date. | [calendar.md](components/calendar.md) |
| Card | Displays a card with header, content, and footer. | [card.md](components/card.md) |
| Checkbox | A control that allows the user to toggle between checked and not checked. | [checkbox.md](components/checkbox.md) |
| Context Menu | Displays a menu to the user — such as a set of actions or functions — triggered by a mouse right-click. | [context-menu.md](components/context-menu.md) |
| Date Picker | A date picker component with range and presets. | [date-picker.md](components/date-picker.md) |
| Dialog | A modal dialog that interrupts the user. | [dialog.md](components/dialog.md) |
| Form | Builds a form with validation and easy access to form fields values. | [form.md](components/form.md) |
| IconButton | Displays an icon button or a component that looks like a button with an icon. | [icon-button.md](components/icon-button.md) |
| Input | Displays a form input field or a component that looks like an input field. | [input.md](components/input.md) |
| InputOTP | Accessible one-time password component with copy paste functionality. | [input-otp.md](components/input-otp.md) |
| Menubar | A visually persistent menu common in desktop applications that provides quick access to a consistent set of commands. | [menubar.md](components/menubar.md) |
| Popover | Displays rich content in a portal, triggered by a button. | [popover.md](components/popover.md) |
| Progress | Displays an indicator showing the completion progress of a task, typically displayed as a progress bar. | [progress.md](components/progress.md) |
| RadioGroup | A set of checkable buttons—known as radio buttons—where no more than one of the buttons can be checked at a time. | [radio-group.md](components/radio-group.md) |
| Resizable | Resizable panel groups and layouts. | [resizable.md](components/resizable.md) |
| Select | Displays a list of options for the user to pick from—triggered by a button. | [select.md](components/select.md) |
| Separator | Visually or semantically separates content. | [separator.md](components/separator.md) |
| Sheet | Extends the Dialog component to display content that complements the main content of the screen. | [sheet.md](components/sheet.md) |
| Slider | An input where the user selects a value from within a given range. | [slider.md](components/slider.md) |
| Sonner | An opinionated toast component. | [sonner.md](components/sonner.md) |
| Switch | A control that allows the user to toggle between checked and not checked. | [switch.md](components/switch.md) |
| Table | A responsive table component. | [table.md](components/table.md) |
| Tabs | A set of layered sections of content—known as tab panels—that are displayed one at a time. | [tabs.md](components/tabs.md) |
| Textarea | Displays a form textarea or a component that looks like a textarea. | [textarea.md](components/textarea.md) |
| Time Picker | A time picker component. | [time-picker.md](components/time-picker.md) |
| Toast | A succinct message that is displayed temporarily. | [toast.md](components/toast.md) |
| Tooltip | A popup that displays information related to an element when the element receives keyboard focus or the mouse hovers over it. | [tooltip.md](components/tooltip.md) |

## Usage Examples
Examples are available at the bottom of each component page.

### Basic Setup
Here is a complete example of a Counter App using `shadcn_ui`, including light and dark theme support.
```dart
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      debugShowCheckedModeBanner: false,
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme: const ShadZincColorScheme.light(),
      ),
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadZincColorScheme.dark(),
      ),
      themeMode: ThemeMode.system,
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Shadcn Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
              style: theme.textTheme.muted,
            ),
            Text(
              '$_counter',
              style: theme.textTheme.h1,
            ),
          ],
        ),
      ),
      floatingActionButton: ShadButton(
        onPressed: _incrementCounter,
        child: const Icon(LucideIcons.plus),
      ),
    );
  }
}
```

## Packages included in the library

Flutter Shadcn UI consists of fantastic open-source libraries that are exported and you can use them without importing them into your project.

### [flutter_animate](https://pub.dev/packages/flutter_animate)

The flutter animate library is a very cool animations library extensively used in Shadcn UI Components.

With flutter_animate animations can be easily customized from the user, because components will take a `List<Effect>`.

### [lucide_icons_flutter](https://pub.dev/packages/lucide_icons_flutter)

A nice icon library that is used in Shadcn UI Components.
You can use Lucide icons with the `LucideIcons` class, for example `LucideIcons.activity`.

You can browse all the icons [here](https://lucide.dev/icons/).

### [two_dimensional_scrollables](https://pub.dev/packages/two_dimensional_scrollables)

A nice raw table (very performant) implementation used by the [ShadTable](../components/table) component.

### [intl](https://pub.dev/packages/intl)

The intl package provides internationalization and localization facilities, including message translation.

### [universal_image](https://pub.dev/packages/universal_image)

Support multiple image formats. Used by the [ShadAvatar](../components/avatar) component.
