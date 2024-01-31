import 'package:flutter/material.dart';

class ShadAnchor {
  const ShadAnchor({
    required this.childAlignment,
    required this.overlayAlignment,
    required this.offset,
  });

  final Alignment childAlignment;
  final Alignment overlayAlignment;
  final Offset offset;

  static const center = ShadAnchor(
    childAlignment: Alignment.topCenter,
    overlayAlignment: Alignment.bottomCenter,
    offset: Offset.zero,
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
  final ShadAnchor anchor;

  @override
  State<ShadPortal> createState() => _ShadPortalState();
}

class _ShadPortalState extends State<ShadPortal> {
  final layerLink = LayerLink();
  final overlayPortalController = OverlayPortalController();

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

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: OverlayPortal(
        controller: overlayPortalController,
        overlayChildBuilder: (context) => Material(
          type: MaterialType.transparency,
          child: Center(
            child: CompositedTransformFollower(
              link: layerLink,
              offset: widget.anchor.offset,
              followerAnchor: widget.anchor.overlayAlignment,
              targetAnchor: widget.anchor.childAlignment,
              child: widget.portalBuilder(context),
            ),
          ),
        ),
        child: widget.child,
      ),
    );
  }
}
