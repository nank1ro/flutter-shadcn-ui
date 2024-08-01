// ignore_for_file: cascade_invocations

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/components/dialog.dart';
import 'package:shadcn_ui/src/components/image.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/position.dart';

Future<T?> showShadSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  ShadSheetSide? side,
  Color? backgroundColor,
  String barrierLabel = '',
  ShapeBorder? shape,
  Color barrierColor = const Color(0xcc000000),
  bool useRootNavigator = false,
  bool isDismissible = true,
  RouteSettings? routeSettings,
  Offset? anchorPoint,
  List<Effect<dynamic>>? animateIn,
  List<Effect<dynamic>>? animateOut,
}) {
  final theme = ShadTheme.of(context);
  final effectiveSide = side ?? ShadSheetSide.bottom;
  final defaultAnimateIn = switch (effectiveSide) {
    ShadSheetSide.top => const SlideEffect(
        begin: Offset(0, -1),
        end: Offset.zero,
      ),
    ShadSheetSide.bottom => const SlideEffect(
        begin: Offset(0, 1),
        end: Offset.zero,
      ),
    ShadSheetSide.left => const SlideEffect(
        begin: Offset(-1, 0),
        end: Offset.zero,
      ),
    ShadSheetSide.right => const SlideEffect(
        begin: Offset(1, 0),
        end: Offset.zero,
      ),
  };

  final effectiveAnimateIn =
      animateIn ?? theme.sheetTheme.animateIn ?? [defaultAnimateIn];

  final defaultAnimateOut = switch (effectiveSide) {
    ShadSheetSide.top => const SlideEffect(
        begin: Offset.zero,
        end: Offset(0, -1),
      ),
    ShadSheetSide.bottom => const SlideEffect(
        begin: Offset.zero,
        end: Offset(0, 1),
      ),
    ShadSheetSide.left => const SlideEffect(
        begin: Offset.zero,
        end: Offset(-1, 0),
      ),
    ShadSheetSide.right => const SlideEffect(
        begin: Offset.zero,
        end: Offset(1, 0),
      ),
  };

  final effectiveAnimateOut =
      animateOut ?? theme.sheetTheme.animateOut ?? [defaultAnimateOut];

  return showShadDialog(
    context: context,
    builder: (context) {
      return ShadSheetInheritedWidget(
        side: effectiveSide,
        child: builder(context),
      );
    },
    barrierColor: barrierColor,
    barrierLabel: barrierLabel,
    barrierDismissible: isDismissible,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    anchorPoint: anchorPoint,
    animateIn: effectiveAnimateIn,
    animateOut: effectiveAnimateOut,
  );
}

class ShadSheetInheritedWidget extends InheritedWidget {
  const ShadSheetInheritedWidget({
    super.key,
    required super.child,
    required this.side,
  });

  final ShadSheetSide side;

