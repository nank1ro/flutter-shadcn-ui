import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/components/sidebar/common/sidebar_collapsible.dart';
import 'package:shadcn_ui/src/components/sidebar/sidebar.dart';
import 'package:shadcn_ui/src/components/sidebar/sidebar_item.dart';
import 'package:shadcn_ui/src/components/sidebar/sidebar_menu.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

class ShadSidebarGroup extends StatelessWidget {
  const ShadSidebarGroup({
    super.key,
    this.action,
    this.content,
    this.padding = const EdgeInsets.all(8),
    this.labelPadding = const EdgeInsets.symmetric(horizontal: 8),
    this.labelText,
    this.label,
    this.hiddenWhenCollapsedToIcons = true,
    this.flex = 0,
  }) : collapsible = false;

  /// Create a sidebar group of items.
  ShadSidebarGroup.items({
    super.key,
    this.action,
    List<ShadSidebarItem> items = const [],
    this.padding = const EdgeInsets.all(8),
    this.labelPadding = const EdgeInsets.symmetric(horizontal: 8),
    this.labelText,
    this.label,
    this.hiddenWhenCollapsedToIcons = true,
    this.flex = 0,
  }) : content = ShadSidebarMenu(items: items),
       collapsible = false;

  const factory ShadSidebarGroup.collapsible({
    Key? key,
    Widget? content,
    EdgeInsetsGeometry padding,
    EdgeInsetsGeometry labelPadding,
    String? labelText,
    Widget? label,
    bool initiallyCollapsed,
    int flex,
    Widget Function(bool collapsed)? trailingIconBuilder,
    bool hiddenWhenCollapsedToIcons,
  }) = _CollapsibleSidebarGroup;

  factory ShadSidebarGroup.collapsibleItems({
    Key? key,
    EdgeInsetsGeometry padding,
    EdgeInsetsGeometry labelPadding,
    String? labelText,
    Widget? label,
    bool initiallyCollapsed,
    int flex,
    Widget Function(bool collapsed)? trailingIconBuilder,
    bool hiddenWhenCollapsedToIcons,
    List<ShadSidebarItem> items,
  }) = _CollapsibleSidebarGroup.menu;

  const ShadSidebarGroup._({
    super.key,
    this.action,
    this.content,
    this.padding = const EdgeInsets.all(8),
    this.label,
    this.labelText,
    this.labelPadding = const EdgeInsets.symmetric(horizontal: 8),
    this.flex = 0,
    this.hiddenWhenCollapsedToIcons = true,
    required this.collapsible,
  }) : assert(
         (labelText == null || label == null),
         'Either labelText or label can be provided',
       );

  final String? labelText;
  final Widget? label;

  /// Usually a `ShadIconButton`.
  final Widget? action;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry labelPadding;
  final bool collapsible;

  /// The main content of the group displayed under the label.
  ///
  /// This is usually a [ShadSidebarMenu].
  final Widget? content;
  final int flex;
  final bool hiddenWhenCollapsedToIcons;

  @override
  Widget build(BuildContext context) {
    final c = ShadSidebar.of(context);
    final isCollapsedToIcons = c.collapsedToIcons;
    if (hiddenWhenCollapsedToIcons && isCollapsedToIcons) {
      return const SizedBox.shrink();
    }
    return Expanded(
      flex: flex,
      child: Padding(
        padding: isCollapsedToIcons ? EdgeInsets.zero : padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: isCollapsedToIcons
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            if (!isCollapsedToIcons)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _labelBuilder(
                    context,
                    padding: labelPadding,
                    label: label,
                    labelText: labelText,
                  ),
                  if (action != null) action!,
                ],
              ),
            if (content != null)
              if (!(hiddenWhenCollapsedToIcons && isCollapsedToIcons))
                Flexible(
                  flex: 0,
                  child: content!,
                ),
          ],
        ),
      ),
    );
  }
}

Widget _labelBuilder(
  BuildContext context, {
  String? labelText,
  Widget? label,
  required EdgeInsetsGeometry padding,
}) {
  Widget? effectiveLabel;
  if (label != null) {
    effectiveLabel = label;
  }
  if (labelText != null) {
    final colorScheme = ShadTheme.of(context).colorScheme;
    final fColor = colorScheme.sidebarForeground;
    effectiveLabel = Text(
      labelText,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: Color.from(
          alpha: (fColor.a * 70) / 100,
          red: fColor.r,
          green: fColor.g,
          blue: fColor.b,
        ),
      ),
    );
  }
  return effectiveLabel == null
      ? const SizedBox.shrink()
      : Container(
          constraints: const BoxConstraints(minHeight: 32),
          padding: padding,
          child: effectiveLabel,
        );
}

class _CollapsibleSidebarGroup extends ShadSidebarGroup {
  const _CollapsibleSidebarGroup({
    super.key,
    super.content,
    super.padding,
    super.label,
    super.labelText,
    super.labelPadding,
    super.flex,
    super.hiddenWhenCollapsedToIcons = true,
    this.initiallyCollapsed = false,
    this.trailingIconBuilder,
  }) : super._(collapsible: true);

  _CollapsibleSidebarGroup.menu({
    super.key,
    super.padding,
    super.label,
    super.labelText,
    super.labelPadding,
    super.flex,
    super.hiddenWhenCollapsedToIcons = true,
    this.initiallyCollapsed = false,
    this.trailingIconBuilder,
    List<ShadSidebarItem> items = const [],
  }) : super._(collapsible: true, content: ShadSidebarMenu(items: items));

  final bool initiallyCollapsed;
  final Widget Function(bool collapsed)? trailingIconBuilder;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: padding,
        child: SidebarCollapsible(
          labelPadding: labelPadding,
          initiallyCollapsed: initiallyCollapsed,
          content: content,
          label: label,
          labelText: labelText,
          iconBuilder: trailingIconBuilder,
        ),
      ),
    );
  }
}
