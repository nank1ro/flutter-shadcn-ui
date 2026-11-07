import 'dart:math' as math;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/disabled.dart';
import 'package:shadcn_ui/src/components/separator.dart';
import 'package:shadcn_ui/src/raw_components/focusable.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/components/item.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';
import 'package:shadcn_ui/src/utils/provider.dart';
import 'package:shadcn_ui/src/utils/states_controller.dart';
import 'package:universal_image/universal_image.dart';

/// The variant of the [ShadItem].
enum ShadItemVariant { primary, outline, muted }

/// The size of the [ShadItem].
enum ShadItemSize { regular, sm }

/// The variant of the [ShadItemMedia].
enum ShadItemMediaVariant { primary, icon, image }

/// Returns the theme of the closest [ShadItem], or the primary item theme
/// when used outside of an item.
ShadItemTheme _itemTheme(BuildContext context) {
  return context.maybeWatch<ShadItemTheme>() ??
      ShadTheme.of(context).primaryItemTheme;
}

/// {@template ShadItem}
/// A versatile row to display content with media, a title, a description
/// and actions, styled according to the Shadcn UI design system.
///
/// The item expands to the width of its parent, so it must be placed in a
/// widget that provides a bounded width.
/// {@endtemplate}
class ShadItem extends StatefulWidget {
  /// {@macro ShadItem}
  const ShadItem({
    super.key,
    this.header,
    this.media,
    this.title,
    this.description,
    this.child,
    this.actions,
    this.footer,
    this.size,
    this.padding,
    this.gap,
    this.decoration,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.titleStyle,
    this.descriptionStyle,
    this.descriptionMaxLines,
    this.contentSpacing,
    this.cursor,
    this.textDirection,
    this.onPressed,
    this.enabled = true,
    this.link = false,
    this.focusNode,
    this.autofocus = false,
    this.onFocusChange,
    this.onHoverChange,
    this.statesController,
  }) : variant = ShadItemVariant.primary;

  /// {@macro ShadItem}
  const ShadItem.outline({
    super.key,
    this.header,
    this.media,
    this.title,
    this.description,
    this.child,
    this.actions,
    this.footer,
    this.size,
    this.padding,
    this.gap,
    this.decoration,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.titleStyle,
    this.descriptionStyle,
    this.descriptionMaxLines,
    this.contentSpacing,
    this.cursor,
    this.textDirection,
    this.onPressed,
    this.enabled = true,
    this.link = false,
    this.focusNode,
    this.autofocus = false,
    this.onFocusChange,
    this.onHoverChange,
    this.statesController,
  }) : variant = ShadItemVariant.outline;

  /// {@macro ShadItem}
  const ShadItem.muted({
    super.key,
    this.header,
    this.media,
    this.title,
    this.description,
    this.child,
    this.actions,
    this.footer,
    this.size,
    this.padding,
    this.gap,
    this.decoration,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.titleStyle,
    this.descriptionStyle,
    this.descriptionMaxLines,
    this.contentSpacing,
    this.cursor,
    this.textDirection,
    this.onPressed,
    this.enabled = true,
    this.link = false,
    this.focusNode,
    this.autofocus = false,
    this.onFocusChange,
    this.onHoverChange,
    this.statesController,
  }) : variant = ShadItemVariant.muted;

  /// {@macro ShadItem}
  const ShadItem.raw({
    super.key,
    required this.variant,
    this.header,
    this.media,
    this.title,
    this.description,
    this.child,
    this.actions,
    this.footer,
    this.size,
    this.padding,
    this.gap,
    this.decoration,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.titleStyle,
    this.descriptionStyle,
    this.descriptionMaxLines,
    this.contentSpacing,
    this.cursor,
    this.textDirection,
    this.onPressed,
    this.enabled = true,
    this.link = false,
    this.focusNode,
    this.autofocus = false,
    this.onFocusChange,
    this.onHoverChange,
    this.statesController,
  });

  /// {@template ShadItem.variant}
  /// The variant of the item, defaults to [ShadItemVariant.primary].
  /// {@endtemplate}
  final ShadItemVariant variant;

  /// {@template ShadItem.header}
  /// The widget displayed above the item content, spanning the full width
  /// of the item, usually a [ShadItemHeader].
  /// {@endtemplate}
  final Widget? header;

  /// {@template ShadItem.media}
  /// The widget displayed at the start of the item, usually a
  /// [ShadItemMedia].
  ///
  /// When a [description] is provided, the media is aligned to the top of
  /// the content, otherwise it is vertically centered.
  /// {@endtemplate}
  final Widget? media;

  /// {@template ShadItem.title}
  /// The title of the item, rendered inside a [ShadItemTitle].
  /// {@endtemplate}
  final Widget? title;

