import 'package:boxy/flex.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/components/icon_button.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';
import 'package:shadcn_ui/src/utils/animate.dart';
import 'package:shadcn_ui/src/utils/extensions/text_style.dart';
import 'package:shadcn_ui/src/utils/position.dart';
import 'package:shadcn_ui/src/utils/responsive.dart';
import 'package:shadcn_ui/src/utils/separated_iterable.dart';

/// {@template ShadDialogRoute}
/// A custom dialog route that allows specifying a `reverseTransitionDuration`.
/// {@macro flutter.widgets.ModalRoute.barrierDismissible}
///
/// Used internally by [showShadDialog].
/// {@endtemplate}
class ShadDialogRoute<T> extends PopupRoute<T> {
  /// {@macro ShadDialogRoute}
  ShadDialogRoute({
    required this.pageBuilder,
    this.barrierDismissible = true,
    this.barrierLabel,
    this.barrierColor = const Color(0x80000000),
    this.transitionDuration = const Duration(milliseconds: 200),
    this.reverseTransitionDuration = const Duration(milliseconds: 200),
    this.transitionBuilder,
    this.anchorPoint,
    super.settings,
  });

  final WidgetBuilder pageBuilder;

  @override
  final bool barrierDismissible;

  @override
  final String? barrierLabel;

  @override
  final Color? barrierColor;

  @override
  final Duration transitionDuration;

  @override
  final Duration reverseTransitionDuration;

  final RouteTransitionsBuilder? transitionBuilder;

  final Offset? anchorPoint;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Builder(builder: pageBuilder);
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (transitionBuilder != null) {
      return transitionBuilder!(context, animation, secondaryAnimation, child);
    }
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

/// Displays a [ShadDialog] as a modal dialog with animation.
///
/// Shows a dialog with customizable barrier and animation properties, returning
/// a [Future] with the result when the dialog is dismissed.
Future<T?> showShadDialog<T>({
  /// The build context in which to show the dialog.
  required BuildContext context,

  /// The builder function to create the dialog content.
  required WidgetBuilder builder,

  /// Whether the dialog can be dismissed by tapping outside the barrier.
  /// Defaults to true.
  bool barrierDismissible = true,

  /// The color of the barrier behind the dialog.
  /// Defaults to a semi-transparent black (0xcc000000).
  Color barrierColor = const Color(0xcc000000),

  /// The accessibility label for the barrier.
  /// Defaults to an empty string.
  String barrierLabel = '',

  /// Whether to use the root navigator for routing.
  /// Defaults to true.
  bool useRootNavigator = true,

  /// Optional route settings for navigation.
  RouteSettings? routeSettings,

  /// The anchor point for positioning the dialog.
  Offset? anchorPoint,

  /// The animation effects when the dialog appears.
  /// Defaults to fade and scale-in if not specified.
  List<Effect<dynamic>>? animateIn,

  /// The animation effects when the dialog disappears.
  /// Defaults to fade and scale-out if not specified.
  List<Effect<dynamic>>? animateOut,

  /// The variant of the dialog to display.
  /// Defaults to [ShadDialogVariant.primary].
  ShadDialogVariant variant = ShadDialogVariant.primary,
}) {
  final theme = ShadTheme.of(context);
  final effectiveDialogTheme = switch (variant) {
    ShadDialogVariant.primary => theme.primaryDialogTheme,
    ShadDialogVariant.alert => theme.alertDialogTheme,
  };

  final effectiveAnimateIn =
      animateIn ??
      effectiveDialogTheme.animateIn ??
      const [
        FadeEffect(),
        ScaleEffect(begin: Offset(.95, .95), end: Offset(1, 1)),
      ];

  final effectiveAnimateOut =
      animateOut ??
      effectiveDialogTheme.animateOut ??
      const [
        FadeEffect(begin: 1, end: 0),
        ScaleEffect(begin: Offset(1, 1), end: Offset(.95, .95)),
      ];

  /// Returns the maximum duration(including delay) from
  /// the list of [Effect]s.
  Duration maxCompletionDuration(List<Effect<dynamic>> effects) {
    if (effects.isEmpty) return Duration.zero;

    return effects.fold<Duration>(
      Duration.zero, // start with zero
      (max, effect) {
        final effectTotal =
            (effect.delay ?? Duration.zero) +
            (effect.duration ?? Animate.defaultDuration);
        return effectTotal > max ? effectTotal : max;
      },
    );
  }

  return Navigator.of(context, rootNavigator: useRootNavigator).push(
    ShadDialogRoute(
      pageBuilder: builder,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      anchorPoint: anchorPoint,
      settings: routeSettings,
      transitionDuration: maxCompletionDuration(effectiveAnimateIn),
      reverseTransitionDuration: maxCompletionDuration(effectiveAnimateOut),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        if (animation.status == AnimationStatus.completed) {
          return child;
        }
        final animateIn = animation.status == AnimationStatus.forward;
        return ShadAnimate(
          effects: animateIn ? effectiveAnimateIn : effectiveAnimateOut,
          child: child,
        );
      },
    ),
  );
}

