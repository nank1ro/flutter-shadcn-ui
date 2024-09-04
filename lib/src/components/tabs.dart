import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';
import 'package:shadcn_ui/src/utils/states_controller.dart';

class ShadTabsInheritedWidget<T> extends InheritedWidget {
  const ShadTabsInheritedWidget({
    super.key,
    required this.data,
    required super.child,
  });

  final ShadTabsState<T> data;

  static ShadTabsState<T> of<T>(BuildContext context) {
    final provider = maybeOf<T>(context);
    if (provider == null) {
      throw FlutterError('No ShadTabs widget found in context');
    }
    return provider;
  }

  static ShadTabsState<T>? maybeOf<T>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ShadTabsInheritedWidget<T>>()
        ?.data;
  }

  @override
  bool updateShouldNotify(covariant ShadTabsInheritedWidget<T> oldWidget) {
    return true;
  }
}

class ShadTabsController<T> extends ChangeNotifier {
  ShadTabsController({required T value}) : selected = value;

  T selected;

  /// Selects the given [value].
  ///
  /// Returns true if the value was changed, false otherwise.
  bool select(T value) {
    if (value == selected) return false;
    selected = value;
    notifyListeners();
    return true;
  }
}

class RestorableShadTabsController<T>
    extends RestorableChangeNotifier<ShadTabsController<T>> {
  /// Creates a [RestorableShadTabsController].
  factory RestorableShadTabsController({required T value}) =>
      RestorableShadTabsController.fromValue(value);

  RestorableShadTabsController.fromValue(T value) : selected = value;

  T selected;

  @override
  ShadTabsController<T> createDefaultValue() {
    return ShadTabsController<T>(value: selected);
  }

  @override
  ShadTabsController<T> fromPrimitives(Object? data) {
    return ShadTabsController<T>(value: data! as T);
  }

  @override
  Object? toPrimitives() {
    return selected;
  }
}

class ShadTabs<T> extends StatefulWidget implements PreferredSizeWidget {
  const ShadTabs({
    super.key,
    this.value,
    required this.tabs,
    this.controller,
    this.gap,
    this.scrollable,
    this.dragStartBehavior,
    this.physics,
    this.padding,
    this.decoration,
    this.tabBarConstraints,
    this.contentConstraints,
    this.expandContent,
    this.restorationId,
    this.onChanged,
  }) : assert(
          (value != null) ^ (controller != null),
          'Either value or controller must be provided',
        );

  /// {@template ShadTabs.value}
  /// The currently selected tab.
  /// {@endtemplate}
  final T? value;

  /// {@template ShadTabs.tabs}
  /// The tabs to display.
  /// {@endtemplate}
  final List<ShadTab<T>> tabs;

  /// {@template ShadTabs.controller}
  /// The controller of the tabs.
  /// {@endtemplate}
  final ShadTabsController<T>? controller;

  /// {@template ShadTabs.gap}
  /// The gap between the tabBar and the content.
  /// {@endtemplate}
  final double? gap;

  /// {@template ShadTabs.scrollable}
  /// Whether the tabs should be scrollable, defaults to false.
  /// {@endtemplate}
  final bool? scrollable;

  /// {@template ShadTabs.dragStartBehavior}
  /// The drag start behavior of the tabs, defaults to [DragStartBehavior.start]
  /// {@endtemplate}
  final DragStartBehavior? dragStartBehavior;

  /// {@template ShadTabs.physics}
  /// The physics of the tabs, defaults to null.
  /// {@endtemplate}
  final ScrollPhysics? physics;

  /// {@template ShadTabs.padding}
  /// The padding of the tabs, defaults to `EdgeInsets.zero`.
  /// {@endtemplate}
  final EdgeInsets? padding;

  /// {@template ShadTabs.decoration}
  /// The decoration of the tabs.
  /// {@endtemplate}
  final ShadDecoration? decoration;

