import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show LucideIcons;
import 'package:shadcn_ui/src/components/sidebar/sidebar_nav_item.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

/// Individual menu item in the sidebar.
///
/// Displays a single navigation item with optional icon, hover effects,
/// and support for nested items through collapsible sections.
class ShadSidebarMenuItem extends StatefulWidget {
  /// Creates a sidebar menu item.
  ///
  /// [item] contains the navigation data and configuration for this menu item.
  const ShadSidebarMenuItem({
    super.key,
    required this.item,
  });

  /// The navigation item data to display.
  final ShadSidebarNavItem item;

  @override
  State<ShadSidebarMenuItem> createState() => _ShadSidebarMenuItemState();
}

class _ShadSidebarMenuItemState extends State<ShadSidebarMenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    // Main item button
    final mainButton = MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.item.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            color: widget.item.isActive 
                ? theme.colorScheme.accent 
                : _isHovered 
                    ? theme.colorScheme.accent.withOpacity(0.1)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              if (widget.item.icon != null) ...[
                SizedBox(
                  width: 16,
                  height: 16,
                  child: widget.item.icon!,
                ),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: Text(
                  widget.item.title,
                  style: theme.textTheme.small.copyWith(
                    fontSize: 13,
                    fontWeight: widget.item.isActive ? FontWeight.w500 : FontWeight.w400,
                    color: widget.item.isActive
                        ? theme.colorScheme.accentForeground
                        : theme.colorScheme.foreground,
                  ),
                ),
              ),
              if (widget.item.items?.isNotEmpty == true)
                Icon(
                  LucideIcons.chevronRight,
                  size: 12,
                  color: theme.colorScheme.mutedForeground,
                ),
            ],
          ),
        ),
      ),
    );

    // If no sub-items, return just the button
    if (widget.item.items?.isEmpty != false) {
      return mainButton;
    }

    // If has sub-items, wrap in custom collapsible menu
    return _ShadSidebarCollapsibleMenuItem(
      item: widget.item,
    );
  }
}

/// Internal widget for collapsible menu item functionality.
class _ShadSidebarCollapsibleMenuItem extends StatefulWidget {
  const _ShadSidebarCollapsibleMenuItem({
    required this.item,
  });

  final ShadSidebarNavItem item;

  @override
  State<_ShadSidebarCollapsibleMenuItem> createState() => _ShadSidebarCollapsibleMenuItemState();
}

class _ShadSidebarCollapsibleMenuItemState extends State<_ShadSidebarCollapsibleMenuItem> 
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _sizeAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _isExpanded = false; // Default collapsed for menu items
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 0.5,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _sizeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Main menu item button
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            onTap: widget.item.onTap ?? _toggle,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: widget.item.isActive 
                    ? theme.colorScheme.accent 
                    : _isHovered
                        ? theme.colorScheme.accent.withOpacity(0.1)
                        : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  if (widget.item.icon != null) ...[
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: widget.item.icon!,
                    ),
                    const SizedBox(width: 8),
                  ],
                  Expanded(
                    child: Text(
                      widget.item.title,
                      style: theme.textTheme.small.copyWith(
                        fontSize: 13,
                        fontWeight: widget.item.isActive ? FontWeight.w500 : FontWeight.w400,
                        color: widget.item.isActive
                            ? theme.colorScheme.accentForeground
                            : theme.colorScheme.foreground,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _toggle,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: AnimatedBuilder(
                        animation: _rotationAnimation,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: _rotationAnimation.value * 3.14159, // 180 degrees
                            child: Icon(
                              LucideIcons.chevronDown,
                              size: 12,
                              color: theme.colorScheme.mutedForeground,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        
        // Collapsible sub-items with vertical line
        SizeTransition(
          sizeFactor: _sizeAnimation,
          axisAlignment: -1.0, // Align to top for top-to-bottom animation
          child: Container(
            margin: const EdgeInsets.only(left: 12, top: 2),
            padding: const EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: theme.colorScheme.border,
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: [
                for (int i = 0; i < widget.item.items!.length; i++) ...[
                  ShadSidebarMenuItem(item: widget.item.items![i]),
                  if (i < widget.item.items!.length - 1) const SizedBox(height: 1),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
