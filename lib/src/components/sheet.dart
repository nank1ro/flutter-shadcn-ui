import 'package:flutter/material.dart';
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

class ShadSheet extends StatelessWidget {
  const ShadSheet({
    super.key,
    this.title,
    this.description,
    this.content,
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
  });

  final Widget? title;
  final Widget? description;
  final Widget? content;
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

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final side = ShadSheetInheritedWidget.of(context);
    final mSize = MediaQuery.sizeOf(context);

    final effectiveExpandCrossSide =
        expandCrossSide ?? theme.sheetTheme.expandCrossSide ?? true;

    final effectiveRadius =
        radius ?? theme.sheetTheme.radius ?? BorderRadius.zero;

    final effectiveBackgroundColor = backgroundColor ??
        theme.sheetTheme.backgroundColor ??
        theme.colorScheme.background;

    final effectiveExpandActionsWhenTiny =
        expandActionsWhenTiny ?? theme.sheetTheme.expandActionsWhenTiny ?? true;

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

    final effectiveMainAxisAlignment = mainAxisAlignment ??
        theme.sheetTheme.mainAxisAlignment ??
        defaultMainAxisAlignment;

    final effectiveCrossAxisAlignment = crossAxisAlignment ??
        theme.sheetTheme.crossAxisAlignment ??
        defaultCrossAxisAlignment;

    var effectiveConstraints = constraints ??
        theme.sheetTheme.constraints ??
        (effectiveExpandCrossSide ? defaultConstraints : null);

    if (effectiveExpandCrossSide) {
      effectiveConstraints = effectiveConstraints?.enforce(defaultConstraints);
    }

    final effectiveBorder = border ??
        theme.sheetTheme.border ??
        Border.all(color: theme.colorScheme.border);

    final effectiveShadows = shadows ?? theme.sheetTheme.shadows;

    final effectiveRemoveBorderRadiusWhenTiny = removeBorderRadiusWhenTiny ??
        theme.sheetTheme.removeBorderRadiusWhenTiny;
    final effectivePadding = padding ?? theme.sheetTheme.padding;

    final effectiveGap = gap ?? theme.sheetTheme.gap;

    final effectiveTitleStyle = titleStyle ?? theme.sheetTheme.titleStyle;

    final effectiveDescriptionStyle =
        descriptionStyle ?? theme.sheetTheme.descriptionStyle;

    final effectiveCloseIconSrc = closeIconSrc ?? theme.sheetTheme.closeIconSrc;

    final effectiveCloseIconPosition =
        closeIconPosition ?? theme.sheetTheme.closeIconPosition;

    final effectiveActionsAxis = actionsAxis ?? theme.sheetTheme.actionsAxis;

    final effectiveActionsMainAxisSize =
        actionsMainAxisSize ?? theme.sheetTheme.actionsMainAxisSize;

    final effectiveActionsMainAxisAlignment =
        actionsMainAxisAlignment ?? theme.sheetTheme.actionsMainAxisAlignment;

    final effectiveActionsVerticalDirection =
        actionsVerticalDirection ?? theme.sheetTheme.actionsVerticalDirection;

    final effectiveTitleTextAlign =
        titleTextAlign ?? theme.sheetTheme.titleTextAlign;

    final effectiveDescriptionTextAlign =
        descriptionTextAlign ?? theme.sheetTheme.descriptionTextAlign;

    final effectiveScrollable =
        scrollable ?? theme.sheetTheme.scrollable ?? true;

    final effectiveScrollPadding = scrollPadding ??
        theme.sheetTheme.scrollPadding ??
        MediaQuery.viewInsetsOf(context);

    return ShadDialog(
      title: title,
      description: description,
      alignment: side.toAlignment(),
      constraints: effectiveConstraints,
      content: content,
      actions: actions,
      radius: effectiveRadius,
      closeIcon: closeIcon,
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
    );
  }
}