  /// {@template ShadItem.description}
  /// The description of the item, rendered inside a [ShadItemDescription].
  /// {@endtemplate}
  final Widget? description;

  /// {@template ShadItem.child}
  /// Additional content displayed below the [description].
  /// {@endtemplate}
  final Widget? child;

  /// {@template ShadItem.actions}
  /// The widget displayed at the end of the item, usually a
  /// [ShadItemActions].
  /// {@endtemplate}
  final Widget? actions;

  /// {@template ShadItem.footer}
  /// The widget displayed below the item content, spanning the full width
  /// of the item, usually a [ShadItemFooter].
  /// {@endtemplate}
  final Widget? footer;

  /// {@template ShadItem.size}
  /// The size of the item, defaults to [ShadItemSize.regular].
  /// {@endtemplate}
  final ShadItemSize? size;

  /// {@template ShadItem.padding}
  /// The padding of the item, defaults to `EdgeInsets.all(16)` for
  /// [ShadItemSize.regular] and
  /// `EdgeInsets.symmetric(horizontal: 16, vertical: 12)` for
  /// [ShadItemSize.sm].
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadItem.gap}
  /// The gap between the [media], the content and the [actions], and
  /// between the [header], the content and the [footer].
  ///
  /// Defaults to 16 for [ShadItemSize.regular] and 10 for [ShadItemSize.sm].
  /// {@endtemplate}
  final double? gap;

  /// {@template ShadItem.decoration}
  /// The decoration of the item, merged with the theme decoration.
  /// {@endtemplate}
  final ShadDecoration? decoration;

  /// {@template ShadItem.backgroundColor}
  /// The background color of the item.
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template ShadItem.hoverBackgroundColor}
  /// The background color of the item when hovered, only used when
  /// [onPressed] is not null.
  ///
  /// Defaults to `ShadColorScheme.accent` with 50% opacity.
  /// {@endtemplate}
  final Color? hoverBackgroundColor;

  /// {@macro ShadItemTitle.style}
  final TextStyle? titleStyle;

  /// {@macro ShadItemDescription.style}
  final TextStyle? descriptionStyle;

  /// {@macro ShadItemDescription.maxLines}
  final int? descriptionMaxLines;

  /// {@macro ShadItemContent.spacing}
  final double? contentSpacing;

  /// {@template ShadItem.cursor}
  /// The mouse cursor of the item when [onPressed] is not null, defaults to
  /// [SystemMouseCursors.click].
  /// {@endtemplate}
  final MouseCursor? cursor;

  /// {@template ShadItem.textDirection}
  /// The text direction of the item, defaults to the ambient
  /// [Directionality].
  /// {@endtemplate}
  final TextDirection? textDirection;

  /// {@template ShadItem.onPressed}
  /// Called when the item is tapped or activated with the keyboard.
  ///
  /// When null, the item is not interactive: it can't be focused and has no
  /// hover style.
  /// {@endtemplate}
  final VoidCallback? onPressed;

  /// {@template ShadItem.enabled}
  /// Whether the item is enabled, defaults to true.
  ///
  /// Only used when [onPressed] is not null. A static item is never disabled.
  /// A disabled item also prevents its [actions] from getting the focus.
  /// {@endtemplate}
  final bool enabled;

  /// {@template ShadItem.link}
  /// Whether the item navigates somewhere, like a link on the web, defaults to
  /// false.
  ///
  /// A link item is announced as a link instead of a button and is activated
  /// with Enter only, not with Space.
  /// {@endtemplate}
  final bool link;

  /// {@macro ShadButton.focusNode}
  final FocusNode? focusNode;

  /// {@macro ShadButton.autofocus}
  final bool autofocus;

  /// {@template ShadItem.onFocusChange}
  /// Called when the item gains or loses the focus.
  ///
  /// Only the item's own focus is reported, not the focus of its [actions].
  /// {@endtemplate}
  final ValueChanged<bool>? onFocusChange;

  /// {@macro ShadButton.onHoverChange}
  final ValueChanged<bool>? onHoverChange;

  /// {@macro ShadButton.statesController}
  final ShadStatesController? statesController;

  @override
  State<ShadItem> createState() => _ShadItemState();
}

class _ShadItemState extends State<ShadItem> {
  ShadStatesController? _statesController;
  FocusNode? _focusNode;

  ShadStatesController get statesController =>
      widget.statesController ?? _statesController!;

  FocusNode get focusNode => widget.focusNode ?? _focusNode!;

  @override
  void initState() {
    super.initState();
    if (widget.statesController == null) {
      _statesController = ShadStatesController();
    }
    if (widget.focusNode == null) _focusNode = FocusNode();
    statesController
      ..update(ShadState.disabled, !widget.enabled)
      ..update(ShadState.focused, focusNode.hasPrimaryFocus);
    focusNode.addListener(onFocusChange);
  }

