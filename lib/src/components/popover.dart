import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
// import 'package:flutter_portal/flutter_portal.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';

/// Controls the visibility of a [ShadcnPopover].
class ShadcnPopoverController extends ChangeNotifier {
  ShadcnPopoverController();

  bool isOpen = false;

  void show() {
    assert(isOpen == false, 'popover is already visible');
    isOpen = true;
    notifyListeners();
  }

  void hide() {
    assert(isOpen == true, 'popover is already hidden');
    isOpen = false;
    notifyListeners();
  }

  void toggle() => isOpen ? hide() : show();
}

class ShadcnPopover extends StatefulWidget {
  const ShadcnPopover({
    super.key,
    required this.child,
    required this.popover,
    required this.controller,
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
  });

  /// The widget displayed as a popover.
  final Widget popover;

  /// The child widget.
  final Widget child;

  /// The controller that controls the visibility of the [popover].
  final ShadcnPopoverController controller;

  /// The focus node of the child, the [popover] will be shown when focused.
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
  /// The shadows applied to the [popover], defaults to [ShadcnShadows.md].
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
  State<ShadcnPopover> createState() => _ShadcnPopoverState();
}

class _ShadcnPopoverState extends State<ShadcnPopover> {
  @override
  Widget build(BuildContext context) {
    final theme = ShadcnTheme.of(context);

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
        child: widget.popover,
      ),
    );

    if (effectiveEffects.isNotEmpty) {
      popover = Animate(
        effects: effectiveEffects,
        child: popover,
      );
    }

    return ListenableBuilder(
      listenable: widget.controller,
      builder: (context, _) {
        return Portal(
          overlay: popover,
          visible: widget.controller.isOpen,
          anchor: Anchor(
            childAlignment: effectiveAlignment,
            overlayAlignment: effectiveChildAlignment,
            offset: effectiveOffset,
          ),
          child: widget.child,
        );
      },
    );
  }
}
