import 'package:flutter/widgets.dart';

/// The position of the [ShadPortal] in the global coordinate system.
sealed class ShadAnchorBase {
  const ShadAnchorBase();
}

/// Automatically infers the position of the [ShadPortal] in the global
/// coordinate system adjusting according to the [offset],
/// [followerAnchor] and [targetAnchor] properties.
@immutable
class ShadAnchorAuto extends ShadAnchorBase {
  const ShadAnchorAuto({
    this.offset = Offset.zero,
    this.followTargetOnResize = true,
    this.followerAnchor = Alignment.bottomCenter,
    this.targetAnchor = Alignment.bottomCenter,
  });

  /// The offset of the overlay from the target widget.
  final Offset offset;

  /// Whether the overlay is automatically adjusted to follow the target
  /// widget when the target widget moves dues to a window resize.
  final bool followTargetOnResize;

  /// The coordinates of the overlay from which the overlay starts, which
  /// is calculated from the initial [targetAnchor].
  final Alignment followerAnchor;

  /// The coordinates of the target from which the overlay starts.
  final Alignment targetAnchor;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadAnchorAuto &&
        other.offset == offset &&
        other.followTargetOnResize == followTargetOnResize &&
        other.followerAnchor == followerAnchor &&
        other.targetAnchor == targetAnchor;
  }

  @override
  int get hashCode =>
      offset.hashCode ^
      followTargetOnResize.hashCode ^
      followerAnchor.hashCode ^
      targetAnchor.hashCode;
}

/// Manually specifies the position of the [ShadPortal] in the global
/// coordinate system.
@immutable
class ShadAnchor extends ShadAnchorBase {
  const ShadAnchor({
    this.childAlignment = Alignment.topLeft,
    this.overlayAlignment = Alignment.bottomLeft,
    this.offset = Offset.zero,
  });

  final Alignment childAlignment;
  final Alignment overlayAlignment;
  final Offset offset;

  static const center = ShadAnchor(
    childAlignment: Alignment.topCenter,
    overlayAlignment: Alignment.bottomCenter,
  );

  ShadAnchor copyWith({
    Alignment? childAlignment,
    Alignment? overlayAlignment,
    Offset? offset,
  }) {
    return ShadAnchor(
      childAlignment: childAlignment ?? this.childAlignment,
      overlayAlignment: overlayAlignment ?? this.overlayAlignment,
      offset: offset ?? this.offset,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadAnchor &&
        other.childAlignment == childAlignment &&
        other.overlayAlignment == overlayAlignment &&
        other.offset == offset;
  }

  @override
  int get hashCode {
    return childAlignment.hashCode ^
        overlayAlignment.hashCode ^
        offset.hashCode;
  }
}

@immutable
class ShadGlobalAnchor extends ShadAnchorBase {
  const ShadGlobalAnchor(this.offset);

  /// The global offset where the overlay is positioned.
  final Offset offset;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadGlobalAnchor && other.offset == offset;
  }

  @override
  int get hashCode => offset.hashCode;
}

class ShadPortal extends StatefulWidget {
  const ShadPortal({
    super.key,
    required this.child,
    required this.portalBuilder,
    required this.visible,
    required this.anchor,
  });

  final Widget child;
  final WidgetBuilder portalBuilder;
  final bool visible;
  final ShadAnchorBase anchor;

  @override
  State<ShadPortal> createState() => _ShadPortalState();
}

class _ShadPortalState extends State<ShadPortal> {
  final layerLink = LayerLink();
  final overlayPortalController = OverlayPortalController();
  final overlayKey = GlobalKey();
  Offset? _calculatedTarget;
  // When scrolling, recalculate the position
  ScrollNotificationObserverState? _scrollNotificationObserver;
  bool _autoPositionUpdateScheduled = false;

  @override
  void initState() {
    super.initState();
    updateVisibility();
  }

  @override
  void didUpdateWidget(covariant ShadPortal oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Avoid scheduling a post-frame visibility update on every rebuild.
    final visibilityChanged = widget.visible != oldWidget.visible;
    final anchorChanged = widget.anchor != oldWidget.anchor;
    if (visibilityChanged || (widget.visible && anchorChanged)) {
      updateVisibility();
    }

    // Avoid subscribing hidden portals to scroll notifications.
    _syncScrollNotificationObserver();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncScrollNotificationObserver();

    if (widget.visible && widget.anchor is ShadAnchorAuto) {
      final anchor = widget.anchor as ShadAnchorAuto;
      if (anchor.followTargetOnResize) {
        _scheduleAutoPositionUpdate();
      }
    }
  }