/// Variants available for the [ShadDialog] widget.
enum ShadDialogVariant {
  primary,
  alert,
}

/// A customizable dialog widget for displaying content and actions.
///
/// The [ShadDialog] widget provides a styled container for presenting a title,
/// description, custom content, and actions in a modal format. It supports
/// variants (primary and alert) and integrates with [ShadTheme] for styling.
/// Use named constructors like [ShadDialog.alert] for alert-specific styling or
/// [ShadDialog.raw] for full control.
class ShadDialog extends StatelessWidget {
  /// Creates a primary variant dialog widget.
  const ShadDialog({
    super.key,
    this.title,
    this.description,
    this.child,
    this.actions = const [],
    this.closeIcon,
    this.closeIconData,
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
    this.actionsGap,
    this.useSafeArea,
    this.titlePinned,
    this.descriptionPinned,
    this.actionsPinned,
  }) : variant = ShadDialogVariant.primary;

  /// Creates an alert variant dialog widget, typically for warnings or
  /// critical messages.
  const ShadDialog.alert({
    super.key,
    this.title,
    this.description,
    this.child,
    this.actions = const [],
    this.closeIcon,
    this.closeIconData,
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
    this.actionsGap,
    this.useSafeArea,
    this.titlePinned,
    this.descriptionPinned,
    this.actionsPinned,
  }) : variant = ShadDialogVariant.alert;

  /// Creates a dialog widget with a specified [variant], offering full
  /// customization.
  const ShadDialog.raw({
    super.key,
    required this.variant,
    this.title,
    this.description,
    this.child,
    this.actions = const [],
    this.closeIcon,
    this.closeIconData,
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
    this.actionsGap,
    this.useSafeArea,
    this.titlePinned,
    this.descriptionPinned,
    this.actionsPinned,
  });

  /// {@template ShadDialog.title}
  /// The title widget displayed at the top of the dialog.
  /// Typically a [Text] widget, styled with the theme’s large text style.
  /// {@endtemplate}
  final Widget? title;

  /// {@template ShadDialog.description}
  /// The description widget displayed below the title.
  /// Typically a [Text] widget, styled with the theme’s muted style.
  /// {@endtemplate}
  final Widget? description;

  /// {@template ShadDialog.child}
  /// The main content widget of the dialog, displayed below the description.
  /// Expands to fill available space if scrollable.
  /// {@endtemplate}
  final Widget? child;

  /// {@template ShadDialog.variant}
  /// The variant of the dialog, either [ShadDialogVariant.primary] or
  /// [ShadDialogVariant.alert]. Determines the visual style applied through the
  /// [ShadTheme].
  /// {@endtemplate}
  final ShadDialogVariant variant;

  /// {@template ShadDialog.actions}
  /// The list of action widgets displayed at the bottom of the dialog.
  /// Typically buttons, arranged based on [actionsAxis].
  /// Defaults to an empty list if not specified.
  /// {@endtemplate}
  final List<Widget> actions;

