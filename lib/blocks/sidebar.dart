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
    this.collapsedWidth = 64,
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

  /// Width when collapsed
  final double collapsedWidth;

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
    if (oldWidget.width != widget.width ||
        oldWidget.collapsedWidth != widget.collapsedWidth) {
      _updateAnimation();
    }
  }

  void _updateAnimation() {
    _widthAnimation = Tween<double>(
      begin: widget.width,
      end: widget.collapsedWidth,
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
        return Container(
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
          child: Column(
            children: [
              // Header
              if (widget.header != null)
                Container(
                  width: double.infinity,
                  padding: widget.padding ?? const EdgeInsets.all(16),
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
                  padding: widget.padding ?? const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < widget.navGroups.length; i++) ...[
                        widget.navGroups[i],
                        if (i < widget.navGroups.length - 1)
                          const SizedBox(height: 24),
                      ],
                    ],
                  ),
                ),
              ),

              // Footer
              if (widget.footer != null)
                Container(
                  width: double.infinity,
                  padding: widget.padding ?? const EdgeInsets.all(16),
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
          if (i < items.length - 1) const SizedBox(height: 4),
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
            ExpansionTile(
              initiallyExpanded: initiallyExpanded,
              title: Text(
                label!,
                style: theme.textTheme.muted.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              children: [content],
              tilePadding: EdgeInsets.zero,
              childrenPadding: EdgeInsets.zero,
              maintainState: true,
            )
          else ...[
            Text(
              label!,
              style: theme.textTheme.muted.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            content,
          ]
        else if (collapsible)
          ExpansionTile(
            initiallyExpanded: initiallyExpanded,
            title: const SizedBox.shrink(),
            children: [content],
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.zero,
            maintainState: true,
          )
        else
          content,
      ],
    );
  }
}

/// Individual menu item in the sidebar
class ShadSidebarMenuItem extends StatelessWidget {
  const ShadSidebarMenuItem({
    super.key,
    required this.item,
  });

  final ShadSidebarNavItem item;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    // Main item button
    final mainButton = GestureDetector(
      onTap: item.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: item.isActive 
              ? theme.colorScheme.accent 
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            if (item.icon != null) ...[
              SizedBox(
                width: 16,
                height: 16,
                child: item.icon!,
              ),
              const SizedBox(width: 8),
            ],
            Expanded(
              child: Text(
                item.title,
                style: theme.textTheme.small.copyWith(
                  fontWeight: item.isActive ? FontWeight.w500 : FontWeight.w400,
                  color: item.isActive
                      ? theme.colorScheme.accentForeground
                      : theme.colorScheme.foreground,
                ),
              ),
            ),
            if (item.items?.isNotEmpty == true)
              Icon(
                LucideIcons.chevronRight,
                size: 14,
                color: theme.colorScheme.mutedForeground,
              ),
          ],
        ),
      ),
    );

    // If no sub-items, return just the button
    if (item.items?.isEmpty != false) {
      return mainButton;
    }

    // If has sub-items, wrap in expansion tile
    return ExpansionTile(
      title: Row(
        children: [
          if (item.icon != null) ...[
            SizedBox(
              width: 16,
              height: 16,
              child: item.icon!,
            ),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              item.title,
              style: theme.textTheme.small.copyWith(
                fontWeight: item.isActive ? FontWeight.w500 : FontWeight.w400,
                color: item.isActive
                    ? theme.colorScheme.accentForeground
                    : theme.colorScheme.foreground,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: item.isActive 
          ? theme.colorScheme.accent 
          : Colors.transparent,
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      maintainState: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Column(
            children: [
              for (int i = 0; i < item.items!.length; i++) ...[
                ShadSidebarMenuItem(item: item.items![i]),
                if (i < item.items!.length - 1) const SizedBox(height: 2),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

/// Sidebar header with app branding
class ShadSidebarHeader extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent,
        ),
        child: Row(
          children: [
            if (logo != null) ...[
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(child: logo!),
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.small.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: theme.textTheme.muted.copyWith(
                        fontSize: 10,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Sidebar footer with user information
class ShadSidebarFooter extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return GestureDetector(
      onTap: onUserTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent,
        ),
        child: Row(
          children: [
            // Avatar
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: theme.colorScheme.muted,
                borderRadius: BorderRadius.circular(8),
              ),
              child: user.avatar != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        user.avatar!,
                        width: 32,
                        height: 32,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            _buildFallbackAvatar(theme),
                      ),
                    )
                  : _buildFallbackAvatar(theme),
            ),
            const SizedBox(width: 12),
            // User info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    user.name,
                    style: theme.textTheme.small.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    user.email,
                    style: theme.textTheme.muted.copyWith(
                      fontSize: 10,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // Actions
            if (actions?.isNotEmpty == true) ...[
              const SizedBox(width: 8),
              ...actions!,
            ] else
              Icon(
                LucideIcons.chevronsUpDown,
                size: 14,
                color: theme.colorScheme.mutedForeground,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFallbackAvatar(ShadThemeData theme) {
    return Center(
      child: Text(
        user.name.isNotEmpty ? user.name[0].toUpperCase() : 'U',
        style: theme.textTheme.small.copyWith(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.mutedForeground,
        ),
      ),
    );
  }
}
