import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/components/sidebar/sidebar_scope.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

/// The scrollable middle section of a [ShadSidebar].
///
/// Placed between [ShadSidebarHeader] and [ShadSidebarFooter].
/// Wraps its [children] in a vertically scrolling list.
///
/// ```dart
/// ShadSidebarContent(
///   children: [
///     ShadSidebarGroup(...),
///     ShadSidebarSeparator(),
///     ShadSidebarGroup(...),
///   ],
/// )
/// ```
class ShadSidebarContent extends StatelessWidget {
  const ShadSidebarContent({
    super.key,
    required this.children,
    this.padding,
    this.controller,
    this.physics,
  });

  /// The widgets displayed inside the scrollable area.
  ///
  /// Typically a list of [ShadSidebarGroup], [ShadSidebarSeparator],
  /// or any other widget.
  final List<Widget> children;

  /// Padding applied inside the scrollable area, around all [children].
  final EdgeInsetsGeometry? padding;

  /// An optional [ScrollController] for the internal scroll view.
  final ScrollController? controller;

  /// Scroll physics for the internal scroll view.
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final sidebarTheme = theme.sidebarTheme;
    final scope = ShadSidebarScope.maybeOf(context);

    final effectivePadding =
        padding ?? sidebarTheme.contentPadding ?? EdgeInsets.zero;

    final isIconCollapsed = scope?.isIconCollapsed ?? false;

    Widget scrollView = SingleChildScrollView(
      controller: controller,
      physics: physics,
      padding: effectivePadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );

    // Hide scrollbar when collapsed to icon-only rail.
    if (isIconCollapsed) {
      scrollView = ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: scrollView,
      );
    }

    return Expanded(child: scrollView);
  }
}
