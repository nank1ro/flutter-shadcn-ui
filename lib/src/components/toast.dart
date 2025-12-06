import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/components/icon_button.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';
import 'package:shadcn_ui/src/utils/animate.dart';
import 'package:shadcn_ui/src/utils/border.dart';
import 'package:shadcn_ui/src/utils/position.dart';
import 'package:shadcn_ui/src/utils/responsive.dart';

/// The default duration for toasts to remain visible.
const kDefaultToastDuration = Duration(seconds: 5);

/// A widget that manages and displays toasts within the widget tree.
///
/// The [ShadToaster] widget acts as a provider for toast notifications,
/// displaying them as overlays on top of its child widget. It uses an
/// [InheritedWidget] to allow descendants to access its state and show toasts
/// via [ShadToaster.of].
class ShadToaster extends StatefulWidget {
  /// Creates a toaster widget that wraps the provided child.
  const ShadToaster({
    super.key,
    required this.child,
  });

  /// The widget below the toaster in the tree, over which toasts are displayed.
  /// Typically the main app content.
  final Widget child;

  @override
  State<ShadToaster> createState() => ShadToasterState();

  /// Retrieves the [ShadToasterState] from the nearest [ShadToaster] ancestor.
  ///
  /// Throws a [FlutterError] if no [ShadToaster] is found in the widget tree.
  static ShadToasterState of(BuildContext context) {
    final provider = maybeOf(context);
    if (provider == null) {
      throw FlutterError(
        '''Could not find ShadToaster InheritedWidget in the ancestor widget tree.''',
      );
    }
    return provider;
  }

  /// Attempts to retrieve the [ShadToasterState] from the nearest [ShadToaster]
  /// ancestor.
  ///
  /// Returns null if no [ShadToaster] is found, allowing optional access.
  static ShadToasterState? maybeOf(BuildContext context) {
    final scope = context
        .dependOnInheritedWidgetOfExactType<ShadToasterScope>();
    return scope?.shadMessengerState;
  }
}

