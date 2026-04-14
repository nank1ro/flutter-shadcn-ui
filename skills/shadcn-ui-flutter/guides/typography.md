Styles for headings, paragraphs, lists...etc

## h1Large


 ```dart
Text(
  'Taxing Laughter: The Joke Tax Chronicles',
  style: ShadTheme.of(context).textTheme.h1Large,
)
```


## h1


 ```dart
Text(
  'Taxing Laughter: The Joke Tax Chronicles',
  style: ShadTheme.of(context).textTheme.h1,
)
```


## h2


 ```dart
Text(
  'The People of the Kingdom',
  style: ShadTheme.of(context).textTheme.h2,
)
```


## h3


 ```dart
Text(
  'The Joke Tax',
  style: ShadTheme.of(context).textTheme.h3,
)
```


## h4


 ```dart
Text(
  'The king, seeing how much happier his subjects were, realized the error of his ways and repealed the joke tax.',
  style: ShadTheme.of(context).textTheme.h4,
)
```


## p


 ```dart
Text(
  'The king, seeing how much happier his subjects were, realized the error of his ways and repealed the joke tax.',
  style: ShadTheme.of(context).textTheme.p,
)
```


## Blockquote


 ```dart
Text(
  '"After all," he said, "everyone enjoys a good joke, so it\'s only fair that they should pay for the privilege."',
  style: ShadTheme.of(context).textTheme.blockquote,
)
```


## Table


 ```dart
Text(
  "King's Treasury",
  style: ShadTheme.of(context).textTheme.table,
)
```


## List


 ```dart
Text(
  '1st level of puns: 5 gold coins',
  style: ShadTheme.of(context).textTheme.list,
)
```


## Lead


 ```dart
Text(
  'A modal dialog that interrupts the user with important content and expects a response.',
  style: ShadTheme.of(context).textTheme.lead,
)
```


## Large


 ```dart
Text(
  'Are you absolutely sure?',
  style: ShadTheme.of(context).textTheme.large,
)
```


## Small


 ```dart
Text(
  'Email address',
  style: ShadTheme.of(context).textTheme.small,
)
```


## Muted


 ```dart
Text(
  'Enter your email address.',
  style: ShadTheme.of(context).textTheme.muted,
)
```


## Custom font family

By default Shadcn UI uses [Geist](https://vercel.com/font) as default font family.
To change it, add the local font to your project, for example in the `/fonts` directory.
Then update your `pubspec.yaml` with something like this:

```diff lang="yaml"
flutter:
+  fonts:
+    - family: UbuntuMono
+      fonts:
+        - asset: fonts/UbuntuMono-Regular.ttf
+        - asset: fonts/UbuntuMono-Italic.ttf
+          style: italic
+        - asset: fonts/UbuntuMono-Bold.ttf
+          weight: 700
+        - asset: fonts/UbuntuMono-BoldItalic.ttf
+          weight: 700
+          style: italic
```

Then in your `ShadApp` update the `ShadTextTheme`:
```diff lang="dart"
return ShadApp(
  debugShowCheckedModeBanner: false,
  themeMode: themeMode,
  routes: routes,
  theme: ShadThemeData(
    brightness: Brightness.light,
    colorScheme: const ShadZincColorScheme.light(),
+    textTheme: ShadTextTheme(
+      colorScheme: const ShadZincColorScheme.light(),
+      family: 'UbuntuMono',
+    ),
  ),
  ...
);
```

## Google font

Install the [google_fonts](https://pub.dev/packages/google_fonts) package.
Then add the google font to your `ShadApp`:
```diff lang="dart"
return ShadApp(
  debugShowCheckedModeBanner: false,
  themeMode: themeMode,
  routes: routes,
  theme: ShadThemeData(
    brightness: Brightness.light,
    colorScheme: const ShadZincColorScheme.light(),
+    textTheme: ShadTextTheme.fromGoogleFont(GoogleFonts.poppins),
  ),
  ...
);
```

## Extend with custom styles

You can extend the `ShadTextTheme` with your own custom styles by using the `custom` parameter.
```diff lang="dart"
return ShadApp(
  theme: ShadThemeData(
+    textTheme: ShadTextTheme(
+      custom: {
+        'myCustomStyle': const TextStyle(
+          fontSize: 16,
+          fontWeight: FontWeight.w400,
+          color: Colors.blue,
+        ),
+      },
+    ),
  ),
);
```

Then you can access it like this `ShadTheme.of(context).textTheme.custom['myCustomStyle']!`.

Or you can create an extension on `ShadTextTheme` to make it easier to access:
```dart
extension CustomStyleExtension on ShadTextTheme {
  TextStyle get myCustomStyle => custom['myCustomStyle']!;
}
```

In this way you can access it like other styles `ShadTheme.of(context).textTheme.myCustomStyle`.