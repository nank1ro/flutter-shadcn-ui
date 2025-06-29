import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Interface for navigation items in the sidebar
class ShadSidebarNavItem {
  const ShadSidebarNavItem({
    required this.title,
    this.url,
    this.icon,
    this.isActive = false,
    this.items,
    this.onTap,
  });

  final String title;
  final String? url;
  final Widget? icon;
  final bool isActive;
  final List<ShadSidebarNavItem>? items;
  final VoidCallback? onTap;
}

/// Interface for user data in the sidebar
class ShadSidebarUser {
  const ShadSidebarUser({
    required this.name,
    required this.email,
    this.avatar,
  });

  final String name;
  final String email;
  final String? avatar;
}

/// A composable sidebar block component inspired by shadcn/ui
/// 
/// This is a complete sidebar implementation that follows the shadcn/ui patterns
/// and can be used as a building block in Flutter applications.
class ShadSidebar extends StatefulWidget {
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

  /// Optional header widget (typically app logo and title)
  final Widget? header;

  /// Optional footer widget (typically user info)
  final Widget? footer;

  /// List of navigation groups
  final List<ShadSidebarGroup> navGroups;

  /// Width when expanded
  final double width;

  /// Whether the sidebar is collapsed
  final bool isCollapsed;

  /// Callback when collapsed state changes
  final ValueChanged<bool>? onCollapsedChanged;

  /// Background color override
  final Color? backgroundColor;

  /// Border color override
  final Color? borderColor;

  /// Padding override
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
                  children: [              // Header
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
                ),// Content
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
              ),              // Footer
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

/// A group of navigation items in the sidebar
class ShadSidebarGroup extends StatelessWidget {
  const ShadSidebarGroup({
    super.key,
    this.label,
    required this.items,
    this.collapsible = false,
    this.initiallyExpanded = true,
  });

  /// Optional group label
  final String? label;

  /// Navigation items in this group
  final List<ShadSidebarNavItem> items;

  /// Whether this group can be collapsed
  final bool collapsible;

  /// Whether this group is initially expanded (if collapsible)
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < items.length; i++) ...[
          ShadSidebarMenuItem(item: items[i]),
          if (i < items.length - 1) const SizedBox(height: 1),
        ],
      ],
    );

    if (label == null && !collapsible) {
      return content;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          if (collapsible)
            _ShadSidebarCollapsibleGroup(
              label: label!,
              initiallyExpanded: initiallyExpanded,
              content: content,
            )
          else ...[
            Text(
              label!,
              style: theme.textTheme.muted.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.05,
              ),
            ),
            const SizedBox(height: 6),
            content,
          ]
        else if (collapsible)
          _ShadSidebarCollapsibleGroup(
            label: '', // No label, just collapsible content
            initiallyExpanded: initiallyExpanded,
            content: content,
          )
        else
          content,
      ],
    );
  }
}

/// Individual menu item in the sidebar
class ShadSidebarMenuItem extends StatefulWidget {
  const ShadSidebarMenuItem({
    super.key,
    required this.item,
  });

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
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            color: widget.item.isActive 
                ? theme.colorScheme.accent 
                : _isHovered 
                    ? theme.colorScheme.accent.withValues(alpha: 0.1)
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

/// Sidebar header with app branding
class ShadSidebarHeader extends StatefulWidget {
  const ShadSidebarHeader({
    super.key,
    this.logo,
    required this.title,
    this.subtitle,
    this.onTap,
  });

  final Widget? logo;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  @override
  State<ShadSidebarHeader> createState() => _ShadSidebarHeaderState();
}

class _ShadSidebarHeaderState extends State<ShadSidebarHeader> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return MouseRegion(
      cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: _isHovered && widget.onTap != null
                ? theme.colorScheme.accent.withValues(alpha: 0.1)
                : Colors.transparent,
          ),
          child: Row(
            children: [
              if (widget.logo != null) ...[
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(child: widget.logo!),
                ),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.title,
                      style: theme.textTheme.small.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (widget.subtitle != null)
                      Text(
                        widget.subtitle!,
                        style: theme.textTheme.muted.copyWith(
                          fontSize: 11,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Sidebar footer with user information
class ShadSidebarFooter extends StatefulWidget {
  const ShadSidebarFooter({
    super.key,
    required this.user,
    this.actions,
    this.onUserTap,
  });

  final ShadSidebarUser user;
  final List<Widget>? actions;
  final VoidCallback? onUserTap;

  @override
  State<ShadSidebarFooter> createState() => _ShadSidebarFooterState();
}

class _ShadSidebarFooterState extends State<ShadSidebarFooter> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return MouseRegion(
      cursor: widget.onUserTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onUserTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: _isHovered && widget.onUserTap != null
                ? theme.colorScheme.accent.withValues(alpha: 0.1)
                : Colors.transparent,
          ),
          child: Row(
            children: [
              // Avatar
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: theme.colorScheme.muted,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: widget.user.avatar != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          widget.user.avatar!,
                          width: 28,
                          height: 28,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              _buildFallbackAvatar(theme),
                        ),
                      )
                    : _buildFallbackAvatar(theme),
              ),
              const SizedBox(width: 8),
              // User info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.user.name,
                      style: theme.textTheme.small.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.user.email,
                      style: theme.textTheme.muted.copyWith(
                        fontSize: 11,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // Actions
              if (widget.actions?.isNotEmpty == true) ...[
                const SizedBox(width: 8),
                ...widget.actions!,
              ] else
                Icon(
                  LucideIcons.chevronsUpDown,
                  size: 12,
                  color: theme.colorScheme.mutedForeground,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFallbackAvatar(ShadThemeData theme) {
    return Center(
      child: Text(
        widget.user.name.isNotEmpty ? widget.user.name[0].toUpperCase() : 'U',
        style: theme.textTheme.small.copyWith(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.mutedForeground,
        ),
      ),
    );
  }
}

/// Custom collapsible group widget that matches shadcn/ui guidelines
class _ShadSidebarCollapsibleGroup extends StatefulWidget {
  const _ShadSidebarCollapsibleGroup({
    required this.label,
    required this.initiallyExpanded,
    required this.content,
  });

  final String label;
  final bool initiallyExpanded;
  final Widget content;

  @override
  State<_ShadSidebarCollapsibleGroup> createState() => _ShadSidebarCollapsibleGroupState();
}

class _ShadSidebarCollapsibleGroupState extends State<_ShadSidebarCollapsibleGroup> 
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _sizeAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
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
    
    if (_isExpanded) {
      _animationController.value = 1.0;
    }
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
        // Collapsible header button (only show if label is not empty)
        if (widget.label.isNotEmpty)
          MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: GestureDetector(
              onTap: _toggle,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: _isHovered
                      ? theme.colorScheme.accent.withValues(alpha: 0.1)
                      : Colors.transparent,
                ),
                child: Row(
                  children: [
                    AnimatedBuilder(
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
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        widget.label,
                        style: theme.textTheme.muted.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.05,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
        // Collapsible content with vertical line
        SizeTransition(
          sizeFactor: _sizeAnimation,
          axisAlignment: -1.0, // Align to top for top-to-bottom animation
          child: Container(
            margin: const EdgeInsets.only(left: 12, top: 4),
            padding: const EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: theme.colorScheme.border,
                  width: 1,
                ),
              ),
            ),
            child: widget.content,
          ),
        ),
      ],
    );
  }
}

/// Custom collapsible menu item widget that matches shadcn/ui guidelines
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
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: widget.item.isActive 
                    ? theme.colorScheme.accent 
                    : _isHovered
                        ? theme.colorScheme.accent.withValues(alpha: 0.1)
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
