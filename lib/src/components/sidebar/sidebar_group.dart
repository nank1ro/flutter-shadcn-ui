import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show LucideIcons;
import 'package:shadcn_ui/src/components/sidebar/sidebar_menu_item.dart';
import 'package:shadcn_ui/src/components/sidebar/sidebar_nav_item.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

/// A group of navigation items in the sidebar.
///
/// Groups can have an optional label and can be collapsible. Groups organize
/// related navigation items together with consistent spacing and styling.
class ShadSidebarGroup extends StatelessWidget {
  /// Creates a sidebar group.
  ///
  /// [items] is required and contains the navigation items to display.
  /// [label] is an optional group title displayed above the items.
  /// [collapsible] determines if the group can be collapsed by the user.
  /// [initiallyExpanded] sets the initial state for collapsible groups.
  const ShadSidebarGroup({
    super.key,
    this.label,
    required this.items,
    this.collapsible = false,
    this.initiallyExpanded = true,
  });

  /// Optional group label displayed above the items.
  final String? label;

  /// Navigation items in this group.
  final List<ShadSidebarNavItem> items;

  /// Whether this group can be collapsed by the user.
  final bool collapsible;

  /// Whether this group is initially expanded (if collapsible).
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

/// Internal widget for collapsible group functionality.
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
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: _isHovered
                      ? theme.colorScheme.accent.withOpacity(0.1)
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
