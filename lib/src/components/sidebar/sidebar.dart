import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/components/sidebar/sidebar_scope.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';

class ShadSidebar extends StatelessWidget {
  const ShadSidebar({
    super.key,
    required this.content,
    this.header,
    this.footer,
    this.width,
    this.collapsedWidth,
    this.decoration,
    this.backgroundColor,
    this.floatingMargin,
    this.floatingBorderRadius,
    this.floatingShadow,
  });

  final Widget content;
  final Widget? header;
  final Widget? footer;
  final double? width;
  final double? collapsedWidth;
  final ShadDecoration? decoration;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? floatingMargin;
  final BorderRadiusGeometry? floatingBorderRadius;
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

    final effectiveBorderColor =
        colorScheme.sidebarBorder ?? colorScheme.border;

    final effectiveDecoration = decoration ?? sidebarTheme.decoration;

    final effectiveFloatingMargin =
        floatingMargin ??
        sidebarTheme.floatingMargin ??
        const EdgeInsets.all(8);

    final effectiveFloatingBorderRadius =
        floatingBorderRadius ??
        sidebarTheme.floatingBorderRadius ??
        BorderRadius.circular(8);

    final effectiveFloatingShadow =
        floatingShadow ?? sidebarTheme.floatingShadow ?? ShadShadows.sm;

    final sidebarBody = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ?header,
        content,
        ?footer,
      ],
    );

    // Build variant-specific container
    final container = _buildVariantContainer(
      scope: scope,
      theme: theme,
      sidebarBody: sidebarBody,
      effectiveBackgroundColor: effectiveBackgroundColor,
      effectiveBorderColor: effectiveBorderColor,
      effectiveDecoration: effectiveDecoration,
      effectiveFloatingMargin: effectiveFloatingMargin,
      effectiveFloatingBorderRadius: effectiveFloatingBorderRadius,
      effectiveFloatingShadow: effectiveFloatingShadow,
    );

    // Mobile — full width, scaffold handles slide
    if (scope.isMobile) {
      return SizedBox(
        width: scope.expandedWidth,
        child: container,
      );
    }

    // Non-collapsible — fixed width
    if (scope.collapsibleMode == ShadSidebarCollapsibleMode.none) {
      return SizedBox(
        width: scope.expandedWidth,
        child: container,
      );
    }

    // Animated — single widget tree for all states
    return AnimatedBuilder(
      animation: scope.animation,
      builder: (context, child) {
        final currentWidth = scope.currentWidth;
        if (currentWidth <= 0) return const SizedBox.shrink();
        return ClipRect(
          child: Container(
            margin: scope.variant == ShadSidebarVariant.floating
                ? effectiveFloatingMargin
                : null,
            width: currentWidth,
            child: child,
          ),
        );
      },
      child: container,
    );
  }

  Widget _buildVariantContainer({
    required ShadSidebarScope scope,
    required ShadThemeData theme,
    required Widget sidebarBody,
    required Color effectiveBackgroundColor,
    required ShadDecoration? effectiveDecoration,
    required EdgeInsetsGeometry effectiveFloatingMargin,
    required BorderRadiusGeometry effectiveFloatingBorderRadius,
    required List<BoxShadow> effectiveFloatingShadow,
    required Color effectiveBorderColor,
  }) {
    if (scope.variant == ShadSidebarVariant.floating) {
      return Container(
        decoration: BoxDecoration(
          color: effectiveBackgroundColor,
          borderRadius: effectiveFloatingBorderRadius,
          border: Border.all(color: effectiveBorderColor),
          boxShadow: effectiveFloatingShadow,
        ),
        clipBehavior: Clip.antiAlias,
        child: sidebarBody,
      );
    }

    if (scope.variant == ShadSidebarVariant.inset) {
      return ColoredBox(
        color: effectiveBackgroundColor,
        child: sidebarBody,
      );
    }

    // -------------------------------------------------------------------
    // Default — ShadDecorator with theme decoration
    // -------------------------------------------------------------------
    return ShadDecorator(
      decoration: effectiveDecoration,
      child: ColoredBox(
        color: effectiveBackgroundColor,
        child: sidebarBody,
      ),
    );
  }
}