  /// {@template ShadTabs.tabBarConstraints}
  /// The constraints of the tab bar, defaults to `null`.
  /// {@endtemplate}
  final BoxConstraints? tabBarConstraints;

  /// {@template ShadTabs.contentConstraints}
  /// The constraints of the content, defaults to `null`.
  /// {@endtemplate}
  final BoxConstraints? contentConstraints;

  /// {@template ShadTabs.expandContent}
  /// Whether the content should be expanded, defaults to `false`.
  /// {@endtemplate}
  final bool? expandContent;

  /// {@template ShadTabs.restorationId}
  /// The restoration id, defaults to `null`.
  /// {@endtemplate}
  final String? restorationId;

  /// {@template ShadTabs.onChanged}
  /// The callback that is called when the value of the tabs changes.
  /// {@endtemplate}
  final ValueChanged<T>? onChanged;

  @override
  State<ShadTabs<T>> createState() => ShadTabsState<T>();

  @override
  Size get preferredSize {
    var maxHeight = 0.0;
    for (final tab in tabs) {
      final itemHeight = tab.preferredSize.height;
      maxHeight = math.max(itemHeight, maxHeight);
    }
    return Size.fromHeight(maxHeight);
  }
}

class ShadTabsState<T> extends State<ShadTabs<T>> with RestorationMixin {
  late List<GlobalKey> _tabKeys;

  late List<T> orderedValues;

  RestorableShadTabsController<T>? _controller;

  ShadTabsController<T> get controller =>
      widget.controller ?? _controller!.value;

  late final scrollController = ScrollController();

  bool get scrollable => widget.scrollable ?? false;

  @override
  void initState() {
    super.initState();
    _tabKeys = widget.tabs.map((_) => GlobalKey()).toList();
    if (widget.controller == null) {
      _createLocalController(widget.value as T);
    }
    orderedValues = widget.tabs.map((e) => e.value).toList();
  }

  @override
  void didUpdateWidget(covariant ShadTabs<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.controller == null && oldWidget.controller != null) {
      _createLocalController(oldWidget.controller!.selected);
    } else if (widget.controller != null && oldWidget.controller == null) {
      unregisterFromRestoration(_controller!);
      _controller!.dispose();
      _controller = null;
    }

    if (widget.tabs.length > _tabKeys.length) {
      final delta = widget.tabs.length - _tabKeys.length;
      _tabKeys.addAll(List<GlobalKey>.generate(delta, (int n) => GlobalKey()));
    } else if (widget.tabs.length < _tabKeys.length) {
      _tabKeys.removeRange(widget.tabs.length, _tabKeys.length);
    }
    if (!listEquals(widget.tabs, oldWidget.tabs)) {
      orderedValues = widget.tabs.map((e) => e.value).toList();
    }

    // Update the controller if the value has changed.
    if (widget.value is T &&
        widget.controller == null &&
        controller.selected != widget.value) {
      controller.select(widget.value as T);
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    _controller?.dispose();
    super.dispose();
  }

  void _registerController() {
    assert(_controller != null);
    registerForRestoration(_controller!, 'controller');
  }

  void _createLocalController(T value) {
    assert(_controller == null);
    _controller = RestorableShadTabsController<T>.fromValue(value);
    if (!restorePending) {
      _registerController();
    }
  }

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    if (_controller != null) _registerController();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final tabsTheme = theme.tabsTheme;

    final effectiveDragStartBehavior = widget.dragStartBehavior ??
        tabsTheme.dragStartBehavior ??
        DragStartBehavior.start;

    final effectivePadding =
        widget.padding ?? tabsTheme.padding ?? EdgeInsets.zero;

    final effectiveDecoration = widget.decoration ??
        tabsTheme.decoration ??
        ShadDecoration(
          merge: false,
          color: theme.colorScheme.muted,
          border: ShadBorder.all(radius: theme.radius, width: 0),
        );

    final effectiveGap = widget.gap ?? tabsTheme.gap ?? 8;

    final effectiveTabBarConstraints =
        widget.tabBarConstraints ?? tabsTheme.tabBarConstraints;

