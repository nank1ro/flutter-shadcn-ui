import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';
import 'package:shadcn_ui/src/utils/border.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';
import 'package:shadcn_ui/src/utils/provider.dart';
import 'package:shadcn_ui/src/utils/states_controller.dart';

/// A controller for [ShadTabs] to manage tab selection.
///
/// Extends [ChangeNotifier] to provide reactive updates when the selected tab
/// changes.
class ShadTabsController<T> extends ChangeNotifier {
  /// Creates a [ShadTabsController] with an initial selected value.
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

/// A restorable version of [ShadTabsController] for state persistence.
///
/// Useful for maintaining tab selection across widget rebuilds and state
/// restoration.
class RestorableShadTabsController<T>
    extends RestorableChangeNotifier<ShadTabsController<T>> {
  /// Creates a [RestorableShadTabsController].
  factory RestorableShadTabsController({required T value}) =>
      RestorableShadTabsController.fromValue(value);

  /// Creates a [RestorableShadTabsController] from a given value.
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

/// {@template ShadTabs}
/// A widget that displays a horizontal series of tabs with associated content.
///
/// Supports scrollable and non-scrollable layouts, custom styling, and state
/// management.
/// {@endtemplate}
class ShadTabs<T> extends StatefulWidget implements PreferredSizeWidget {
  /// {@macro ShadTabs}
  const ShadTabs({
    super.key,
    this.value,
    required this.tabs,
    this.controller,
    this.tabBarAlignment,
    this.tabsGap,
    this.gap,
    this.scrollable,
    this.dragStartBehavior,
    this.physics,
    this.padding,
    this.decoration,
    this.tabBarConstraints,
    this.contentConstraints,
    this.restorationId,
    this.onChanged,
    this.maintainState,
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

  /// {@template ShadTabs.tabsGap}
  /// The horizontal gap between the tabs in the tabBar.
  /// {@endtemplate}
  final double? tabsGap;

  /// {@template ShadTabs.tabBarAlignment}
  /// The alignment of the tabBar.
  /// {@endtemplate}
  final Alignment? tabBarAlignment;

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
  final EdgeInsetsGeometry? padding;

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

  /// {@template ShadTabs.restorationId}
  /// The restoration id, defaults to `null`.
  /// {@endtemplate}
  final String? restorationId;

  /// {@template ShadTabs.onChanged}
  /// The callback that is called when the value of the tabs changes.
  /// {@endtemplate}
  final ValueChanged<T>? onChanged;

  /// {@template ShadTabs.maintainState}
  /// Whether to maintain the state of the tabs when switching between them.
  /// Defaults to true.
  /// {@endtemplate}
  final bool? maintainState;

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

    final effectiveDragStartBehavior =
        widget.dragStartBehavior ??
        tabsTheme.dragStartBehavior ??
        DragStartBehavior.start;

    final effectivePadding =
        widget.padding ?? tabsTheme.padding ?? EdgeInsets.zero;

    final effectiveDecoration = ShadDecoration(
      color: theme.colorScheme.muted,
      border: ShadBorder.all(radius: theme.radius, width: 0),
    ).merge(tabsTheme.decoration).merge(widget.decoration);

    final effectiveGap = widget.gap ?? tabsTheme.gap ?? 8;

    final effectiveTabBarConstraints =
        widget.tabBarConstraints ?? tabsTheme.tabBarConstraints;

    final effectiveContentConstraints =
        widget.contentConstraints ?? tabsTheme.contentConstraints;

    final effectiveMaintainState = widget.maintainState ?? true;

    Widget tabBar = Row(
      spacing: widget.tabsGap ?? tabsTheme.tabsGap ?? 0,
      children: widget.tabs,
    );

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

    final effectiveTabBarAlignment =
        widget.tabBarAlignment ?? tabsTheme.tabBarAlignment;
    if (effectiveTabBarAlignment != null) {
      tabBar = Align(alignment: effectiveTabBarAlignment, child: tabBar);
    }

    return ShadProvider(
      data: this as ShadTabsState<dynamic>,
      notifyUpdate: (_) => true,
      child: ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          return Column(
            children: [
              ShadDecorator(
                decoration: effectiveDecoration,
                child: tabBar,
              ),
              SizedBox(height: effectiveGap),
              ...List<Widget>.generate(widget.tabs.length, (int index) {
                final tab = widget.tabs[index];
                final selected = tab.value == controller.selected;
                if (!selected && !effectiveMaintainState) {
                  return const SizedBox.shrink();
                }
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

                final effectiveExpandContent =
                    tab.expandContent ?? theme.tabsTheme.expandContent ?? false;
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

/// {@template ShadTab}
/// Represents a single tab item within a [ShadTabs] widget.
///
/// Includes properties for styling, content, and interaction handling.
/// {@endtemplate}
class ShadTab<T> extends StatefulWidget implements PreferredSizeWidget {
  /// {@macro ShadTab}
  const ShadTab({
    super.key,
    required this.value,
    required this.child,
    this.content,
    this.leading,
    this.trailing,
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
    this.expandContent,
  });

  /// {@template ShadTab.value}
  /// The value associated with this tab, used for selection and identification.
  /// {@endtemplate}
  final T value;

  /// {@template ShadTab.child}
  /// The widget to display as the tab's label, typically a [Text] widget.
  /// {@endtemplate}
  final Widget child;

  /// {@template ShadTab.content}
  /// The widget to display as the content associated with this tab.
  ///
  /// Displayed when the tab is selected.
  /// {@endtemplate}
  final Widget? content;

  /// {@template ShadTab.leading}
  /// A widget to display at the start of the tab, often an [Icon].
  /// {@endtemplate}
  final Widget? leading;

  /// {@template ShadTab.trailing}
  /// A widget to display at the end of the tab.
  /// {@endtemplate}
  final Widget? trailing;

  /// {@template ShadTab.enabled}
  /// Whether the tab is enabled and can be selected.
  ///
  /// Defaults to true.
  /// {@endtemplate}
  final bool enabled;

  /// {@template ShadTab.flex}
  /// Flex factor for the tab when it's part of a [Row] in a non-scrollable
  /// [ShadTabs].
  ///
  /// Ignored when [ShadTabs] is scrollable. Defaults to 1.
  /// {@endtemplate}
  final int flex;

  /// {@template ShadTab.height}
  /// Height of the tab.
  ///
  /// Defaults to 32.
  /// {@endtemplate}
  final double? height;

  /// {@template ShadTab.width}
  /// Width of the tab.
  ///
  /// In non-scrollable [ShadTabs], defaults to `double.infinity`. In scrollable
  /// [ShadTabs], defaults to null, allowing the tab to size to its content.
  /// {@endtemplate}
  final double? width;

  /// {@template ShadTab.backgroundColor}
  /// Background color of the tab when unselected.
  ///
  /// Defaults to `Colors.transparent`.
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template ShadTab.selectedBackgroundColor}
  /// Background color of the tab when selected.
  ///
  /// Defaults to theme's background color.
  /// {@endtemplate}
  final Color? selectedBackgroundColor;

  /// {@template ShadTab.hoverBackgroundColor}
  /// Background color when hovered.
  ///
  /// Defaults to [backgroundColor].
  /// {@endtemplate}
  final Color? hoverBackgroundColor;

  /// {@template ShadTab.selectedHoverBackgroundColor}
  /// Background color when selected and hovered.
  ///
  /// Defaults to [selectedBackgroundColor].
  /// {@endtemplate}
  final Color? selectedHoverBackgroundColor;

  /// {@template ShadTab.padding}
  /// Padding within the tab.
  ///
  /// Defaults to `EdgeInsets.symmetric(horizontal: 12, vertical: 6)`.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadTab.decoration}
  /// Decoration for the tab when unselected.
  ///
  /// Uses [ShadDecoration].
  /// {@endtemplate}
  final ShadDecoration? decoration;

  /// {@template ShadTab.selectedDecoration}
  /// Decoration for the tab when selected.
  ///
  /// Defaults to [decoration]. Uses [ShadDecoration].
  /// {@endtemplate}
  final ShadDecoration? selectedDecoration;

  /// {@template ShadTab.foregroundColor}
  /// Foreground color (text/icon color) when unselected.
  ///
  /// Defaults to theme's foreground color.
  /// {@endtemplate}
  final Color? foregroundColor;

  /// {@template ShadTab.selectedForegroundColor}
  /// Foreground color when selected.
  ///
  /// Defaults to [foregroundColor].
  /// {@endtemplate}
  final Color? selectedForegroundColor;

  /// {@template ShadTab.textStyle}
  /// Text style for the tab label.
  ///
  /// Defaults to theme's small text style.
  /// {@endtemplate}
  final TextStyle? textStyle;

  /// {@template ShadTab.shadows}
  /// Shadows for the tab when unselected.
  ///
  /// Defaults to small shadows ([ShadShadows.sm]).
  /// {@endtemplate}
  final List<BoxShadow>? shadows;

  /// {@template ShadTab.selectedShadows}
  /// Shadows for the tab when selected.
  ///
  /// Defaults to small shadows ([ShadShadows.sm]).
  /// {@endtemplate}
  final List<BoxShadow>? selectedShadows;

  /// {@template ShadTab.focusNode}
  /// Focus node to control the focus state of the tab.
  ///
  /// If null, an internal [FocusNode] is created.
  /// {@endtemplate}
  final FocusNode? focusNode;

  /// {@template ShadTab.onPressed}
  /// Callback for tap events on the tab.
  /// {@endtemplate}
  final VoidCallback? onPressed;

  /// {@template ShadTab.onLongPress}
  /// Callback for long-press events on the tab.
  /// {@endtemplate}
  final VoidCallback? onLongPress;

  /// {@template ShadTab.size}
  /// Size configuration for the tab, uses [ShadButtonSize].
  /// {@endtemplate}
  final ShadButtonSize? size;

  /// {@template ShadTab.cursor}
  /// Mouse cursor when hovering over the tab.
  /// {@endtemplate}
  final MouseCursor? cursor;

  /// {@template ShadTab.hoverForegroundColor}
  /// Foreground color when hovered.
  /// {@endtemplate}
  final Color? hoverForegroundColor;

  /// {@template ShadTab.autofocus}
  /// Whether the tab should automatically focus on build.
  ///
  /// Defaults to false.
  /// {@endtemplate}
  final bool autofocus;

  /// {@template ShadTab.pressedBackgroundColor}
  /// Background color when pressed.
  /// {@endtemplate}
  final Color? pressedBackgroundColor;

  /// {@template ShadTab.pressedForegroundColor}
  /// Foreground color when pressed.
  /// {@endtemplate}
  final Color? pressedForegroundColor;

  /// {@template ShadTab.gradient}
  /// Background gradient for the tab.
  /// {@endtemplate}
  final Gradient? gradient;

  /// {@template ShadTab.textDecoration}
  /// Text decoration for the tab label.
  /// {@endtemplate}
  final TextDecoration? textDecoration;

  /// {@template ShadTab.hoverTextDecoration}
  /// Text decoration when hovered.
  /// {@endtemplate}
  final TextDecoration? hoverTextDecoration;

  /// {@template ShadTab.statesController}
  /// Custom states controller for managing tab states.
  /// {@endtemplate}
  final ShadStatesController? statesController;

  /// {@macro ShadButton.mainAxisAlignment}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@macro ShadButton.crossAxisAlignment}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@macro ShadButton.hoverStrategies}
  final ShadHoverStrategies? hoverStrategies;

  /// {@macro ShadButton.onHoverChange}
  final ValueChanged<bool>? onHoverChange;

  /// {@macro ShadButton.onTapDown}
  final ValueChanged<TapDownDetails>? onTapDown;

  /// {@macro ShadButton.onTapUp}
  final ValueChanged<TapUpDetails>? onTapUp;

  /// {@macro ShadButton.onTapCancel}
  final VoidCallback? onTapCancel;

  /// {@macro ShadButton.onLongPressStart}
  final ValueChanged<LongPressStartDetails>? onLongPressStart;

  /// {@macro ShadButton.onLongPressCancel}
  final VoidCallback? onLongPressCancel;

  /// {@macro ShadButton.onLongPressUp}
  final VoidCallback? onLongPressUp;

  /// {@macro ShadButton.onLongPressDown}
  final ValueChanged<LongPressDownDetails>? onLongPressDown;

  /// {@macro ShadButton.onLongPressEnd}
  final ValueChanged<LongPressEndDetails>? onLongPressEnd;

  /// {@macro ShadButton.onDoubleTap}
  final VoidCallback? onDoubleTap;

  /// {@macro ShadButton.onDoubleTapDown}
  final ValueChanged<TapDownDetails>? onDoubleTapDown;

  /// {@macro ShadButton.onDoubleTapCancel}
  final VoidCallback? onDoubleTapCancel;

  /// {@macro ShadButton.longPressDuration}
  final Duration? longPressDuration;

  /// {@template ShadTab.expand}
  /// Whether the tab content should be expanded, defaults to `false`.
  /// {@endtemplate}
  final bool? expandContent;

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
    final inherited =
        context.watch<ShadTabsState<dynamic>>() as ShadTabsState<T>;

    void onMayChanged() {
      final hasChanged = inherited.controller.select(widget.value);
      if (hasChanged) {
        inherited.widget.onChanged?.call(widget.value);
      }
    }

    final tabsTheme = theme.tabsTheme;

    final defaultWidth = inherited.scrollable ? null : double.infinity;
    final effectiveWidth = widget.width ?? tabsTheme.tabWidth ?? defaultWidth;
    final effectiveBackgroundColor =
        widget.backgroundColor ??
        tabsTheme.tabBackgroundColor ??
        const Color(0x00000000);

    final effectiveSelectedBackgroundColor =
        widget.selectedBackgroundColor ??
        tabsTheme.tabSelectedBackgroundColor ??
        theme.colorScheme.background;

    final effectiveHoverBackgroundColor =
        widget.hoverBackgroundColor ??
        tabsTheme.tabHoverBackgroundColor ??
        effectiveBackgroundColor;

    final effectiveSelectedHoverBackgroundColor =
        widget.selectedHoverBackgroundColor ??
        tabsTheme.tabSelectedHoverBackgroundColor ??
        effectiveSelectedBackgroundColor;

    final effectivePadding =
        widget.padding ??
        tabsTheme.tabPadding ??
        const EdgeInsets.symmetric(horizontal: 12, vertical: 6);

    final effectiveForegroundColor =
        widget.foregroundColor ??
        tabsTheme.tabForegroundColor ??
        theme.colorScheme.foreground;

    final effectiveSelectedForegroundColor =
        widget.selectedForegroundColor ??
        tabsTheme.tabSelectedForegroundColor ??
        effectiveForegroundColor;

    final effectiveShadows = widget.shadows ?? tabsTheme.tabShadows;
    final effectiveSelectedShadows =
        widget.selectedShadows ??
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
    final effectivePressedBackgroundColor =
        widget.pressedBackgroundColor ?? tabsTheme.tabPressedBackgroundColor;
    final effectivePressedForegroundColor =
        widget.pressedForegroundColor ?? tabsTheme.tabPressedForegroundColor;

    final effectiveTextStyle =
        widget.textStyle ?? tabsTheme.tabTextStyle ?? theme.textTheme.small;

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
              color: theme.colorScheme.ring,
            ),
          ),
          false => ShadDecoration(
            border: ShadBorder.all(radius: BorderRadius.circular(2), width: 0),
            secondaryBorder: ShadBorder.all(
              width: 0,
              radius: BorderRadius.circular(2),
              padding: EdgeInsetsDirectional.fromSTEB(
                isFirstTab ? 4 : 2,
                4,
                isLastTab ? 4 : 2,
                4,
              ),
            ),
            secondaryFocusedBorder: ShadBorder.all(
              width: 2,
              radius: theme.radius,
              padding: EdgeInsetsDirectional.fromSTEB(
                isFirstTab ? 2 : 0,
                2,
                isLastTab ? 2 : 0,
                2,
              ),
              color: theme.colorScheme.ring,
            ),
          ),
        };

        final effectiveDecoration = defaultDecoration
            .merge(
              selected
                  ? tabsTheme.tabSelectedDecoration ?? tabsTheme.tabDecoration
                  : tabsTheme.tabDecoration,
            )
            .merge(widget.decoration);

        return ShadButton.secondary(
          canRequestFocus: selected,
          leading: widget.leading,
          trailing: widget.trailing,
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
            onMayChanged();
            widget.onPressed?.call();
          },
          enabled: widget.enabled,
          onLongPress: widget.onLongPress,
          size: effectiveSize,
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
          onFocusChange: (focused) {
            if (focused) onMayChanged();
          },
          child: DefaultTextStyle.merge(
            style: effectiveTextStyle,
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
