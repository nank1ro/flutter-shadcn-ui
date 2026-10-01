import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/components/sidebar/scope.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';

class ShadSidebar extends StatelessWidget {
  const ShadSidebar({
    required this.content,
    super.key,
    this.header,
    this.footer,
    this.decoration,
    this.backgroundColor,
    this.floatingMargin,
    this.floatingBorderRadius,
    this.floatingShadow,
  });

  final Widget content;
  final Widget? header;
  final Widget? footer;

  /// {@template ShadSidebar.decoration}
  /// Decoration for the sidebar container.
  /// {@endtemplate}
  final ShadDecoration? decoration;

  /// {@template ShadSidebar.backgroundColor}
  /// Background color of the sidebar. Convenience shorthand; if [decoration]
  /// is also provided, [decoration] takes precedence.
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template ShadSidebar.floatingMargin}
  /// Margin around the sidebar when using the floating variant.
  /// {@endtemplate}
  final EdgeInsetsGeometry? floatingMargin;

  /// {@template ShadSidebar.floatingBorderRadius}
  /// Border radius of the sidebar when using the floating variant.
  /// {@endtemplate}
  final BorderRadiusGeometry? floatingBorderRadius;

  /// {@template ShadSidebar.floatingShadow}
  /// Shadow for the floating variant. Defaults to ShadShadows.sm.
  /// {@endtemplate}
  final List<BoxShadow>? floatingShadow;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final sidebarTheme = theme.sidebarTheme;
    final colorScheme = theme.colorScheme;
    final scope = ShadSidebarScope.of(context);

    final effectiveBackgroundColor =
        backgroundColor ??
        sidebarTheme.backgroundColor ??
        colorScheme.sidebarBackground ??
        colorScheme.card;

    final effectiveDecoration = decoration ?? sidebarTheme.decoration;

    final effectiveBorderColor =
        colorScheme.sidebarBorder ?? colorScheme.border;

    final effectiveFloatingMargin =
        floatingMargin ??
        sidebarTheme.floatingMargin ??
        const EdgeInsets.all(8);

    final effectiveFloatingBorderRadius =
        floatingBorderRadius ??
        sidebarTheme.floatingBorderRadius ??
        BorderRadius.circular(8);

    final effectiveFloatingShadow =
        floatingShadow ?? sidebarTheme.floatingShadows ?? ShadShadows.sm;

    final sidebarBody = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ?header,
        content,
        ?footer,
      ],
    );

    final Widget container = switch (scope.variant) {
      ShadSidebarVariant.floating => _ShadSidebarFloatingContainer(
        borderRadius: effectiveFloatingBorderRadius,
        borderColor: effectiveBorderColor,
        backgroundColor: effectiveBackgroundColor,
        shadow: effectiveFloatingShadow,
        child: sidebarBody,
      ),
      ShadSidebarVariant.inset => _ShadSidebarInsetContainer(
        backgroundColor: effectiveBackgroundColor,
        child: sidebarBody,
      ),
      ShadSidebarVariant.sidebar => _ShadSidebarDefaultContainer(
        decoration: effectiveDecoration,
        backgroundColor: effectiveBackgroundColor,
        child: sidebarBody,
      ),
    };

    if (scope.isMobile) {
      return SizedBox(width: scope.expandedWidth, child: container);
    }

    if (scope.collapsibleMode == ShadSidebarCollapsibleMode.none) {
      return SizedBox(width: scope.expandedWidth, child: container);
    }

    final applyFloatingMargin = scope.isOpen || scope.isIconCollapsed;

    // Apply the margin to the sized-box and not the actual content
    // container. This to not take the margin from the content width.
    return Padding(
      padding:
          (scope.variant == ShadSidebarVariant.floating && applyFloatingMargin)
          ? effectiveFloatingMargin
          : EdgeInsets.zero,
      child: _ShadSidebarAnimatedWidth(
        animation: scope.animation,
        child: container,
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Animated width wrapper
// ---------------------------------------------------------------------------

class _ShadSidebarAnimatedWidth extends StatelessWidget {
  const _ShadSidebarAnimatedWidth({
    required this.animation,
    required this.child,
  });

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final scope = ShadSidebarScope.of(context);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final currentWidth = scope.currentWidth;
        if (currentWidth <= 0) return const SizedBox.shrink();
        return ClipRect(
          child: SizedBox(width: currentWidth, child: child),
        );
      },
      child: child,
    );
  }
}

// ---------------------------------------------------------------------------
// Floating variant container
// ---------------------------------------------------------------------------

class _ShadSidebarFloatingContainer extends StatelessWidget {
  const _ShadSidebarFloatingContainer({
    required this.borderRadius,
    required this.borderColor,
    required this.backgroundColor,
    required this.shadow,
    required this.child,
  });

  final BorderRadiusGeometry borderRadius;
  final Color borderColor;
  final Color backgroundColor;
  final List<BoxShadow> shadow;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: Border.all(color: borderColor),
        boxShadow: shadow,
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}

// ---------------------------------------------------------------------------
// Inset variant container
// ---------------------------------------------------------------------------

class _ShadSidebarInsetContainer extends StatelessWidget {
  const _ShadSidebarInsetContainer({
    required this.backgroundColor,
    required this.child,
  });

  final Color backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: backgroundColor, child: child);
  }
}

// ---------------------------------------------------------------------------
// Default variant container
// ---------------------------------------------------------------------------

class _ShadSidebarDefaultContainer extends StatelessWidget {
  const _ShadSidebarDefaultContainer({
    required this.decoration,
    required this.backgroundColor,
    required this.child,
  });

  final ShadDecoration? decoration;
  final Color backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShadDecorator(
      decoration: decoration,
      child: ColoredBox(color: backgroundColor, child: child),
    );
  }
}