  @override
  void didUpdateWidget(covariant ShadItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.enabled != widget.enabled) {
      statesController.update(ShadState.disabled, !widget.enabled);
    }
    if (oldWidget.focusNode != null && widget.focusNode == null) {
      oldWidget.focusNode!.removeListener(onFocusChange);
      _focusNode?.dispose();
      _focusNode = FocusNode();
      focusNode.addListener(onFocusChange);
    }
    // The gesture detector is removed when the item stops being
    // interactive, so it can't report the pointer leaving anymore.
    if (oldWidget.onPressed != null && widget.onPressed == null) {
      statesController
        ..update(ShadState.hovered, false)
        ..update(ShadState.pressed, false);
    }
  }

  @override
  void dispose() {
    _statesController?.dispose();
    focusNode.removeListener(onFocusChange);
    _focusNode?.dispose();
    super.dispose();
  }

  // Only the item's own focus counts, otherwise focusing one of the actions
  // would paint the focus ring around the whole item.
  void onFocusChange() {
    final focused = focusNode.hasPrimaryFocus;
    if (statesController.value.contains(ShadState.focused) == focused) return;
    statesController.update(ShadState.focused, focused);
    widget.onFocusChange?.call(focused);
  }

  ShadItemTheme variantTheme(ShadThemeData theme) {
    return switch (widget.variant) {
      ShadItemVariant.primary => theme.primaryItemTheme,
      ShadItemVariant.outline => theme.outlineItemTheme,
      ShadItemVariant.muted => theme.mutedItemTheme,
    };
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    final theme = ShadTheme.of(context);

    // Widget parameters are applied to the provided theme, so that the
    // building blocks (title, description, ...) can read them too.
    final itemTheme = variantTheme(theme).copyWith(
      titleStyle: widget.titleStyle,
      descriptionStyle: widget.descriptionStyle,
      descriptionMaxLines: widget.descriptionMaxLines,
      contentSpacing: widget.contentSpacing,
    );

    final effectiveSize = widget.size ?? itemTheme.size ?? ShadItemSize.regular;
    final effectivePadding =
        widget.padding ??
        itemTheme.padding ??
        switch (effectiveSize) {
          ShadItemSize.regular => const EdgeInsets.all(16),
          ShadItemSize.sm => const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        };
    final effectiveGap =
        widget.gap ??
        itemTheme.gap ??
        switch (effectiveSize) {
          ShadItemSize.regular => 16.0,
          ShadItemSize.sm => 10.0,
        };

    final effectiveDecoration = (itemTheme.decoration ?? const ShadDecoration())
        .merge(widget.decoration);
    final effectiveBackgroundColor =
        widget.backgroundColor ?? itemTheme.backgroundColor;
    final effectiveHoverBackgroundColor =
        widget.hoverBackgroundColor ??
        itemTheme.hoverBackgroundColor ??
        effectiveBackgroundColor;

    final hasDescription = widget.description != null;

    var media = widget.media;
    if (media != null && hasDescription) {
      // Like the web version, the media is aligned to the top of the content
      // and nudged down to line up with the title when there is a
      // description.
      media = Transform.translate(offset: const Offset(0, 2), child: media);
    }

    final hasContent =
        widget.title != null || hasDescription || widget.child != null;

    Widget? content;
    if (hasContent) {
      content = ShadItemContent(
        children: [
          if (widget.title != null) ShadItemTitle(child: widget.title!),
          if (hasDescription) ShadItemDescription(child: widget.description!),
          ?widget.child,
        ],
      );
    }

    final effectiveTextDirection =
        widget.textDirection ?? itemTheme.textDirection;

    Widget item = Padding(
      padding: effectivePadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: effectiveGap,
        children: [
          ?widget.header,
          if (media != null || content != null || widget.actions != null)
            _ShadItemRow(
              gap: effectiveGap,
              textDirection:
                  effectiveTextDirection ?? Directionality.of(context),
              alignMediaToTop: hasDescription,
              media: media,
              content: content,
              actions: widget.actions,
            ),
          ?widget.footer,
        ],
      ),
    );

    item = ShadProvider<ShadItemTheme>(
      data: itemTheme,
      notifyUpdate: (oldWidget) => oldWidget.data != itemTheme,
      child: item,
    );

    if (effectiveTextDirection != null) {
      item = Directionality(textDirection: effectiveTextDirection, child: item);
    }

    if (widget.onPressed == null) {
      return ShadDecorator(
        decoration: effectiveDecoration.copyWith(
          color: effectiveBackgroundColor,
        ),
        child: item,
      );
    }

    return ValueListenableBuilder(
      valueListenable: statesController,
      builder: (context, states, child) {
        final hovered = states.contains(ShadState.hovered);
        final focused = states.contains(ShadState.focused);
        final enabled = !states.contains(ShadState.disabled);

        return Semantics(
          container: true,
          button: !widget.link,
          link: widget.link,
          focusable: enabled,
          enabled: enabled,
          child: ShadDisabled(
            disabled: !enabled,
            child: ShadFocusable(
              canRequestFocus: enabled,
              descendantsAreFocusable: enabled,
              autofocus: widget.autofocus,
              focusNode: focusNode,
              onKeyEvent: onKeyEvent,
              builder: (context, _, child) => ShadDecorator(
                decoration: effectiveDecoration.copyWith(
                  color: hovered
                      ? effectiveHoverBackgroundColor
                      : effectiveBackgroundColor,
                ),
                focused: focused,
                child: child,
              ),
              child: child,
            ),
          ),
        );
      },
      child: ShadGestureDetector(
        behavior: HitTestBehavior.opaque,
        cursor: widget.cursor ?? itemTheme.cursor ?? SystemMouseCursors.click,
        onHoverChange: (value) {
          statesController.update(ShadState.hovered, value);
          widget.onHoverChange?.call(value);
        },
        onTap: onPressed,
        onTapDown: (_) => statesController.update(ShadState.pressed, true),
        onTapUp: (_) => statesController.update(ShadState.pressed, false),
        onTapCancel: () => statesController.update(ShadState.pressed, false),
        child: item,
      ),
    );
  }

  void onPressed() {
    if (!widget.enabled) return;
    widget.onPressed?.call();
  }

  // Keys that a focused action doesn't handle bubble up to the item: they
  // must neither activate it nor be swallowed, so ancestors still get them.
  KeyEventResult onKeyEvent(FocusNode node, KeyEvent event) {
    if (!node.hasPrimaryFocus) return KeyEventResult.ignored;
    final activators = [
      const SingleActivator(LogicalKeyboardKey.enter),
      if (!widget.link) const SingleActivator(LogicalKeyboardKey.space),
    ];
    final keyboard = HardwareKeyboard.instance;
    if (!activators.any((activator) => activator.accepts(event, keyboard))) {
      return KeyEventResult.ignored;
    }
    onPressed();
    return KeyEventResult.handled;
  }
}

