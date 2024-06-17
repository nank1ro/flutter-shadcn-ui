// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'
    show
        GlobalCupertinoLocalizations,
        GlobalMaterialLocalizations,
        GlobalWidgetsLocalizations;
import 'package:shadcn_ui/src/components/toast.dart';
import 'package:shadcn_ui/src/theme/color_scheme/slate.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/mouse_cursor_provider.dart';

enum ShadAppType {
  shadcn,
  material,
  cupertino,
}

class ShadApp extends StatefulWidget {
  /// Creates a [ShadApp] providing a [ShadTheme].
  const ShadApp({
    super.key,
    this.navigatorKey,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.initialRoute,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.showPerformanceOverlay = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.theme,
    this.darkTheme,
    this.themeMode,
    this.restorationScopeId,
    this.scrollBehavior = const ShadScrollBehavior(),
    this.pageRouteBuilder,
    this.themeCurve = Curves.linear,
    this.materialThemeBuilder,
  })  : routeInformationProvider = null,
        routeInformationParser = null,
        routerDelegate = null,
        backButtonDispatcher = null,
        routerConfig = null,
        cupertinoThemeBuilder = null,
        type = ShadAppType.shadcn;

  /// Creates a [ShadApp] that uses the [Router] instead of a [Navigator].
  const ShadApp.router({
    super.key,
    this.theme,
    this.darkTheme,
    this.themeMode,
    this.routeInformationProvider,
    this.routeInformationParser,
    this.routerDelegate,
    this.backButtonDispatcher,
    this.routerConfig,
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.showPerformanceOverlay = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior = const ShadScrollBehavior(),
    this.themeCurve = Curves.linear,
    this.materialThemeBuilder,
  })  : navigatorObservers = null,
        navigatorKey = null,
        onGenerateRoute = null,
        home = null,
        onGenerateInitialRoutes = null,
        onUnknownRoute = null,
        routes = null,
        initialRoute = null,
        pageRouteBuilder = null,
        cupertinoThemeBuilder = null,
        type = ShadAppType.shadcn;

  /// Creates a [MaterialApp] wrapped by a [ShadTheme].
  const ShadApp.material({
    super.key,
    this.navigatorKey,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.initialRoute,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.showPerformanceOverlay = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.theme,
    this.darkTheme,
    this.themeMode,
    this.restorationScopeId,
    this.scrollBehavior = const MaterialScrollBehavior(),
    this.pageRouteBuilder,
    this.themeCurve = Curves.linear,
    this.materialThemeBuilder,
  })  : routeInformationProvider = null,
        routeInformationParser = null,
        routerDelegate = null,
        backButtonDispatcher = null,
        routerConfig = null,
        cupertinoThemeBuilder = null,
        type = ShadAppType.material;

  /// Creates a [MaterialApp] wrapped by a [ShadTheme] that uses the [Router] instead of a [Navigator].
  const ShadApp.materialRouter({
    super.key,
    this.theme,
    this.darkTheme,
    this.themeMode,
    this.routeInformationProvider,
    this.routeInformationParser,
    this.routerDelegate,
    this.backButtonDispatcher,
    this.routerConfig,
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.showPerformanceOverlay = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior = const MaterialScrollBehavior(),
    this.themeCurve = Curves.linear,
    this.materialThemeBuilder,
  })  : navigatorObservers = null,
        navigatorKey = null,
        onGenerateRoute = null,
        home = null,
        onGenerateInitialRoutes = null,
        onUnknownRoute = null,
        routes = null,
        initialRoute = null,
        pageRouteBuilder = null,
        cupertinoThemeBuilder = null,
        type = ShadAppType.material;

  /// Creates a [CupertinoApp] wrapped by a [ShadTheme].
  const ShadApp.cupertino({
    super.key,
    this.navigatorKey,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.initialRoute,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.showPerformanceOverlay = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.theme,
    this.darkTheme,
    this.themeMode,
    this.restorationScopeId,
    this.scrollBehavior = const CupertinoScrollBehavior(),
    this.pageRouteBuilder,
    this.themeCurve = Curves.linear,
    this.cupertinoThemeBuilder,
    this.materialThemeBuilder,
  })  : routeInformationProvider = null,
        routeInformationParser = null,
        routerDelegate = null,
        backButtonDispatcher = null,
        routerConfig = null,
        type = ShadAppType.cupertino;

