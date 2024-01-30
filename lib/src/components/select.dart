import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/assets.dart';
import 'package:shadcn_ui/src/components/disabled.dart';
import 'package:shadcn_ui/src/components/focusable.dart';

import 'package:shadcn_ui/src/components/image.dart';
import 'package:shadcn_ui/src/components/popover.dart';
import 'package:shadcn_ui/src/raw_components/same_width_column.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/components/select.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';

typedef ShadcnSelectedOptionBuilder<T> = Widget Function(
  BuildContext context,
  T value,
);

class ShadcnSelect<T> extends StatefulWidget {
  const ShadcnSelect({
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

  /// The callback that is called when the value of the [ShadcnSelect] changes.
  final ValueChanged<T?>? onChanged;

  /// The initial value of the [ShadcnSelect], defaults to `null`.
  final T? initialValue;

  /// The placeholder of the [ShadcnSelect], displayed when the value is null.
  final Widget? placeholder;

  /// The builder for the selected option of the [ShadcnSelect].
  final ShadcnSelectedOptionBuilder<T> selectedOptionBuilder;

  /// The options of the [ShadcnSelect].
  final List<Widget> options;

  /// The focus node of the [ShadcnSelect].
  final FocusNode? focusNode;

  /// Whether to close the [ShadcnSelect] when the user taps outside of it,
  /// defaults to `true`.
  final bool closeOnTapOutside;

  /// The minimum width of the [ShadcnSelect], defaults to
  /// `max(kDefaultSelectMinWidth, constraints.minWidth)`.
  ///
  /// This value is not guaranteed to be respected, because the effective
  /// minWidth is calculated from the max of this value and the min width of the
  /// view itself.
  final double? minWidth;

  /// The maximum height of the [ShadcnSelect], defaults to
  /// `kDefaultSelectMaxHeight`.
  final double? maxHeight;

  /// The decoration of the [ShadcnSelect].
  final ShadcnDecorationTheme? decoration;

  /// The offset of the [ShadcnSelect], defaults to `Offset(4, 0)`.
  final Offset? offset;

  /// The trailing widget of the [ShadcnSelect], defaults to a chevron-right
  /// icon.
  final Widget? trailing;

  /// The padding of the [ShadcnSelect], defaults to
  /// `EdgeInsets.symmetric(horizontal: 12, vertical: 8)`.
  final EdgeInsets? padding;

  /// The background color of the [ShadcnSelect], defaults to
  /// the color scheme color.
  final Color? backgroundColor;

  /// The radius of the [ShadcnSelect], defaults to `ShadcnThemeData.radius`.
  final BorderRadius? radius;

  /// The border of the [ShadcnSelect], defaults to
  /// `Border.all(color: kDefaultSelectBorderColor)`.
  final Border? border;

  /// The padding of the options of the [ShadcnSelect], defaults to
  /// `EdgeInsets.all(4)`.
  final EdgeInsets? optionsPadding;

  /// Whether to show the scroll-to-top chevron, defaults to true.
  final bool? showScrollToTopChevron;

  /// Whether to show the scroll-to-bottom chevron, defaults to true.
  final bool? showScrollToBottomChevron;

  /// The scroll controller of the [ShadcnSelect].
  final ScrollController? scrollController;

  static ShadcnSelectState<T> of<T>(BuildContext context) {
    return maybeOf<T>(context)!;
  }

  static ShadcnSelectState<T>? maybeOf<T>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ShadcnInheritedSelectContainer<T>>()
        ?.data;
  }

  @override
  ShadcnSelectState<T> createState() => ShadcnSelectState();
}

class ShadcnSelectState<T> extends State<ShadcnSelect<T>> {
  FocusNode? internalFocusNode;
  late T? selected = widget.initialValue;
  final controller = ShadcnPopoverController();
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
    assert(debugCheckHasShadcnTheme(context));

    final theme = ShadcnTheme.of(context);
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
        ShadcnImage.square(
          ShadAssets.chevronDown,
          size: 16,
          color: theme.colorScheme.popoverForeground.withOpacity(.5),
        );

    final select = ShadDisabled(
      disabled: widget.onChanged == null,
      child: ShadFocused(
        canRequestFocus: widget.onChanged != null,
        focusNode: focusNode,
        builder: (context, focused) {
          return ShadcnDecorator(
            focused: focused,
            decoration: effectiveDecoration,
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
          );
        },
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
                              child: ShadcnImage.square(
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
                              child: ShadcnImage.square(
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

        return ShadcnInheritedSelectContainer(
          data: this,
          child: ShadcnPopover(
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

class ShadcnInheritedSelectContainer<T> extends InheritedWidget {
  const ShadcnInheritedSelectContainer({
    super.key,
    required this.data,
    required super.child,
  });

  final ShadcnSelectState<T> data;

  @override
  bool updateShouldNotify(ShadcnInheritedSelectContainer<T> oldWidget) => true;
}

class ShadcnOption<T> extends StatefulWidget {
  const ShadcnOption({
    super.key,
    required this.value,
    required this.child,
    this.hoveredBackgroundColor,
    this.padding,
    this.selectedIcon,
    this.radius,
  });

  /// The value of the [ShadcnOption], it must be unique above the options.
  final T value;

  /// The child widget.
  final Widget child;

  /// The background color of the [ShadcnOption] when hovered, defaults to
  /// `ShadcnThemeData.accent`.
  final Color? hoveredBackgroundColor;

  /// The padding of the [ShadcnOption], defaults to
  /// `EdgeInsets.symmetric(horizontal: 8, vertical: 6)`
  final EdgeInsets? padding;

  /// The icon of the [ShadcnOption] when selected.
  final Widget? selectedIcon;

  /// The radius of the [ShadcnOption], defaults to `ShadcnThemeData.radius`.
  final BorderRadius? radius;

  @override
  State<ShadcnOption<T>> createState() => _ShadcnOptionState<T>();
}

class _ShadcnOptionState<T> extends State<ShadcnOption<T>> {
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
    final theme = ShadcnTheme.of(context);
    assert(
      ShadcnSelect.maybeOf<T>(context) != null,
      'Cannot find ShadcnSelect InheritedWidget',
    );
    final inheritedSelect = ShadcnSelect.of<T>(context);
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
                        child: ShadcnImage.square(
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