enum _ShadItemSlot { media, content, actions }

/// Lays out the media, the content and the actions of a [ShadItem] like
/// `flex flex-wrap items-center` on the web.
///
/// The items are placed on a line in order, and an item moves to the next
/// line when it doesn't fit. The content counts with its min-content width
/// and then expands to fill its line, so long titles and descriptions wrap
/// before the actions move down. Each item is vertically centered in its
/// line, except the media which sits at the top of its line when
/// [alignMediaToTop] is true.
class _ShadItemRow
    extends SlottedMultiChildRenderObjectWidget<_ShadItemSlot, RenderBox> {
  const _ShadItemRow({
    required this.gap,
    required this.textDirection,
    required this.alignMediaToTop,
    this.media,
    this.content,
    this.actions,
  });

  final double gap;
  final TextDirection textDirection;
  final bool alignMediaToTop;
  final Widget? media;
  final Widget? content;
  final Widget? actions;

  @override
  Iterable<_ShadItemSlot> get slots => _ShadItemSlot.values;

  @override
  Widget? childForSlot(_ShadItemSlot slot) => switch (slot) {
    _ShadItemSlot.media => media,
    _ShadItemSlot.content => content,
    _ShadItemSlot.actions => actions,
  };

  @override
  _RenderShadItemRow createRenderObject(BuildContext context) {
    return _RenderShadItemRow(
      gap: gap,
      textDirection: textDirection,
      alignMediaToTop: alignMediaToTop,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderShadItemRow renderObject,
  ) {
    renderObject
      ..gap = gap
      ..textDirection = textDirection
      ..alignMediaToTop = alignMediaToTop;
  }
}

/// The result of [_RenderShadItemRow._computeLayout]: the size of the row and
/// the constraints and position of each child.
class _ShadItemRowLayout {
  _ShadItemRowLayout(this.size);

  final Size size;
  final constraints = <RenderBox, BoxConstraints>{};
  final offsets = <RenderBox, Offset>{};
}

class _RenderShadItemRow extends RenderBox
    with SlottedContainerRenderObjectMixin<_ShadItemSlot, RenderBox> {
  _RenderShadItemRow({
    required double gap,
    required TextDirection textDirection,
    required bool alignMediaToTop,
  }) : _gap = gap,
       _textDirection = textDirection,
       _alignMediaToTop = alignMediaToTop;

  double get gap => _gap;
  double _gap;
  set gap(double value) {
    if (_gap == value) return;
    _gap = value;
    markNeedsLayout();
  }

  TextDirection get textDirection => _textDirection;
  TextDirection _textDirection;
  set textDirection(TextDirection value) {
    if (_textDirection == value) return;
    _textDirection = value;
    markNeedsLayout();
  }

  bool get alignMediaToTop => _alignMediaToTop;
  bool _alignMediaToTop;
  set alignMediaToTop(bool value) {
    if (_alignMediaToTop == value) return;
    _alignMediaToTop = value;
    markNeedsLayout();
  }

  RenderBox? get _content => childForSlot(_ShadItemSlot.content);

  /// The children in the order they are placed on the lines.
  List<RenderBox> get _items => [
    for (final slot in _ShadItemSlot.values) ?childForSlot(slot),
  ];

  // The min-content width of the content, the widest min-content width of
  // its title, description and child.
  //
  // Widgets without intrinsic dimensions, like a LayoutBuilder, return 0 in
  // release mode but throw in debug mode, and there is no API to ask whether
  // a render object supports them. Each child is measured on its own and a
  // throw counts as 0, so debug lays out like release. In debug mode only,
  // this leaves the framework's intrinsic timeline events unbalanced.
  double _minContentWidth(RenderBox content) {
    var width = 0.0;
    content.visitChildren((child) {
      try {
        width = math.max(
          width,
          (child as RenderBox).getMinIntrinsicWidth(double.infinity),
        );
        // ignore: avoid_catching_errors
      } on FlutterError {
        // Counts as 0, like in release mode.
      }
    });
    return width;
  }

  /// Splits the items, given their widths, into lines of at most [maxWidth].
  List<List<int>> _lines(List<double> widths, double maxWidth) {
    final lines = <List<int>>[];
    var lineWidth = 0.0;
    for (var i = 0; i < widths.length; i++) {
      if (lines.isEmpty || lineWidth + gap + widths[i] > maxWidth) {
        lines.add([i]);
        lineWidth = widths[i];
      } else {
        lines.last.add(i);
        lineWidth += gap + widths[i];
      }
    }
    return lines;
  }

  // The single source of truth for the layout: performLayout lays the
  // children out with it, while the dry layout, the dry baseline and the
  // intrinsic heights only measure them, so they always agree.
  _ShadItemRowLayout _computeLayout(
    BoxConstraints constraints,
    Size Function(RenderBox child, BoxConstraints constraints) sizeOf,
  ) {
    final items = _items;
    final content = _content;
    final maxWidth = constraints.maxWidth;
    final loose = constraints.loosen();

    final sizes = <RenderBox, Size>{};
    final childConstraints = <RenderBox, BoxConstraints>{};
    final widths = <double>[];
    for (final item in items) {
      if (item == content) {
        widths.add(_minContentWidth(item));
      } else {
        childConstraints[item] = loose;
        sizes[item] = sizeOf(item, loose);
        widths.add(sizes[item]!.width);
      }
    }

    final lines = _lines(widths, maxWidth);
    final offsets = <RenderBox, Offset>{};
    var top = 0.0;
    for (final line in lines) {
      final lineItems = [for (final i in line) items[i]];
      if (content != null && lineItems.contains(content)) {
        var width = maxWidth - (line.length - 1) * gap;
        for (final item in lineItems) {
          if (item != content) width -= sizes[item]!.width;
        }
        // Without a bounded width (only when measuring intrinsic sizes) the
        // content takes its natural width.
        final contentConstraints = maxWidth.isFinite
            ? BoxConstraints.tightFor(width: math.max(0, width)).enforce(loose)
            : loose;
        childConstraints[content] = contentConstraints;
        sizes[content] = sizeOf(content, contentConstraints);
      }

      final height = lineItems
          .map((item) => sizes[item]!.height)
          .reduce(math.max);
      var x = 0.0;
      for (final item in lineItems) {
        final size = sizes[item]!;
        final y = alignMediaToTop && item == childForSlot(_ShadItemSlot.media)
            ? 0.0
            : (height - size.height) / 2;
        final dx = textDirection == TextDirection.rtl && maxWidth.isFinite
            ? maxWidth - x - size.width
            : x;
        offsets[item] = Offset(dx, top + y);
        x += size.width + gap;
      }
      top += height + gap;
    }

    final width = maxWidth.isFinite
        ? maxWidth
        : items.fold<double>(0, (width, item) => width + sizes[item]!.width) +
              (items.length - 1) * gap;
    final layout = _ShadItemRowLayout(
      constraints.constrain(Size(width, math.max(0, top - gap))),
    );
    layout.constraints.addAll(childConstraints);
    layout.offsets.addAll(offsets);
    return layout;
  }

  static Size _dryLayout(RenderBox child, BoxConstraints constraints) =>
      child.getDryLayout(constraints);

  @override
  void performLayout() {
    assert(
      constraints.hasBoundedWidth,
      'ShadItem needs a bounded width, wrap it in an Expanded or a SizedBox.',
    );
    final layout = _computeLayout(constraints, (child, constraints) {
      child.layout(constraints, parentUsesSize: true);
      return child.size;
    });
    for (final MapEntry(key: child, value: offset) in layout.offsets.entries) {
      (child.parentData! as BoxParentData).offset = offset;
    }
    size = layout.size;
  }

  @override
  Size computeDryLayout(covariant BoxConstraints constraints) =>
      _computeLayout(constraints, _dryLayout).size;

  @override
  double? computeDryBaseline(
    covariant BoxConstraints constraints,
    TextBaseline baseline,
  ) {
    final layout = _computeLayout(constraints, _dryLayout);
    double? result;
    for (final MapEntry(key: child, value: offset) in layout.offsets.entries) {
      final distance = child.getDryBaseline(
        layout.constraints[child]!,
        baseline,
      );
      if (distance == null) continue;
      result = math.min(result ?? double.infinity, offset.dy + distance);
    }
    return result;
  }

  @override
  double? computeDistanceToActualBaseline(TextBaseline baseline) {
    double? result;
    for (final child in _items) {
      final distance = child.getDistanceToActualBaseline(baseline);
      if (distance == null) continue;
      final offset = (child.parentData! as BoxParentData).offset;
      result = math.min(result ?? double.infinity, offset.dy + distance);
    }
    return result;
  }

  @override
  double computeMinIntrinsicWidth(double height) => _items.fold(
    0,
    (width, child) => math.max(
      width,
      // The content is measured like in layout.
      child == _content
          ? _minContentWidth(child)
          : child.getMinIntrinsicWidth(height),
    ),
  );

  @override
  double computeMaxIntrinsicWidth(double height) {
    final items = _items;
    return items.fold<double>(
          0,
          (width, child) => width + child.getMaxIntrinsicWidth(height),
        ) +
        math.max(0, items.length - 1) * gap;
  }

  // Like RenderWrap, the height depends on how the items wrap, so it is the
  // height of the dry layout for the given width.
  @override
  double computeMinIntrinsicHeight(double width) =>
      getDryLayout(BoxConstraints(maxWidth: width)).height;

  @override
  double computeMaxIntrinsicHeight(double width) =>
      getDryLayout(BoxConstraints(maxWidth: width)).height;

  @override
  void paint(PaintingContext context, Offset offset) {
    for (final child in _items) {
      context.paintChild(
        child,
        offset + (child.parentData! as BoxParentData).offset,
      );
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    for (final child in _items.reversed) {
      final childOffset = (child.parentData! as BoxParentData).offset;
      final isHit = result.addWithPaintOffset(
        offset: childOffset,
        position: position,
        hitTest: (result, transformed) =>
            child.hitTest(result, position: transformed),
      );
      if (isHit) return true;
    }
    return false;
  }
}

/// {@template ShadItemMedia}
/// The media of a [ShadItem], like an icon, an avatar or an image.
/// {@endtemplate}
class ShadItemMedia extends StatelessWidget {
  /// {@macro ShadItemMedia}
  const ShadItemMedia({
    super.key,
    required Widget this.child,
  }) : variant = ShadItemMediaVariant.primary,
       src = null,
       fit = null,
       placeholder = null,
       size = null,
       iconSize = null,
       radius = null,
       backgroundColor = null,
       borderColor = null;

  /// Displays the [child] icon inside a bordered, muted square.
  const ShadItemMedia.icon({
    super.key,
    required Widget this.child,
    this.size,
    this.iconSize,
    this.radius,
    this.backgroundColor,
    this.borderColor,
  }) : variant = ShadItemMediaVariant.icon,
       src = null,
       fit = null,
       placeholder = null;

  /// Displays the [src] image clipped inside a square, covering it by
  /// default.
  const ShadItemMedia.image({
    super.key,
    required this.src,
    this.fit,
    this.placeholder,
    this.size,
    this.radius,
  }) : variant = ShadItemMediaVariant.image,
       child = null,
       iconSize = null,
       backgroundColor = null,
       borderColor = null;

  /// {@macro ShadItemMedia}
  const ShadItemMedia.raw({
    super.key,
    required this.variant,
    this.child,
    this.src,
    this.fit,
    this.placeholder,
    this.size,
    this.iconSize,
    this.radius,
    this.backgroundColor,
    this.borderColor,
  }) : assert(
         variant == ShadItemMediaVariant.image ? src != null : child != null,
         'An image media needs a src, the other variants need a child',
       );

  /// {@template ShadItemMedia.variant}
  /// The variant of the media, defaults to [ShadItemMediaVariant.primary].
  /// {@endtemplate}
  final ShadItemMediaVariant variant;

  /// {@template ShadItemMedia.child}
  /// The content of the media, not used by [ShadItemMediaVariant.image].
  /// {@endtemplate}
  final Widget? child;

  /// {@template ShadItemMedia.src}
  /// The source of a [ShadItemMediaVariant.image] media, like a network url,
  /// an asset path or a file.
  ///
  /// Handled by [UniversalImage] for rendering.
  /// {@endtemplate}
  final dynamic src;

  /// {@template ShadItemMedia.fit}
  /// How the image of a [ShadItemMediaVariant.image] media fits the square,
  /// defaults to [BoxFit.cover].
  /// {@endtemplate}
  final BoxFit? fit;

  /// {@template ShadItemMedia.placeholder}
  /// The widget displayed while the image of a [ShadItemMediaVariant.image]
  /// media is loading or when it fails to load.
  /// {@endtemplate}
  final Widget? placeholder;

  /// {@template ShadItemMedia.size}
  /// The size of the media square, defaults to 32 for
  /// [ShadItemMediaVariant.icon] and 40 for [ShadItemMediaVariant.image].
  /// {@endtemplate}
  final double? size;

  /// {@template ShadItemMedia.iconSize}
  /// The size of the icon of a [ShadItemMediaVariant.icon] media, defaults
  /// to 16.
  /// {@endtemplate}
  final double? iconSize;

  /// {@template ShadItemMedia.radius}
  /// The border radius of the media square, defaults to 4.
  /// {@endtemplate}
  final BorderRadius? radius;

  /// {@template ShadItemMedia.backgroundColor}
  /// The background color of a [ShadItemMediaVariant.icon] media.
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template ShadItemMedia.borderColor}
  /// The border color of a [ShadItemMediaVariant.icon] media.
  /// {@endtemplate}
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    final theme = ShadTheme.of(context);
    final itemTheme = _itemTheme(context);

    final effectiveRadius =
        radius ??
        itemTheme.mediaRadius ??
        const BorderRadius.all(Radius.circular(4));

    switch (variant) {
      case ShadItemMediaVariant.primary:
        return child!;
      case ShadItemMediaVariant.icon:
        final effectiveSize = size ?? itemTheme.mediaIconContainerSize ?? 32;
        return SizedBox.square(
          dimension: effectiveSize,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color:
                  backgroundColor ??
                  itemTheme.mediaBackgroundColor ??
                  theme.colorScheme.muted,
              border: Border.all(
                color:
                    borderColor ??
                    itemTheme.mediaBorderColor ??
                    theme.colorScheme.border,
              ),
              borderRadius: effectiveRadius,
            ),
            child: Center(
              child: IconTheme.merge(
                data: IconThemeData(
                  size: iconSize ?? itemTheme.mediaIconSize ?? 16,
                ),
                child: child!,
              ),
            ),
          ),
        );
      case ShadItemMediaVariant.image:
        final effectiveSize = size ?? itemTheme.mediaImageSize ?? 40;
        return SizedBox.square(
          dimension: effectiveSize,
          child: ClipRRect(
            borderRadius: effectiveRadius,
            child: UniversalImage(
              src,
              width: effectiveSize,
              height: effectiveSize,
              fit: fit ?? itemTheme.mediaImageFit ?? BoxFit.cover,
              placeholder: placeholder,
            ),
          ),
        );
    }
  }
}

