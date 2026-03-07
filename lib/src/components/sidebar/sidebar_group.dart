import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/components/sidebar/sidebar_scope.dart';
import 'package:shadcn_ui/src/theme/components/sidebar.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

/// A visual section within a [ShadSidebar] that groups related items
/// under an optional label.
///
/// Merges the concepts of `SidebarGroup`, `SidebarGroupLabel`,
/// `SidebarGroupContent`, `SidebarGroupAction`, and `SidebarMenu`
/// from the original shadcn web library into a single Flutter widget.
///
/// When the sidebar is in [ShadSidebarCollapsibleMode.icon] mode and
/// collapsed, the [label] and [action] fade out and collapse to zero
/// height, leaving only the child items (which render as icon-only).
///
/// ```dart
/// ShadSidebarGroup(
///   label: Text('Platform'),
///   action: ShadButton.ghost(
///     icon: Icon(Icons.add),
///     onPressed: () {},
///   ),
///   children: [
///     ShadSidebarItem(...),
///     ShadSidebarItem.collapsible(...),
///     ShadSidebarSeparator(),
///   ],
/// )
/// ```
class ShadSidebarGroup extends StatelessWidget {
  const ShadSidebarGroup({
    super.key,
    this.label,
    this.action,
    required this.children,
    this.padding,
    this.labelStyle,
    this.labelPadding,
  });

  /// An optional heading for this group.
  ///
  /// Typically a [Text] widget. Rendered in a small, muted style by default.
  /// Set to `null` to create a group with no visible heading.
  final Widget? label;

  /// An optional trailing action displayed at the end of the label row.
  ///
  /// Typically a small icon button (e.g. "add", "more"). Only visible when
  /// [label] is also provided.
  final Widget? action;

  /// The items inside this group.
  ///
  /// Usually a list of [ShadSidebarItem], [ShadSidebarSeparator],
  /// or nested [ShadSidebarGroup] widgets.
  final List<Widget> children;

  /// Padding around the entire group (label + children).
  final EdgeInsetsGeometry? padding;

  /// Text style for the [label].
  ///
  /// Defaults to a small, muted, semi-bold style.
  final TextStyle? labelStyle;

  /// Padding around the label row.
  final EdgeInsetsGeometry? labelPadding;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final sidebarTheme = theme.sidebarTheme;
    final scope = ShadSidebarScope.of(context);

    final effectivePadding =
        padding ?? sidebarTheme.groupPadding ?? const EdgeInsets.all(8);

    return Padding(
      padding: effectivePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null)
            _GroupLabel(
              label: label!,
              action: action,
              labelStyle: labelStyle,
              labelPadding: labelPadding,
              sidebarTheme: sidebarTheme,
              theme: theme,
              scope: scope,
            ),
          ...children,
        ],
      ),
    );
  }
}

/// The label row of a [ShadSidebarGroup].
///
/// In [ShadSidebarCollapsibleMode.icon] mode this fades out and collapses
/// to zero height as the sidebar closes.
class _GroupLabel extends StatelessWidget {
  const _GroupLabel({
    required this.label,
    required this.action,
    required this.labelStyle,
    required this.labelPadding,
    required this.sidebarTheme,
    required this.theme,
    required this.scope,
  });

  final Widget label;
  final Widget? action;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? labelPadding;
  final ShadSidebarTheme sidebarTheme;
  final ShadThemeData theme;
  final ShadSidebarScope scope;

  @override
  Widget build(BuildContext context) {
    final colorScheme = theme.colorScheme;

    final effectiveLabelPadding =
        labelPadding ??
        sidebarTheme.groupLabelPadding ??
        const EdgeInsets.symmetric(horizontal: 8);

    final sidebarFg = colorScheme.sidebarForeground ?? colorScheme.foreground;

    final effectiveLabelStyle =
        labelStyle ??
        sidebarTheme.groupLabelStyle ??
        TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: sidebarFg,
          letterSpacing: 0.5,
        );

    final labelRow = Container(
      height: 32,
      padding: effectiveLabelPadding,
      child: Row(
        children: [
          Expanded(
            child: DefaultTextStyle(
              style: effectiveLabelStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              child: label,
            ),
          ),
          ?action,
        ],
      ),
    );

    // In icon-collapse mode, animate the label away
    if (scope.collapsibleMode == ShadSidebarCollapsibleMode.icon) {
      return SizeTransition(
        sizeFactor: scope.animation,
        axisAlignment: -1,
        child: FadeTransition(
          opacity: scope.animation,
          child: labelRow,
        ),
      );
    }

    return labelRow;
  }
}
