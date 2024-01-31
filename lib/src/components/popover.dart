import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';

/// Controls the visibility of a [ShadPopover].
class ShadPopoverController extends ChangeNotifier {
  /// Indicates if the popover is visible.
  bool isOpen = false;

  /// Displays the popover.
  void show() {
    assert(isOpen == false, 'popover is already visible');
    isOpen = true;
    notifyListeners();
  }

  /// Hides the popover.
  void hide() {
    assert(isOpen == true, 'popover is already hidden');
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
    this.offset,
    this.effects,
    this.shadows,
    this.alignment,
    this.childAlignment,
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

  /// {@template tooltip.waitDuration}
  /// The length of time that a pointer must hover over a tooltip's widget
  /// before the tooltip will be shown.
  ///
  /// Defaults to null (tooltips are shown immediately upon hover).
  /// {@endtemplate}
  final Duration? waitDuration;

  /// {@template tooltip.showDuration}
  /// The length of time that the tooltip will be shown after a mouse pointer
  /// exits the widget.
  ///
  /// Defaults to null.
  /// {@endtemplate}
  final Duration? showDuration;

  /// {@template tooltip.offset}
  /// The tooltip offset from the child, defaults to [Offset.zero].
  /// {@endtemplate}
  final Offset? offset;

  /// {@template tooltip.effects}
  /// The animation effects applied to the [popover]. Defaults to
  /// [FadeEffect(), ScaleEffect(begin: Offset(.95, .95), end: Offset(1, 1)),
  /// MoveEffect(begin: Offset(0, 2), end: Offset(0, 0))].
  /// {@endtemplate}
  final List<Effect<dynamic>>? effects;

  /// {@template tooltip.shadows}
  /// The shadows applied to the [popover], defaults to
  /// [ShadShadows.md].
  /// {@endtemplate}
  final List<BoxShadow>? shadows;

  /// {@template tooltip.alignment}
  /// The alignment of the [popover], defaults to [Alignment.topCenter].
  /// {@endtemplate}
  final Alignment? alignment;

  /// {@template tooltip.childAlignment}
  /// The alignment of the [child], defaults to [Alignment.bottomCenter].
  /// {@endtemplate}
  final Alignment? childAlignment;

  /// {@template tooltip.padding}
  /// The padding of the [popover], defaults to
  /// `EdgeInsets.symmetric(horizontal: 12, vertical: 6)`.
  /// {@endtemplate}
  final EdgeInsets? padding;

  /// {@template tooltip.decoration}
  /// The decoration of the [popover].
  /// {@endtemplate}
  final BoxDecoration? decoration;

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
    final effectivePadding = widget.padding ?? theme.popoverTheme.padding;
    final effectiveShadows = widget.shadows ?? theme.popoverTheme.shadows;
    final effectiveDecoration =
        widget.decoration ?? theme.popoverTheme.decoration;
    final effectiveAlignment =
        widget.alignment ?? theme.popoverTheme.alignment ?? Alignment.topCenter;
    final effectiveChildAlignment = widget.childAlignment ??
        theme.popoverTheme.childAlignment ??
        Alignment.bottomCenter;
    final effectiveOffset =
        widget.offset ?? theme.popoverTheme.offset ?? Offset.zero;

    Widget popover = Container(
      padding: effectivePadding,
      decoration: effectiveDecoration?.copyWith(boxShadow: effectiveShadows),
      child: DefaultTextStyle(
        style: TextStyle(
          color: theme.colorScheme.popoverForeground,
        ),
        textAlign: TextAlign.center,
        child: Builder(
          builder: widget.popover,
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
          return ShadPortal(
            portalBuilder: (_) => popover,
            visible: controller.isOpen,
            anchor: ShadAnchor(
              childAlignment: effectiveAlignment,
              overlayAlignment: effectiveChildAlignment,
              offset: effectiveOffset,
            ),
            child: widget.child,
          );
        },
      ),
    );
  }
}