/// {@template ShadItemContent}
/// Stacks the title, the description and any other content of a
/// [ShadItem] vertically.
/// {@endtemplate}
class ShadItemContent extends StatelessWidget {
  /// {@macro ShadItemContent}
  const ShadItemContent({
    super.key,
    required this.children,
    this.spacing,
  });

  /// {@template ShadItemContent.children}
  /// The widgets to stack vertically.
  /// {@endtemplate}
  final List<Widget> children;

  /// {@template ShadItemContent.spacing}
  /// The vertical spacing between the title, the description and the rest of
  /// the content, defaults to 4.
  /// {@endtemplate}
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: spacing ?? _itemTheme(context).contentSpacing ?? 4,
      children: children,
    );
  }
}

/// {@template ShadItemTitle}
/// The title of a [ShadItem].
/// {@endtemplate}
class ShadItemTitle extends StatelessWidget {
  /// {@macro ShadItemTitle}
  const ShadItemTitle({
    super.key,
    required this.child,
    this.style,
  });

  /// {@template ShadItemTitle.child}
  /// The title widget, usually a [Text].
  /// {@endtemplate}
  final Widget child;

  /// {@template ShadItemTitle.style}
  /// The text style of the title, defaults to `ShadTextTheme.small`.
  /// {@endtemplate}
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    final theme = ShadTheme.of(context);