    final effectiveContentConstraints =
        widget.contentConstraints ?? tabsTheme.contentConstraints;

    final effectiveExpandContent =
        widget.expandContent ?? tabsTheme.expandContent ?? false;

    Widget tabBar = Row(children: widget.tabs);

    if (effectiveTabBarConstraints != null) {
      tabBar = ConstrainedBox(
        constraints: effectiveTabBarConstraints,
        child: tabBar,
      );
    }

    if (scrollable) {
      tabBar = ScrollConfiguration(
        // The scrolling tabs should not show an overscroll indicator.
        behavior: ScrollConfiguration.of(context).copyWith(overscroll: false),
        child: SingleChildScrollView(
          dragStartBehavior: effectiveDragStartBehavior,
          scrollDirection: Axis.horizontal,
          controller: scrollController,
          padding: effectivePadding,
          physics: widget.physics,
          child: tabBar,
        ),
      );
    } else {
      tabBar = Padding(padding: effectivePadding, child: tabBar);
    }

    return ShadTabsInheritedWidget<T>(
      data: this,
      child: ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ShadDecorator(
                decoration: effectiveDecoration,
                child: tabBar,
              ),
              SizedBox(height: effectiveGap),
              ...List<Widget>.generate(widget.tabs.length, (int index) {
                final tab = widget.tabs[index];
                final selected = tab.value == controller.selected;
                Widget content = Offstage(
                  offstage: !selected,
                  child: FocusTraversalGroup(
                    descendantsAreFocusable: selected,
                    policy: WidgetOrderTraversalPolicy(),
                    child: KeyedSubtree(
                      key: _tabKeys[index],
                      child: tab.content ?? const SizedBox.shrink(),
                    ),
                  ),
                );

                if (effectiveContentConstraints != null) {
                  content = ConstrainedBox(
                    constraints: effectiveContentConstraints,
                    child: content,
                  );
                }

                if (effectiveExpandContent && selected) {
                  content = Expanded(child: content);
                }

                return content;
              }),
            ],
          );
        },
      ),
    );
  }
}

class ShadTab<T> extends StatefulWidget implements PreferredSizeWidget {
  const ShadTab({
    super.key,
    required this.value,
    required this.child,
    this.content,
    this.icon,
    this.enabled = true,
    this.flex = 1,
    this.height,
    this.width,
    this.backgroundColor,
    this.selectedBackgroundColor,
    this.hoverBackgroundColor,
    this.selectedHoverBackgroundColor,
    this.padding,
    this.decoration,
    this.selectedDecoration,
    this.foregroundColor,
    this.selectedForegroundColor,
    this.textStyle,
    this.shadows,
    this.selectedShadows,
    this.focusNode,
    this.onPressed,
    this.onLongPress,
    this.size,
    this.applyIconColorFilter,
    this.cursor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
  });

  /// The value of the tab.
  final T value;

  /// The text of the tab.
  final Widget child;

  /// The content of the tab.
  final Widget? content;

  /// The icon of the tab.
  final Widget? icon;

  /// Whether the tab is enabled, defaults to true.
  final bool enabled;

  /// The flex of the tab, defaults to 1.
  ///
  /// If the tab is scrollable, the flex is ignored.
  final int flex;

  /// The height of the tab, defaults to 32.
  final double? height;

  /// The width of the tab, defaults to null when [ShadTabs.scrollable] is true,
  /// otherwise `double.infinity`.
  final double? width;

  /// The background color of the unselected tab, defaults to
  /// `Colors.transparent`.
  final Color? backgroundColor;

  /// The background color of the selected tab, defaults to
  /// ShadThemeData.colorScheme.background.
  final Color? selectedBackgroundColor;

  /// The background color of the hovered tab, defaults to
  /// [ShadTab.backgroundColor].
  final Color? hoverBackgroundColor;

  /// The background color of the selected tab, defaults to
  /// [ShadTab.selectedBackgroundColor].
  final Color? selectedHoverBackgroundColor;

