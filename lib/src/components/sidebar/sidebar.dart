import 'package:flutter/material.dart';

import 'package:shadcn_ui/src/components/sidebar/common/enums.dart';
import 'package:shadcn_ui/src/components/sidebar/sidebar_controller.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';
import 'package:shadcn_ui/src/utils/border.dart';

/// A widget that holds the configuration and content for a sidebar.
///
/// This widget is used with `ShadSidebarScaffold` to define the appearance,
/// content, and behavior of a sidebar. It is a stateless widget that simply
/// provides the configuration to the scaffold, which then handles the state
/// and animation.
class ShadSidebar extends StatelessWidget {
  const ShadSidebar.variant({
    super.key,
    this.header,
    this.content,
    this.footer,
    this.backgroundColor,
    this.borderColor,
    this.side,
    this.animationDuration,
    this.animationCurve,
    this.collapseMode,
    this.collapsedToIconsWidth,
    this.extendedWidth,
    this.mobileWidth,
    this.mobileBreakPoint,
    this.keyboardShortcut,
    required this.variant,
    this.initiallyExtended = true,
  });

  /// Creates a sidebar with the `ShadSidebarVariant.normal` variant.
  const ShadSidebar.normal({
    super.key,
    this.header,
    this.content,
    this.footer,
    this.backgroundColor,
    this.borderColor,
    this.side,
    this.animationDuration,
    this.animationCurve,
    this.collapseMode,
    this.collapsedToIconsWidth,
    this.extendedWidth,
    this.mobileWidth,
    this.mobileBreakPoint,
    this.keyboardShortcut,
    this.initiallyExtended = true,
  }) : variant = ShadSidebarVariant.normal;

  /// Creates a sidebar with the `ShadSidebarVariant.floating` variant.
  const ShadSidebar.floating({
    super.key,
    this.header,
    this.content,
    this.footer,
    this.backgroundColor,
    this.borderColor,
    this.side,
    this.animationDuration,
    this.animationCurve,
    this.collapseMode,
    this.collapsedToIconsWidth,
    this.extendedWidth,
    this.mobileWidth,
    this.mobileBreakPoint,
    this.keyboardShortcut,
    this.initiallyExtended = true,
  }) : variant = ShadSidebarVariant.floating;

  /// Creates a sidebar with the `ShadSidebarVariant.inset` variant.
  const ShadSidebar.inset({
    super.key,
    this.header,
    this.content,
    this.footer,
    this.backgroundColor,
    this.borderColor,
    this.side,
    this.animationDuration,
    this.animationCurve,
    this.collapseMode,
    this.collapsedToIconsWidth,
    this.extendedWidth,
    this.mobileWidth,
    this.mobileBreakPoint,
    this.keyboardShortcut,
    this.initiallyExtended = true,
  }) : variant = ShadSidebarVariant.inset;

  /// The header of the sidebar.
  final ShadSidebarHeader? header;

  /// The main content of the sidebar.
  final ShadSidebarContent? content;

  /// The footer of the sidebar.
  final ShadSidebarFooter? footer;

  /// The background color of the sidebar.
  final Color? backgroundColor;

  /// The color of the sidebar's border.
  final Color? borderColor;

  /// The visual style of the sidebar.
  final ShadSidebarVariant variant;

  /// The side of the screen where the sidebar is located.
  final ShadSidebarSide? side;

  /// Whether the sidebar is initially extended.
  final bool initiallyExtended;

  /// The duration of the animation when the sidebar is extended or collapsed.
  final Duration? animationDuration;

  /// The curve of the animation when the sidebar is extended or collapsed.
  final Curve? animationCurve;

  /// The collapse mode of the sidebar.
  final ShadSidebarCollapseMode? collapseMode;

  /// The width of the sidebar when it's collapsed to icons.
  final double? collapsedToIconsWidth;

  /// The width of the sidebar when it's extended.
  final double? extendedWidth;

  /// The width of the sidebar when it's shown on mobile.
  final double? mobileWidth;

  /// The breakpoint at which the sidebar switches to mobile view.
  final double? mobileBreakPoint;

  /// The keyboard shortcut to toggle the sidebar.
  final ShortcutActivator? keyboardShortcut;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveBackgroundColor =
        backgroundColor ?? theme.colorScheme.sidebar;

    final sidebarContent = ColoredBox(
      color: effectiveBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (header != null) header!,
          Expanded(child: content ?? const SizedBox.shrink()),
          if (footer != null) footer!,
        ],
      ),
    );

    return switch (variant) {
      ShadSidebarVariant.normal => _buildNormalVariant(context, sidebarContent),
      ShadSidebarVariant.floating =>
        _buildFloatingVariant(context, sidebarContent),
      ShadSidebarVariant.inset => sidebarContent,
    };
  }

  Widget _buildNormalVariant(
    BuildContext context,
    Widget sidebar,
  ) {
    final theme = ShadTheme.of(context).sidebarTheme;
    final side = this.side ?? theme.side ?? ShadSidebarSide.left;

    final effectiveBorderColor =
        borderColor ?? ShadTheme.of(context).colorScheme.border;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            sidebar,
            _ResizeHandle(
              width: constraints.maxWidth,
              side: side,
              borderColor: effectiveBorderColor,
            ),
          ],
        );
      },
    );
  }

  Widget _buildFloatingVariant(
    BuildContext context,
    Widget sidebar,
  ) {
    final theme = ShadTheme.of(context);

    final effectiveBorderColor = borderColor ?? theme.colorScheme.border;

    return Container(
      margin: const EdgeInsets.all(8),
      child: ShadDecorator(
        decoration: ShadDecoration(
          border: ShadBorder.all(
            radius: theme.radius,
            width: 1,
            color: effectiveBorderColor,
          ),
          shadows: ShadShadows.sm,
        ),
        child: ClipRRect(
          borderRadius: theme.radius,
          child: sidebar,
        ),
      ),
    );
  }
}

class _ResizeHandle extends StatefulWidget {
  const _ResizeHandle({
    required this.width,
    required this.side,
    required this.borderColor,
  });

  final double width;
  final ShadSidebarSide side;
  final Color borderColor;

  @override
  State<_ResizeHandle> createState() => _ResizeHandleState();
}

class _ResizeHandleState extends State<_ResizeHandle> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: widget.side.isRight ? null : (widget.width - 17),
      right: widget.side.isRight ? (widget.width - 17) : null,
      child: SizedBox(
        width: 16,
        child: InkWell(
          mouseCursor: SystemMouseCursors.resizeColumn,
          onTap: () => ShadSidebarController.maybeOf(context)?.toggle(context),
          onHover: (value) => setState(() => _isHovered = value),
          child: Container(
            alignment: widget.side.isRight
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: VerticalDivider(
              width: 1,
              thickness: _isHovered ? 2 : 0,
              color: widget.borderColor,
            ),
          ),
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
