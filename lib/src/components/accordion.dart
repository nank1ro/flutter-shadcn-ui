import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/components/image.dart';
import 'package:shadcn_ui/src/raw_components/focusable.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/animation_builder.dart';
import 'package:shadcn_ui/src/utils/effects.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';

enum ShadAccordionType {
  single,
  multiple,
}

class ShadAccordion<T> extends StatefulWidget {
  ShadAccordion({
    super.key,
    required this.children,
    T? initialValue,
    this.maintainState,
  })  : type = ShadAccordionType.single,
        initialValue = initialValue == null ? <T>[] : <T>[initialValue];

  const ShadAccordion.multiple({
    super.key,
    required this.children,
    this.initialValue,
    this.maintainState,
  }) : type = ShadAccordionType.multiple;

  final ShadAccordionType type;
  final Iterable<Widget> children;
  final List<T>? initialValue;
  final bool? maintainState;

  @override
  State<ShadAccordion<T>> createState() => ShadAccordionState<T>();
}

class ShadAccordionState<T> extends State<ShadAccordion<T>> {
  late List<T> values = widget.initialValue?.toList() ?? <T>[];

  bool get maintainState {
    return widget.maintainState ??
        ShadTheme.of(context, listen: false).accordionTheme.maintainState ??
        false;
  }

  void toggle(T value) {
    setState(() {
      switch (widget.type) {
        case ShadAccordionType.single:
          if (values.contains(value)) {
            values = <T>[];
          } else {
            values = <T>[value];
          }
        case ShadAccordionType.multiple:
          if (values.contains(value)) {
            values.remove(value);
          } else {
            values.add(value);
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShadAccordionInheritedWidget<T>(
      data: this,
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

class ShadAccordionInheritedWidget<T> extends InheritedWidget {
  const ShadAccordionInheritedWidget({
    super.key,
    required this.data,
    required super.child,
  });

  final ShadAccordionState<T> data;

  static ShadAccordionState<T> of<T>(BuildContext context) {
    return maybeOf<T>(context)!;
  }

  static ShadAccordionState<T>? maybeOf<T>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ShadAccordionInheritedWidget<T>>()
        ?.data;
  }

  @override
  bool updateShouldNotify(covariant ShadAccordionInheritedWidget<T> oldWidget) {
    return true;
  }
}

class ShadAccordionItem<T> extends StatefulWidget {
  const ShadAccordionItem({
    super.key,
    required this.value,
    required this.title,
    required this.content,
    this.separator,
    this.icon,
    this.iconSrc,
    this.iconEffects,
    this.padding,
    this.underlineTitleOnHover,
    this.titleStyle,
    this.curve,
    this.duration,
    this.focusNode,
    this.effects,
  });

  final T value;
  final Widget title;
  final Widget content;
  final Widget? separator;
  final Widget? icon;
  final ShadImageSrc? iconSrc;
  final List<Effect<dynamic>>? iconEffects;
  final EdgeInsets? padding;
  final bool? underlineTitleOnHover;
  final TextStyle? titleStyle;
  final Curve? curve;
  final Duration? duration;
  final FocusNode? focusNode;
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
    final inherited = ShadAccordionInheritedWidget.of<T>(context);
    final expanded = inherited.values.contains(widget.value);
    final theme = ShadTheme.of(context);
    final effectiveSeparator = widget.separator ?? const Divider();

    final effectiveDuration =
        widget.duration ?? theme.accordionTheme.duration ?? 300.milliseconds;

    final effectiveCurve = widget.curve ??
        theme.accordionTheme.curve ??
        const Cubic(0.87, 0, 0.13, 1);

    final effectiveTitleStyle = widget.titleStyle ??
        theme.accordionTheme.titleStyle ??
        theme.textTheme.list.copyWith(
          fontWeight: FontWeight.w500,
        );

    final effectiveUnderlineTitleOnHover = widget.underlineTitleOnHover ??
        theme.accordionTheme.underlineTitleOnHover ??
        true;

    final effectiveIconEffects = widget.iconEffects ??
        theme.accordionTheme.iconEffects ??
        [
          RotateEffect(
            begin: 0,
            end: .5,
            duration: 300.milliseconds,
            curve: effectiveCurve,
          ),
        ];

    final effectiveIconSrc = widget.iconSrc ??
        theme.accordionTheme.iconSrc ??
        LucideIcons.chevronDown;

    final effectiveIcon = widget.icon ??
        ShadImage.square(
          effectiveIconSrc,
          color: theme.colorScheme.foreground,
          size: 16,
        );

    final effectivePadding = widget.padding ??
        theme.accordionTheme.padding ??
        const EdgeInsets.symmetric(vertical: 16);

    final effectiveEffects = widget.effects ??
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
              onTap: () => inherited.toggle(widget.value),
              child: Padding(
                padding: effectivePadding,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CallbackShortcuts(
                      bindings: {
                        const SingleActivator(LogicalKeyboardKey.enter): () {
                          inherited.toggle(widget.value);
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
                                      hovered && effectiveUnderlineTitleOnHover
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
                    Animate(
                      target: expanded ? 1 : 0,
                      effects: effectiveIconEffects,
                      child: effectiveIcon,
                    ),
                  ],
                ),
              ),
            ),
            if (!shouldRemoveChild)
              Animate(
                controller: controller,
                effects: effectiveEffects,
                child: widget.content,
              ),
            effectiveSeparator,
          ],
        );
      },
    );
  }
}