  static ShadSheetSide of(BuildContext context) {
    final inherited = context
        .getElementForInheritedWidgetOfExactType<ShadSheetInheritedWidget>()!
        .widget as ShadSheetInheritedWidget;
    return inherited.side;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

enum ShadSheetSide {
  top,
  right,
  bottom,
  left;

  Alignment toAlignment() {
    return switch (this) {
      ShadSheetSide.top => Alignment.topCenter,
      ShadSheetSide.bottom => Alignment.bottomCenter,
      ShadSheetSide.left => Alignment.topLeft,
      ShadSheetSide.right => Alignment.topRight,
    };
  }
}

/// A callback for when the user begins dragging the sheet.
///
/// Used by [ShadSheet.onDragStart].
typedef SheetDragStartHandler = void Function(DragStartDetails details);

/// A callback for when the user stops dragging the sheet.
///
/// Used by [ShadSheet.onDragEnd].
typedef SheetDragEndHandler = void Function(
  DragEndDetails details, {
  required bool isClosing,
});

class ShadSheet extends StatefulWidget {
  const ShadSheet({
    super.key,
    this.title,
    this.description,
    this.child,
    this.actions = const [],
    this.constraints,
    this.expandCrossSide,
    this.closeIcon,
    this.closeIconSrc,
    this.closeIconPosition,
    this.radius,
    this.backgroundColor,
    this.expandActionsWhenTiny,
    this.padding,
    this.gap,
    this.actionsAxis,
    this.actionsMainAxisSize,
    this.actionsMainAxisAlignment,
    this.actionsVerticalDirection,
    this.border,
    this.shadows,
    this.removeBorderRadiusWhenTiny,
    this.titleStyle,
    this.descriptionStyle,
    this.titleTextAlign,
    this.descriptionTextAlign,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.scrollable,
    this.scrollPadding,
    this.draggable,
    this.onClosing,
    this.onDragStart,
    this.onDragEnd,
    this.animationController,
    this.isScrollControlled = false,
    this.minFlingVelocity,
    this.closeProgressThreshold,
    this.enterDuration = const Duration(milliseconds: 250),
    this.exitDuration = const Duration(milliseconds: 200),
    this.disabledScrollControlMaxRatio,
  });

  final Widget? title;
  final Widget? description;
  final Widget? child;
  final List<Widget> actions;
  final BoxConstraints? constraints;
  final bool? expandCrossSide;
  final Widget? closeIcon;
  final ShadImageSrc? closeIconSrc;
  final ShadPosition? closeIconPosition;
  final BorderRadius? radius;
  final Color? backgroundColor;
  final bool? expandActionsWhenTiny;
  final EdgeInsets? padding;
  final double? gap;
  final Axis? actionsAxis;
  final MainAxisSize? actionsMainAxisSize;
  final MainAxisAlignment? actionsMainAxisAlignment;
  final VerticalDirection? actionsVerticalDirection;
  final BoxBorder? border;
  final List<BoxShadow>? shadows;
  final bool? removeBorderRadiusWhenTiny;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final TextAlign? titleTextAlign;
  final TextAlign? descriptionTextAlign;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final bool? scrollable;
  final EdgeInsets? scrollPadding;

  /// Whether the sheet is draggable, defaults to false.
  final bool? draggable;

  /// Whether the sheet is scroll controlled, defaults to false.
  final bool isScrollControlled;

  /// Called when the sheet begins to close.
  ///
  /// A sheet might be prevented from closing (e.g., by user
  /// interaction) even after this callback is called. For this reason, this
  /// callback might be call multiple times for a given sheet.
  final VoidCallback? onClosing;

  /// Called when the user begins dragging the sheet vertically, if
  /// [draggable] is true.
  ///
  /// Would typically be used to change the sheet animation curve so
  /// that it tracks the user's finger accurately.
  final SheetDragStartHandler? onDragStart;

  /// Called when the user stops dragging the sheet, if [draggable]
  /// is true.
  ///
  /// Would typically be used to reset the sheet animation curve, so
  /// that it animates non-linearly. Called before [onClosing] if the
  /// sheet is closing.
  final SheetDragEndHandler? onDragEnd;

  /// The animation controller that controls the sheet's entrance and
  /// exit animations.
  ///
  /// The Sheet widget will manipulate the position of this animation, it
  /// is not just a passive observer.
  final AnimationController? animationController;

  /// {@template ShadSheet.minFlingVelocity}
  /// The minimum velocity to initiate a fling.
  ///
  /// Defaults to 700.
  /// {@endtemplate}
  final double? minFlingVelocity;

  /// {@template ShadSheet.closeProgressThreshold}
  /// The threshold for determining whether the sheet is closing.
  ///
  /// Defaults to 0.5.
  /// {@endtemplate}
  final double? closeProgressThreshold;

  /// {@template ShadSheet.enterDuration}
  /// The duration of the sheet's entrance animation.
  ///
  /// Defaults to 250ms.
  /// {@endtemplate}
  final Duration enterDuration;

  /// {@template ShadSheet.exitDuration}
  /// The duration of the sheet's exit animation.
  ///
  /// Defaults to 200ms.
  /// {@endtemplate}
  final Duration exitDuration;

  /// {@template ShadSheet.disabledScrollControlMaxRatio}
  /// The maximum ratio of the sheet's height when is not scroll controlled.
  /// Defaults to 9/16. Has no effect when [draggable] is false.
  /// {@endtemplate}
  final double? disabledScrollControlMaxRatio;

  @override
  State<ShadSheet> createState() => _ShadSheetState();
}

class _ShadSheetState extends State<ShadSheet>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  final dragHandleMaterialState = <WidgetState>{};
  final GlobalKey childKey = GlobalKey(debugLabel: 'ShadSheet child');

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  AnimationController get animationController =>
      widget.animationController ??
      (_animationController ??= AnimationController(
        duration: widget.enterDuration,
        reverseDuration: widget.exitDuration,
        debugLabel: 'ShadSheet',
        vsync: this,
        value: 1,
      ));

  double get childHeight {
    final renderBox = childKey.currentContext!.findRenderObject()! as RenderBox;
    return renderBox.size.height;
  }

  void _handleDragStart(DragStartDetails details) {
    setState(() {
      dragHandleMaterialState.add(WidgetState.dragged);
    });
    widget.onDragStart?.call(details);
  }

  bool get effectiveDraggable => widget.draggable ?? false;

  bool get _dismissUnderway =>
      animationController.status == AnimationStatus.reverse;

  void _handleDragUpdate(DragUpdateDetails details, ShadSheetSide side) {
    if (_dismissUnderway) {
      return;
    }

    switch (side) {
      case ShadSheetSide.bottom:
        animationController.value -= details.primaryDelta! / childHeight;
      case ShadSheetSide.top:
        animationController.value += details.primaryDelta! / childHeight;
      case ShadSheetSide.left:
        animationController.value += details.primaryDelta! / childHeight;
      case ShadSheetSide.right:
        animationController.value -= details.primaryDelta! / childHeight;
    }
  }

  void _handleDragEnd(
    DragEndDetails details, {
    required ShadSheetSide side,
    required double minFlingVelocity,
    required double closeProgressThreshold,
  }) {
    if (_dismissUnderway) {
      return;
    }
    setState(() {
      dragHandleMaterialState.remove(WidgetState.dragged);
    });
    var isClosing = false;
    final velocity = side == ShadSheetSide.top
        ? details.velocity.pixelsPerSecond.dy
        : -details.velocity.pixelsPerSecond.dy;

    if (velocity.abs() > minFlingVelocity) {
      final flingVelocity = velocity / childHeight;
      if (animationController.value > 0.0) {
        animationController.fling(velocity: flingVelocity);
      }
      if (flingVelocity < 0.0) {
        isClosing = true;
      }
    } else if (animationController.value < closeProgressThreshold) {
      if (animationController.value > 0.0) {
        animationController.fling(velocity: -1);
      }
      isClosing = true;
    } else {
      animationController.forward();
    }

    widget.onDragEnd?.call(
      details,
      isClosing: isClosing,
    );

    if (isClosing) {
      if (widget.onClosing != null) {
        widget.onClosing!();
      } else {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final side = ShadSheetInheritedWidget.of(context);
    final mSize = MediaQuery.sizeOf(context);

    final effectiveExpandCrossSide =
        widget.expandCrossSide ?? theme.sheetTheme.expandCrossSide ?? true;

    final effectiveRadius =
        widget.radius ?? theme.sheetTheme.radius ?? BorderRadius.zero;

    final effectiveBackgroundColor = widget.backgroundColor ??
        theme.sheetTheme.backgroundColor ??
        theme.colorScheme.background;

    final effectiveExpandActionsWhenTiny = widget.expandActionsWhenTiny ??
        theme.sheetTheme.expandActionsWhenTiny ??
        true;

    final defaultConstraints = switch (side) {
      ShadSheetSide.top ||
      ShadSheetSide.bottom =>
        BoxConstraints(minWidth: mSize.width),
      ShadSheetSide.left ||
      ShadSheetSide.right =>
        BoxConstraints(minHeight: mSize.height)
    };

    final defaultCrossAxisAlignment = switch (side) {
      ShadSheetSide.top || ShadSheetSide.bottom => CrossAxisAlignment.stretch,
      ShadSheetSide.left || ShadSheetSide.right => CrossAxisAlignment.start,
    };

    final defaultMainAxisAlignment = switch (side) {
      ShadSheetSide.top || ShadSheetSide.bottom => MainAxisAlignment.start,
      ShadSheetSide.left || ShadSheetSide.right => MainAxisAlignment.end,
    };

    final effectiveMainAxisAlignment = widget.mainAxisAlignment ??
        theme.sheetTheme.mainAxisAlignment ??
        defaultMainAxisAlignment;

    final effectiveCrossAxisAlignment = widget.crossAxisAlignment ??
        theme.sheetTheme.crossAxisAlignment ??
        defaultCrossAxisAlignment;

    var effectiveConstraints = widget.constraints ??
        theme.sheetTheme.constraints ??
        (effectiveExpandCrossSide ? defaultConstraints : null);

    if (effectiveExpandCrossSide) {
      effectiveConstraints = effectiveConstraints?.enforce(defaultConstraints);
    }

    final effectiveBorder = widget.border ??
        theme.sheetTheme.border ??
        Border.all(color: theme.colorScheme.border);

    final effectiveShadows = widget.shadows ?? theme.sheetTheme.shadows;

    final effectiveRemoveBorderRadiusWhenTiny =
        widget.removeBorderRadiusWhenTiny ??
            theme.sheetTheme.removeBorderRadiusWhenTiny;
    final effectivePadding = widget.padding ?? theme.sheetTheme.padding;

    final effectiveGap = widget.gap ?? theme.sheetTheme.gap;

    final effectiveTitleStyle =
        widget.titleStyle ?? theme.sheetTheme.titleStyle;

    final effectiveDescriptionStyle =
        widget.descriptionStyle ?? theme.sheetTheme.descriptionStyle;

    final effectiveCloseIconSrc =
        widget.closeIconSrc ?? theme.sheetTheme.closeIconSrc;

    final effectiveCloseIconPosition =
        widget.closeIconPosition ?? theme.sheetTheme.closeIconPosition;

    final effectiveActionsAxis =
        widget.actionsAxis ?? theme.sheetTheme.actionsAxis;

    final effectiveActionsMainAxisSize =
        widget.actionsMainAxisSize ?? theme.sheetTheme.actionsMainAxisSize;

    final effectiveActionsMainAxisAlignment = widget.actionsMainAxisAlignment ??
        theme.sheetTheme.actionsMainAxisAlignment;

    final effectiveActionsVerticalDirection = widget.actionsVerticalDirection ??
        theme.sheetTheme.actionsVerticalDirection;

    final effectiveTitleTextAlign =
        widget.titleTextAlign ?? theme.sheetTheme.titleTextAlign;

    final effectiveDescriptionTextAlign =
        widget.descriptionTextAlign ?? theme.sheetTheme.descriptionTextAlign;

    final effectiveScrollable =
        widget.scrollable ?? theme.sheetTheme.scrollable ?? true;

    final effectiveScrollPadding = widget.scrollPadding ??
        theme.sheetTheme.scrollPadding ??
        MediaQuery.viewInsetsOf(context);

    Widget child = ShadDialog(
      key: childKey,
      title: widget.title,
      description: widget.description,
      alignment: side.toAlignment(),
      constraints: effectiveConstraints,
      actions: widget.actions,
      radius: effectiveRadius,
      closeIcon: widget.closeIcon,
      closeIconSrc: effectiveCloseIconSrc,
      closeIconPosition: effectiveCloseIconPosition,
      backgroundColor: effectiveBackgroundColor,
      expandActionsWhenTiny: effectiveExpandActionsWhenTiny,
      padding: effectivePadding,
      gap: effectiveGap,
      actionsAxis: effectiveActionsAxis,
      actionsMainAxisSize: effectiveActionsMainAxisSize,
      actionsMainAxisAlignment: effectiveActionsMainAxisAlignment,
      actionsVerticalDirection: effectiveActionsVerticalDirection,
      border: effectiveBorder,
      shadows: effectiveShadows,
      removeBorderRadiusWhenTiny: effectiveRemoveBorderRadiusWhenTiny,
      titleStyle: effectiveTitleStyle,
      descriptionStyle: effectiveDescriptionStyle,
      titleTextAlign: effectiveTitleTextAlign,
      descriptionTextAlign: effectiveDescriptionTextAlign,
      crossAxisAlignment: effectiveCrossAxisAlignment,
      mainAxisAlignment: effectiveMainAxisAlignment,
      scrollable: effectiveScrollable,
      scrollPadding: effectiveScrollPadding,
      child: widget.child,
    );

    if (effectiveDraggable) {
      final effectiveDisabledScrollControlMaxRatio =
          widget.disabledScrollControlMaxRatio ??
              theme.sheetTheme.disabledScrollControlMaxRatio ??
              9 / 16;

      final effectiveMinFlingVelocity =
          widget.minFlingVelocity ?? theme.sheetTheme.minFlingVelocity ?? 700;

      final effectiveCloseProgressThreshold = widget.closeProgressThreshold ??
          theme.sheetTheme.closeProgressThreshold ??
          0.5;

      child = ShadSheetGestureDetector(
        onDragStart: _handleDragStart,
        onDragUpdate: (details) => _handleDragUpdate(details, side),
        onDragEnd: (details) => _handleDragEnd(
          details,
          side: side,
          minFlingVelocity: effectiveMinFlingVelocity,
          closeProgressThreshold: effectiveCloseProgressThreshold,
        ),
        side: side,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            final animationValue = Easing.legacyDecelerate.transform(
              animationController.view.value,
            );
            return ShadSheetLayoutWithSizeListener(
              animationValue: animationValue,
              onChildSizeChanged: (_) {},
              scrollControlDisabledMaxRatio:
                  effectiveDisabledScrollControlMaxRatio,
              isScrollControlled: widget.isScrollControlled,
              side: side,
              child: child,
            );
          },
          child: child,
        ),
      );
    }

    return child;
  }
}

class ShadSheetGestureDetector extends StatelessWidget {
  const ShadSheetGestureDetector({
    super.key,
    required this.child,
    required this.onDragStart,
    required this.onDragUpdate,
    required this.onDragEnd,
    required this.side,
  });

