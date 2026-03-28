import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:shadcn_ui/src/components/sidebar/scope.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

/// A section within a sidebar that groups related items.
///
/// The [label] slot is typically a [ShadSidebarGroupLabel], but any
/// widget is accepted.
///
/// ```dart
/// ShadSidebarGroup(
///   label: ShadSidebarGroupLabel(child: Text('Platform')),
///   children: [
///     ShadSidebarItem(...),
///     ShadSidebarItem(...),
///   ],
/// )
/// ```
class ShadSidebarGroup extends StatelessWidget {
  const ShadSidebarGroup({
    super.key,
    required this.children,
    this.label,
    this.padding,
    this.labelText,
  }) : assert(
         label == null || labelText == null,
         'Cannot provide both label and labelText',
       );

  /// A custom label widget.
  /// Typically a [ShadSidebarGroupLabel].
  final Widget? label;

  /// Used in a [Text] widget inside [ShadSidebarGroupLabel].
  final String? labelText;

  /// The items inside this group.
  final List<Widget> children;

  /// Padding around the entire group.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final sidebarTheme = theme.sidebarTheme;

    final effectivePadding =
        padding ?? sidebarTheme.groupPadding ?? const EdgeInsets.all(8);
    final effectiveLabel =
        label ??
        (labelText != null
            ? ShadSidebarGroupLabel(child: Text(labelText!))
            : null);

    return Padding(
      padding: effectivePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          ?effectiveLabel,
          ...children,
        ],
      ),
    );
  }
}

/// A styled label for a [ShadSidebarGroup].
///
/// Automatically animates away (fade + collapse) when the sidebar
/// is in [ShadSidebarCollapsibleMode.icon] and collapses.
///
/// ```dart
/// ShadSidebarGroupLabel(
///   child: Text('Platform'),
///   action: ShadButton.ghost(icon: Icon(Icons.add), onPressed: () {}),
/// )
/// ```
class ShadSidebarGroupLabel extends StatelessWidget {
  const ShadSidebarGroupLabel({
    super.key,
    required this.child,
    this.action,
    this.textStyle,
    this.padding,
    this.height,
  });

  /// The label content. Typically a [Text] widget.
  final Widget child;

  /// Optional trailing action on the label row.
  final Widget? action;

  final TextStyle? textStyle;

  /// Padding around the label row.
  final EdgeInsetsGeometry? padding;

  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final sidebarTheme = theme.sidebarTheme;
    final colorScheme = theme.colorScheme;
    final scope = ShadSidebarScope.of(context);

    final effectiveHeight = height ?? 32;
    final effectivePadding =
        padding ??
        sidebarTheme.groupLabelPadding ??
        const EdgeInsets.symmetric(horizontal: 8);

    final defaultLabelStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: colorScheme.sidebarForeground ?? colorScheme.foreground,
      letterSpacing: 0.5,
    );

    final effectiveTextStyle = theme.textTheme.p
        .merge(defaultLabelStyle)
        .merge(sidebarTheme.groupLabelStyle)
        .merge(textStyle);

    final duration =
        sidebarTheme.animationDuration ?? const Duration(milliseconds: 200);
    final curve = sidebarTheme.animationCurve ?? Curves.linear;

    Widget result = Container(
      height: effectiveHeight,
      padding: effectivePadding,
      child: Row(
        children: [
          Expanded(
            child: DefaultTextStyle(
              style: effectiveTextStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              child: child,
            ),
          ),
          ?action,
        ],
      ),
    );

    if (scope.collapsibleMode == ShadSidebarCollapsibleMode.icon) {
      result = result
          .animate(target: scope.isOpen ? 1 : 0)
          .fadeIn(duration: duration, curve: curve)
          .custom(
            duration: duration,
            curve: curve,
            builder: (context, value, child) => ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: value,
                child: child,
              ),
            ),
          );
    }

    return result;
  }
}