    return DefaultTextStyle.merge(
      style: style ?? _itemTheme(context).titleStyle ?? theme.textTheme.small,
      child: child,
    );
  }
}

/// {@template ShadItemDescription}
/// The description of a [ShadItem].
/// {@endtemplate}
class ShadItemDescription extends StatelessWidget {
  /// {@macro ShadItemDescription}
  const ShadItemDescription({
    super.key,
    required this.child,
    this.style,
    this.maxLines,
  });

  /// {@template ShadItemDescription.child}
  /// The description widget, usually a [Text].
  /// {@endtemplate}
  final Widget child;

  /// {@template ShadItemDescription.style}
  /// The text style of the description, defaults to `ShadTextTheme.muted`.
  /// {@endtemplate}
  final TextStyle? style;

  /// {@template ShadItemDescription.maxLines}
  /// The maximum number of lines of the description, defaults to 2.
  /// {@endtemplate}
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    final theme = ShadTheme.of(context);
    final itemTheme = _itemTheme(context);

    return DefaultTextStyle.merge(
      style: style ?? itemTheme.descriptionStyle ?? theme.textTheme.muted,
      maxLines: maxLines ?? itemTheme.descriptionMaxLines ?? 2,
      overflow: TextOverflow.ellipsis,
      child: child,
    );
  }
}