  final Widget child;
  final GestureDragStartCallback onDragStart;
  final GestureDragUpdateCallback onDragUpdate;
  final GestureDragEndCallback onDragEnd;
  final ShadSheetSide side;

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      excludeFromSemantics: true,
      gestures: <Type, GestureRecognizerFactory<GestureRecognizer>>{
        if (side == ShadSheetSide.bottom || side == ShadSheetSide.top)
          VerticalDragGestureRecognizer: GestureRecognizerFactoryWithHandlers<
              VerticalDragGestureRecognizer>(
            () => VerticalDragGestureRecognizer(debugOwner: this),
            (VerticalDragGestureRecognizer instance) {
              instance
                ..onStart = onDragStart
                ..onUpdate = onDragUpdate
                ..onEnd = onDragEnd
                ..onlyAcceptDragOnThreshold = true;
            },
          ),
        if (side == ShadSheetSide.left || side == ShadSheetSide.right)
          HorizontalDragGestureRecognizer: GestureRecognizerFactoryWithHandlers<
              HorizontalDragGestureRecognizer>(
            () => HorizontalDragGestureRecognizer(debugOwner: this),
            (HorizontalDragGestureRecognizer instance) {
              instance
                ..onStart = onDragStart
                ..onUpdate = onDragUpdate
                ..onEnd = onDragEnd
                ..onlyAcceptDragOnThreshold = true;
            },
          ),
      },
      child: child,
    );
  }
}