  /// The padding of the tab, defaults to
  /// `EdgeInsets.symmetric(horizontal: 12, vertical: 6)`.
  final EdgeInsets? padding;

  /// The decoration of the tab.
  final ShadDecoration? decoration;

  /// The decoration of the selected tab, defaults to [ShadTab.decoration].
  final ShadDecoration? selectedDecoration;

  /// The foreground color of the unselected tab, defaults to
  /// ShadThemeData.colorScheme.foreground.
  final Color? foregroundColor;

  /// The foreground color of the selected tab, defaults to
  /// [ShadTab.foregroundColor].
  final Color? selectedForegroundColor;

  /// The text style of the tab, defaults to ShadThemeData.textTheme.small.
  final TextStyle? textStyle;

  /// The shadows of the unselected tab, defaults to [ShadShadows.sm].
  final List<BoxShadow>? shadows;

  /// The shadows of the selected tab, defaults to `null`.
  final List<BoxShadow>? selectedShadows;

  /// The focus node of the tab.
  final FocusNode? focusNode;

  /// The callback that is called when the button is tapped.
  final VoidCallback? onPressed;

  /// The callback that is called when the button is long-pressed.
  final VoidCallback? onLongPress;

  /// The size of the button.
  final ShadButtonSize? size;

  /// Whether to apply the icon color filter to the button.
  final bool? applyIconColorFilter;

  /// The cursor for the button.
  final MouseCursor? cursor;

  /// The foreground color of the button when the mouse is hovering over it.
  final Color? hoverForegroundColor;

  /// Whether the button should automatically focus itself.
  final bool autofocus;

  /// The background color of the button when it is pressed.
  final Color? pressedBackgroundColor;

  /// The foreground color of the button when it is pressed.
  final Color? pressedForegroundColor;

  /// The gradient to use for the button's background.
  final Gradient? gradient;

  /// The text decoration to use for the button's text.
  final TextDecoration? textDecoration;

  /// The text decoration to use for the button's text when the mouse is
  /// hovering over it.
  final TextDecoration? hoverTextDecoration;

  /// The states controller of the button.
  final ShadStatesController? statesController;

  /// {@template ShadButton.mainAxisAlignment}
  /// The main axis alignment of the button.
  ///
  /// Defaults to [MainAxisAlignment.center]
  /// {@endtemplate}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@template ShadButton.crossAxisAlignment}
  /// The cross axis alignment of the button.
  ///
  /// Defaults to [CrossAxisAlignment.center]
  /// {@endtemplate}
  final CrossAxisAlignment? crossAxisAlignment;

  final ShadHoverStrategies? hoverStrategies;
  final ValueChanged<bool>? onHoverChange;
  final ValueChanged<TapDownDetails>? onTapDown;
  final ValueChanged<TapUpDetails>? onTapUp;
  final VoidCallback? onTapCancel;
  final ValueChanged<LongPressStartDetails>? onLongPressStart;
  final VoidCallback? onLongPressCancel;
  final VoidCallback? onLongPressUp;
  final ValueChanged<LongPressDownDetails>? onLongPressDown;
  final ValueChanged<LongPressEndDetails>? onLongPressEnd;
  final VoidCallback? onDoubleTap;
  final ValueChanged<TapDownDetails>? onDoubleTapDown;
  final VoidCallback? onDoubleTapCancel;
  final Duration? longPressDuration;

  @override
  State<ShadTab<T>> createState() => _ShadTabState<T>();

  @override
  Size get preferredSize {
    return Size.fromHeight(height ?? 32);
  }
}

class _ShadTabState<T> extends State<ShadTab<T>> {
  FocusNode? _focusNode;

  FocusNode get focusNode => widget.focusNode ?? _focusNode!;

