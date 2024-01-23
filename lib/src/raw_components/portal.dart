import 'package:flutter/material.dart';

class ShadcnAnchor {
  const ShadcnAnchor({
    required this.childAlignment,
    required this.overlayAlignment,
    required this.offset,
  });

  final Alignment childAlignment;
  final Alignment overlayAlignment;
  final Offset offset;

  static const center = ShadcnAnchor(
    childAlignment: Alignment.topCenter,
    overlayAlignment: Alignment.bottomCenter,
    offset: Offset.zero,
  );

  ShadcnAnchor copyWith({
    Alignment? childAlignment,
    Alignment? overlayAlignment,
    Offset? offset,
  }) {
    return ShadcnAnchor(
      childAlignment: childAlignment ?? this.childAlignment,
      overlayAlignment: overlayAlignment ?? this.overlayAlignment,
      offset: offset ?? this.offset,
    );
  }
}

class ShadcnPortal extends StatefulWidget {
  const ShadcnPortal({
    super.key,
    required this.child,
    required this.overlay,
    required this.visible,
    required this.anchor,
  });

  final Widget child;
  final Widget overlay;
  final bool visible;
  final ShadcnAnchor anchor;

  @override
  State<ShadcnPortal> createState() => _ShadcnPortalState();
}

class _ShadcnPortalState extends State<ShadcnPortal> {
  final layerLink = LayerLink();
  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();
    updateVisibility();
  }

  @override
  void didUpdateWidget(covariant ShadcnPortal oldWidget) {
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