  /// Creates a [CupertinoApp] wrapped by a [ShadTheme] that uses the [Router] instead of a [Navigator].
  const ShadApp.cupertinoRouter({
    super.key,
    this.theme,
    this.darkTheme,
    this.themeMode,
    this.routeInformationProvider,
    this.routeInformationParser,
    this.routerDelegate,
    this.backButtonDispatcher,
    this.routerConfig,
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.showPerformanceOverlay = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior = const CupertinoScrollBehavior(),
    this.themeCurve = Curves.linear,
    this.cupertinoThemeBuilder,
    this.materialThemeBuilder,
  })  : navigatorObservers = null,
        navigatorKey = null,
        onGenerateRoute = null,
        home = null,
        onGenerateInitialRoutes = null,
        onUnknownRoute = null,
        routes = null,
        initialRoute = null,
        pageRouteBuilder = null,
        type = ShadAppType.cupertino;

  /// The type of app to use.
  ///
  /// If you are going to use only Shad components, use [ShadAppType.shadcn].
  /// If you are going to use also Material components, use [ShadAppType.material].
  /// If you are going to use also Cupertino components, use [ShadAppType/cupertino].
  final ShadAppType type;

  /// Default visual properties, like colors fonts and shapes, for this app's
  /// shad widgets.
  ///
  /// A second [darkTheme] [ShadThemeData] value, which is used to provide a
  /// dark version of the user interface can also be specified. [themeMode] will
  /// control which theme will be used if a [darkTheme] is provided.
  ///
  /// The default value of this property is the value of
  /// `ShadThemeData(brightness: Brightness.light)`.
  final ShadThemeData? theme;

  /// The [ShadThemeData] to use when a 'dark mode' is requested by the
  /// system.
  ///
  /// Some host platforms allow the users to select a system-wide 'dark mode',
  /// or the application may want to offer the user the ability to choose a
  /// dark theme just for this application. This is theme that will be used for
  /// such cases. [themeMode] will control which theme will be used.
  ///
  /// This theme should have a [ShadThemeData.brightness] set to
  /// [Brightness.dark].
  ///
  /// Uses [theme] instead when null. Defaults to the value of
  /// [ShadThemeData(brightness: Brightness.light)] when both [darkTheme] and
  /// [theme] are null.
  final ShadThemeData? darkTheme;

  /// Determines which theme will be used by the application if both [theme]
  /// and [darkTheme] are provided.
  ///
  /// If set to [ThemeMode.system], the choice of which theme to use will
  /// be based on the user's system preferences. If the
  /// [MediaQuery.platformBrightnessOf] is [Brightness.light], [theme] will be
  /// used. If it is [Brightness.dark], [darkTheme] will be used (unless it is
  /// null, in which case [theme] will be used.
  ///
  /// If set to [ThemeMode.light] the [theme] will always be used,
  /// regardless of the user's system preference.
  ///
  /// If set to [ThemeMode.dark] the [darkTheme] will be used
  /// regardless of the user's system preference. If [darkTheme] is null
  /// then it will fallback to using [theme].
  ///
  /// The default value is [ThemeMode.system].
  final ThemeMode? themeMode;

  /// {@macro flutter.widgets.widgetsApp.navigatorKey}
  final GlobalKey<NavigatorState>? navigatorKey;

  /// {@macro flutter.widgets.widgetsApp.home}
  final Widget? home;

  /// The application's top-level routing table.
  ///
  /// When a named route is pushed with [Navigator.pushNamed], the route name is
  /// looked up in this map. If the name is present, the associated
  /// [WidgetBuilder] is used to construct a [MaterialPageRoute] that performs
  /// an appropriate transition, including [Hero] animations, to the new route.
  ///
  /// {@macro flutter.widgets.widgetsApp.routes}
  final Map<String, WidgetBuilder>? routes;