  late bool focused = focusNode.hasFocus;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode == null) _focusNode = FocusNode();
    focusNode.addListener(focusNodeListener);
  }

  @override
  void didUpdateWidget(covariant ShadTab<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.focusNode == null && oldWidget.focusNode != null) {
      focusNode.removeListener(focusNodeListener);
      _focusNode = FocusNode();
      focusNode.addListener(focusNodeListener);
    } else if (widget.focusNode != null && oldWidget.focusNode == null) {
      focusNode.removeListener(focusNodeListener);
      _focusNode?.dispose();
      _focusNode = null;
      focusNode.addListener(focusNodeListener);
    }
  }

  @override
  void dispose() {
    _focusNode?.dispose();
    super.dispose();
  }

  void focusNodeListener() {
    setState(() => focused = focusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final inherited = ShadTabsInheritedWidget.of<T>(context);

    final tabsTheme = theme.tabsTheme;

    final defaultWidth = inherited.scrollable ? null : double.infinity;
    final effectiveWidth = widget.width ?? tabsTheme.tabWidth ?? defaultWidth;
    final effectiveBackgroundColor = widget.backgroundColor ??
        tabsTheme.tabBackgroundColor ??
        Colors.transparent;
    final effectiveSelectedBackgroundColor = widget.selectedBackgroundColor ??
        tabsTheme.tabSelectedBackgroundColor ??
        theme.colorScheme.background;

    final effectiveHoverBackgroundColor = widget.hoverBackgroundColor ??
        tabsTheme.tabHoverForegroundColor ??
        effectiveBackgroundColor;

    final effectiveSelectedHoverBackgroundColor =
        widget.selectedHoverBackgroundColor ??
            tabsTheme.tabSelectedHoverBackgroundColor ??
            effectiveSelectedBackgroundColor;

    final effectivePadding = widget.padding ??
        tabsTheme.tabPadding ??
        const EdgeInsets.symmetric(horizontal: 12, vertical: 6);

    final effectiveForegroundColor = widget.foregroundColor ??
        tabsTheme.tabForegroundColor ??
        theme.colorScheme.foreground;

    final effectiveSelectedForegroundColor = widget.selectedForegroundColor ??
        tabsTheme.tabSelectedForegroundColor ??
        effectiveForegroundColor;

    final effectiveShadows = widget.shadows ?? tabsTheme.tabShadows;
    final effectiveSelectedShadows = widget.selectedShadows ??
        tabsTheme.tabSelectedShadows ??
        ShadShadows.sm;

    final effectiveMainAxisAlignment =
        widget.mainAxisAlignment ?? tabsTheme.tabMainAxisAlignment;
    final effectiveCrossAxisAlignment =
        widget.crossAxisAlignment ?? tabsTheme.tabCrossAxisAlignment;
    final effectiveHoverStrategies =
        widget.hoverStrategies ?? tabsTheme.tabHoverStrategies;

    final effectiveTextDecoration =
        widget.textDecoration ?? tabsTheme.tabTextDecoration;
    final effectiveHoverTextDecoration =
        widget.hoverTextDecoration ?? tabsTheme.tabHoverTextDecoration;
    final effectiveGradient = widget.gradient ?? tabsTheme.tabGradient;
    final effectiveSize = widget.size ?? tabsTheme.tabSize;
    final effectiveHoverForegroundColor =
        widget.hoverForegroundColor ?? tabsTheme.tabHoverForegroundColor;
    final effectiveCursor = widget.cursor ?? tabsTheme.tabCursor;
    final effectiveApplyIconColorFilter =
        widget.applyIconColorFilter ?? tabsTheme.tabApplyIconColorFilter;
    final effectivePressedBackgroundColor =
        widget.pressedBackgroundColor ?? tabsTheme.tabPressedBackgroundColor;
    final effectivePressedForegroundColor =
        widget.pressedForegroundColor ?? tabsTheme.tabPressedForegroundColor;

    Widget tab = ListenableBuilder(
      listenable: inherited.controller,
      builder: (context, _) {
        final selected = inherited.controller.selected == widget.value;
        final isFirstTab = inherited.orderedValues.first == widget.value;
        final isLastTab = inherited.orderedValues.last == widget.value;

        final defaultDecoration = switch (theme.disableSecondaryBorder) {
          true => ShadDecoration(
              border: ShadBorder.all(
                radius: BorderRadius.circular(2),
                width: 0,
                padding: const EdgeInsets.all(2),
              ),
              focusedBorder: ShadBorder.all(
                width: 2,
                radius: BorderRadius.circular(2),
              ),
            ),
          false => ShadDecoration(
              border:
                  ShadBorder.all(radius: BorderRadius.circular(2), width: 0),
              secondaryBorder: ShadBorder.all(
                width: 0,
                radius: BorderRadius.circular(2),
                padding: EdgeInsets.fromLTRB(
                  isFirstTab ? 4 : 2,
                  4,
                  isLastTab ? 4 : 2,
                  4,
                ),
              ),
              secondaryFocusedBorder: ShadBorder.all(
                width: 2,
                radius: theme.radius,
                padding: EdgeInsets.fromLTRB(
                  isFirstTab ? 2 : 0,
                  2,
                  isLastTab ? 2 : 0,
                  2,
                ),
              ),
            ),
        };

        final effectiveDecoration =
            widget.decoration ?? tabsTheme.tabDecoration ?? defaultDecoration;

        return ShadButton.secondary(
          icon: widget.icon,
          focusNode: focusNode,
          height: widget.preferredSize.height,
          width: effectiveWidth,
          backgroundColor: selected
              ? effectiveSelectedBackgroundColor
              : effectiveBackgroundColor,
          hoverBackgroundColor: selected
              ? effectiveSelectedHoverBackgroundColor
              : effectiveHoverBackgroundColor,
          padding: effectivePadding,
          decoration: effectiveDecoration,
          foregroundColor: selected
              ? effectiveSelectedForegroundColor
              : effectiveForegroundColor,
          shadows: selected ? effectiveSelectedShadows : effectiveShadows,
          onPressed: () {
            final hasChanged = inherited.controller.select(widget.value);
            if (hasChanged) {
              inherited.widget.onChanged?.call(widget.value);
            }
            widget.onPressed?.call();
          },
          enabled: widget.enabled,
          onLongPress: widget.onLongPress,
          size: effectiveSize,
          applyIconColorFilter: effectiveApplyIconColorFilter,
          cursor: effectiveCursor,
          hoverForegroundColor: effectiveHoverForegroundColor,
          autofocus: widget.autofocus,
          pressedBackgroundColor: effectivePressedBackgroundColor,
          pressedForegroundColor: effectivePressedForegroundColor,
          gradient: effectiveGradient,
          textDecoration: effectiveTextDecoration,
          hoverTextDecoration: effectiveHoverTextDecoration,
          statesController: widget.statesController,
          mainAxisAlignment: effectiveMainAxisAlignment,
          crossAxisAlignment: effectiveCrossAxisAlignment,
          hoverStrategies: effectiveHoverStrategies,
          onHoverChange: widget.onHoverChange,
          onTapDown: widget.onTapDown,
          onTapUp: widget.onTapUp,
          onTapCancel: widget.onTapCancel,
          onLongPressStart: widget.onLongPressStart,
          onLongPressCancel: widget.onLongPressCancel,
          onLongPressUp: widget.onLongPressUp,
          onLongPressDown: widget.onLongPressDown,
          onLongPressEnd: widget.onLongPressEnd,
          onDoubleTap: widget.onDoubleTap,
          onDoubleTapDown: widget.onDoubleTapDown,
          onDoubleTapCancel: widget.onDoubleTapCancel,
          longPressDuration: widget.longPressDuration,
          child: DefaultTextStyle(
            style: theme.textTheme.small,
            child: widget.child,
          ),
        );
      },
    );

    if (!inherited.scrollable) {
      tab = Expanded(flex: widget.flex, child: tab);
    }

    return tab;
  }
}