/// {@template ShadItemActions}
/// The actions of a [ShadItem], like buttons, displayed in a row.
/// {@endtemplate}
class ShadItemActions extends StatelessWidget {
  /// {@macro ShadItemActions}
  const ShadItemActions({
    super.key,
    required this.children,
    this.spacing,
  });

  /// {@template ShadItemActions.children}
  /// The actions to display.
  /// {@endtemplate}
  final List<Widget> children;

  /// {@template ShadItemActions.spacing}
  /// The spacing between the actions, defaults to 8.
  /// {@endtemplate}
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: spacing ?? _itemTheme(context).actionsSpacing ?? 8,
      children: children,
    );
  }
}

/// {@template ShadItemHeader}
/// The header of a [ShadItem], displayed above the item content.
///
/// The children are spread across the full width of the item.
/// {@endtemplate}
class ShadItemHeader extends StatelessWidget {
  /// {@macro ShadItemHeader}
  const ShadItemHeader({
    super.key,
    required this.children,
    this.spacing,
  });

  /// {@template ShadItemHeader.children}
  /// The widgets to display in the header.
  /// {@endtemplate}
  final List<Widget> children;

  /// {@template ShadItemHeader.spacing}
  /// The spacing between the children, defaults to 8.
  /// {@endtemplate}
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: spacing ?? _itemTheme(context).headerSpacing ?? 8,
      children: children,
    );
  }
}

