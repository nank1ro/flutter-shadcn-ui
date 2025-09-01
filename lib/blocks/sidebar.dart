import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

/// A composable sidebar component inspired by shadcn/ui.
///
/// This is a complete sidebar implementation that follows the shadcn/ui patterns
/// and can be used as a building block in Flutter applications. It provides
/// collapsible behavior, theming integration, and support for header, footer,
/// and grouped navigation items.
///
/// The sidebar supports:
/// - Smooth collapse/expand animations
/// - Customizable header and footer sections
/// - Grouped navigation items with labels
/// - Hover effects and active states
/// - Theme integration for consistent styling
/// - Responsive width and padding
///
/// Example:
/// ```dart
/// ShadSidebar(
///   width: 280,
///   isCollapsed: false,
///   header: ShadSidebarHeader(
///     title: 'My App',
///     logo: Icon(Icons.home),
///   ),
///   navGroups: [
///     ShadSidebarGroup(
///       label: 'Main',
///       items: [
///         ShadSidebarNavItem(
///           title: 'Dashboard',
///           icon: Icon(Icons.dashboard),
///           onTap: () => print('Dashboard tapped'),
///         ),
///       ],
///     ),
///   ],
///   footer: ShadSidebarFooter(
///     user: ShadSidebarUser(
///       name: 'John Doe',
///       email: 'john@example.com',
///     ),
///   ),
/// )
/// ```
class ShadSidebar extends StatefulWidget {
  /// Creates a sidebar widget.
  ///
  /// [navGroups] contains the navigation groups to display.
  /// [width] sets the expanded width of the sidebar (default: 280).
  /// [isCollapsed] controls the collapsed state.
  /// [onCollapsedChanged] is called when the collapsed state changes.
  /// [header] and [footer] are optional widgets for branding and user info.
  /// Color and padding can be customized with the respective parameters.
  const ShadSidebar({
    super.key,
    this.header,
    this.footer,
    this.navGroups = const [],
    this.width = 280,
    this.isCollapsed = false,
    this.onCollapsedChanged,
    this.backgroundColor,
    this.borderColor,
    this.padding,
  });

  /// Optional header widget displayed at the top of the sidebar.
  /// 
  /// Typically a [ShadSidebarHeader] with app logo and title,
  /// but can be any widget for custom header content.
  final Widget? header;

  /// Optional footer widget displayed at the bottom of the sidebar.
  /// 
  /// Typically a [ShadSidebarFooter] with user information,
  /// but can be any widget for custom footer content.
  final Widget? footer;

  /// List of navigation groups to display in the sidebar content.
  /// 
  /// Each group is typically a [ShadSidebarGroup] containing
  /// related navigation items with optional grouping labels.
  final List<Widget> navGroups;

  /// Width of the sidebar when expanded.
  /// 
  /// Defaults to 280 pixels. When collapsed, the sidebar
  /// animates to zero width and becomes completely hidden.
  final double width;

  /// Whether the sidebar is currently collapsed.
  /// 
  /// When true, the sidebar animates to zero width and content
  /// becomes hidden. When false, the sidebar expands to [width].
  final bool isCollapsed;

  /// Callback invoked when the collapsed state should change.
  /// 
  /// Provides the new collapsed state as a boolean value.
  /// Use this to update the parent widget's state.
  final ValueChanged<bool>? onCollapsedChanged;

  /// Background color override for the sidebar.
  /// 
  /// If not provided, uses [ShadTheme.colorScheme.card] for
  /// consistent theming with the design system.
  final Color? backgroundColor;

  /// Border color override for the sidebar.
  /// 
  /// If not provided, uses [ShadTheme.colorScheme.border] for
  /// consistent theming with the design system.
  final Color? borderColor;

  /// Padding override for sidebar content areas.
  /// 
  /// If not provided, uses symmetric padding of 12 horizontal
  /// and 8 vertical pixels for consistent spacing.
  final EdgeInsetsGeometry? padding;

  @override
  State<ShadSidebar> createState() => _ShadSidebarState();
}

class _ShadSidebarState extends State<ShadSidebar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _updateAnimation();
    if (widget.isCollapsed) {
      _animationController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(ShadSidebar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isCollapsed != widget.isCollapsed) {
      if (widget.isCollapsed) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
    if (oldWidget.width != widget.width) {
      _updateAnimation();
    }
  }

  void _updateAnimation() {
    _widthAnimation = Tween<double>(
      begin: widget.width,
      end: 0, // Completely hidden when collapsed
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveBackgroundColor = widget.backgroundColor ??
        theme.colorScheme.card;
    final effectiveBorderColor = widget.borderColor ??
        theme.colorScheme.border;

    return AnimatedBuilder(
      animation: _widthAnimation,
      builder: (context, child) {
        // If width is very small (nearly collapsed), don't render content
        if (_widthAnimation.value < 1) {
          return const SizedBox.shrink();
        }

        return ClipRect(
          child: Container(
            width: _widthAnimation.value,
            decoration: BoxDecoration(
              color: effectiveBackgroundColor,
              border: Border(
                right: BorderSide(
                  color: effectiveBorderColor,
                  width: 1,
                ),
              ),
            ),
            child: Opacity(
              opacity: widget.isCollapsed ? 0.0 : 1.0,
              child: SizedBox(
                width: widget.width,
                child: Column(
                  children: [
                    // Header
                    if (widget.header != null)
                      Container(
                        width: double.infinity,
                        padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: effectiveBorderColor,
                              width: 1,
                            ),
                          ),
                        ),
                        child: widget.header!,
                      ),
                    // Content
                    Expanded(
                      child: SingleChildScrollView(
                        padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0; i < widget.navGroups.length; i++) ...[
                              widget.navGroups[i],
                              if (i < widget.navGroups.length - 1)
                                const SizedBox(height: 16),
                            ],
                          ],
                        ),
                      ),
                    ),
                    // Footer
                    if (widget.footer != null)
                      Container(
                        width: double.infinity,
                        padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: effectiveBorderColor,
                              width: 1,
                            ),
                          ),
                        ),
                        child: widget.footer!,
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