  /// {@template ShadDialog.closeIcon}
  /// The custom widget for the close button.
  /// Overrides [closeIconData] if provided; defaults to a ghost button with an
  /// 'X' icon.
  /// {@endtemplate}
  final Widget? closeIcon;

  /// {@template ShadDialog.closeIconData}
  /// The icon data for the close button.
  /// Used if [closeIcon] is null; defaults to [LucideIcons.x] if not specified.
  /// {@endtemplate}
  final IconData? closeIconData;

  /// {@template ShadDialog.closeIconPosition}
  /// The position of the close icon within the dialog.
  /// Defaults to top-end (8, 8) if not specified.
  /// {@endtemplate}
  final ShadPosition? closeIconPosition;

  /// {@template ShadDialog.radius}
  /// The border radius of the dialog’s corners.
  /// Defaults to the theme’s radius if not specified.
  /// {@endtemplate}
  final BorderRadius? radius;

  /// {@template ShadDialog.backgroundColor}
  /// The background color of the dialog.
  /// Defaults to the theme’s background color if not specified.
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template ShadDialog.expandActionsWhenTiny}
  /// Whether actions expand to full width on small screens.
  /// Defaults to true if not specified.
  /// {@endtemplate}
  final bool? expandActionsWhenTiny;

  /// {@template ShadDialog.padding}
  /// The padding inside the dialog, surrounding all content.
  /// Defaults to EdgeInsets.all(24) if not specified.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadDialog.gap}
  /// The gap between content elements (title, description, child, actions).
  /// Defaults to 8 if not specified.
  /// {@endtemplate}
  final double? gap;

  /// {@template ShadDialog.constraints}
  /// Constraints applied to the dialog’s layout.
  /// Defaults to a max width of 512 if not specified.
  /// {@endtemplate}
  final BoxConstraints? constraints;

  /// {@template ShadDialog.border}
  /// The border surrounding the dialog.
  /// Defaults to a border with the theme’s border color if not specified.
  /// {@endtemplate}
  final BoxBorder? border;

  /// {@template ShadDialog.shadows}
  /// The list of box shadows applied to the dialog for elevation.
  /// Defaults to large shadows if not specified.
  /// {@endtemplate}
  final List<BoxShadow>? shadows;

  /// {@template ShadDialog.removeBorderRadiusWhenTiny}
  /// Whether to remove the border radius on small screens.
  /// Defaults to true if not specified.
  /// {@endtemplate}
  final bool? removeBorderRadiusWhenTiny;

  /// {@template ShadDialog.actionsAxis}
  /// The axis along which actions are arranged (horizontal or vertical).
  /// Responsive to screen size if not specified.
  /// {@endtemplate}
  final Axis? actionsAxis;

  /// {@template ShadDialog.actionsMainAxisSize}
  /// The main axis size of the actions layout.
  /// Defaults to [MainAxisSize.max] if not specified.
  /// {@endtemplate}
  final MainAxisSize? actionsMainAxisSize;

  /// {@template ShadDialog.actionsMainAxisAlignment}
  /// The main axis alignment of the actions.
  /// Defaults to [MainAxisAlignment.end] if not specified.
  /// {@endtemplate}
  final MainAxisAlignment? actionsMainAxisAlignment;

  /// {@template ShadDialog.actionsVerticalDirection}
  /// The vertical direction of the actions layout when vertical.
  /// Responsive to screen size if not specified.
  /// {@endtemplate}
  final VerticalDirection? actionsVerticalDirection;

  /// {@template ShadDialog.titleStyle}
  /// The text style for the title.
  /// Defaults to the theme’s large text style if not specified.
  /// {@endtemplate}
  final TextStyle? titleStyle;

  /// {@template ShadDialog.descriptionStyle}
  /// The text style for the description.
  /// Defaults to the theme’s muted text style if not specified.
  /// {@endtemplate}
  final TextStyle? descriptionStyle;

  /// {@template ShadDialog.titleTextAlign}
  /// The text alignment for the title.
  /// Responsive to screen size if not specified.
  /// {@endtemplate}
  final TextAlign? titleTextAlign;

  /// {@template ShadDialog.descriptionTextAlign}
  /// The text alignment for the description.
  /// Responsive to screen size if not specified.
  /// {@endtemplate}
  final TextAlign? descriptionTextAlign;

  /// {@template ShadDialog.alignment}
  /// The alignment of the dialog within its parent container.
  /// Defaults to [Alignment.center] if not specified.
  /// {@endtemplate}
  final Alignment? alignment;

  /// {@template ShadDialog.mainAxisAlignment}
  /// The main axis alignment of the dialog’s column content.
  /// Defaults to [MainAxisAlignment.start] if not specified.
  /// {@endtemplate}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@template ShadDialog.crossAxisAlignment}
  /// The cross axis alignment of the dialog’s column content.
  /// Defaults to [CrossAxisAlignment.start] if not specified.
  /// {@endtemplate}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@template ShadDialog.scrollable}
  /// Whether the dialog content is scrollable.
  ///
  /// Defaults to true if not specified.
  /// {@endtemplate}
  final bool? scrollable;

  /// {@template ShadDialog.scrollPadding}
  /// The padding applied when the dialog content is scrollable.
  ///
  /// If not specified, no additional padding is applied to the scrollable
  /// content.
  /// {@endtemplate}
  final EdgeInsetsGeometry? scrollPadding;

  /// {@template ShadDialog.actionsGap}
  /// The gap between action buttons.

  /// Defaults to 8 if not specified.
  /// {@endtemplate}
  final double? actionsGap;

  /// {@template ShadDialog.useSafeArea}
  /// Whether to wrap the dialog in a SafeArea widget to avoid system UI
  /// intrusions.
  ///
  /// Defaults to true if not specified.
  /// {@endtemplate}
  final bool? useSafeArea;

  /// {@template ShadDialog.titlePinned}
  /// Whether the title is pinned when scrolling and [scrollable] is true.
  ///
  /// Defaults to false if not specified.
  /// {@endtemplate}
  final bool? titlePinned;

  /// {@template ShadDialog.descriptionPinned}
  /// Whether the description is pinned when scrolling and [scrollable] is true.
  ///
  /// Defaults to false if not specified.
  /// {@endtemplate}
  final bool? descriptionPinned;

  /// {@template ShadDialog.actionsPinned}
  /// Whether the actions are pinned when scrolling and [scrollable] is true.
  ///
  /// Defaults to true if not specified.
  /// {@endtemplate}
  final bool? actionsPinned;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveDialogTheme = switch (variant) {
      ShadDialogVariant.primary => theme.primaryDialogTheme,
      ShadDialogVariant.alert => theme.alertDialogTheme,
    };

    final effectiveBackgroundColor =
        backgroundColor ??
        effectiveDialogTheme.backgroundColor ??
        theme.colorScheme.background;

    final effectiveCloseIcon =
        closeIcon ??
        (closeIconData == null && effectiveDialogTheme.closeIconData == null
            ? null
            : ShadIconButton.ghost(
                icon: Icon(
                  size: 16,
                  closeIconData ??
                      effectiveDialogTheme.closeIconData ??
                      LucideIcons.x,
                ),
                width: 20,
                height: 20,
                padding: EdgeInsets.zero,
                foregroundColor: theme.colorScheme.foreground.withValues(
                  alpha: .5,
                ),
                hoverBackgroundColor: const Color(0x00000000),
                hoverForegroundColor: theme.colorScheme.foreground,
                pressedForegroundColor: theme.colorScheme.foreground,
                onPressed: () => Navigator.of(context).pop(),
              ));

    final effectiveCloseIconPosition =
        closeIconPosition ??
        effectiveDialogTheme.closeIconPosition ??
        ShadPosition.directional(
          top: 8,
          end: 8,
          textDirection: Directionality.of(context),
        );

    final effectiveRadius =
        radius ?? effectiveDialogTheme.radius ?? theme.radius;

    final effectiveExpandActionsWhenTiny =
        expandActionsWhenTiny ??
        effectiveDialogTheme.expandActionsWhenTiny ??
        true;

    final effectiveConstraints =
        constraints ??
        effectiveDialogTheme.constraints ??
        const BoxConstraints(maxWidth: 512);

    final effectiveBorder =
        border ??
        effectiveDialogTheme.border ??
        Border.all(color: theme.colorScheme.border);

    final effectiveShadows =
        shadows ?? effectiveDialogTheme.shadows ?? ShadShadows.lg;

    final effectiveRemoveBorderRadiusWhenTiny =
        removeBorderRadiusWhenTiny ??
        effectiveDialogTheme.removeBorderRadiusWhenTiny ??
        true;
    final effectivePadding =
        padding ?? effectiveDialogTheme.padding ?? const EdgeInsets.all(24);

    final effectiveGap = gap ?? effectiveDialogTheme.gap ?? 8;

    final effectiveTitleStyle =
        (titleStyle ?? effectiveDialogTheme.titleStyle ?? theme.textTheme.large)
            .fallback(color: theme.colorScheme.foreground);

    final effectiveDescriptionStyle =
        (descriptionStyle ??
                effectiveDialogTheme.descriptionStyle ??
                theme.textTheme.muted)
            .fallback(
              color: theme.colorScheme.mutedForeground,
            );

    final effectiveAlignment =
        alignment ?? effectiveDialogTheme.alignment ?? Alignment.center;

    final effectiveMainAxisAlignment =
        mainAxisAlignment ??
        effectiveDialogTheme.mainAxisAlignment ??
        MainAxisAlignment.start;

    final effectiveCrossAxisAlignment =
        crossAxisAlignment ??
        effectiveDialogTheme.crossAxisAlignment ??
        CrossAxisAlignment.start;

    final effectiveScrollable =
        scrollable ?? effectiveDialogTheme.scrollable ?? true;

    final effectiveScrollPadding =
        scrollPadding ?? effectiveDialogTheme.scrollPadding;

    final effectiveActionsGap =
        actionsGap ?? effectiveDialogTheme.actionsGap ?? 8;

    final effectiveUseSafeArea =
        useSafeArea ?? effectiveDialogTheme.useSafeArea ?? true;

    final effectiveTitlePinned =
        titlePinned ?? effectiveDialogTheme.titlePinned ?? false;

    final effectiveDescriptionPinned =
        descriptionPinned ?? effectiveDialogTheme.descriptionPinned ?? false;

    final effectiveActionsPinned =
        actionsPinned ?? effectiveDialogTheme.actionsPinned ?? true;

    final dialog = ConstrainedBox(
      constraints: effectiveConstraints,
      child: ShadResponsiveBuilder(
        builder: (context, breakpoint) {
          final sm = breakpoint >= theme.breakpoints.sm;

          final effectiveActionsAxis =
              actionsAxis ??
              effectiveDialogTheme.actionsAxis ??
              (sm ? Axis.horizontal : Axis.vertical);

          final effectiveActionsMainAxisSize =
              actionsMainAxisSize ??
              effectiveDialogTheme.actionsMainAxisSize ??
              MainAxisSize.min;

          final effectiveActionsMainAxisAlignment =
              actionsMainAxisAlignment ??
              effectiveDialogTheme.actionsMainAxisAlignment ??
              MainAxisAlignment.end;

          final effectiveActionsVerticalDirection =
              actionsVerticalDirection ??
              effectiveDialogTheme.actionsVerticalDirection ??
              (sm ? VerticalDirection.down : VerticalDirection.up);

          final effectiveTitleTextAlign =
              titleTextAlign ??
              effectiveDialogTheme.titleTextAlign ??
              (sm ? TextAlign.start : TextAlign.center);

          final effectiveDescriptionTextAlign =
              descriptionTextAlign ??
              effectiveDialogTheme.descriptionTextAlign ??
              (sm ? TextAlign.start : TextAlign.center);

          Widget? effectiveActions = actions.isEmpty
              ? null
              : BoxyFlexible.align(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  child: Flex(
                    direction: effectiveActionsAxis,
                    mainAxisSize: effectiveActionsMainAxisSize,
                    mainAxisAlignment: effectiveActionsMainAxisAlignment,
                    verticalDirection: effectiveActionsVerticalDirection,
                    spacing: effectiveActionsGap,
                    children: actions,
                  ),
                );

          if (!sm &&
              effectiveExpandActionsWhenTiny &&
              effectiveActions != null) {
            effectiveActions = ShadTheme(
              data: theme.copyWith(
                primaryButtonTheme: theme.primaryButtonTheme.copyWith(
                  width: double.infinity,
                ),
                secondaryButtonTheme: theme.secondaryButtonTheme.copyWith(
                  width: double.infinity,
                ),
                outlineButtonTheme: theme.outlineButtonTheme.copyWith(
                  width: double.infinity,
                ),
                ghostButtonTheme: theme.ghostButtonTheme.copyWith(
                  width: double.infinity,
                ),
                destructiveButtonTheme: theme.destructiveButtonTheme.copyWith(
                  width: double.infinity,
                ),
              ),
              child: effectiveActions,
            );
          }

          final effectiveTitle = title != null
              ? DefaultTextStyle(
                  style: effectiveTitleStyle,
                  textAlign: effectiveTitleTextAlign,
                  child: title!,
                )
              : null;

          final effectiveDescription = description != null
              ? DefaultTextStyle(
                  style: effectiveDescriptionStyle,
                  textAlign: effectiveDescriptionTextAlign,
                  child: description!,
                )
              : null;

          final effectiveChild = child != null
              ? DefaultTextStyle(
                  style: effectiveDescriptionStyle,
                  child: child!,
                )
              : null;

          Widget widget = BoxyColumn(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: effectiveMainAxisAlignment,
            crossAxisAlignment: effectiveCrossAxisAlignment,
            children: [
              // Only show title if not scrollable or scrollable but not pinned
              if (effectiveTitle != null &&
                  (!effectiveScrollable || !effectiveTitlePinned))
                effectiveTitle,
              // Only show description if not scrollable or scrollable but not
              // pinned
              if (effectiveDescription != null &&
                  (!effectiveScrollable || !effectiveDescriptionPinned))
                effectiveDescription,
              if (effectiveChild != null) Flexible(child: effectiveChild),
              // Only show actions if not scrollable or scrollable but not
              // pinned
              if (effectiveActions != null &&
                  (!effectiveScrollable || !effectiveActionsPinned))
                effectiveActions,
            ].separatedBy(SizedBox(height: effectiveGap)),
          );

          if (effectiveScrollable) {
            widget = BoxyColumn(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: effectiveMainAxisAlignment,
              crossAxisAlignment: effectiveCrossAxisAlignment,
              children: [
                // Pinned title
                if (effectiveTitle != null && effectiveTitlePinned)
                  effectiveTitle,
                // Pinned description
                if (effectiveDescription != null && effectiveDescriptionPinned)
                  effectiveDescription,
                Flexible(
                  child: SingleChildScrollView(
                    padding: effectiveScrollPadding,
                    child: widget,
                  ),
                ),
                // Pinned actions
                if (effectiveActions != null && effectiveActionsPinned)
                  effectiveActions,
              ].separatedBy(SizedBox(height: effectiveGap)),
            );
          }

          widget = Stack(
            children: [
              Padding(
                padding: effectivePadding,
                child: widget,
              ),
              if (effectiveCloseIcon != null)
                effectiveCloseIcon.positionedWith(effectiveCloseIconPosition),
            ],
          );

          if (effectiveUseSafeArea) {
            widget = SafeArea(child: widget);
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
            child: widget,
          );
        },
      ),
    );

    // Get the current view padding
    final viewPadding = MediaQuery.viewInsetsOf(context);

    return Align(
      alignment: effectiveAlignment,
      child: Padding(
        padding: viewPadding,
        child: dialog,
      ),
    );
  }
}