  /// {@macro flutter.widgets.widgetsApp.initialRoute}
  final String? initialRoute;

  /// {@macro flutter.widgets.widgetsApp.onGenerateRoute}
  final RouteFactory? onGenerateRoute;

  /// {@macro flutter.widgets.widgetsApp.onGenerateInitialRoutes}
  final InitialRouteListFactory? onGenerateInitialRoutes;

  /// {@macro flutter.widgets.widgetsApp.onUnknownRoute}
  final RouteFactory? onUnknownRoute;

  /// {@macro flutter.widgets.widgetsApp.navigatorObservers}
  final List<NavigatorObserver>? navigatorObservers;

  /// {@macro flutter.widgets.widgetsApp.routeInformationProvider}
  final RouteInformationProvider? routeInformationProvider;

  /// {@macro flutter.widgets.widgetsApp.routeInformationParser}
  final RouteInformationParser<Object>? routeInformationParser;

  /// {@macro flutter.widgets.widgetsApp.routerDelegate}
  final RouterDelegate<Object>? routerDelegate;

  /// {@macro flutter.widgets.widgetsApp.backButtonDispatcher}
  final BackButtonDispatcher? backButtonDispatcher;

  /// {@macro flutter.widgets.widgetsApp.routerConfig}
  final RouterConfig<Object>? routerConfig;

  /// The [PageRoute] generator callback used when the app is navigated to a
  /// named route.
  ///
  /// A [PageRoute] represents the page in a [Navigator], so that it can
  /// correctly animate between pages, and to represent the "return value" of
  /// a route (e.g. which button a user selected in a modal dialog).
  ///
  /// This callback can be used, for example, to specify that a
  /// [MaterialPageRoute] or a [CupertinoPageRoute] should be used for building
  /// page transitions.
  ///
  /// The [PageRouteFactory] type is generic, meaning the provided function must
  /// itself be generic. For example (with special emphasis on the `<T>` at the
  /// start of the closure):
  ///
  /// ```dart
  /// pageRouteBuilder: <T>(RouteSettings settings, WidgetBuilder builder) => PageRouteBuilder<T>(
  ///   settings: settings,
  ///   pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => builder(context),
  /// ),
  /// ```
  final PageRouteFactory? pageRouteBuilder;

  /// {@macro flutter.widgets.widgetsApp.builder}
  final TransitionBuilder? builder;

  /// {@macro flutter.widgets.widgetsApp.title}
  ///
  /// This value is passed unmodified to [WidgetsApp.title].
  final String title;

  /// {@macro flutter.widgets.widgetsApp.onGenerateTitle}
  ///
  /// This value is passed unmodified to [WidgetsApp.onGenerateTitle].
  final GenerateAppTitle? onGenerateTitle;

  /// {@macro flutter.widgets.widgetsApp.color}
  final Color? color;

  /// {@macro flutter.widgets.widgetsApp.locale}
  final Locale? locale;

  /// {@macro flutter.widgets.widgetsApp.localizationsDelegates}
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// {@macro flutter.widgets.widgetsApp.localeListResolutionCallback}
  ///
  /// This callback is passed along to the [WidgetsApp] built by this widget.
  final LocaleListResolutionCallback? localeListResolutionCallback;

  /// {@macro flutter.widgets.LocaleResolutionCallback}
  ///
  /// This callback is passed along to the [WidgetsApp] built by this widget.
  final LocaleResolutionCallback? localeResolutionCallback;

  /// {@macro flutter.widgets.widgetsApp.supportedLocales}
  ///
  /// It is passed along unmodified to the [WidgetsApp] built by this widget.
  final Iterable<Locale> supportedLocales;

  /// Turns on a performance overlay.
  ///
  /// See also:
  ///
  ///  * <https://flutter.dev/debugging/#performanceoverlay>
  final bool showPerformanceOverlay;

  /// Turns on an overlay that shows the accessibility information
  /// reported by the framework.
  final bool showSemanticsDebugger;

  /// {@macro flutter.widgets.widgetsApp.debugShowCheckedModeBanner}
  final bool debugShowCheckedModeBanner;