/// The state class for [ShadToaster], managing toast visibility and animations.
///
/// Controls the display, hiding, and timing of toasts using an animation
/// controller and timer, providing methods to show and hide toasts
/// programmatically.
class ShadToasterState extends State<ShadToaster>
    with TickerProviderStateMixin {
  late final _controller = AnimationController(vsync: this);
  final _visibleToast = ValueNotifier<ShadToast?>(null);
  final _shown = ValueNotifier(false);
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    _shown.dispose();
    _visibleToast.dispose();
    super.dispose();
  }

  void show(ShadToast toast) {
    _timer?.cancel();
    _shown.value = true;
    _visibleToast.value = toast;
    _controller.forward(from: 0);
    final effectiveDuration = toast.duration ?? kDefaultToastDuration;
    _timer = Timer(effectiveDuration, hide);
  }

  Future<void> hide({bool animate = true}) async {
    _timer?.cancel();
    _shown.value = false;
    if (animate) await _controller.forward(from: 0);
    _visibleToast.value = null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadToasterScope(
      shadMessengerState: this,
      child: Stack(
        children: [
          widget.child,
          ValueListenableBuilder(
            valueListenable: _shown,
            builder: (context, visible, child) {
              return ValueListenableBuilder(
                valueListenable: _visibleToast,
                builder: (context, toast, child) {
                  final effectiveToastTheme = switch (toast?.variant) {
                    ShadToastVariant.primary || null => theme.primaryToastTheme,
                    ShadToastVariant.destructive => theme.destructiveToastTheme,
                  };
                  final effectiveAlignment =
                      toast?.alignment ??
                      effectiveToastTheme.alignment ??
                      Alignment.bottomRight;
                  // ignore: omit_local_variable_types
                  final List<Effect<dynamic>> defaultAnimateIn =
                      switch (effectiveAlignment) {
                        Alignment.bottomRight ||
                        Alignment.bottomLeft ||
                        Alignment.bottomCenter => [
                          const SlideEffect(
                            begin: Offset(0, 1),
                            end: Offset.zero,
                          ),
                        ],
                        Alignment.topRight ||
                        Alignment.topLeft ||
                        Alignment.topCenter => [
                          const SlideEffect(
                            begin: Offset(0, -1),
                            end: Offset.zero,
                          ),
                        ],
                        Alignment.centerRight ||
                        Alignment.topRight ||
                        Alignment.bottomRight => [
                          const SlideEffect(
                            begin: Offset(1, 0),
                            end: Offset.zero,
                          ),
                        ],
                        Alignment.centerLeft ||
                        Alignment.topLeft ||
                        Alignment.bottomLeft => [
                          const SlideEffect(
                            begin: Offset(-1, 0),
                            end: Offset.zero,
                          ),
                        ],
                        Alignment.center || Alignment() => [
                          const FadeEffect(),
                          const ScaleEffect(
                            begin: Offset(.95, .95),
                            end: Offset(1, 1),
                          ),
                        ],
                      };

                  // ignore: omit_local_variable_types
                  final List<Effect<dynamic>> defaultAnimateOut =
                      switch (effectiveAlignment) {
                        Alignment.bottomRight ||
                        Alignment.topRight ||
                        Alignment.centerRight => const [
                          SlideEffect(
                            begin: Offset.zero,
                            end: Offset(1, 0),
                          ),
                        ],
                        Alignment.topLeft ||
                        Alignment.centerLeft ||
                        Alignment.bottomLeft => const [
                          SlideEffect(
                            begin: Offset.zero,
                            end: Offset(-1, 0),
                          ),
                        ],
                        Alignment.topCenter => [
                          const SlideEffect(
                            begin: Offset.zero,
                            end: Offset(0, -1),
                          ),
                        ],
                        Alignment.bottomCenter => [
                          const SlideEffect(
                            begin: Offset.zero,
                            end: Offset(0, 1),
                          ),
                        ],
                        Alignment.center || Alignment() => [
                          const FadeEffect(begin: 1, end: 0),
                          const ScaleEffect(
                            begin: Offset(1, 1),
                            end: Offset(.95, .95),
                          ),
                        ],
                      };

                  final effectiveAnimateIn =
                      toast?.animateIn ??
                      effectiveToastTheme.animateIn ??
                      defaultAnimateIn;
                  final effectiveAnimateOut =
                      toast?.animateOut ??
                      effectiveToastTheme.animateOut ??
                      defaultAnimateOut;

                  final defaultOffset = switch (effectiveAlignment) {
                    Alignment.topCenter ||
                    Alignment.topLeft ||
                    Alignment.topRight => Offset(
                      16,
                      MediaQuery.paddingOf(context).top + 16,
                    ),
                    Alignment.bottomCenter ||
                    Alignment.bottomLeft ||
                    Alignment.bottomRight => Offset(
                      16,
                      MediaQuery.paddingOf(context).bottom + 16,
                    ),
                    _ => const Offset(16, 16),
                  };

                  final effectiveOffset =
                      toast?.offset ??
                      effectiveToastTheme.offset ??
                      defaultOffset;

                  return ShadAnimate(
                    controller: _controller,
                    effects: visible ? effectiveAnimateIn : effectiveAnimateOut,
                    child: Align(
                      alignment: effectiveAlignment,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: effectiveOffset.dx,
                          vertical: effectiveOffset.dy,
                        ),
                        child: toast,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

/// An inherited widget that provides access to the [ShadToasterState].
///
/// Allows descendants to access the toaster state via [ShadToaster.of] or
/// [ShadToaster.maybeOf] for showing and hiding toasts.
class ShadToasterScope extends InheritedWidget {
  /// Creates a scope widget that holds the [ShadToasterState] and child.
  const ShadToasterScope({
    super.key,
    required super.child,
    required this.shadMessengerState,
  });

  /// The [ShadToasterState] instance managing toast display.
  final ShadToasterState shadMessengerState;

  @override
  bool updateShouldNotify(ShadToasterScope oldWidget) =>
      shadMessengerState != oldWidget.shadMessengerState;
}

/// Variants available for the [ShadToast] widget.
enum ShadToastVariant {
  primary,
  destructive,
}

/// A customizable toast notification widget.
///
/// The [ShadToast] widget displays a notification with a title, description,
/// optional action, and close button, styled according to its variant (primary
/// or destructive). It supports animations and integrates with [ShadTheme] for
/// consistent appearance.
class ShadToast extends StatefulWidget {
  /// Creates a primary variant toast widget.
  const ShadToast({
    super.key,
    this.id,
    this.title,
    this.description,
    this.action,
    this.closeIcon,
    this.closeIconData,
    this.alignment,
    this.offset,
    this.duration,
    this.textDirection,
    this.animateIn,
    this.animateOut,
    this.crossAxisAlignment,
    this.showCloseIconOnlyWhenHovered,
    this.titleStyle,
    this.descriptionStyle,
    this.actionPadding,
    this.border,
    this.radius,
    this.shadows,
    this.backgroundColor,
    this.padding,
    this.closeIconPosition,
    this.constraints,
    this.mainAxisAlignment,
    this.mainAxisSize,
  }) : variant = ShadToastVariant.primary;

  /// Creates a destructive variant toast widget, typically for error or warning
  /// messages.
  const ShadToast.destructive({
    super.key,
    this.id,
    this.title,
    this.description,
    this.action,
    this.closeIcon,
    this.closeIconData,
    this.alignment,
    this.offset,
    this.duration,
    this.textDirection,
    this.animateIn,
    this.animateOut,
    this.crossAxisAlignment,
    this.showCloseIconOnlyWhenHovered,
    this.titleStyle,
    this.descriptionStyle,
    this.actionPadding,
    this.border,
    this.radius,
    this.shadows,
    this.backgroundColor,
    this.padding,
    this.closeIconPosition,
    this.constraints,
    this.mainAxisAlignment,
    this.mainAxisSize,
  }) : variant = ShadToastVariant.destructive;

  /// Creates a toast widget with a specified [variant], offering full
  /// customization.
  const ShadToast.raw({
    super.key,
    this.id,
    required this.variant,
    this.title,
    this.description,
    this.action,
    this.closeIcon,
    this.closeIconData,
    this.alignment,
    this.offset,
    this.duration,
    this.textDirection,
    this.animateIn,
    this.animateOut,
    this.crossAxisAlignment,
    this.showCloseIconOnlyWhenHovered,
    this.titleStyle,
    this.descriptionStyle,
    this.actionPadding,
    this.border,
    this.radius,
    this.shadows,
    this.backgroundColor,
    this.padding,
    this.closeIconPosition,
    this.constraints,
    this.mainAxisAlignment,
    this.mainAxisSize,
  });

  /// {@template ShadToast.id}
  /// The unique identifier for the toast, used for tracking and managing
  /// toasts. Defaults to `UniqueKey()` if not specified.
  /// {@endtemplate}
  final Object? id;

  /// {@template ShadToast.title}
  /// The title widget displayed at the top of the toast.
  /// Typically a [Text] widget, styled with the theme’s muted bold style.
  /// {@endtemplate}
  final Widget? title;

  /// {@template ShadToast.description}
  /// The description widget displayed below the title.
  /// Typically a [Text] widget, styled with the theme’s muted style.
  /// {@endtemplate}
  final Widget? description;

  /// {@template ShadToast.action}
  /// An optional action widget displayed alongside the content.
  /// Typically a button, padded according to [actionPadding].
  /// {@endtemplate}
  final Widget? action;

  /// {@template ShadToast.closeIcon}
  /// The custom widget for the close button.
  /// Overrides [closeIconData] if provided; defaults to a ghost button with an
  /// 'X' icon.
  /// {@endtemplate}
  final Widget? closeIcon;

  /// {@template ShadToast.closeIconData}
  /// The icon data for the close button.
  /// Used if [closeIcon] is null; defaults to [LucideIcons.x] if not specified.
  /// {@endtemplate}
  final IconData? closeIconData;

  /// {@template ShadToast.alignment}
  /// The alignment of the toast within the screen.
  /// Defaults to [Alignment.bottomRight] if not specified.
  /// {@endtemplate}
  final Alignment? alignment;

  /// {@template ShadToast.offset}
  /// The offset from the [alignment] position as padding.
  /// Defaults to 16 pixels from edges or safe areas if not specified.
  /// {@endtemplate}
  final Offset? offset;

  /// {@template ShadToast.duration}
  /// The duration the toast remains visible before auto-hiding.
  /// Defaults to [kDefaultToastDuration] (5 seconds) if not specified.
  /// {@endtemplate}
  final Duration? duration;

  /// {@template ShadToast.textDirection}
  /// The directionality of the toast’s content (e.g., LTR or RTL).
  /// Defaults to null, inheriting from the context.
  /// {@endtemplate}
  final TextDirection? textDirection;

  /// {@template ShadToast.animateIn}
  /// The animation effects when the toast appears.
  /// Defaults to alignment-specific slide or fade effects if not specified.
  /// {@endtemplate}
  final List<Effect<dynamic>>? animateIn;

  /// {@template ShadToast.animateOut}
  /// The animation effects when the toast disappears.
  /// Defaults to alignment-specific slide or fade effects if not specified.
  /// {@endtemplate}
  final List<Effect<dynamic>>? animateOut;

  /// {@template ShadToast.crossAxisAlignment}
  /// The cross-axis alignment of the toast’s content (vertical).
  /// Defaults to [CrossAxisAlignment.center] if not specified.
  /// {@endtemplate}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@template ShadToast.mainAxisAlignment}
  /// The main-axis alignment of the toast’s content (horizontally).
  /// Defaults to [MainAxisAlignment.spaceBetween] if not specified.
  /// {@endtemplate}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@template ShadToast.showCloseIconOnlyWhenHovered}
  /// Whether the close icon is visible only when the toast is hovered.
  /// Defaults to true if not specified.
  /// {@endtemplate}
  final bool? showCloseIconOnlyWhenHovered;

  /// {@template ShadToast.titleStyle}
  /// The text style for the title.
  /// Defaults to a bold muted style with variant-specific foreground color.
  /// {@endtemplate}
  final TextStyle? titleStyle;

  /// {@template ShadToast.descriptionStyle}
  /// The text style for the description.
  /// Defaults to a muted style with variant-specific foreground color.
  /// {@endtemplate}
  final TextStyle? descriptionStyle;

  /// {@template ShadToast.actionPadding}
  /// The padding around the action widget.
  /// Defaults to start padding of 16 if not specified.
  /// {@endtemplate}
  final EdgeInsetsGeometry? actionPadding;

  /// {@template ShadToast.border}
  /// The border surrounding the toast.
  /// Defaults to a border with the theme’s border color if not specified.
  /// {@endtemplate}
  final ShadBorder? border;

  /// {@template ShadToast.radius}
  /// The border radius of the toast’s corners.
  /// Defaults to the theme’s radius if not specified.
  /// {@endtemplate}
  final BorderRadius? radius;

  /// {@template ShadToast.shadows}
  /// The list of box shadows applied to the toast for elevation.
  /// Defaults to large shadows if not specified.
  /// {@endtemplate}
  final List<BoxShadow>? shadows;

  /// {@template ShadToast.backgroundColor}
  /// The background color of the toast.
  /// Defaults to the theme’s background color if not specified.
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template ShadToast.padding}
  /// The padding inside the toast, surrounding all content.
  ///
  /// Defaults to EdgeInsetsDirectional.fromSTEB(24, 24, 32, 24) if not
  /// specified.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadToast.closeIconPosition}
  /// The position of the close icon within the toast.
  /// Defaults to top-end (8, 8) if not specified.
  /// {@endtemplate}
  final ShadPosition? closeIconPosition;

  /// {@template ShadToast.variant}
  /// The variant of the toast, either [ShadToastVariant.primary] or
  /// [ShadToastVariant.destructive]. Determines the visual style applied
  /// through the [ShadTheme].
  /// {@endtemplate}
  final ShadToastVariant variant;

  /// {@template ShadToast.constraints}
  /// Constraints applied to the toast’s layout.
  /// Responsive to screen size; defaults to unbounded min width and 420 max
  /// width on larger screens.
  /// {@endtemplate}
  final BoxConstraints? constraints;

  /// {@template ShadToast.mainAxisSize}
  /// The main axis size of the toast's content (horizontal).
  /// Defaults to [MainAxisSize.max] if not specified.
  /// {@endtemplate}
  final MainAxisSize? mainAxisSize;

  @override
  State<ShadToast> createState() => _ShadToastState();
}

class _ShadToastState extends State<ShadToast> {
  final hovered = ValueNotifier(false);

  @override
  void dispose() {
    hovered.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveToastTheme = switch (widget.variant) {
      ShadToastVariant.primary => theme.primaryToastTheme,
      ShadToastVariant.destructive => theme.destructiveToastTheme,
    };
    final effectiveForegroundColor = switch (widget.variant) {
      ShadToastVariant.primary => theme.colorScheme.foreground,
      ShadToastVariant.destructive => theme.colorScheme.destructiveForeground,
    };

    final effectiveCloseIcon =
        widget.closeIcon ??
        effectiveToastTheme.closeIcon ??
        ShadIconButton.ghost(
          icon: Icon(
            size: 16,
            widget.closeIconData ??
                effectiveToastTheme.closeIconData ??
                LucideIcons.x,
          ),
          width: 20,
          height: 20,
          padding: EdgeInsets.zero,
          foregroundColor: effectiveForegroundColor.withValues(alpha: .5),
          hoverBackgroundColor: const Color(0x00000000),
          hoverForegroundColor: effectiveForegroundColor,
          pressedForegroundColor: effectiveForegroundColor,
          onPressed: () => ShadToaster.of(context).hide(),
        );
    final effectiveTitleStyle =
        widget.titleStyle ??
        effectiveToastTheme.titleStyle ??
        theme.textTheme.muted.copyWith(
          fontWeight: FontWeight.w500,
          color: effectiveForegroundColor,
        );
    final effectiveDescriptionStyle =
        widget.descriptionStyle ??
        effectiveToastTheme.descriptionStyle ??
        theme.textTheme.muted.copyWith(
          color: effectiveForegroundColor.withValues(alpha: .9),
        );
    final effectiveActionPadding =
        widget.actionPadding ??
        effectiveToastTheme.actionPadding ??
        const EdgeInsetsDirectional.only(start: 16);
    final effectiveBorder =
        widget.border ??
        effectiveToastTheme.border ??
        ShadBorder.all(color: theme.colorScheme.border, width: 1);
    final effectiveBorderRadius =
        widget.radius ?? effectiveToastTheme.radius ?? theme.radius;
    final effectiveShadows =
        widget.shadows ?? effectiveToastTheme.shadows ?? ShadShadows.lg;
    final effectiveBackgroundColor =
        widget.backgroundColor ??
        effectiveToastTheme.backgroundColor ??
        theme.colorScheme.background;
    final effectivePadding =
        widget.padding ??
        effectiveToastTheme.padding ??
        const EdgeInsetsDirectional.fromSTEB(24, 24, 32, 24);
    final effectiveCrossAxisAlignment =
        widget.crossAxisAlignment ??
        effectiveToastTheme.crossAxisAlignment ??
        CrossAxisAlignment.center;
    final effectiveMainAxisAlignment =
        widget.mainAxisAlignment ??
        effectiveToastTheme.mainAxisAlignment ??
        MainAxisAlignment.spaceBetween;
    final effectiveCloseIconPosition =
        widget.closeIconPosition ??
        effectiveToastTheme.closeIconPosition ??
        ShadPosition.directional(
          top: 8,
          end: 8,
          textDirection: Directionality.of(context),
        );
    final effectiveShowCloseIconOnlyWhenHovered =
        widget.showCloseIconOnlyWhenHovered ??
        effectiveToastTheme.showCloseIconOnlyWhenHovered ??
        true;
    final effectiveTextDirection =
        widget.textDirection ?? effectiveToastTheme.textDirection;
    final effectiveMainAxisSize =
        widget.mainAxisSize ??
        effectiveToastTheme.mainAxisSize ??
        MainAxisSize.max;

    return MouseRegion(
      onEnter: (_) => hovered.value = true,
      onExit: (_) => hovered.value = false,
      child: ShadResponsiveBuilder(
        builder: (context, breakpoint) {
          final effectiveConstraints =
              widget.constraints ??
              effectiveToastTheme.constraints ??
              BoxConstraints(
                minWidth: breakpoint >= theme.breakpoints.md
                    ? 0
                    : double.infinity,
                maxWidth: breakpoint >= theme.breakpoints.md
                    ? 420
                    : double.infinity,
              );
          return ConstrainedBox(
            constraints: effectiveConstraints,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: effectiveBorder.toBorder(),
                borderRadius: effectiveBorderRadius,
                boxShadow: effectiveShadows,
                color: effectiveBackgroundColor,
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: effectivePadding,
                    child: Row(
                      textDirection: effectiveTextDirection,
                      mainAxisAlignment: effectiveMainAxisAlignment,
                      mainAxisSize: effectiveMainAxisSize,
                      crossAxisAlignment: effectiveCrossAxisAlignment,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (widget.title != null)
                                DefaultTextStyle(
                                  style: effectiveTitleStyle,
                                  child: widget.title!,
                                ),
                              if (widget.description != null)
                                DefaultTextStyle(
                                  style: effectiveDescriptionStyle,
                                  child: widget.description!,
                                ),
                            ],
                          ),
                        ),
                        if (widget.action != null)
                          Padding(
                            padding: effectiveActionPadding,
                            child: widget.action,
                          ),
                      ],
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: hovered,
                    builder: (context, hovered, child) {
                      if (!effectiveShowCloseIconOnlyWhenHovered) {
                        return child!;
                      }
                      return Visibility.maintain(
                        visible: hovered,
                        child: child!,
                      );
                    },
                    child: effectiveCloseIcon,
                  ).positionedWith(effectiveCloseIconPosition),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
