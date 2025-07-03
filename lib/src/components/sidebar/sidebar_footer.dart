import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show LucideIcons;
import 'package:shadcn_ui/src/components/sidebar/sidebar_user.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

/// Sidebar footer with user information.
///
/// Displays user avatar, name, email, and optional action widgets.
/// Supports tap interactions and hover effects for user profile actions.
class ShadSidebarFooter extends StatefulWidget {
  /// Creates a sidebar footer with user information.
  ///
  /// [user] is required and contains the user data to display.
  /// [actions] is an optional list of action widgets (buttons, icons, etc.).
  /// [onUserTap] is called when the user section is tapped.
  const ShadSidebarFooter({
    super.key,
    required this.user,
    this.actions,
    this.onUserTap,
  });

  /// The user data to display.
  final ShadSidebarUser user;

  /// Optional action widgets displayed next to the user info.
  final List<Widget>? actions;

  /// Callback when the user section is tapped.
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
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: _isHovered && widget.onUserTap != null
                ? theme.colorScheme.accent.withOpacity(0.1)
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
