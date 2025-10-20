import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/components/separator.dart';
import 'package:shadcn_ui/src/raw_components/focusable.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/animate.dart';
import 'package:shadcn_ui/src/utils/animation_builder.dart';
import 'package:shadcn_ui/src/utils/effects.dart';
import 'package:shadcn_ui/src/utils/extensions/text_style.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';
import 'package:shadcn_ui/src/utils/provider.dart';

/// {@template ShadAccordionController}
/// A controller for managing the state of a [ShadAccordion] widget.
///
/// Supports both single `ShadAccordionController` and multiple item expansion
/// modes `ShadAccordionController.multiple`.
/// {@endtemplate}
class ShadAccordionController<T> extends ValueNotifier<List<T>> {
  /// {@macro ShadAccordionController}
  ShadAccordionController([T? value])
    : _variant = ShadAccordionVariant.single,
      super(List<T>.unmodifiable([?value]));

  ShadAccordionController.multiple([List<T>? value])
    : _variant = ShadAccordionVariant.multiple,
      super(List<T>.unmodifiable(value ?? <T>[]));

  @override
  set value(List<T> newValue) {
    super.value = List<T>.unmodifiable(newValue);
  }

  final ShadAccordionVariant _variant;

  /// Toggles the expansion state of the item with the given value [v].
  ///
  /// In single mode, expands the item if it's not already expanded, or
  /// collapses it if it is. In multiple mode, adds or removes the item from the
  /// list of expanded items.
  void toggle(T v) {
    switch (_variant) {
      case ShadAccordionVariant.single:
        if (value.contains(v)) {
          value = <T>[];
        } else {
          value = <T>[v];
        }
      case ShadAccordionVariant.multiple:
        if (value.contains(v)) {
          value = value.toList()..remove(v);
        } else {
          value = value.toList()..add(v);
        }
    }
  }
}

/// Variants available for the [ShadAccordion] widget.
enum ShadAccordionVariant {
  single,
  multiple,
}

/// A customizable accordion widget that manages collapsible items.
///
/// The [ShadAccordion] widget allows users to expand and collapse items,
/// supporting either single or multiple open items at a time. Use
/// [ShadAccordion.multiple] for multiple open items or the default constructor
/// for single-item behavior. Items are defined using [ShadAccordionItem].
class ShadAccordion<T> extends StatefulWidget {
  /// Creates a single-type accordion where only one item can be expanded at a
  /// time.
  ShadAccordion({
    super.key,
    required this.children,
    T? initialValue,
    this.maintainState,
    this.controller,
  }) : variant = ShadAccordionVariant.single,
       initialValue = <T>[?initialValue],
       assert(
         controller == null ||
             controller._variant == ShadAccordionVariant.single,
         'Pass a single-mode ShadAccordionController to ShadAccordion(...)',
       );

  /// Creates a multiple-type accordion where multiple items can be expanded
  /// simultaneously.
  ShadAccordion.multiple({
    super.key,
    required this.children,
    this.initialValue,
    this.maintainState,
    this.controller,
  }) : variant = ShadAccordionVariant.multiple,
       assert(
         controller == null ||
             controller._variant == ShadAccordionVariant.multiple,
         'Pass a multiple-mode ShadAccordionController to '
         'ShadAccordion.multiple(...)',
       );

  /// {@template ShadAccordion.variant}
  /// The type of accordion, either [ShadAccordionVariant.single] or
  /// [ShadAccordionVariant.multiple].
  /// Determines whether only one or multiple items can be expanded at once.
  /// {@endtemplate}
  final ShadAccordionVariant variant;

  /// {@template ShadAccordion.children}
  /// The list of [ShadAccordionItem] widgets that make up the accordion's
  /// content. Each item can be expanded or collapsed independently based on
  /// [variant].
  /// {@endtemplate}
  final Iterable<Widget> children;

