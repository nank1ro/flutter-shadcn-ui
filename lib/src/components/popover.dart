import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';
import 'package:shadcn_ui/src/utils/animate.dart';
import 'package:shadcn_ui/src/utils/border.dart';
import 'package:shadcn_ui/src/utils/mouse_area.dart';

/// Controls the visibility of a [ShadPopover].
class ShadPopoverController extends ChangeNotifier {
  ShadPopoverController({bool isOpen = false}) : _isOpen = isOpen;

  bool _isOpen = false;

  /// Indicates if the popover is visible.
  bool get isOpen => _isOpen;

  /// Displays the popover.
  void show() {
    if (_isOpen) return;
    _isOpen = true;
    notifyListeners();
  }

  /// Hides the popover.
  void hide() {
    if (!_isOpen) return;
    _isOpen = false;
    notifyListeners();
  }

  void setOpen(bool open) {
    if (_isOpen == open) return;
    _isOpen = open;
    notifyListeners();
  }

  /// Toggles the visibility of the popover.
  void toggle() => _isOpen ? hide() : show();
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
    this.anchor,
    this.effects,
    this.reverseDuration,
    this.shadows,
    this.padding,
    this.decoration,
    this.filter,
    this.groupId,
    this.areaGroupId,
    this.useSameGroupIdForChild = true,
  }) : assert(
         (controller != null) ^ (visible != null),
         'Either controller or visible must be provided',
       );

  /// {@template ShadPopover.popover}
  /// The widget displayed as a popover.
  /// {@endtemplate}
  final WidgetBuilder popover;

  /// {@template ShadPopover.child}
  /// The child widget.
  /// {@endtemplate}
  final Widget child;

  /// {@template ShadPopover.controller}
  /// The controller that controls the visibility of the [popover].
  /// {@endtemplate}
  final ShadPopoverController? controller;

  /// {@template ShadPopover.visible}
  /// Indicates if the popover should be visible.
  /// {@endtemplate}
  final bool? visible;

  /// {@template ShadPopover.closeOnTapOutside}
  /// Closes the popover when the user taps outside, defaults to true.
  /// {@endtemplate}
  final bool closeOnTapOutside;

  /// {@template ShadPopover.focusNode}
  /// The focus node of the child, the [popover] will be shown when
  /// focused.
  /// {@endtemplate}
  final FocusNode? focusNode;

  ///{@template ShadPopover.anchor}
  /// The position of the [popover] in the global coordinate system.
  ///
  /// Defaults to `ShadAnchorAuto(offset: Offset(0, 4))`.
  /// {@endtemplate}
  final ShadAnchorBase? anchor;

  /// {@template ShadPopover.effects}
  /// The animation effects applied to the [popover]. Defaults to
  /// [FadeEffect(), ScaleEffect(begin: Offset(.95, .95), end: Offset(1, 1)),
  /// MoveEffect(begin: Offset(0, 2), end: Offset(0, 0))].
  /// {@endtemplate}
  final List<Effect<dynamic>>? effects;

  /// {@template ShadPopover.shadows}
  /// The shadows applied to the [popover], defaults to
  /// [ShadShadows.md].
  /// {@endtemplate}
  final List<BoxShadow>? shadows;

  /// {@template ShadPopover.padding}
  /// The padding of the [popover], defaults to
  /// `EdgeInsets.symmetric(horizontal: 12, vertical: 6)`.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadPopover.decoration}
  /// The decoration of the [popover].
  /// {@endtemplate}
  final ShadDecoration? decoration;

  /// {@template ShadPopover.filter}
  /// The filter of the [popover]. If `null`, falls back to `ShadPopoverTheme`.
  /// {@endtemplate}
  final ImageFilter? filter;

  /// {@template ShadPopover.groupId}
  /// The group id of the [popover], defaults to `UniqueKey()`.
  ///
  /// Used to determine it the tap is inside the [popover] or not.
  /// {@endtemplate}
  final Object? groupId;

  /// {@macro ShadMouseArea.groupId}
  final Object? areaGroupId;

  /// {@template ShadPopover.useSameGroupIdForChild}
  /// Whether the [groupId] should be used for the child widget, defaults to
  /// `true`. This teams that taps on the child widget will be handled as inside
  /// the popover.
  /// {@endtemplate}
  final bool useSameGroupIdForChild;

  /// {@template ShadPopover.reverseDuration}
  /// The duration of the popover's exit animation.
  ///
  /// Defaults to [Duration(milliseconds: 150)].
  ///
  /// To customize the opening animation duration,
  /// use [Effect.duration] in specified [effects].
  /// {@endtemplate}
  final Duration? reverseDuration;

  @override
  State<ShadPopover> createState() => _ShadPopoverState();
}

