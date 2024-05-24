import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/image.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';
import 'package:shadcn_ui/src/utils/position.dart';
import 'package:shadcn_ui/src/utils/responsive.dart';
import 'package:shadcn_ui/src/utils/separated_iterable.dart';

Future<T?> showShadDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = true,
  Color barrierColor = const Color(0xcc000000),
  String barrierLabel = '',
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  Offset? anchorPoint,
  List<Effect<dynamic>>? animateIn,
  List<Effect<dynamic>>? animateOut,
  ShadDialogVariant variant = ShadDialogVariant.primary,
}) {
  final theme = ShadTheme.of(context);
  final effectiveDialogTheme = switch (variant) {
    ShadDialogVariant.primary => theme.primaryDialogTheme,
    ShadDialogVariant.alert => theme.alertDialogTheme,
  };

  final effectiveAnimateIn = animateIn ??
      effectiveDialogTheme.animateIn ??
      const [
        FadeEffect(),
        ScaleEffect(begin: Offset(.95, .95), end: Offset(1, 1)),
      ];

  final effectiveAnimateOut = animateOut ??
      effectiveDialogTheme.animateOut ??
      const [
        FadeEffect(begin: 1, end: 0),
        ScaleEffect(begin: Offset(1, 1), end: Offset(.95, .95)),
      ];

  var maxDuration = Animate.defaultDuration;
  for (final e in [...effectiveAnimateIn, ...effectiveAnimateOut]) {
    final duration = e.duration ?? Duration.zero;
    maxDuration = maxDuration > duration ? maxDuration : duration;
  }

  return showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) => builder(context),
    barrierColor: barrierColor,
    barrierDismissible: barrierDismissible,
    barrierLabel: barrierLabel,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    anchorPoint: anchorPoint,
    transitionDuration: maxDuration,
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      if (animation.status == AnimationStatus.completed) {
        return child;
      }
      final animateIn = animation.status == AnimationStatus.forward;
      return Animate(
        effects: animateIn ? effectiveAnimateIn : effectiveAnimateOut,
        child: child,
      );
    },
  );
}

enum ShadDialogVariant {
  primary,
  alert,
}

class ShadDialog extends StatelessWidget {
  const ShadDialog({
    super.key,
    this.title,
    this.description,
    this.content,
    this.actions = const [],
    this.closeIcon,
    this.closeIconSrc,
    this.closeIconPosition,
    this.radius,
    this.backgroundColor,
    this.expandActionsWhenTiny,
    this.padding,
    this.gap,
    this.constraints,
    this.border,
    this.shadows,
    this.removeBorderRadiusWhenTiny,
    this.actionsAxis,
    this.actionsMainAxisSize,
    this.actionsMainAxisAlignment,
    this.actionsVerticalDirection,
    this.titleStyle,
    this.descriptionStyle,
    this.titleTextAlign,
    this.descriptionTextAlign,
    this.alignment,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.scrollable,
    this.scrollPadding,
  }) : variant = ShadDialogVariant.primary;

  const ShadDialog.alert({
    super.key,
    this.title,
    this.description,
    this.content,
    this.actions = const [],
    this.closeIcon,
    this.closeIconSrc,
    this.closeIconPosition,
    this.radius,
    this.backgroundColor,
    this.expandActionsWhenTiny,
    this.padding,
    this.gap,
    this.constraints,
    this.border,
    this.shadows,
    this.removeBorderRadiusWhenTiny,
    this.actionsAxis,
    this.actionsMainAxisSize,
    this.actionsMainAxisAlignment,
    this.actionsVerticalDirection,
    this.titleStyle,
    this.descriptionStyle,
    this.titleTextAlign,
    this.descriptionTextAlign,
    this.alignment,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.scrollable,
    this.scrollPadding,
  }) : variant = ShadDialogVariant.alert;

  final Widget? title;
  final Widget? description;
  final Widget? content;
  final ShadDialogVariant variant;
  final List<Widget> actions;
  final Widget? closeIcon;
  final ShadImageSrc? closeIconSrc;
  final ShadPosition? closeIconPosition;
  final BorderRadius? radius;
  final Color? backgroundColor;
  final bool? expandActionsWhenTiny;
  final EdgeInsets? padding;
  final double? gap;
  final BoxConstraints? constraints;
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
  final Alignment? alignment;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final bool? scrollable;
  final EdgeInsets? scrollPadding;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveDialogTheme = switch (variant) {
      ShadDialogVariant.primary => theme.primaryDialogTheme,
      ShadDialogVariant.alert => theme.alertDialogTheme,
    };

    final effectiveBackgroundColor = backgroundColor ??
        effectiveDialogTheme.backgroundColor ??
        theme.colorScheme.background;

    final effectiveCloseIcon = closeIcon ??
        (closeIconSrc == null && effectiveDialogTheme.closeIconSrc == null
            ? null
            : ShadButton.ghost(
                icon: ShadImage.square(
                  size: 16,
                  closeIconSrc ??
                      effectiveDialogTheme.closeIconSrc ??
                      LucideIcons.x,
                ),
                width: 20,
                height: 20,
                padding: EdgeInsets.zero,
                foregroundColor: theme.colorScheme.foreground.withOpacity(.5),
                hoverBackgroundColor: Colors.transparent,
                hoverForegroundColor: theme.colorScheme.foreground,
                pressedForegroundColor: theme.colorScheme.foreground,
                onPressed: () => Navigator.of(context).pop(),
              ));

    final effectiveCloseIconPosition = closeIconPosition ??
        effectiveDialogTheme.closeIconPosition ??
        const ShadPosition(top: 8, right: 8);

    final effectiveRadius =
        radius ?? effectiveDialogTheme.radius ?? theme.radius;