  /// {@template ShadAccordion.initialValue}
  /// The initial list of values for items that should be expanded on creation.
  /// For single type, only the first value is used; for multiple, all values
  /// are used.
  /// {@endtemplate}
  final List<T>? initialValue;

  /// {@template ShadAccordion.maintainState}
  /// Whether to maintain the state of closed items in the widget tree.
  /// If true, closed items remain built but hidden; if false, they are removed.
  /// {@endtemplate}
  final bool? maintainState;

  /// {@macro ShadAccordionController}
  final ShadAccordionController<T>? controller;

  @override
  State<ShadAccordion<T>> createState() => ShadAccordionState<T>();
}

class ShadAccordionState<T> extends State<ShadAccordion<T>> {
  ShadAccordionController<T>? _controller;

  ShadAccordionController<T> get effectiveController {
    if (widget.controller != null) return widget.controller!;
    if (_controller != null) return _controller!;
    return switch (widget.variant) {
      ShadAccordionVariant.single => _controller ??= ShadAccordionController<T>(
        widget.initialValue != null && widget.initialValue!.isNotEmpty
            ? widget.initialValue!.first
            : null,
      ),
      ShadAccordionVariant.multiple =>
        _controller ??= ShadAccordionController<T>.multiple(
          widget.initialValue,
        ),
    };
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ShadAccordion<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Switched from internal to external controller: dispose internal.
    if (oldWidget.controller == null && widget.controller != null) {
      _controller?.dispose();
      _controller = null;
    }
    // Switched from external to internal or variant changed: recreate lazily.
    if ((oldWidget.controller != null && widget.controller == null) ||
        (oldWidget.variant != widget.variant && widget.controller == null)) {
      _controller?.dispose();
      _controller = null;
    }
  }

  bool get maintainState {
    return widget.maintainState ??
        ShadTheme.of(context, listen: false).accordionTheme.maintainState ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return ShadProvider(
      data: this as ShadAccordionState<dynamic>,
      notifyUpdate: (_) => true,
      child: FocusTraversalGroup(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: widget.children.toList(),
        ),
      ),
    );
  }
}

/// An individual item within a [ShadAccordion], capable of being expanded or
/// collapsed.
///
/// Each item has a title and content, with customizable appearance and
/// animations.
class ShadAccordionItem<T> extends StatefulWidget {
  /// Creates an accordion item with a specific value, title, and content.
  const ShadAccordionItem({
    super.key,
    required this.value,
    required this.title,
    required this.child,
    this.separator,
    this.icon,
    this.iconData,
    this.iconEffects,
    this.padding,
    this.underlineTitleOnHover,
    this.titleStyle,
    this.curve,
    this.duration,
    this.focusNode,
    this.effects,
  });

  /// {@template ShadAccordionItem.value}
  /// The unique value identifying this item within the accordion.
  /// Used to track its expansion state in the [ShadAccordionState].
  /// {@endtemplate}
  final T value;

  /// {@template ShadAccordionItem.title}
  /// The title widget of the item, typically a [Text] widget, displayed in the
  /// header.
  /// Styled by [titleStyle] or theme defaults.
  /// {@endtemplate}
  final Widget title;

  /// {@template ShadAccordionItem.child}
  /// The content widget displayed when the item is expanded.
  /// Animated in and out based on [effects].
  /// {@endtemplate}
  final Widget child;

  /// {@template ShadAccordionItem.separator}
  /// The widget displayed below the item as a separator, defaults to a
  /// Divider if null.
  /// {@endtemplate}
  final Widget? separator;

  /// {@template ShadAccordionItem.icon}
  /// A custom widget to use as the item's icon, takes precedence over
  /// [iconData].
  /// Displayed in the header and animated based on [iconEffects].
  /// {@endtemplate}
  final Widget? icon;

  /// {@template ShadAccordionItem.iconData}
  /// The icon data to display if [icon] is not provided.
  /// Used to create a default [Icon] widget with theme styling.
  /// {@endtemplate}
  final IconData? iconData;

