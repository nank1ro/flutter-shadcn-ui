import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart' show ShadSidebarScaffold;
import 'package:shadcn_ui/src/theme/theme.dart';

/// A sidebar component that can be used with [ShadSidebarScaffold].
///
/// This component provides a layout for a sidebar with an optional header,
/// content, and footer.
class ShadSidebar extends StatelessWidget {
  /// Creates a [ShadSidebar].
  const ShadSidebar({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    this.header,
    this.content,
    this.footer,
  });

  final double? width;

  final double? height;

  final Color? backgroundColor;

  final ShadSidebarHeader? header;

  final ShadSidebarContent? content;

  final ShadSidebarFooter? footer;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveBackgroundColor = backgroundColor ??
        theme.sidebarTheme.backgroundColor ??
        theme.colorScheme.sidebar;

    return ColoredBox(
      color: effectiveBackgroundColor,
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: width,
          height: height,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (header != null) header!,
            Expanded(child: content ?? const SizedBox.shrink()),
            if (footer != null) footer!,
          ],
        ),
      ),
    );
  }
}

/// The header of the sidebar.
class ShadSidebarHeader extends _WidgetListTemplate {
  const ShadSidebarHeader({
    super.key,
    super.padding = const EdgeInsets.all(8),
    super.children,
    super.childrenSpacing,
    super.mainAxisAlignment,
    super.crossAxisAlignment = CrossAxisAlignment.stretch,
  }) : super(scrollable: false);
}

/// The content of the sidebar.
///
/// This is the main area of the sidebar and is scrollable by default.
class ShadSidebarContent extends _WidgetListTemplate {
  const ShadSidebarContent({
    super.key,
    super.padding = EdgeInsets.zero,
    super.mainAxisAlignment = MainAxisAlignment.start,
    super.childrenSpacing = 8,
    super.scrollable = true,
    super.children,
    super.alwaysShowScrollbar,
  });
}

/// The footer of the sidebar.
class ShadSidebarFooter extends _WidgetListTemplate {
  const ShadSidebarFooter({
    super.key,
    super.children,
    super.childrenSpacing,
    super.mainAxisAlignment,
    super.padding = const EdgeInsets.all(8),
  }) : super(scrollable: false);
}

class _WidgetListTemplate extends StatefulWidget {
  const _WidgetListTemplate({
    super.key,
    this.padding = EdgeInsets.zero,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.childrenSpacing = 0,
    this.scrollable = true,
    this.alwaysShowScrollbar = true,
    this.children = const [],
  });
  final EdgeInsetsGeometry padding;
  final List<Widget> children;
  final bool scrollable;
  final double childrenSpacing;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final bool alwaysShowScrollbar;

  @override
  State<_WidgetListTemplate> createState() => _WidgetListTemplateState();
}

class _WidgetListTemplateState extends State<_WidgetListTemplate> {
  // A scroll controller is created to ensure the [Scrollbar] and
  // [CustomScrollView] are always linked, especially on mobile, where the
  // sidebar is rendered in a [ShadSheet] that does not have a default
  // [PrimaryScrollController]. This prevents a "ScrollController not attached"
  // error.
  late final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: widget.mainAxisAlignment,
      crossAxisAlignment: widget.crossAxisAlignment,
      spacing: widget.childrenSpacing,
      children: widget.children,
    );
    if (!widget.scrollable) {
      return Padding(padding: widget.padding, child: content);
    }
    return Scrollbar(
      controller: _scrollController,
      thumbVisibility: widget.alwaysShowScrollbar,
      child: CustomScrollView(
        controller: _scrollController,
        primary: false,
        slivers: [
          SliverPadding(
            padding: widget.padding,
            sliver: SliverFillRemaining(
              hasScrollBody: false,
              child: content,
            ),
          ),
        ],
      ),
    );
  }
}
