import 'package:flutter/material.dart';

class Anchor {
  const Anchor({
    required this.childAlignment,
    required this.overlayAlignment,
    required this.offset,
  });

  final Alignment childAlignment;
  final Alignment overlayAlignment;
  final Offset offset;

  static const center = Anchor(
    childAlignment: Alignment.topCenter,
    overlayAlignment: Alignment.bottomCenter,
    offset: Offset.zero,
  );

  Anchor copyWith({
    Alignment? childAlignment,
    Alignment? overlayAlignment,
    Offset? offset,
  }) {
    return Anchor(
      childAlignment: childAlignment ?? this.childAlignment,
      overlayAlignment: overlayAlignment ?? this.overlayAlignment,
      offset: offset ?? this.offset,
    );
  }
}

class Portal extends StatefulWidget {
  const Portal({
    super.key,
    required this.child,
    required this.overlay,
    required this.visible,
    required this.anchor,
  });

  final Widget child;
  final Widget overlay;
  final bool visible;
  final Anchor anchor;

  @override
  State<Portal> createState() => _PortalState();
}

class _PortalState extends State<Portal> {
  final layerLink = LayerLink();
  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();
    updateVisibility();
  }

  @override
  void didUpdateWidget(covariant Portal oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateVisibility();
  }

  @override
  void dispose() {
    hideOverlay();
    super.dispose();
  }

  void updateVisibility() {
    final shouldShow = widget.visible && entry == null;

    WidgetsBinding.instance.addPostFrameCallback((timer) {
      shouldShow ? showOverlay() : hideOverlay();
    });
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  void showOverlay() {
    if (entry != null) return;
    entry = OverlayEntry(
      builder: (context) => Material(
        type: MaterialType.transparency,
        child: Center(
          child: CompositedTransformFollower(
            link: layerLink,
            offset: widget.anchor.offset,
            followerAnchor: widget.anchor.overlayAlignment,
            targetAnchor: widget.anchor.childAlignment,
            child: widget.overlay,
          ),
        ),
      ),
    );
    Overlay.of(context).insert(entry!);
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: widget.child,
    );
  }
}