  /// {@template ShadAccordionItem.iconEffects}
  /// The animation effects applied to the icon when the item expands or
  /// collapses.
  /// Defaults to a rotation effect if not specified.
  /// {@endtemplate}
  final List<Effect<dynamic>>? iconEffects;

  /// {@template ShadAccordionItem.padding}
  /// Padding around the header content, defaults to vertical padding of 16 if
  /// not specified.
  /// Controls the spacing within the item's header.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadAccordionItem.underlineTitleOnHover}
  /// Whether to underline the title when hovered, defaults to true if not
  /// specified.
  /// Enhances visual feedback on mouse hover.
  /// {@endtemplate}
  final bool? underlineTitleOnHover;

  /// {@template ShadAccordionItem.titleStyle}
  /// Style for the title text, overrides theme default if provided.
  /// Controls font size, weight, and other text properties of the [title].
  /// {@endtemplate}
  final TextStyle? titleStyle;

  /// {@template ShadAccordionItem.curve}
  /// The curve for animations, defaults to a cubic curve if not specified.
  /// Affects the timing of expansion and collapse animations.
  /// {@endtemplate}
  final Curve? curve;

  /// {@template ShadAccordionItem.duration}
  /// The duration of animations, defaults to 300ms if not specified.
  /// Controls how long expansion and collapse animations take.
  /// {@endtemplate}
  final Duration? duration;

  /// {@template ShadAccordionItem.focusNode}
  /// The focus node for keyboard navigation, created internally if not
  /// provided.
  /// Enables focus handling and shortcuts like Enter key toggling.
  /// {@endtemplate}
  final FocusNode? focusNode;

  /// {@template ShadAccordionItem.effects}
  /// The animation effects applied to the content when expanding or collapsing.
  /// Defaults to padding, slide, and size effects if not specified.
  /// {@endtemplate}
  final List<Effect<dynamic>>? effects;

  @override
  State<ShadAccordionItem<T>> createState() => _ShadAccordionItemState<T>();
}

