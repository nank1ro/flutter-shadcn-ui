import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

/// Sidebar header with app branding.
///
/// Displays application logo, title, and optional subtitle in the sidebar header.
/// Supports tap interactions and hover effects for navigation or actions.
class ShadSidebarHeader extends StatefulWidget {
  /// Creates a sidebar header.
  ///
  /// [title] is required and displayed as the main application name.
  /// [logo] is an optional widget displayed next to the title.
  /// [subtitle] is an optional secondary text below the title.
  /// [onTap] is called when the header is tapped.
  const ShadSidebarHeader({
    super.key,
    this.logo,
    required this.title,
    this.subtitle,
    this.onTap,
  });

  /// Optional logo widget displayed next to the title.
  final Widget? logo;

  /// The main application title.
  final String title;

  /// Optional subtitle displayed below the title.
  final String? subtitle;

  /// Callback when the header is tapped.
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
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: _isHovered && widget.onTap != null
                ? theme.colorScheme.accent.withOpacity(0.1)
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