  /// {@macro flutter.widgets.widgetsApp.shortcuts}
  /// {@tool snippet}
  /// This example shows how to add a single shortcut for
  /// [m.LogicalKeyboardKey.select] to the default shortcuts without needing to
  /// add your own [Shortcuts] widget.
  ///
  /// Alternatively, you could insert a [Shortcuts] widget with just the mapping
  /// you want to add between the [ShadApp] and its child and get the same
  /// effect.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return ShadApp(
  ///     shortcuts: <ShortcutActivator, Intent>{
  ///       ... WidgetsApp.defaultShortcuts,
  ///       const SingleActivator(LogicalKeyboardKey.select):
  ///         const ActivateIntent(),
  ///     },
  ///     color: const Color(0xFFFF0000),
  ///     builder: (BuildContext context, Widget? child) {
  ///       return const Placeholder();
  ///     },
  ///   );
  /// }
  /// ```
  /// {@end-tool}
  /// {@macro flutter.widgets.widgetsApp.shortcuts.seeAlso}
  final Map<ShortcutActivator, Intent>? shortcuts;

  /// {@macro flutter.widgets.widgetsApp.actions}
  /// {@tool snippet}
  /// This example shows how to add a single action handling an
  /// [ActivateAction] to the default actions without needing to
  /// add your own [Actions] widget.
  ///
  /// Alternatively, you could insert a [Actions] widget with just the mapping
  /// you want to add between the [ShadApp] and its child and get the same
  /// effect.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return ShadApp(
  ///     actions: <Type, Action<Intent>>{
  ///       ... WidgetsApp.defaultActions,
  ///       ActivateAction: CallbackAction(
  ///         onInvoke: (Intent intent) {
  ///           // Do something here...
  ///           return null;
  ///         },
  ///       ),
  ///     },
  ///     color: const Color(0xFFFF0000),
  ///     builder: (BuildContext context, Widget? child) {
  ///       return const Placeholder();
  ///     },
  ///   );
  /// }
  /// ```
  /// {@end-tool}
  /// {@macro flutter.widgets.widgetsApp.actions.seeAlso}
  final Map<Type, Action<Intent>>? actions;

  /// {@macro flutter.widgets.widgetsApp.restorationScopeId}
  final String? restorationScopeId;

  /// {@macro flutter.material.materialApp.scrollBehavior}
  ///
  /// See also:
  ///
  ///  * [ScrollConfiguration], which controls how [Scrollable] widgets behave
  ///    in a subtree.
  final ScrollBehavior scrollBehavior;

  /// The curve used to animated from one [ShadThemeData] to another, defaults
  /// to [Curves.linear].
  final Curve themeCurve;

  final ThemeData Function(BuildContext context, ThemeData theme)?
      materialThemeBuilder;

  final CupertinoThemeData Function(
    BuildContext context,
    CupertinoThemeData theme,
  )? cupertinoThemeBuilder;

  @override
  State<ShadApp> createState() => _ShadAppState();
}

class _ShadAppState extends State<ShadApp> {
  final heroController = HeroController();

  bool get usesRouter =>
      widget.routerDelegate != null || widget.routerConfig != null;

  /// Combine the Localizations for Material, Cupertino with the ones
  /// contributed by the localizationsDelegates parameter, if any.
  ///
  /// The default value for the localizationsDelegates
  /// ```
  ///  DefaultMaterialLocalizations.delegate,
  ///  DefaultCupertinoLocalizations.delegate,
  ///  DefaultWidgetsLocalizations.delegate
  /// ```
  Iterable<LocalizationsDelegate<dynamic>> get localizationsDelegates sync* {
    final localizationsDelegates = widget.localizationsDelegates;
    if (localizationsDelegates != null) {
      yield* localizationsDelegates;
    }
    yield GlobalMaterialLocalizations.delegate;
    yield GlobalCupertinoLocalizations.delegate;
    yield GlobalWidgetsLocalizations.delegate;
  }

