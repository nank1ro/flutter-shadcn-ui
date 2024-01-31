import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/assets.dart';
import 'package:shadcn_ui/src/components/disabled.dart';
import 'package:shadcn_ui/src/components/focused.dart';

import 'package:shadcn_ui/src/components/image.dart';
import 'package:shadcn_ui/src/components/popover.dart';
import 'package:shadcn_ui/src/raw_components/same_width_column.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/components/select.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';

typedef ShadSelectedOptionBuilder<T> = Widget Function(
  BuildContext context,
  T value,
);

class ShadSelect<T> extends StatefulWidget {
  const ShadSelect({
    super.key,
    required this.options,
    required this.selectedOptionBuilder,
    this.placeholder,
    this.initialValue,
    this.onChanged,
    this.focusNode,
    this.closeOnTapOutside = true,
    this.minWidth,
    this.maxHeight,
    this.decoration,
    this.offset,
    this.trailing,
    this.padding,
    this.backgroundColor,
    this.radius,
    this.border,
    this.optionsPadding,
    this.showScrollToBottomChevron,
    this.showScrollToTopChevron,
    this.scrollController,
  });

  /// The callback that is called when the value of the [ShadSelect] changes.
  final ValueChanged<T?>? onChanged;

  /// The initial value of the [ShadSelect], defaults to `null`.
  final T? initialValue;

  /// The placeholder of the [ShadSelect], displayed when the value is null.
  final Widget? placeholder;

  /// The builder for the selected option of the [ShadSelect].
  final ShadSelectedOptionBuilder<T> selectedOptionBuilder;

  /// The options of the [ShadSelect].
  final List<Widget> options;

  /// The focus node of the [ShadSelect].
  final FocusNode? focusNode;

  /// Whether to close the [ShadSelect] when the user taps outside of it,
  /// defaults to `true`.
  final bool closeOnTapOutside;

  /// The minimum width of the [ShadSelect], defaults to
  /// `max(kDefaultSelectMinWidth, constraints.minWidth)`.
  ///
  /// This value is not guaranteed to be respected, because the effective
  /// minWidth is calculated from the max of this value and the min width of the
  /// view itself.
  final double? minWidth;

  /// The maximum height of the [ShadSelect], defaults to
  /// `kDefaultSelectMaxHeight`.
  final double? maxHeight;

  /// The decoration of the [ShadSelect].
  final ShadDecorationTheme? decoration;

  /// The offset of the [ShadSelect], defaults to `Offset(4, 0)`.
  final Offset? offset;

  /// The trailing widget of the [ShadSelect], defaults to a chevron-right
  /// icon.
  final Widget? trailing;

  /// The padding of the [ShadSelect], defaults to
  /// `EdgeInsets.symmetric(horizontal: 12, vertical: 8)`.
  final EdgeInsets? padding;

  /// The background color of the [ShadSelect], defaults to
  /// the color scheme color.
  final Color? backgroundColor;

  /// The radius of the [ShadSelect], defaults to `ShadThemeData.radius`.
  final BorderRadius? radius;

  /// The border of the [ShadSelect], defaults to
  /// `Border.all(color: kDefaultSelectBorderColor)`.
  final Border? border;

  /// The padding of the options of the [ShadSelect], defaults to
  /// `EdgeInsets.all(4)`.
  final EdgeInsets? optionsPadding;

  /// Whether to show the scroll-to-top chevron, defaults to true.
  final bool? showScrollToTopChevron;

  /// Whether to show the scroll-to-bottom chevron, defaults to true.
  final bool? showScrollToBottomChevron;

  /// The scroll controller of the [ShadSelect].
  final ScrollController? scrollController;

  static ShadSelectState<T> of<T>(BuildContext context) {
    return maybeOf<T>(context)!;
  }

  static ShadSelectState<T>? maybeOf<T>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ShadInheritedSelectContainer<T>>()
        ?.data;
  }

  @override
  ShadSelectState<T> createState() => ShadSelectState();
}

class ShadSelectState<T> extends State<ShadSelect<T>> {
  FocusNode? internalFocusNode;
  late T? selected = widget.initialValue;
  final controller = ShadPopoverController();
  ScrollController? _scrollController;

  final showScrollToBottom = ValueNotifier(false);
  final showScrollToTop = ValueNotifier(false);
  bool shouldAnimateToTop = false;
  bool shouldAnimateToBottom = false;

  FocusNode get focusNode => widget.focusNode ?? internalFocusNode!;

  ScrollController get scrollController =>
      widget.scrollController ?? _scrollController!;