typedef SizeChangeCallback<Size> = void Function(Size size);

class ShadSheetLayoutWithSizeListener extends SingleChildRenderObjectWidget {
  const ShadSheetLayoutWithSizeListener({
    super.key,
    required this.onChildSizeChanged,
    required this.animationValue,
    required this.isScrollControlled,
    required this.scrollControlDisabledMaxRatio,
    required this.side,
    super.child,
  });

  final SizeChangeCallback<Size> onChildSizeChanged;
  final double animationValue;
  final bool isScrollControlled;
  final double scrollControlDisabledMaxRatio;
  final ShadSheetSide side;

  @override
  RenderSheetLayoutWithSizeListener createRenderObject(
    BuildContext context,
  ) {
    return RenderSheetLayoutWithSizeListener(
      onChildSizeChanged: onChildSizeChanged,
      animationValue: animationValue,
      isScrollControlled: isScrollControlled,
      scrollControlDisabledMaxRatio: scrollControlDisabledMaxRatio,
      side: side,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderSheetLayoutWithSizeListener renderObject,
  ) {
    renderObject.onChildSizeChanged = onChildSizeChanged;
    renderObject.animationValue = animationValue;
    renderObject.isScrollControlled = isScrollControlled;
    renderObject.scrollControlDisabledMaxRatio = scrollControlDisabledMaxRatio;
  }
}

class RenderSheetLayoutWithSizeListener extends RenderShiftedBox {
  RenderSheetLayoutWithSizeListener({
    RenderBox? child,
    required this.side,
    required SizeChangeCallback<Size> onChildSizeChanged,
    required double animationValue,
    required bool isScrollControlled,
    required double scrollControlDisabledMaxRatio,
  })  : _onChildSizeChanged = onChildSizeChanged,
        _animationValue = animationValue,
        _isScrollControlled = isScrollControlled,
        _scrollControlDisabledMaxRatio = scrollControlDisabledMaxRatio,
        super(child);

