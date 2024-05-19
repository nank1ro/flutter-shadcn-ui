import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';

/// Controls the visibility of a [ShadPopover].
class ShadPopoverController extends ChangeNotifier {
  /// Indicates if the popover is visible.
  bool isOpen = false;

  /// Displays the popover.
  void show() {
    if (isOpen) return;
    isOpen = true;
    notifyListeners();
  }

  /// Hides the popover.
  void hide() {
    if (!isOpen) return;
    isOpen = false;
    notifyListeners();
  }

  /// Toggles the visibility of the popover.
  void toggle() => isOpen ? hide() : show();
}

class ShadPopover extends StatefulWidget {
  const ShadPopover({
    super.key,
    required this.child,
    required this.popover,
    this.controller,
    this.visible,
    this.closeOnTapOutside = true,
    this.focusNode,
    this.waitDuration,
    this.showDuration,
    this.anchor,
    this.effects,
    this.shadows,
    this.padding,
    this.decoration,
  }) : assert(
          (controller != null) ^ (visible != null),
          'Either controller or visible must be provided',
        );

  /// The widget displayed as a popover.
  final WidgetBuilder popover;

  /// The child widget.
  final Widget child;

  /// The controller that controls the visibility of the [popover].
  final ShadPopoverController? controller;

  /// Indicates if the popover should be visible.
  final bool? visible;

  /// Closes the popover when the user taps outside, defaults to true.
  final bool closeOnTapOutside;

  /// The focus node of the child, the [popover] will be shown when
  /// focused.
  final FocusNode? focusNode;

  /// {@template popover.waitDuration}
  /// The length of time that a pointer must hover over a tooltip's widget
  /// before the tooltip will be shown.
  ///
  /// Defaults to null (tooltips are shown immediately upon hover).
  /// {@endtemplate}
  final Duration? waitDuration;

  /// {@template popover.showDuration}
  /// The length of time that the tooltip will be shown after a mouse pointer
  /// exits the widget.
  ///
  /// Defaults to null.
  /// {@endtemplate}
  final Duration? showDuration;

  ///{@template popover.anchor}
  /// The position of the [popover] in the global coordinate system.
  ///
  /// Defaults to
  /// `ShadAnchorAutoPosition(verticalOffset: 24, preferBelow: true)`.
  /// {@endtemplate}
  final ShadAnchorBase? anchor;

  /// {@template popover.effects}
  /// The animation effects applied to the [popover]. Defaults to
  /// [FadeEffect(), ScaleEffect(begin: Offset(.95, .95), end: Offset(1, 1)),
  /// MoveEffect(begin: Offset(0, 2), end: Offset(0, 0))].
  /// {@endtemplate}
  final List<Effect<dynamic>>? effects;

  /// {@template popover.shadows}
  /// The shadows applied to the [popover], defaults to
  /// [ShadShadows.md].
  /// {@endtemplate}
  final List<BoxShadow>? shadows;

  /// {@template popover.padding}
  /// The padding of the [popover], defaults to
  /// `EdgeInsets.symmetric(horizontal: 12, vertical: 6)`.
  /// {@endtemplate}
  final EdgeInsets? padding;

  /// {@template popover.decoration}
  /// The decoration of the [popover].
  /// {@endtemplate}
  final ShadDecoration? decoration;

  @override
  State<ShadPopover> createState() => _ShadPopoverState();
}

class _ShadPopoverState extends State<ShadPopover> {
  ShadPopoverController? _controller;
  ShadPopoverController get controller => widget.controller ?? _controller!;
  bool animating = false;
  final popoverKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = ShadPopoverController();
    }
  }

  @override
  void didUpdateWidget(covariant ShadPopover oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.visible != null) {
      if (widget.visible! && !controller.isOpen) {
        controller.show();
      } else if (!widget.visible! && controller.isOpen) {
        controller.hide();
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveEffects = widget.effects ?? theme.popoverTheme.effects ?? [];
    final effectivePadding = widget.padding ??
        theme.popoverTheme.padding ??
        const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
    final effectiveShadows = widget.shadows ?? theme.popoverTheme.shadows;
    final effectiveDecoration =
        (theme.popoverTheme.decoration ?? const ShadDecoration())
            .mergeWith(widget.decoration)
            .copyWith(shadows: effectiveShadows);

    final effectiveAnchor = widget.anchor ??
        theme.popoverTheme.anchor ??
        const ShadAnchorAuto(
          verticalOffset: 24,
          preferBelow: true,
        );

    Widget popover = ShadDecorator(
      decoration: effectiveDecoration,
      child: Padding(
        padding: effectivePadding,
        child: DefaultTextStyle(
          style: TextStyle(
            color: theme.colorScheme.popoverForeground,
          ),
          textAlign: TextAlign.center,
          child: Builder(
            builder: widget.popover,
          ),
        ),
      ),
    );

    if (effectiveEffects.isNotEmpty) {
      popover = Animate(
        effects: effectiveEffects,
        child: popover,
      );
    }

    if (widget.closeOnTapOutside) {
      popover = TapRegion(
        groupId: popoverKey,
        behavior: HitTestBehavior.opaque,
        onTapOutside: (_) => controller.hide(),
        child: popover,
      );
    }

    return TapRegion(
      groupId: popoverKey,
      child: ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          return CallbackShortcuts(
            bindings: {
              const SingleActivator(LogicalKeyboardKey.escape): () {
                controller.hide();
              },
            },
            child: ShadPortal(
              portalBuilder: (_) => popover,
              visible: controller.isOpen,
              anchor: effectiveAnchor,
              child: widget.child,
            ),
          );
        },
      ),
    );
  }
}
