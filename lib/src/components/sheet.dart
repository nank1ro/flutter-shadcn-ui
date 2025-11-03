// ignore_for_file: cascade_invocations

import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/components/dialog.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/position.dart';

/// Shows a [ShadSheet], which is a modal bottom sheet implementation.
///
/// Returns a [Future] that resolves to the value (if any) that the sheet is
/// closed with.
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
  final effectiveSide = side ?? theme.sheetTheme.side ?? ShadSheetSide.bottom;
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

/// Inherited widget to provide [ShadSheetSide] down the widget tree.
class ShadSheetInheritedWidget extends InheritedWidget {
  const ShadSheetInheritedWidget({
    super.key,
    required super.child,
    required this.side,
  });

  /// {@template ShadSheet.side}
  /// The side from which the sheet slides in.
  /// {@endtemplate}
  final ShadSheetSide side;

  /// Retrieves the [ShadSheetSide] from the nearest [ShadSheetInheritedWidget]
  /// ancestor.
  static ShadSheetSide of(BuildContext context) {
    final inherited =
        context
                .getElementForInheritedWidgetOfExactType<
                  ShadSheetInheritedWidget
                >()!
                .widget
            as ShadSheetInheritedWidget;
    return inherited.side;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

/// Enum representing the side from which the [ShadSheet] slides in.
enum ShadSheetSide {
  /// Sheet slides in from the top.
  top,

  /// Sheet slides in from the right.
  right,

  /// Sheet slides in from the bottom.
  bottom,

  /// Sheet slides in from the left.
  left;

  /// Converts the [ShadSheetSide] to an [Alignment].
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
typedef SheetDragEndHandler =
    void Function(
      DragEndDetails details, {
      required bool isClosing,
    });

/// {@template ShadSheet}
/// A customizable sheet component that slides in from the edges of the screen.
///
/// It can be configured to slide from the top, bottom, left, or right, and
/// supports draggable dismissal, custom styling, and actions.
/// {@endtemplate}
class ShadSheet extends StatefulWidget {
  /// {@macro ShadSheet}
  const ShadSheet({
    super.key,
    this.title,
    this.description,
    this.child,
    this.actions = const [],
    this.constraints,
    this.expandCrossSide,
    this.closeIcon,
    this.closeIconData,
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
    this.useSafeArea,
    this.titlePinned,
    this.descriptionPinned,
    this.actionsPinned,
  });

  /// {@template ShadSheet.title}
  /// The title widget of the sheet, typically displayed at the top.
  /// {@endtemplate}
  final Widget? title;

  /// {@template ShadSheet.description}
  /// The description widget, providing more context under the title.
  /// {@endtemplate}
  final Widget? description;

  /// {@template ShadSheet.child}
  /// The main content of the sheet.
  /// {@endtemplate}
  final Widget? child;

  /// {@template ShadSheet.actions}
  /// List of action widgets, typically buttons, displayed at the bottom or side
  /// of the sheet.
  /// {@endtemplate}
  final List<Widget> actions;

  /// {@template ShadSheet.constraints}
  /// Constraints for the sheet's size.
  /// {@endtemplate}
  final BoxConstraints? constraints;

  /// {@template ShadSheet.expandCrossSide}
  /// Whether to expand the sheet to the full width/height of the screen along the cross axis.
  /// {@endtemplate}
  final bool? expandCrossSide;

  /// {@template ShadSheet.closeIcon}
  /// Custom close icon widget.
  /// {@endtemplate}
  final Widget? closeIcon;

  /// {@template ShadSheet.closeIconData}
  /// Icon data for the default close icon.
  /// {@endtemplate}
  final IconData? closeIconData;

  /// {@template ShadSheet.closeIconPosition}
  /// Position of the close icon.
  /// {@endtemplate}
  final ShadPosition? closeIconPosition;

  /// {@template ShadSheet.radius}
  /// Border radius of the sheet.
  /// {@endtemplate}
  final BorderRadius? radius;

  /// {@template ShadSheet.backgroundColor}
  /// Background color of the sheet.
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template ShadSheet.expandActionsWhenTiny}
  /// Whether to expand actions to full width when the screen is tiny.
  /// {@endtemplate}
  final bool? expandActionsWhenTiny;

  /// {@template ShadSheet.padding}
  /// Padding around the content of the sheet.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadSheet.gap}
  /// Vertical gap between title, description, child, and actions.
  /// {@endtemplate}
  final double? gap;

  /// {@template ShadSheet.actionsAxis}
  /// Axis for arranging actions.
  /// {@endtemplate}
  final Axis? actionsAxis;

  /// {@template ShadSheet.actionsMainAxisSize}
  /// Main axis size for actions.
  /// {@endtemplate}
  final MainAxisSize? actionsMainAxisSize;

  /// {@template ShadSheet.actionsMainAxisAlignment}
  /// Main axis alignment for actions.
  /// {@endtemplate}
  final MainAxisAlignment? actionsMainAxisAlignment;

  /// {@template ShadSheet.actionsVerticalDirection}
  /// Vertical direction for actions.
  /// {@endtemplate}
  final VerticalDirection? actionsVerticalDirection;

  /// {@template ShadSheet.border}
  /// Border of the sheet.
  /// {@endtemplate}
  final BoxBorder? border;

  /// {@template ShadSheet.shadows}
  /// List of shadows for the sheet.
  /// {@endtemplate}
  final List<BoxShadow>? shadows;

  /// {@template ShadSheet.removeBorderRadiusWhenTiny}
  /// Whether to remove border radius when the screen is tiny.
  /// {@endtemplate}
  final bool? removeBorderRadiusWhenTiny;

  /// {@template ShadSheet.titleStyle}
  /// Style for the title text.
  /// {@endtemplate}
  final TextStyle? titleStyle;

  /// {@template ShadSheet.descriptionStyle}
  /// Style for the description text.
  /// {@endtemplate}
  final TextStyle? descriptionStyle;

  /// {@template ShadSheet.titleTextAlign}
  /// Text alignment for the title.
  /// {@endtemplate}
  final TextAlign? titleTextAlign;

  /// {@template ShadSheet.descriptionTextAlign}
  /// Text alignment for the description.
  /// {@endtemplate}
  final TextAlign? descriptionTextAlign;

  /// {@template ShadSheet.mainAxisAlignment}
  /// Main axis alignment for the sheet's content.
  /// {@endtemplate}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@template ShadSheet.crossAxisAlignment}
  /// Cross axis alignment for the sheet's content.
  /// {@endtemplate}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@template ShadSheet.scrollable}
  /// Whether the sheet's content is scrollable.
  /// {@endtemplate}
  final bool? scrollable;

  /// {@template ShadSheet.scrollPadding}
  /// Padding for scrollable content.
  /// {@endtemplate}
  final EdgeInsetsGeometry? scrollPadding;

  /// {@template ShadSheet.draggable}
  /// Whether the sheet is draggable, allowing dismissal by dragging.
  /// Defaults to false.
  /// {@endtemplate}
  final bool? draggable;

  /// {@template ShadSheet.isScrollControlled}
  /// Whether the sheet is scroll controlled, allowing it to expand to full
  /// screen if content is taller.
  /// Defaults to false.
  /// {@endtemplate}
  final bool isScrollControlled;

  /// {@template ShadSheet.onClosing}
  /// Called when the sheet begins to close.
  ///
  /// A sheet might be prevented from closing (e.g., by user
  /// interaction) even after this callback is called. For this reason, this
  /// callback might be call multiple times for a given sheet.
  /// {@endtemplate}
  final VoidCallback? onClosing;

  /// {@template ShadSheet.onDragStart}
  /// Called when the user begins dragging the sheet vertically, if
  /// [draggable] is true.
  ///
  /// Would typically be used to change the sheet animation curve so
  /// that it tracks the user's finger accurately.
  /// {@endtemplate}
  final SheetDragStartHandler? onDragStart;

  /// {@template ShadSheet.onDragEnd}
  /// Called when the user stops dragging the sheet, if [draggable]
  /// is true.
  ///
  /// Would typically be used to reset the sheet animation curve, so
  /// that it animates non-linearly. Called before [onClosing] if the
  /// sheet is closing.
  /// {@endtemplate}
  final SheetDragEndHandler? onDragEnd;

  /// {@template ShadSheet.animationController}
  /// The animation controller that controls the sheet's entrance and
  /// exit animations.
  ///
  /// The Sheet widget will manipulate the position of this animation, it
  /// is not just a passive observer.
  /// {@endtemplate}
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

  /// {@macro ShadDialog.useSafeArea}
  final bool? useSafeArea;

  /// {@macro ShadDialog.titlePinned}
  final bool? titlePinned;

  /// {@macro ShadDialog.descriptionPinned}
  final bool? descriptionPinned;

  /// {@macro ShadDialog.actionsPinned}
  final bool? actionsPinned;

  @override
  State<ShadSheet> createState() => _ShadSheetState();
}

class _ShadSheetState extends State<ShadSheet>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  final dragHandleMaterialState = <WidgetState>{};
  final GlobalKey childKey = GlobalKey(debugLabel: 'ShadSheet child');
  static const Curve legacyDecelerate = Cubic(0, 0, 0.2, 1);

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

    final effectiveBackgroundColor =
        widget.backgroundColor ??
        theme.sheetTheme.backgroundColor ??
        theme.colorScheme.background;

    final effectiveExpandActionsWhenTiny =
        widget.expandActionsWhenTiny ??
        theme.sheetTheme.expandActionsWhenTiny ??
        true;

    final defaultConstraints = switch (side) {
      ShadSheetSide.top ||
      ShadSheetSide.bottom => BoxConstraints(minWidth: mSize.width),
      ShadSheetSide.left ||
      ShadSheetSide.right => BoxConstraints(minHeight: mSize.height),
    };

    final defaultCrossAxisAlignment = switch (side) {
      ShadSheetSide.top || ShadSheetSide.bottom => CrossAxisAlignment.stretch,
      ShadSheetSide.left || ShadSheetSide.right => CrossAxisAlignment.start,
    };

    final defaultMainAxisAlignment = switch (side) {
      ShadSheetSide.top || ShadSheetSide.bottom => MainAxisAlignment.start,
      ShadSheetSide.left || ShadSheetSide.right => MainAxisAlignment.end,
    };

    final effectiveMainAxisAlignment =
        widget.mainAxisAlignment ??
        theme.sheetTheme.mainAxisAlignment ??
        defaultMainAxisAlignment;

    final effectiveCrossAxisAlignment =
        widget.crossAxisAlignment ??
        theme.sheetTheme.crossAxisAlignment ??
        defaultCrossAxisAlignment;

    var effectiveConstraints =
        widget.constraints ??
        theme.sheetTheme.constraints ??
        (effectiveExpandCrossSide ? defaultConstraints : null);

    if (effectiveExpandCrossSide) {
      effectiveConstraints = effectiveConstraints?.enforce(defaultConstraints);
    }

    final effectiveBorder =
        widget.border ??
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

    final effectiveCloseIconData =
        widget.closeIconData ?? theme.sheetTheme.closeIconData;

    final effectiveCloseIconPosition =
        widget.closeIconPosition ?? theme.sheetTheme.closeIconPosition;

    final effectiveActionsAxis =
        widget.actionsAxis ?? theme.sheetTheme.actionsAxis;

    final effectiveActionsMainAxisSize =
        widget.actionsMainAxisSize ?? theme.sheetTheme.actionsMainAxisSize;

    final effectiveActionsMainAxisAlignment =
        widget.actionsMainAxisAlignment ??
        theme.sheetTheme.actionsMainAxisAlignment;

    final effectiveActionsVerticalDirection =
        widget.actionsVerticalDirection ??
        theme.sheetTheme.actionsVerticalDirection;

    final effectiveTitleTextAlign =
        widget.titleTextAlign ?? theme.sheetTheme.titleTextAlign;

    final effectiveDescriptionTextAlign =
        widget.descriptionTextAlign ?? theme.sheetTheme.descriptionTextAlign;

    final effectiveScrollable =
        widget.scrollable ?? theme.sheetTheme.scrollable ?? true;

    final effectiveScrollPadding =
        widget.scrollPadding ??
        theme.sheetTheme.scrollPadding ??
        MediaQuery.viewInsetsOf(context);

    final effectiveUseSafeArea =
        widget.useSafeArea ?? theme.sheetTheme.useSafeArea ?? true;

    final effectiveTitlePinned =
        widget.titlePinned ?? theme.sheetTheme.titlePinned ?? false;

    final effectiveDescriptionPinned =
        widget.descriptionPinned ?? theme.sheetTheme.descriptionPinned ?? false;

    final effectiveActionsPinned =
        widget.actionsPinned ?? theme.sheetTheme.actionsPinned ?? true;

    Widget child = ShadDialog(
      key: childKey,
      title: widget.title,
      description: widget.description,
      alignment: side.toAlignment(),
      constraints: effectiveConstraints,
      actions: widget.actions,
      radius: effectiveRadius,
      closeIcon: widget.closeIcon,
      closeIconData: effectiveCloseIconData,
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
      useSafeArea: effectiveUseSafeArea,
      titlePinned: effectiveTitlePinned,
      descriptionPinned: effectiveDescriptionPinned,
      actionsPinned: effectiveActionsPinned,
      child: widget.child,
    );

    if (effectiveDraggable) {
      final effectiveDisabledScrollControlMaxRatio =
          widget.disabledScrollControlMaxRatio ??
          theme.sheetTheme.disabledScrollControlMaxRatio ??
          9 / 16;

      final effectiveMinFlingVelocity =
          widget.minFlingVelocity ?? theme.sheetTheme.minFlingVelocity ?? 700;

      final effectiveCloseProgressThreshold =
          widget.closeProgressThreshold ??
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
            final animationValue = legacyDecelerate.transform(
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

/// {@template ShadSheetGestureDetector}
/// A [GestureDetector] specifically for [ShadSheet] to handle drag gestures for
/// dismissal.
/// {@endtemplate}
class ShadSheetGestureDetector extends StatelessWidget {
  /// {@macro ShadSheetGestureDetector}
  const ShadSheetGestureDetector({
    super.key,
    required this.child,
    required this.onDragStart,
    required this.onDragUpdate,
    required this.onDragEnd,
    required this.side,
  });

  /// {@template ShadSheetGestureDetector.child}
  /// The child widget to wrap with gesture detection.
  /// {@endtemplate}
  final Widget child;

  /// {@template ShadSheetGestureDetector.onDragStart}
  /// Callback for drag start events.
  /// {@endtemplate}
  final GestureDragStartCallback onDragStart;

  /// {@template ShadSheetGestureDetector.onDragUpdate}
  /// Callback for drag update events.
  /// {@endtemplate}
  final GestureDragUpdateCallback onDragUpdate;

  /// {@template ShadSheetGestureDetector.onDragEnd}
  /// Callback for drag end events.
  /// {@endtemplate}
  final GestureDragEndCallback onDragEnd;

  /// {@template ShadSheetGestureDetector.side}
  /// The side from which the sheet is sliding.
  /// {@endtemplate}
  final ShadSheetSide side;

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      excludeFromSemantics: true,
      gestures: <Type, GestureRecognizerFactory<GestureRecognizer>>{
        if (side == ShadSheetSide.bottom || side == ShadSheetSide.top)
          VerticalDragGestureRecognizer:
              GestureRecognizerFactoryWithHandlers<
                VerticalDragGestureRecognizer
              >(
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
          HorizontalDragGestureRecognizer:
              GestureRecognizerFactoryWithHandlers<
                HorizontalDragGestureRecognizer
              >(
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

/// Callback for when the size of a widget changes.
typedef SizeChangeCallback<Size> = void Function(Size size);

/// A [SingleChildRenderObjectWidget] that listens for size changes in its child
/// and applies layout transformations for [ShadSheet] animations.
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

  /// {@template ShadSheetLayoutWithSizeListener.onChildSizeChanged}
  /// Callback when the child widget's size changes.
  /// {@endtemplate}
  final SizeChangeCallback<Size> onChildSizeChanged;

  /// {@template ShadSheetLayoutWithSizeListener.animationValue}
  /// The current animation value (0.0 to 1.0) for the sheet's animation.
  /// {@endtemplate}
  final double animationValue;

  /// {@template ShadSheetLayoutWithSizeListener.isScrollControlled}
  /// Whether the sheet is scroll controlled.
  /// {@endtemplate}
  final bool isScrollControlled;

  /// {@template ShadSheetLayoutWithSizeListener.scrollControlDisabledMaxRatio}
  /// Maximum height ratio when not scroll controlled.
  /// {@endtemplate}
  final double scrollControlDisabledMaxRatio;

  /// {@template ShadSheetLayoutWithSizeListener.side}
  /// The side from which the sheet slides in.
  /// {@endtemplate}
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

/// {@template RenderSheetLayoutWithSizeListener}
/// The render object for [ShadSheetLayoutWithSizeListener], responsible for
/// layout and size change notifications.
/// {@endtemplate}
class RenderSheetLayoutWithSizeListener extends RenderShiftedBox {
  /// {@macro RenderSheetLayoutWithSizeListener}
  RenderSheetLayoutWithSizeListener({
    RenderBox? child,
    required this.side,
    required SizeChangeCallback<Size> onChildSizeChanged,
    required double animationValue,
    required bool isScrollControlled,
    required double scrollControlDisabledMaxRatio,
  }) : _onChildSizeChanged = onChildSizeChanged,
       _animationValue = animationValue,
       _isScrollControlled = isScrollControlled,
       _scrollControlDisabledMaxRatio = scrollControlDisabledMaxRatio,
       super(child);

  /// {@template RenderSheetLayoutWithSizeListener.side}
  /// The side from which the sheet slides in.
  /// {@endtemplate}
  final ShadSheetSide side;

  /// The last size of the child widget to track size changes.
  Size _lastSize = Size.zero;

  /// Callback when the child widget's size changes.
  SizeChangeCallback<Size> get onChildSizeChanged => _onChildSizeChanged;
  SizeChangeCallback<Size> _onChildSizeChanged;
  set onChildSizeChanged(SizeChangeCallback<Size> newCallback) {
    if (_onChildSizeChanged == newCallback) {
      return;
    }

    _onChildSizeChanged = newCallback;
    markNeedsLayout();
  }

  /// The current animation value (0.0 to 1.0) for the sheet's animation.
  double get animationValue => _animationValue;
  double _animationValue;
  set animationValue(double newValue) {
    if (_animationValue == newValue) {
      return;
    }

    _animationValue = newValue;
    markNeedsLayout();
  }

  /// Whether the sheet is scroll controlled.
  bool get isScrollControlled => _isScrollControlled;
  bool _isScrollControlled;
  set isScrollControlled(bool newValue) {
    if (_isScrollControlled == newValue) {
      return;
    }

    _isScrollControlled = newValue;
    markNeedsLayout();
  }

  /// Maximum height ratio when not scroll controlled.
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
      ShadSheetSide.bottom => Offset(
        0,
        size.height - childSize.height * animationValue,
      ),
      ShadSheetSide.top => Offset(0, childSize.height * (animationValue - 1)),
      ShadSheetSide.left => Offset(childSize.width * (animationValue - 1), 0),
      ShadSheetSide.right => Offset(
        size.width - childSize.width * animationValue,
        0,
      ),
    };
  }

  @override
  void performLayout() {
    size = _getSize(constraints);
    if (child != null) {
      final childConstraints = _getConstraintsForChild(constraints);
      assert(childConstraints.debugAssertIsValid(isAppliedConstraint: true));
      child!.layout(
        childConstraints,
        parentUsesSize: !childConstraints.isTight,
      );
      final childParentData = child!.parentData! as BoxParentData;
      childParentData.offset = _getPositionForChild(
        size,
        childConstraints.isTight ? childConstraints.smallest : child!.size,
      );
      final childSize = childConstraints.isTight
          ? childConstraints.smallest
          : child!.size;

      if (_lastSize != childSize) {
        _lastSize = childSize;
        _onChildSizeChanged.call(_lastSize);
      }
    }
  }
}