  @override
  void initState() {
    super.initState();
    if (widget.scrollController == null) {
      _scrollController = ScrollController();
    }
    if (widget.focusNode == null) internalFocusNode = FocusNode();

    // Toggle the popover when the user presses enter
    focusNode.onKeyEvent = (node, event) {
      if (event.logicalKey == LogicalKeyboardKey.enter &&
          event is KeyDownEvent) {
        if (controller.isOpen) {
          controller.hide();
          focusNode.requestFocus();
        } else {
          FocusScope.of(context).unfocus();
          controller.show();
        }
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    };

    // react to the scroll position
    scrollController.addListener(() {
      if (!scrollController.hasClients) return;
      showScrollToBottom.value =
          scrollController.offset < scrollController.position.maxScrollExtent;
      showScrollToTop.value = scrollController.offset > 0;
    });
  }

  @override
  void dispose() {
    internalFocusNode?.dispose();
    controller.dispose();
    _scrollController?.dispose();
    showScrollToBottom.dispose();
    showScrollToTop.dispose();
    super.dispose();
  }

  Future<void> animateToTop() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    while (shouldAnimateToTop) {
      shouldAnimateToTop = scrollController.offset > 0;
      await scrollController.animateTo(
        max(scrollController.offset - 30, 0),
        duration: const Duration(milliseconds: 20),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  Future<void> animateToBottom() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    while (shouldAnimateToBottom) {
      shouldAnimateToBottom =
          scrollController.offset < scrollController.position.maxScrollExtent;
      await scrollController.animateTo(
        min(
          scrollController.offset + 30,
          scrollController.position.maxScrollExtent,
        ),
        duration: const Duration(milliseconds: 20),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void select(T value, {bool hideOptions = true}) {
    final changed = value != selected;
    setState(() {
      if (hideOptions) controller.hide();
      selected = value;
    });
    focusNode.requestFocus();
    if (changed) widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));

    final theme = ShadTheme.of(context);
    final effectiveDecoration = widget.decoration ?? theme.decoration;
    final decorationHorizontalPadding =
        effectiveDecoration.border?.padding?.horizontal ?? 0.0;
    final effectivePadding = widget.padding ??
        theme.selectTheme.padding ??
        const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
    final effectiveBackgroundColor = widget.backgroundColor ??
        theme.selectTheme.backgroundColor ??
        theme.colorScheme.background;
    final effectiveRadius =
        widget.radius ?? theme.selectTheme.radius ?? theme.radius;
    final effectiveBorder = widget.border ??
        theme.selectTheme.border ??
        Border.all(color: theme.colorScheme.input);

    final effectiveShowScrollToTopChevron = widget.showScrollToTopChevron ??
        theme.selectTheme.showScrollToTopChevron ??
        true;
    final effectiveShowScrollToBottomChevron =
        widget.showScrollToBottomChevron ??
            theme.selectTheme.showScrollToBottomChevron ??
            true;

    final Widget effectiveText;
    if (selected is T) {
      effectiveText = widget.selectedOptionBuilder(
        context,
        selected as T,
      );
    } else {
      assert(
        widget.placeholder != null,
        'placeholder must not be null when value is null',
      );
      effectiveText = widget.placeholder!;
    }

    final effectiveTrailing = widget.trailing ??
        ShadImage.square(
          ShadAssets.chevronDown,
          size: 16,
          color: theme.colorScheme.popoverForeground.withOpacity(.5),
        );

    final select = ShadDisabled(
      disabled: widget.onChanged == null,
      child: ShadFocused(
        canRequestFocus: widget.onChanged != null,
        focusNode: focusNode,
        builder: (context, focused, child) {
          return ShadDecorator(
            focused: focused,
            decoration: effectiveDecoration,
            child: child!,
          );
        },
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            controller.toggle();
          },
          child: Container(
            padding: effectivePadding,
            decoration: BoxDecoration(
              color: effectiveBackgroundColor,
              borderRadius: effectiveRadius,
              border: effectiveBorder,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: effectiveText),
                effectiveTrailing,
              ],
            ),
          ),
        ),
      ),
    );

    final effectiveOffset =
        widget.offset ?? theme.selectTheme.offset ?? const Offset(4, 0);
    final effectiveMinWidth =
        widget.minWidth ?? theme.selectTheme.minWidth ?? kDefaultSelectMinWidth;
    final effectiveMaxHeight = widget.maxHeight ??
        theme.selectTheme.maxHeight ??
        kDefaultSelectMaxHeight;
    final effectiveOptionsPadding = widget.optionsPadding ??
        theme.selectTheme.optionsPadding ??
        const EdgeInsets.all(4);