  @override
  void dispose() {
    heroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: widget.scrollBehavior,
      child: HeroControllerScope(
        controller: heroController,
        child: ShadAnimatedTheme(
          data: theme(context),
          curve: widget.themeCurve,
          child: ShadMouseCursorProvider(
            child: _buildApp(context),
          ),
        ),
      ),
    );
  }

  ShadThemeData theme(BuildContext context) {
    final mode = widget.themeMode ?? ThemeMode.system;
    final platformBrightness = MediaQuery.platformBrightnessOf(context);
    final useDarkStyle = mode == ThemeMode.dark ||
        (mode == ThemeMode.system && platformBrightness == Brightness.dark);

    final data = () {
      late ShadThemeData result;
      if (useDarkStyle) {
        result = widget.darkTheme ??
            ShadThemeData(
              colorScheme: const ShadSlateColorScheme.dark(),
              brightness: Brightness.dark,
            );
      } else {
        result = widget.theme ??
            ShadThemeData(
              colorScheme: const ShadSlateColorScheme.light(),
              brightness: Brightness.light,
            );
      }
      return result;
    }();
    return data;
  }

  ThemeData materialTheme(BuildContext context) {
    final themeData = theme(context);
    final mTheme = ThemeData(
      fontFamily: themeData.textTheme.family,
      extensions: themeData.extensions,
      colorScheme: ColorScheme(
        brightness: themeData.brightness,
        primary: themeData.colorScheme.primary,
        onPrimary: themeData.colorScheme.primaryForeground,
        secondary: themeData.colorScheme.secondary,
        onSecondary: themeData.colorScheme.secondaryForeground,
        error: themeData.colorScheme.destructive,
        onError: themeData.colorScheme.destructiveForeground,
        // Keep deprecated members for backwards compatibility
        // ignore: deprecated_member_use
        background: themeData.colorScheme.background,
        // ignore: deprecated_member_use
        onBackground: themeData.colorScheme.foreground,
        surface: themeData.colorScheme.card,
        onSurface: themeData.colorScheme.cardForeground,
      ),
      scaffoldBackgroundColor: themeData.colorScheme.background,
      brightness: themeData.brightness,
      dividerTheme: DividerThemeData(
        color: themeData.colorScheme.border,
        thickness: 1,
      ),
    );
    if (widget.materialThemeBuilder == null) {
      return mTheme;
    }
    return widget.materialThemeBuilder!(context, mTheme);
  }

  CupertinoThemeData cupertinoTheme(BuildContext context) {
    final themeData = theme(context);
    final cTheme = CupertinoThemeData(
      primaryColor: themeData.colorScheme.primary,
      primaryContrastingColor: themeData.colorScheme.primaryForeground,
      scaffoldBackgroundColor: themeData.colorScheme.background,
      barBackgroundColor: themeData.colorScheme.primary,
      brightness: themeData.brightness,
    );

    if (widget.cupertinoThemeBuilder == null) {
      return cTheme;
    }
    return widget.cupertinoThemeBuilder!(context, cTheme);
  }

  Widget _builder(BuildContext context, Widget? child) {
    return ShadToaster(
      child: widget.builder != null
          ? Builder(
              builder: (BuildContext context) {
                // Why are we surrounding a builder with a builder?
                //
                // The widget.builder may contain code that invokes
                // Theme.of(), which should return the theme we selected
                // above in AnimatedTheme. However, if we invoke
                // widget.builder() directly as the child of AnimatedTheme
                // then there is no Context separating them, and the
                // widget.builder() will not find the theme. Therefore, we
                // surround widget.builder with yet another builder so that
                // a context separates them and Theme.of() correctly
                // resolves to the theme we passed to AnimatedTheme.
                return widget.builder!(context, child);
              },
            )
          : child ?? const SizedBox.shrink(),
    );
  }

  Widget _buildApp(BuildContext context) {
    switch (widget.type) {
      case ShadAppType.shadcn:
        if (usesRouter) {
          return AnimatedTheme(
            data: materialTheme(context),
            child: WidgetsApp.router(
              key: GlobalObjectKey(this),
              routeInformationProvider: widget.routeInformationProvider,
              routeInformationParser: widget.routeInformationParser,
              routerDelegate: widget.routerDelegate,
              routerConfig: widget.routerConfig,
              backButtonDispatcher: widget.backButtonDispatcher,
              builder: _builder,
              title: widget.title,
              onGenerateTitle: widget.onGenerateTitle,
              color: widget.color ?? Colors.blue,
              locale: widget.locale,
              localeResolutionCallback: widget.localeResolutionCallback,
              localeListResolutionCallback: widget.localeListResolutionCallback,
              supportedLocales: widget.supportedLocales,
              showPerformanceOverlay: widget.showPerformanceOverlay,
              showSemanticsDebugger: widget.showSemanticsDebugger,
              debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
              shortcuts: widget.shortcuts,
              actions: widget.actions,
              restorationScopeId: widget.restorationScopeId,
              localizationsDelegates: localizationsDelegates,
            ),
          );
        }

        return AnimatedTheme(
          data: materialTheme(context),
          child: WidgetsApp(
            key: GlobalObjectKey(this),
            navigatorKey: widget.navigatorKey,
            navigatorObservers: widget.navigatorObservers!,
            home: widget.home,
            routes: widget.routes!,
            initialRoute: widget.initialRoute,
            onGenerateRoute: widget.onGenerateRoute,
            onGenerateInitialRoutes: widget.onGenerateInitialRoutes,
            onUnknownRoute: widget.onUnknownRoute,
            builder: _builder,
            title: widget.title,
            onGenerateTitle: widget.onGenerateTitle,
            color: widget.color ?? Colors.blue,
            locale: widget.locale,
            localeResolutionCallback: widget.localeResolutionCallback,
            localeListResolutionCallback: widget.localeListResolutionCallback,
            supportedLocales: widget.supportedLocales,
            showPerformanceOverlay: widget.showPerformanceOverlay,
            showSemanticsDebugger: widget.showSemanticsDebugger,
            debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
            shortcuts: widget.shortcuts,
            actions: widget.actions,
            restorationScopeId: widget.restorationScopeId,
            localizationsDelegates: localizationsDelegates,
            pageRouteBuilder: widget.pageRouteBuilder ??
                <T>(RouteSettings settings, WidgetBuilder builder) {
                  return MaterialPageRoute<T>(
                    settings: settings,
                    builder: builder,
                  );
                },
          ),
        );
      case ShadAppType.material:
        if (usesRouter) {
          return MaterialApp.router(
            routeInformationProvider: widget.routeInformationProvider,
            routeInformationParser: widget.routeInformationParser,
            routerDelegate: widget.routerDelegate,
            routerConfig: widget.routerConfig,
            backButtonDispatcher: widget.backButtonDispatcher,
            builder: _builder,
            theme: materialTheme(context),
            title: widget.title,
            onGenerateTitle: widget.onGenerateTitle,
            color: widget.color ?? Colors.blue,
            locale: widget.locale,
            localeResolutionCallback: widget.localeResolutionCallback,
            localeListResolutionCallback: widget.localeListResolutionCallback,
            supportedLocales: widget.supportedLocales,
            showPerformanceOverlay: widget.showPerformanceOverlay,
            showSemanticsDebugger: widget.showSemanticsDebugger,
            debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
            shortcuts: widget.shortcuts,
            actions: widget.actions,
            restorationScopeId: widget.restorationScopeId,
            localizationsDelegates: localizationsDelegates,
          );
        }
        return MaterialApp(
          navigatorKey: widget.navigatorKey,
          navigatorObservers: widget.navigatorObservers!,
          home: widget.home,
          routes: widget.routes!,
          initialRoute: widget.initialRoute,
          onGenerateRoute: widget.onGenerateRoute,
          onGenerateInitialRoutes: widget.onGenerateInitialRoutes,
          onUnknownRoute: widget.onUnknownRoute,
          builder: _builder,
          theme: materialTheme(context),
          title: widget.title,
          onGenerateTitle: widget.onGenerateTitle,
          color: widget.color ?? Colors.blue,
          locale: widget.locale,
          localeResolutionCallback: widget.localeResolutionCallback,
          localeListResolutionCallback: widget.localeListResolutionCallback,
          supportedLocales: widget.supportedLocales,
          showPerformanceOverlay: widget.showPerformanceOverlay,
          showSemanticsDebugger: widget.showSemanticsDebugger,
          debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
          shortcuts: widget.shortcuts,
          actions: widget.actions,
          restorationScopeId: widget.restorationScopeId,
          localizationsDelegates: localizationsDelegates,
        );

      case ShadAppType.cupertino:
        if (usesRouter) {
          return AnimatedTheme(
            data: materialTheme(context),
            child: CupertinoApp.router(
              routeInformationProvider: widget.routeInformationProvider,
              routeInformationParser: widget.routeInformationParser,
              routerDelegate: widget.routerDelegate,
              routerConfig: widget.routerConfig,
              backButtonDispatcher: widget.backButtonDispatcher,
              builder: _builder,
              theme: cupertinoTheme(context),
              title: widget.title,
              onGenerateTitle: widget.onGenerateTitle,
              color: widget.color ?? Colors.blue,
              locale: widget.locale,
              localeResolutionCallback: widget.localeResolutionCallback,
              localeListResolutionCallback: widget.localeListResolutionCallback,
              supportedLocales: widget.supportedLocales,
              showPerformanceOverlay: widget.showPerformanceOverlay,
              showSemanticsDebugger: widget.showSemanticsDebugger,
              debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
              shortcuts: widget.shortcuts,
              actions: widget.actions,
              restorationScopeId: widget.restorationScopeId,
              localizationsDelegates: localizationsDelegates,
            ),
          );
        }
        return AnimatedTheme(
          data: materialTheme(context),
          child: CupertinoApp(
            navigatorKey: widget.navigatorKey,
            navigatorObservers: widget.navigatorObservers!,
            home: widget.home,
            routes: widget.routes!,
            initialRoute: widget.initialRoute,
            onGenerateRoute: widget.onGenerateRoute,
            onGenerateInitialRoutes: widget.onGenerateInitialRoutes,
            onUnknownRoute: widget.onUnknownRoute,
            builder: _builder,
            theme: cupertinoTheme(context),
            title: widget.title,
            onGenerateTitle: widget.onGenerateTitle,
            color: widget.color ?? Colors.blue,
            locale: widget.locale,
            localeResolutionCallback: widget.localeResolutionCallback,
            localeListResolutionCallback: widget.localeListResolutionCallback,
            supportedLocales: widget.supportedLocales,
            showPerformanceOverlay: widget.showPerformanceOverlay,
            showSemanticsDebugger: widget.showSemanticsDebugger,
            debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
            shortcuts: widget.shortcuts,
            actions: widget.actions,
            restorationScopeId: widget.restorationScopeId,
            localizationsDelegates: localizationsDelegates,
          ),
        );
    }
  }
}

