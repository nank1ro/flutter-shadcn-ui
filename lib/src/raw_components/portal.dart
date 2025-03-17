import 'package:flutter/material.dart';

/// The position of the [ShadPortal] in the global coordinate system.
sealed class ShadAnchorBase {
  const ShadAnchorBase();
}

/// Automatically infers the position of the [ShadPortal] in the global
/// coordinate system adjusting according to the [verticalOffset] and
/// [preferBelow] properties.
@immutable
class ShadAnchorAuto extends ShadAnchorBase {
  const ShadAnchorAuto({
    this.verticalOffset = 0,
    this.preferBelow = true,
    this.followTargetOnResize = true,
    this.alignment = Alignment.center,
  });

  /// The vertical offset of the overlay from the start of target widget.
  final double verticalOffset;

  /// Whether the overlay is displayed below its widget by default, if there is
  /// enough space.
  final bool preferBelow;

  /// Whether the overlay is automatically adjusted to follow the target
  /// widget when the target widget moves dues to a window resize.
  final bool followTargetOnResize;

  /// The position from where the overlay should be aligned.
  /// Using this property, the coordinates of target are adjusted.
  ///
  /// Defaults to [Alignment.center], meaning the overlay is aligned to the
  /// center of the target widget.
  final Alignment alignment;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadAnchorAuto &&
        other.verticalOffset == verticalOffset &&
        other.preferBelow == preferBelow &&
        other.followTargetOnResize == followTargetOnResize;
  }

  @override
  int get hashCode =>
      verticalOffset.hashCode ^
      preferBelow.hashCode ^
      followTargetOnResize.hashCode;
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

  @override
  void initState() {
    super.initState();
    updateVisibility();
  }

  @override
  void didUpdateWidget(covariant ShadPortal oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateVisibility();
  }

  @override
  void dispose() {
    hide();
    super.dispose();
  }

  void updateVisibility() {
    final shouldShow = widget.visible;

    WidgetsBinding.instance.addPostFrameCallback((timer) {
      shouldShow ? show() : hide();
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

  Widget buildAutoPosition(
    BuildContext context,
    ShadAnchorAuto anchor,
  ) {
    if (anchor.followTargetOnResize) {
      MediaQuery.sizeOf(context);
    }
    final overlayState = Overlay.of(context, debugRequiredFor: widget);
    final box = this.context.findRenderObject()! as RenderBox;
    final overlayAncestor =
        overlayState.context.findRenderObject()! as RenderBox;

    final overlay = overlayKey.currentContext?.findRenderObject() as RenderBox?;
    final overlaySize = overlay?.size ?? Size.zero;
    final boxFromAlignment = switch (anchor.alignment) {
      Alignment.topLeft =>
        box.size.topLeft(Offset(-overlaySize.width / 2, -overlaySize.height)),
      Alignment.topCenter => box.size.topCenter(Offset(0, -overlaySize.height)),
      Alignment.topRight =>
        box.size.topRight(Offset(overlaySize.width / 2, -overlaySize.height)),
      Alignment.centerLeft => box.size
          .centerLeft(Offset(-overlaySize.width / 2, -overlaySize.height / 2)),
      Alignment.center => box.size.center(Offset(0, -overlaySize.height / 2)),
      Alignment.centerRight => box.size
          .centerRight(Offset(overlaySize.width / 2, -overlaySize.height / 2)),
      Alignment.bottomLeft =>
        box.size.bottomLeft(Offset(-overlaySize.width / 2, 0)),
      Alignment.bottomCenter => box.size.bottomCenter(Offset.zero),
      Alignment.bottomRight =>
        box.size.bottomRight(Offset(overlaySize.width / 2, 0)),
      final alignment => throw Exception(
          """ShadAnchorAuto doesn't support the alignment $alignment you provided""",
        ),
    };
    final target = box.localToGlobal(
      boxFromAlignment,
      ancestor: overlayAncestor,
    );
    return CustomSingleChildLayout(
      delegate: ShadPositionDelegate(
        target: target,
        verticalOffset: anchor.verticalOffset,
        preferBelow: anchor.preferBelow,
      ),
      child: KeyedSubtree(
        key: overlayKey,
        child: Visibility.maintain(
          // The overlay layout details are available only after the view is
          // rendered, in this way we can avoid the flickering effect.
          visible: overlay != null,
          child: widget.portalBuilder(context),
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
          return Material(
            type: MaterialType.transparency,
            child: Center(
              widthFactor: 1,
              heightFactor: 1,
              child: switch (widget.anchor) {
                final ShadAnchorAuto anchor =>
                  buildAutoPosition(context, anchor),
                final ShadAnchor anchor => buildManualPosition(context, anchor),
                final ShadGlobalAnchor anchor =>
                  buildGlobalPosition(context, anchor),
              },
            ),
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