    return LayoutBuilder(
      builder: (context, constraints) {
        final calculatedMinWidth =
            max(effectiveMinWidth, constraints.minWidth) -
                decorationHorizontalPadding;

        final scrollToTopChild = effectiveShowScrollToTopChevron
            ? ValueListenableBuilder(
                valueListenable: showScrollToTop,
                builder: (context, show, child) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: show
                        ? MouseRegion(
                            onEnter: (_) {
                              shouldAnimateToTop = true;
                              animateToTop();
                            },
                            onExit: (_) => shouldAnimateToTop = false,
                            child: Container(
                              width: calculatedMinWidth,
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: ShadImage.square(
                                ShadAssets.chevronUp,
                                size: 16,
                                color: theme.colorScheme.popoverForeground,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  );
                },
              )
            : null;

        final scrollToBottomChild = effectiveShowScrollToBottomChevron
            ? ValueListenableBuilder(
                valueListenable: showScrollToBottom,
                builder: (context, show, child) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: show
                        ? MouseRegion(
                            onEnter: (_) {
                              shouldAnimateToBottom = true;
                              animateToBottom();
                            },
                            onExit: (_) => shouldAnimateToBottom = false,
                            child: Container(
                              width: calculatedMinWidth,
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: ShadImage.square(
                                ShadAssets.chevronDown,
                                size: 16,
                                color: theme.colorScheme.popoverForeground,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  );
                },
              )
            : null;

        return ShadInheritedSelectContainer(
          data: this,
          child: ShadPopover(
            padding: EdgeInsets.zero,
            controller: controller,
            offset: effectiveOffset,
            alignment: Alignment.bottomLeft,
            childAlignment: Alignment.topLeft,
            closeOnTapOutside: widget.closeOnTapOutside,
            popover: (_) {
              // set the initial value for showScrollToBottom and
              // showScrollToTop, after the popover is rendered
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                if (scrollController.hasClients) {
                  showScrollToBottom.value = scrollController.offset <
                      scrollController.position.maxScrollExtent;
                  showScrollToTop.value = scrollController.offset > 0;
                }
              });

              return ConstrainedBox(
                constraints: BoxConstraints(maxHeight: effectiveMaxHeight),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (scrollToTopChild != null) scrollToTopChild,
                    Flexible(
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minWidth: calculatedMinWidth),
                        child: SingleChildScrollView(
                          padding: effectiveOptionsPadding,
                          controller: scrollController,
                          child: ShadSameWidthColumn(children: widget.options),
                        ),
                      ),
                    ),
                    if (scrollToBottomChild != null) scrollToBottomChild,
                  ],
                ),
              );
            },
            child: select,
          ),
        );
      },
    );
  }
}

class ShadInheritedSelectContainer<T> extends InheritedWidget {
  const ShadInheritedSelectContainer({
    super.key,
    required this.data,
    required super.child,
  });

  final ShadSelectState<T> data;

  @override
  bool updateShouldNotify(ShadInheritedSelectContainer<T> oldWidget) => true;
}

class ShadOption<T> extends StatefulWidget {
  const ShadOption({
    super.key,
    required this.value,
    required this.child,
    this.hoveredBackgroundColor,
    this.padding,
    this.selectedIcon,
    this.radius,
  });

  /// The value of the [ShadOption], it must be unique above the options.
  final T value;

  /// The child widget.
  final Widget child;

  /// The background color of the [ShadOption] when hovered, defaults to
  /// `ShadThemeData.accent`.
  final Color? hoveredBackgroundColor;

  /// The padding of the [ShadOption], defaults to
  /// `EdgeInsets.symmetric(horizontal: 8, vertical: 6)`
  final EdgeInsets? padding;

  /// The icon of the [ShadOption] when selected.
  final Widget? selectedIcon;

  /// The radius of the [ShadOption], defaults to `ShadThemeData.radius`.
  final BorderRadius? radius;

  @override
  State<ShadOption<T>> createState() => _ShadOptionState<T>();
}

class _ShadOptionState<T> extends State<ShadOption<T>> {
  final hovered = ValueNotifier(false);
  final focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    hovered.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    assert(
      ShadSelect.maybeOf<T>(context) != null,
      'Cannot find ShadSelect InheritedWidget',
    );
    final inheritedSelect = ShadSelect.of<T>(context);
    final selected = inheritedSelect.selected == widget.value;
    if (selected) {
      // scroll to the selected option
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        Scrollable.maybeOf(context)
            ?.position
            .ensureVisible(context.findRenderObject()!);
      });
    }

    final effectiveHoveredBackgroundColor = widget.hoveredBackgroundColor ??
        theme.optionTheme.hoveredBackgroundColor ??
        theme.colorScheme.accent;
    final effectivePadding = widget.padding ??
        theme.optionTheme.padding ??
        const EdgeInsets.symmetric(horizontal: 8, vertical: 6);
    final effectiveRadius =
        widget.radius ?? theme.optionTheme.radius ?? theme.radius;

    return Focus(
      focusNode: focusNode,
      canRequestFocus: true,
      child: MouseRegion(
        onEnter: (_) => hovered.value = true,
        onExit: (_) => hovered.value = false,
        child: GestureDetector(
          onTap: () => inheritedSelect.select(widget.value),
          child: ValueListenableBuilder(
            valueListenable: hovered,
            builder: (context, hovered, child) {
              return Container(
                padding: effectivePadding,
                decoration: BoxDecoration(
                  color: hovered ? effectiveHoveredBackgroundColor : null,
                  borderRadius: effectiveRadius,
                ),
                child: child,
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.selectedIcon ??
                    Visibility.maintain(
                      visible: selected,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ShadImage.square(
                          ShadAssets.check,
                          size: 16,
                          color: theme.colorScheme.popoverForeground,
                        ),
                      ),
                    ),
                DefaultTextStyle(
                  style: theme.textTheme.muted.copyWith(
                    color: theme.colorScheme.popoverForeground,
                  ),
                  child: widget.child,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