/// Describes how [Scrollable] widgets behave for [ShadApp]s.
///
/// {@macro flutter.widgets.scrollBehavior}
///
/// When using the desktop platform, if the [Scrollable] widget scrolls in the
/// [Axis.vertical], a [Scrollbar] is applied.
///
/// See also:
///
///  * [ScrollBehavior], the default scrolling behavior extended by this class.
/// By default we will use [CupertinoScrollbar] for iOS and macOS platforms
/// for windows and Linux [Scrollbar]
/// for Android and Fuchsia we will return the child
class ShadScrollBehavior extends ScrollBehavior {
  /// Creates a ShadScrollBehavior that decorates [Scrollable]s with
  /// [Scrollbar]s based on the current platform and provided
  /// [ScrollableDetails].
  const ShadScrollBehavior();

  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    switch (axisDirectionToAxis(details.direction)) {
      case Axis.horizontal:
        return child;
      case Axis.vertical:
        switch (getPlatform(context)) {
          case TargetPlatform.macOS:
          case TargetPlatform.iOS:
            return CupertinoScrollbar(
              controller: details.controller,
              child: child,
            );
          case TargetPlatform.linux:
          case TargetPlatform.windows:
            return Scrollbar(
              controller: details.controller,
              child: child,
            );
          case TargetPlatform.android:
          case TargetPlatform.fuchsia:
            return child;
        }
    }
  }
}