class _ShadPopoverState extends State<ShadPopover>
    with SingleTickerProviderStateMixin {
  ShadPopoverController? _controller;
  ShadPopoverController get controller => widget.controller ?? _controller!;

  late final AnimationController animationController;

  late final _popoverKey = UniqueKey();

  // The focus node of the popover.
  // It's used to be able to focus the popover and receive key events.
  final _popoverFocusNode = FocusNode();

  Object get groupId => widget.groupId ?? _popoverKey;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = ShadPopoverController(isOpen: widget.visible ?? false);
    }
    animationController = AnimationController(
      vsync: this,
      // This duration will be overridden later
      // by the [Animate] widget based on the effects.
      duration: Animate.defaultDuration,
    );
    controller.addListener(_onPopoverToggle);

    _onPopoverToggle();
  }

  @override
  void didUpdateWidget(covariant ShadPopover oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != null &&
        widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_onPopoverToggle);
      widget.controller!.addListener(_onPopoverToggle);
    }

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
    // Remove the listener from the provided `ShadPopoverController`
    // or our internal controller.
    controller.removeListener(_onPopoverToggle);

    animationController.dispose();
    _popoverFocusNode.dispose();
    _controller?.dispose();
    super.dispose();
  }

  void _onPopoverToggle() {
    if (controller.isOpen) {
      animationController.forward(from: 0);
      // When the popover is opened, request focus
      // to be able to receive key events.

      _popoverFocusNode.requestFocus();
    } else {
      animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveReverseDuration =
        widget.reverseDuration ?? theme.popoverTheme.reverseDuration;

    animationController.reverseDuration = effectiveReverseDuration;

    final effectiveEffects = widget.effects ?? theme.popoverTheme.effects ?? [];

    final effectivePadding =
        widget.padding ??
        theme.popoverTheme.padding ??
        const EdgeInsets.symmetric(horizontal: 12, vertical: 6);

    final effectiveShadows = widget.shadows ?? theme.popoverTheme.shadows;
    var effectiveDecoration =
        (theme.popoverTheme.decoration ?? const ShadDecoration())
            .merge(widget.decoration)
            .copyWith(shadows: effectiveShadows);
    // remove the top padding of the popover
    effectiveDecoration = effectiveDecoration.copyWith(
      secondaryBorder: ShadBorder(
        padding: theme.decoration.secondaryBorder?.padding
            ?.resolve(Directionality.of(context))
            .copyWith(top: 0),
      ),
    );

    final effectiveAnchor =
        widget.anchor ??
        theme.popoverTheme.anchor ??
        const ShadAnchorAuto(offset: Offset(0, 4));

    final effectiveFilter = widget.filter ?? theme.popoverTheme.filter;

    final effectiveFilterRadius =
        effectiveDecoration.border?.radius ?? BorderRadius.zero;

    Widget popover = ShadMouseArea(
      groupId: widget.areaGroupId,
      child: ShadDecorator(
        decoration: effectiveDecoration,
        child: Padding(
          padding: effectivePadding,
          child: DefaultTextStyle(
            style: TextStyle(
              color: ShadTheme.of(context).colorScheme.popoverForeground,
            ),
            textAlign: TextAlign.center,
            child: Builder(
              builder: widget.popover,
            ),
          ),
        ),
      ),
    );

    if (effectiveFilter != null) {
      popover = ClipRRect(
        borderRadius: effectiveFilterRadius,
        child: BackdropFilter(
          filter: effectiveFilter,
          child: popover,
        ),
      );
    }

    if (effectiveEffects.isNotEmpty) {
      popover = ShadAnimate(
        controller: animationController,
        effects: effectiveEffects,
        child: popover,
      );
    }

    if (widget.closeOnTapOutside) {
      popover = TapRegion(
        groupId: groupId,
        behavior: HitTestBehavior.opaque,
        onTapOutside: (_) => controller.hide(),
        child: popover,
      );
    }

    Widget child = CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.escape): () {
          controller.hide();
        },
      },
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          return ShadPortal(
            portalBuilder: (_) {
              // used to trap the focus inside the popover.
              return FocusScope(
                child: Focus(
                  skipTraversal: true,
                  focusNode: _popoverFocusNode,
                  child: popover,
                ),
              );
            },
            visible: !animationController.isDismissed,
            anchor: effectiveAnchor,
            child: widget.child,
          );
        },
      ),
    );
    if (widget.useSameGroupIdForChild) {
      child = TapRegion(
        groupId: groupId,
        child: child,
      );
    }
    return child;
  }
}
