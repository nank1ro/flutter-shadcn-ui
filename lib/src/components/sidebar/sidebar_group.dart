import 'package:flutter/cupertino.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shadcn_ui/src/components/sidebar/common/sidebar_collapsible.dart';

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

  final String? labelText;
  final Widget? label;

  /// Usually a [ShadIconButton].
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
    final sidebar = ShadSidebarScaffold.of(context);
    final isCollapsedToIcons = sidebar.collapsedToIcons;
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

Widget _labelBuilder({
  String? labelText,
  Widget? label,
  required EdgeInsetsGeometry padding,
}) {
  Widget? effectiveLabel;
  if (label != null) {
    effectiveLabel = label;
  }
  if (labelText != null) {
    effectiveLabel = _SidebarGroupLabelText(labelText);
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

class _SidebarGroupLabelText extends StatelessWidget {
  const _SidebarGroupLabelText(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ShadTheme.of(context).colorScheme;
    final sidebarTheme = ShadTheme.of(context).sidebarTheme;
    final fColor =
        sidebarTheme.foregroundColor ?? colorScheme.sidebarForeground;
    return Text(
      label,
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
}