  final ShadSheetSide side;

  Size _lastSize = Size.zero;

  SizeChangeCallback<Size> get onChildSizeChanged => _onChildSizeChanged;
  SizeChangeCallback<Size> _onChildSizeChanged;
  set onChildSizeChanged(SizeChangeCallback<Size> newCallback) {
    if (_onChildSizeChanged == newCallback) {
      return;
    }

    _onChildSizeChanged = newCallback;
    markNeedsLayout();
  }

  double get animationValue => _animationValue;
  double _animationValue;
  set animationValue(double newValue) {
    if (_animationValue == newValue) {
      return;
    }

    _animationValue = newValue;
    markNeedsLayout();
  }

  bool get isScrollControlled => _isScrollControlled;
  bool _isScrollControlled;
  set isScrollControlled(bool newValue) {
    if (_isScrollControlled == newValue) {
      return;
    }

    _isScrollControlled = newValue;
    markNeedsLayout();
  }

  double get scrollControlDisabledMaxRatio => _scrollControlDisabledMaxRatio;
  double _scrollControlDisabledMaxRatio;
  set scrollControlDisabledMaxRatio(double newValue) {
    if (_scrollControlDisabledMaxRatio == newValue) {
      return;
    }

    _scrollControlDisabledMaxRatio = newValue;
    markNeedsLayout();
  }