/// {@template ShadItemFooter}
/// The footer of a [ShadItem], displayed below the item content.
///
/// The children are spread across the full width of the item.
/// {@endtemplate}
class ShadItemFooter extends StatelessWidget {
  /// {@macro ShadItemFooter}
  const ShadItemFooter({
    super.key,
    required this.children,
    this.spacing,
  });

  /// {@template ShadItemFooter.children}
  /// The widgets to display in the footer.
  /// {@endtemplate}
  final List<Widget> children;

  /// {@template ShadItemFooter.spacing}
  /// The spacing between the children, defaults to 8.
  /// {@endtemplate}
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: spacing ?? _itemTheme(context).footerSpacing ?? 8,
      children: children,
    );
  }
}

/// {@template ShadItemGroup}
/// Groups multiple [ShadItem]s in a vertical list, optionally separated by
/// [ShadItemSeparator]s.
/// {@endtemplate}
class ShadItemGroup extends StatelessWidget {
  /// {@macro ShadItemGroup}
  const ShadItemGroup({
    super.key,
    required this.children,
    this.spacing,
  });

  /// {@template ShadItemGroup.children}
  /// The items of the group.
  /// {@endtemplate}
  final List<Widget> children;

  /// {@template ShadItemGroup.spacing}
  /// The spacing between the items, defaults to 0.
  /// {@endtemplate}
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: spacing ?? _itemTheme(context).groupSpacing ?? 0,
      children: children,
    );
  }
}

/// {@template ShadItemSeparator}
/// A horizontal separator between the items of a [ShadItemGroup].
/// {@endtemplate}
class ShadItemSeparator extends StatelessWidget {
  /// {@macro ShadItemSeparator}
  const ShadItemSeparator({
    super.key,
    this.margin,
    this.thickness,
    this.color,
  });

  /// {@template ShadItemSeparator.margin}
  /// The margin of the separator, defaults to [EdgeInsets.zero].
  /// {@endtemplate}
  final EdgeInsetsGeometry? margin;

  /// {@macro ShadSeparator.thickness}
  final double? thickness;

  /// {@macro ShadSeparator.color}
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ShadSeparator.horizontal(
      margin: margin ?? EdgeInsets.zero,
      thickness: thickness,
      color: color,
    );
  }
}