  @override
  void dispose() {
    _unsubscribeScrollNotificationObserver();
    hide();
    super.dispose();
  }

  bool get _isAutoAnchor => widget.anchor is ShadAnchorAuto;

  bool get _shouldListenToScrollNotifications =>
      widget.visible && _isAutoAnchor;

  void _unsubscribeScrollNotificationObserver() {
    _scrollNotificationObserver?.removeListener(_handleScrollNotification);
    _scrollNotificationObserver = null;
  }

  void _syncScrollNotificationObserver() {
    if (!_shouldListenToScrollNotifications) {
      _unsubscribeScrollNotificationObserver();
      return;
    }

    final observer = ScrollNotificationObserver.maybeOf(context);
    if (identical(observer, _scrollNotificationObserver)) return;

    _unsubscribeScrollNotificationObserver();
    _scrollNotificationObserver = observer;
    _scrollNotificationObserver?.addListener(_handleScrollNotification);
  }

  void _scheduleAutoPositionUpdate() {
    if (_autoPositionUpdateScheduled) return;
    _autoPositionUpdateScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoPositionUpdateScheduled = false;
      _calculatePosition();
    });
  }

  void _handleScrollNotification(ScrollNotification notification) {
    if (!widget.visible || !_isAutoAnchor) return;

    // Check if the notification is a scroll update notification and if the
    // `notification.depth` is 0. This way we only listen to the scroll
    // notifications from the closest scrollable, instead of those that may be
    // nested.
    if (notification is ScrollUpdateNotification &&
        defaultScrollNotificationPredicate(notification)) {
      // Recalculate the position of the portal on scroll.
      _scheduleAutoPositionUpdate();
    }
  }

  void updateVisibility() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final shouldShow = widget.visible;
      if (shouldShow) {
        _calculatePosition();
        show();
      } else {
        if (_calculatedTarget != null) {
          setState(() => _calculatedTarget = null);
        }
        hide();
      }

      // Keep scroll listener registration in sync with the actual visibility.
      _syncScrollNotificationObserver();
    });
  }

  void hide() {
    if (overlayPortalController.isShowing) {
      overlayPortalController.hide();
    }
  }

  void show() {
    if (!overlayPortalController.isShowing) {
      overlayPortalController.show();
    }
  }

  void _calculatePosition() {
    // Only auto-position when the overlay is visible.
    if (!mounted || !widget.visible || widget.anchor is! ShadAnchorAuto) return;

    final anchor = widget.anchor as ShadAnchorAuto;
    final box = context.findRenderObject();
    final overlayState = Overlay.of(context, debugRequiredFor: widget);
    final overlayAncestor = overlayState.context.findRenderObject();

    final ready =
        box is RenderBox &&
        box.attached &&
        box.hasSize &&
        overlayAncestor is RenderBox &&
        overlayAncestor.attached &&
        overlayAncestor.hasSize;

    if (!ready) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _calculatePosition();
      });
      return;
    }

    final overlay = overlayKey.currentContext?.findRenderObject() as RenderBox?;
    final overlaySize = (true == overlay?.hasSize) ? overlay!.size : Size.zero;

    final targetOffset = switch (anchor.targetAnchor) {
      Alignment.topLeft => box.size.topLeft(Offset.zero),
      Alignment.topCenter => box.size.topCenter(Offset.zero),
      Alignment.topRight => box.size.topRight(Offset.zero),
      Alignment.centerLeft => box.size.centerLeft(Offset.zero),
      Alignment.center => box.size.center(Offset.zero),
      Alignment.centerRight => box.size.centerRight(Offset.zero),
      Alignment.bottomLeft => box.size.bottomLeft(Offset.zero),
      Alignment.bottomCenter => box.size.bottomCenter(Offset.zero),
      Alignment.bottomRight => box.size.bottomRight(Offset.zero),
      final alignment => throw Exception(
        """ShadAnchorAuto doesn't support the alignment $alignment you provided""",
      ),
    };

    var followerOffset = switch (anchor.followerAnchor) {
      Alignment.topLeft => Offset(-overlaySize.width / 2, -overlaySize.height),
      Alignment.topCenter => Offset(0, -overlaySize.height),
      Alignment.topRight => Offset(overlaySize.width / 2, -overlaySize.height),
      Alignment.centerLeft => Offset(
        -overlaySize.width / 2,
        -overlaySize.height / 2,
      ),
      Alignment.center => Offset(0, -overlaySize.height / 2),
      Alignment.centerRight => Offset(
        overlaySize.width / 2,
        -overlaySize.height / 2,
      ),
      Alignment.bottomLeft => Offset(-overlaySize.width / 2, 0),
      Alignment.bottomCenter => Offset.zero,
      Alignment.bottomRight => Offset(overlaySize.width / 2, 0),
      final alignment => throw Exception(
        """ShadAnchorAuto doesn't support the alignment $alignment you provided""",
      ),
    };

    followerOffset += targetOffset + anchor.offset;

    final target = box.localToGlobal(
      followerOffset,
      ancestor: overlayAncestor,
    );

    if (target != _calculatedTarget) {
      if (mounted) {
        setState(() {
          _calculatedTarget = target;
        });
      }
    } else if (overlay == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _calculatePosition();
      });
    } else {
      // The target is unchanged but the overlay render object now exists.
      // Force a rebuild so that the overlay becomes visible (it was initially
      // built with Visibility.maintain(visible: false) while the render
      // object was being created).
      if (mounted) {
        setState(() {});
      }
    }
  }

  Widget buildAutoPosition(
    BuildContext context,
    ShadAnchorAuto anchor,
  ) {
    if (anchor.followTargetOnResize) {
      MediaQuery.sizeOf(context);
    }

    if (_calculatedTarget == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _calculatePosition());
      return const SizedBox.shrink();
    }

    final target = _calculatedTarget!;

    final overlay = overlayKey.currentContext?.findRenderObject() as RenderBox?;

    if (overlay == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _calculatePosition();
      });
    }

    return CustomSingleChildLayout(
      delegate: ShadPositionDelegate(
        target: target,
        verticalOffset: 0,
        preferBelow: true,
      ),
      child: KeyedSubtree(
        key: overlayKey,
        child: Visibility.maintain(
          // The overlay layout details are available only after the view is
          // rendered, in this way we can avoid the flickering effect.
          visible: overlay != null,
          child: IgnorePointer(
            ignoring: overlay == null,
            child: widget.portalBuilder(context),
          ),
        ),
      ),
    );
  }

  Widget buildManualPosition(
    BuildContext context,
    ShadAnchor anchor,
  ) {
    return CompositedTransformFollower(
      link: layerLink,
      offset: anchor.offset,
      followerAnchor: anchor.childAlignment,
      targetAnchor: anchor.overlayAlignment,
      child: widget.portalBuilder(context),
    );
  }

  Widget buildGlobalPosition(
    BuildContext context,
    ShadGlobalAnchor anchor,
  ) {
    return CustomSingleChildLayout(
      delegate: ShadPositionDelegate(
        target: anchor.offset,
        verticalOffset: 0,
        preferBelow: true,
      ),
      child: widget.portalBuilder(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: OverlayPortal(
        controller: overlayPortalController,
        overlayChildBuilder: (context) {
          return Center(
            widthFactor: 1,
            heightFactor: 1,
            child: switch (widget.anchor) {
              final ShadAnchorAuto anchor => buildAutoPosition(context, anchor),
              final ShadAnchor anchor => buildManualPosition(context, anchor),
              final ShadGlobalAnchor anchor => buildGlobalPosition(
                context,
                anchor,
              ),
            },
          );
        },
        child: widget.child,
      ),
    );
  }
}

/// A delegate for computing the layout of an overlay to be displayed above or
/// below a target specified in the global coordinate system.
class ShadPositionDelegate extends SingleChildLayoutDelegate {
  /// Creates a delegate for computing the layout of an overlay.
  ShadPositionDelegate({
    required this.target,
    required this.verticalOffset,
    required this.preferBelow,
  });

  /// The offset of the target the overlay is positioned near in the global
  /// coordinate system.
  final Offset target;

  /// The amount of vertical distance between the target and the displayed
  /// overlay.
  final double verticalOffset;

  /// Whether the overlay is displayed below its widget by default.
  ///
  /// If there is insufficient space to display the tooltip in the preferred
  /// direction, the tooltip will be displayed in the opposite direction.
  final bool preferBelow;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) =>
      constraints.loosen();

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return positionDependentBox(
      size: size,
      childSize: childSize,
      target: target,
      verticalOffset: verticalOffset,
      preferBelow: preferBelow,
      margin: 0,
    );
  }

  @override
  bool shouldRelayout(ShadPositionDelegate oldDelegate) {
    return target != oldDelegate.target ||
        verticalOffset != oldDelegate.verticalOffset ||
        preferBelow != oldDelegate.preferBelow;
  }
}