class _ShadAccordionItemState<T> extends State<ShadAccordionItem<T>>
    with SingleTickerProviderStateMixin {
  final hovered = ValueNotifier(false);
  FocusNode? _focusNode;

  FocusNode get focusNode => widget.focusNode ?? _focusNode!;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode == null) _focusNode = FocusNode();
    focusNode.addListener(onFocusChange);
  }

  @override
  void didUpdateWidget(covariant ShadAccordionItem<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Internal -> external: detach from internal, attach to external.
    if (oldWidget.focusNode == null && widget.focusNode != null) {
      _focusNode?.removeListener(onFocusChange);
      _focusNode?.dispose();
      _focusNode = null;
      widget.focusNode!.addListener(onFocusChange);
    }
    // External -> internal: detach from external, create internal, attach.
    if (oldWidget.focusNode != null && widget.focusNode == null) {
      oldWidget.focusNode!.removeListener(onFocusChange);
      _focusNode?.dispose();
      _focusNode = FocusNode();
      focusNode.addListener(onFocusChange);
    }
  }

  @override
  void dispose() {
    focusNode.removeListener(onFocusChange);
    _focusNode?.dispose();
    hovered.dispose();
    super.dispose();
  }

  void onFocusChange() {
    hovered.value = focusNode.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    final inherited =
        context.watch<ShadAccordionState<dynamic>>() as ShadAccordionState<T>;

    final keyboardTriggers = <ShortcutActivator>[
      const SingleActivator(LogicalKeyboardKey.enter),
      const SingleActivator(LogicalKeyboardKey.space),
    ];

    return ValueListenableBuilder(
      valueListenable: inherited.effectiveController,
      builder: (context, value, child) {
        final expanded = value.contains(widget.value);
        final theme = ShadTheme.of(context);
        final effectiveSeparator =
            widget.separator ?? const ShadSeparator.horizontal();

        final effectiveDuration =
            widget.duration ??
            theme.accordionTheme.duration ??
            300.milliseconds;

        final effectiveCurve =
            widget.curve ??
            theme.accordionTheme.curve ??
            const Cubic(0.87, 0, 0.13, 1);

        final effectiveTitleStyle =
            (widget.titleStyle ??
                    theme.accordionTheme.titleStyle ??
                    theme.textTheme.list.copyWith(
                      fontWeight: FontWeight.w500,
                    ))
                .fallback(color: theme.colorScheme.foreground);

        final effectiveUnderlineTitleOnHover =
            widget.underlineTitleOnHover ??
            theme.accordionTheme.underlineTitleOnHover ??
            true;

        final effectiveIconEffects =
            widget.iconEffects ??
            theme.accordionTheme.iconEffects ??
            [
              RotateEffect(
                begin: 0,
                end: .5,
                duration: 300.milliseconds,
                curve: effectiveCurve,
              ),
            ];

        final effectiveIconData =
            widget.iconData ??
            theme.accordionTheme.iconData ??
            LucideIcons.chevronDown;

        final effectiveIcon =
            widget.icon ??
            Icon(
              effectiveIconData,
              color: theme.colorScheme.foreground,
              size: 16,
            );

        final effectivePadding =
            widget.padding ??
            theme.accordionTheme.padding ??
            const EdgeInsets.symmetric(vertical: 16);

        final effectiveEffects =
            widget.effects ??
            theme.accordionTheme.effects ??
            [
              PaddingEffect(
                padding: const EdgeInsets.only(bottom: 8),
                curve: effectiveCurve,
                duration: effectiveDuration,
              ),
              SlideEffect(
                curve: effectiveCurve,
                begin: const Offset(0, -1),
                end: Offset.zero,
                duration: effectiveDuration,
              ),
              SizeEffect(
                curve: effectiveCurve,
                duration: effectiveDuration,
              ),
            ];

        return ShadAnimationBuilder(
          duration: effectiveDuration,
          builder: (context, controller) {
            if (expanded && !controller.isCompleted) {
              // animates the opened item, to show it
              controller.forward();
            } else if (!expanded && !controller.isDismissed) {
              // animates the closed item, to hide it
              controller.reverse();
            }

            final closed = !expanded && controller.isDismissed;
            final shouldRemoveChild = closed && !inherited.maintainState;

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ShadGestureDetector(
                  cursor: SystemMouseCursors.click,
                  onHoverChange: (value) => hovered.value = value,
                  behavior: HitTestBehavior.opaque,
                  onTap: () =>
                      inherited.effectiveController.toggle(widget.value),
                  child: Padding(
                    padding: effectivePadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CallbackShortcuts(
                            bindings: {
                              for (final trigger in keyboardTriggers)
                                trigger: () {
                                  inherited.effectiveController.toggle(
                                    widget.value,
                                  );
                                },
                            },
                            child: ShadFocusable(
                              focusNode: focusNode,
                              builder: (context, focused, child) {
                                return ValueListenableBuilder(
                                  valueListenable: hovered,
                                  builder: (context, hovered, child) {
                                    return DefaultTextStyle(
                                      style: effectiveTitleStyle.copyWith(
                                        decoration:
                                            hovered &&
                                                effectiveUnderlineTitleOnHover
                                            ? TextDecoration.underline
                                            : null,
                                      ),
                                      child: child!,
                                    );
                                  },
                                  child: widget.title,
                                );
                              },
                            ),
                          ),
                        ),
                        ShadAnimate(
                          target: expanded ? 1 : 0,
                          effects: effectiveIconEffects,
                          child: effectiveIcon,
                        ),
                      ],
                    ),
                  ),
                ),
                if (!shouldRemoveChild)
                  ShadAnimate(
                    controller: controller,
                    effects: effectiveEffects,
                    child: widget.child,
                  ),
                effectiveSeparator,
              ],
            );
          },
        );
      },
    );
  }
}