  Size _getSize(BoxConstraints constraints) {
    return constraints.constrain(constraints.biggest);
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    final width = _getSize(BoxConstraints.tightForFinite(height: height)).width;
    if (width.isFinite) {
      return width;
    }
    return 0;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    final width = _getSize(BoxConstraints.tightForFinite(height: height)).width;
    if (width.isFinite) {
      return width;
    }
    return 0;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    final height = _getSize(BoxConstraints.tightForFinite(width: width)).height;
    if (height.isFinite) {
      return height;
    }
    return 0;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    final height = _getSize(BoxConstraints.tightForFinite(width: width)).height;
    if (height.isFinite) {
      return height;
    }
    return 0;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return _getSize(constraints);
  }

  BoxConstraints _getConstraintsForChild(BoxConstraints constraints) {
    return switch (side) {
      ShadSheetSide.top || ShadSheetSide.bottom => BoxConstraints(
          minWidth: constraints.maxWidth,
          maxWidth: constraints.maxWidth,
          maxHeight: isScrollControlled
              ? constraints.maxHeight
              : constraints.maxHeight * scrollControlDisabledMaxRatio,
        ),
      ShadSheetSide.left || ShadSheetSide.right => BoxConstraints(
          minHeight: constraints.maxHeight,
          maxHeight: constraints.maxHeight,
          maxWidth: isScrollControlled
              ? constraints.maxWidth
              : constraints.maxWidth * scrollControlDisabledMaxRatio,
        ),
    };
  }

  Offset _getPositionForChild(Size size, Size childSize) {
    return switch (side) {
      ShadSheetSide.bottom =>
        Offset(0, size.height - childSize.height * animationValue),
      ShadSheetSide.top => Offset(0, childSize.height * (animationValue - 1)),
      ShadSheetSide.left => Offset(childSize.width * (animationValue - 1), 0),
      ShadSheetSide.right =>
        Offset(size.width - childSize.width * animationValue, 0),
    };
  }

  @override
  void performLayout() {
    size = _getSize(constraints);
    if (child != null) {
      final childConstraints = _getConstraintsForChild(constraints);
      assert(childConstraints.debugAssertIsValid(isAppliedConstraint: true));
      child!
          .layout(childConstraints, parentUsesSize: !childConstraints.isTight);
      final childParentData = child!.parentData! as BoxParentData;
      childParentData.offset = _getPositionForChild(
        size,
        childConstraints.isTight ? childConstraints.smallest : child!.size,
      );
      final childSize =
          childConstraints.isTight ? childConstraints.smallest : child!.size;

      if (_lastSize != childSize) {
        _lastSize = childSize;
        _onChildSizeChanged.call(_lastSize);
      }
    }
  }
}