    final effectiveExpandActionsWhenTiny = expandActionsWhenTiny ??
        effectiveDialogTheme.expandActionsWhenTiny ??
        true;

    final effectiveConstraints = constraints ??
        effectiveDialogTheme.constraints ??
        const BoxConstraints(maxWidth: 512);

    final effectiveBorder = border ??
        effectiveDialogTheme.border ??
        Border.all(color: theme.colorScheme.border);

    final effectiveShadows =
        shadows ?? effectiveDialogTheme.shadows ?? ShadShadows.lg;

    final effectiveRemoveBorderRadiusWhenTiny = removeBorderRadiusWhenTiny ??
        effectiveDialogTheme.removeBorderRadiusWhenTiny ??
        true;
    final effectivePadding =
        padding ?? effectiveDialogTheme.padding ?? const EdgeInsets.all(24);

    final effectiveGap = gap ?? effectiveDialogTheme.gap ?? 8;

    final effectiveTitleStyle =
        titleStyle ?? effectiveDialogTheme.titleStyle ?? theme.textTheme.large;

    final effectiveDescriptionStyle = descriptionStyle ??
        effectiveDialogTheme.descriptionStyle ??
        theme.textTheme.muted;

    final effectiveAlignment =
        alignment ?? effectiveDialogTheme.alignment ?? Alignment.center;

    final effectiveMainAxisAlignment = mainAxisAlignment ??
        effectiveDialogTheme.mainAxisAlignment ??
        MainAxisAlignment.start;

    final effectiveCrossAxisAlignment = crossAxisAlignment ??
        effectiveDialogTheme.crossAxisAlignment ??
        CrossAxisAlignment.stretch;

    final effectiveScrollable =
        scrollable ?? effectiveDialogTheme.scrollable ?? true;

    final effectiveScrollPadding = scrollPadding ??
        effectiveDialogTheme.scrollPadding ??
        MediaQuery.viewInsetsOf(context);

    Widget dialog = ConstrainedBox(
      constraints: effectiveConstraints,
      child: ShadResponsiveBuilder(
        builder: (context, breakpoint) {
          final sm = breakpoint >= theme.breakpoints.small;

          final effectiveActionsAxis = actionsAxis ??
              effectiveDialogTheme.actionsAxis ??
              (sm ? Axis.horizontal : Axis.vertical);

          final effectiveActionsMainAxisSize = actionsMainAxisSize ??
              effectiveDialogTheme.actionsMainAxisSize ??
              MainAxisSize.max;

          final effectiveActionsMainAxisAlignment = actionsMainAxisAlignment ??
              effectiveDialogTheme.actionsMainAxisAlignment ??
              MainAxisAlignment.end;

          final effectiveActionsVerticalDirection = actionsVerticalDirection ??
              effectiveDialogTheme.actionsVerticalDirection ??
              (sm ? VerticalDirection.down : VerticalDirection.up);

          final effectiveTitleTextAlign = titleTextAlign ??
              effectiveDialogTheme.titleTextAlign ??
              (sm ? TextAlign.start : TextAlign.center);

          final effectiveDescriptionTextAlign = descriptionTextAlign ??
              effectiveDialogTheme.descriptionTextAlign ??
              (sm ? TextAlign.start : TextAlign.center);

          Widget effectiveActions = Flex(
            direction: effectiveActionsAxis,
            mainAxisSize: effectiveActionsMainAxisSize,
            mainAxisAlignment: effectiveActionsMainAxisAlignment,
            verticalDirection: effectiveActionsVerticalDirection,
            children: actions,
          );

          if (!sm && effectiveExpandActionsWhenTiny) {
            effectiveActions = ShadTheme(
              data: theme.copyWith(
                primaryButtonTheme:
                    theme.primaryButtonTheme.copyWith(width: double.infinity),
                secondaryButtonTheme:
                    theme.secondaryButtonTheme.copyWith(width: double.infinity),
                outlineButtonTheme:
                    theme.outlineButtonTheme.copyWith(width: double.infinity),
                ghostButtonTheme:
                    theme.ghostButtonTheme.copyWith(width: double.infinity),
                destructiveButtonTheme: theme.destructiveButtonTheme
                    .copyWith(width: double.infinity),
              ),
              child: effectiveActions,
            );
          }
          return DecoratedBox(
            decoration: BoxDecoration(
              color: effectiveBackgroundColor,
              borderRadius: (!sm && effectiveRemoveBorderRadiusWhenTiny)
                  ? null
                  : effectiveRadius,
              border: effectiveBorder,
              boxShadow: effectiveShadows,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: effectivePadding,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: effectiveMainAxisAlignment,
                    crossAxisAlignment: effectiveCrossAxisAlignment,
                    children: [
                      if (title != null)
                        DefaultTextStyle(
                          style: effectiveTitleStyle,
                          textAlign: effectiveTitleTextAlign,
                          child: title!,
                        ),
                      if (description != null)
                        DefaultTextStyle(
                          style: effectiveDescriptionStyle,
                          textAlign: effectiveDescriptionTextAlign,
                          child: description!,
                        ),
                      if (content != null)
                        DefaultTextStyle(
                          style: effectiveDescriptionStyle,
                          child: content!,
                        ),
                      if (actions.isNotEmpty) effectiveActions,
                    ].separatedBy(SizedBox(height: effectiveGap)),
                  ),
                ),
                if (effectiveCloseIcon != null)
                  effectiveCloseIcon.positionedWith(effectiveCloseIconPosition),
              ],
            ),
          );
        },
      ),
    );

    if (effectiveScrollable) {
      dialog = SingleChildScrollView(
        padding: effectiveScrollPadding,
        child: dialog,
      );
    }

    return Align(
      alignment: effectiveAlignment,
      child: dialog,
    );
  }
}
