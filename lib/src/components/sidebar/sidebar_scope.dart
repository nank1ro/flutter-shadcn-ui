import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/components/sidebar/sidebar_controller.dart';

// ---------------------------------------------------------------------------
// Enums
// ---------------------------------------------------------------------------

/// Which logical side of the scaffold the sidebar is placed on.
///
/// Automatically resolves to the correct physical side based on
/// [Directionality] (LTR vs RTL).
enum ShadSidebarSide {
  /// The starting edge: left in LTR, right in RTL.
  start,

  /// The ending edge: right in LTR, left in RTL.
  end;

  bool get isStart => this == start;
}

/// Visual variant of the sidebar.
enum ShadSidebarVariant {
  /// Flush against the edge, no gap between sidebar and content.
  sidebar,

  /// Inset from the edge with margin and rounded corners.
  floating,

  /// The content area itself gets an inset/rounded look.
  inset,
}

/// How the sidebar behaves when collapsed.
enum ShadSidebarCollapsibleMode {
  /// Slides completely off-screen.
  offcanvas,

  /// Shrinks to a narrow icon-only rail.
  icon,

  /// Cannot be collapsed; always fully visible.
  none,
}

// ---------------------------------------------------------------------------
// Scope
// ---------------------------------------------------------------------------

/// Inherited widget that provides sidebar state and configuration to
/// all descendants.
///
/// Placed by `ShadSidebarScaffold`. Consumers should use [of] or [maybeOf]
/// to access it.
class ShadSidebarScope extends InheritedWidget {
  const ShadSidebarScope({
    super.key,
    required this.controller,
    required this.animation,
    required this.variant,
    required this.side,
    required this.collapsibleMode,
    required this.isMobile,
    required this.expandedWidth,
    required this.collapsedWidth,
    required this.isOpen,
    required super.child,
  });

  /// The sidebar controller that manages open/close state.
  final ShadSidebarController controller;

  /// The running animation driven by the scaffold.
  ///
  /// - `1.0` → fully expanded
  /// - `0.0` → fully collapsed
  final Animation<double> animation;

  /// The visual variant of the sidebar.
  final ShadSidebarVariant variant;

  /// Which logical side of the scaffold this sidebar is on.
  final ShadSidebarSide side;

  /// How the sidebar behaves when collapsed.
  final ShadSidebarCollapsibleMode collapsibleMode;

  /// Whether the sidebar is currently in mobile/sheet mode.
  final bool isMobile;

  /// The width of the sidebar when fully expanded.
  final double expandedWidth;

  /// The width of the sidebar when collapsed in icon mode.
  final double collapsedWidth;

  final bool isOpen;

  // ---------------------------------------------------------------------------
  // Direction resolution
  // ---------------------------------------------------------------------------

  /// Resolves the logical [side] to a physical side based on
  /// the ambient [Directionality].
  ///
  /// Returns `true` if the sidebar should be physically on the **left**.
  static bool isPhysicallyLeft(BuildContext context, ShadSidebarSide side) {
    final textDirection = Directionality.of(context);
    switch (side) {
      case ShadSidebarSide.start:
        return textDirection == TextDirection.ltr;
      case ShadSidebarSide.end:
        return textDirection == TextDirection.rtl;
    }
  }

  // ---------------------------------------------------------------------------
  // Convenience getters
  // ---------------------------------------------------------------------------

  bool get isIconCollapsed =>
      collapsibleMode == ShadSidebarCollapsibleMode.icon && !isOpen;

  double get currentWidth {
    switch (collapsibleMode) {
      case ShadSidebarCollapsibleMode.icon:
        return collapsedWidth +
            (expandedWidth - collapsedWidth) * animation.value;
      case ShadSidebarCollapsibleMode.offcanvas:
        return expandedWidth * animation.value;
      case ShadSidebarCollapsibleMode.none:
        return expandedWidth;
    }
  }

  // ---------------------------------------------------------------------------
  // Accessors
  // ---------------------------------------------------------------------------

  /// Returns the nearest [ShadSidebarScope], or throws if none is found.
  static ShadSidebarScope of(BuildContext context) {
    final scope = context
        .dependOnInheritedWidgetOfExactType<ShadSidebarScope>();
    assert(
      scope != null,
      'No ShadSidebarScope found in context. '
      'Make sure to wrap your widget tree with ShadSidebarScaffold.',
    );
    return scope!;
  }

  /// Returns the nearest [ShadSidebarScope], or `null` if none is found.
  static ShadSidebarScope? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShadSidebarScope>();
  }

  // ---------------------------------------------------------------------------
  // updateShouldNotify
  // ---------------------------------------------------------------------------

  @override
  bool updateShouldNotify(ShadSidebarScope oldWidget) {
    return controller != oldWidget.controller ||
        animation != oldWidget.animation ||
        variant != oldWidget.variant ||
        side != oldWidget.side ||
        collapsibleMode != oldWidget.collapsibleMode ||
        isMobile != oldWidget.isMobile ||
        expandedWidth != oldWidget.expandedWidth ||
        collapsedWidth != oldWidget.collapsedWidth ||
        isOpen != oldWidget.isOpen;
  }
}
