import 'package:flutter/cupertino.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/border.dart';
import 'package:shadcn_ui/src/utils/extensions/order_policy.dart';

enum ShadAlertVariant {
  primary,
  destructive,
}

class ShadAlert extends StatelessWidget {
  const ShadAlert({
    super.key,
    this.icon,
    this.iconData,
    this.title,
    this.description,
    this.textDirection,
    this.decoration,
    this.iconPadding,
    this.iconColor,
    this.titleStyle,
    this.descriptionStyle,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.orderPolicy,
  }) : variant = ShadAlertVariant.primary;

  const ShadAlert.destructive({
    super.key,
    this.icon,
    this.iconData,
    this.title,
    this.description,
    this.textDirection,
    this.decoration,
    this.iconPadding,
    this.iconColor,
    this.titleStyle,
    this.descriptionStyle,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.orderPolicy,
  }) : variant = ShadAlertVariant.destructive;

  const ShadAlert.raw({
    super.key,
    required this.variant,
    this.icon,
    this.iconData,
    this.title,
    this.description,
    this.textDirection,
    this.decoration,
    this.iconPadding,
    this.iconColor,
    this.titleStyle,
    this.descriptionStyle,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.orderPolicy,
  });

  final ShadAlertVariant variant;
  final Widget? icon;
  final IconData? iconData;
  final Widget? title;
  final Widget? description;
  final TextDirection? textDirection;
  final ShadDecoration? decoration;
  final EdgeInsets? iconPadding;
  final Color? iconColor;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@template ShadAlert.orderPolicy}
  /// The order policy of the items that compose the alert, defaults to
  /// [WidgetOrderPolicy.linear()].
  /// {@endtemplate}
  final WidgetOrderPolicy? orderPolicy;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveAlertTheme = variant == ShadAlertVariant.primary
        ? theme.primaryAlertTheme
        : theme.destructiveAlertTheme;

    final effectiveIconPadding = iconPadding ??
        effectiveAlertTheme.iconPadding ??
        const EdgeInsets.only(right: 12);

    final defaultDecoration = ShadDecoration(
      border: ShadBorder.all(
        color: theme.colorScheme.border,
        radius: theme.radius,
        padding: const EdgeInsets.all(16),
      ),
    );

    final effectiveDecoration = defaultDecoration
        .mergeWith(effectiveAlertTheme.decoration)
        .mergeWith(decoration);

    final effectiveIconColor = iconColor ??
        effectiveAlertTheme.iconColor ??
        theme.colorScheme.foreground;

    final hasIcon = icon != null || iconData != null;
    final effectiveIcon = hasIcon
        ? Padding(
            padding: effectiveIconPadding,
            child: icon ??
                Icon(
                  iconData,
                  color: effectiveIconColor,
                ),
          )
        : null;

    final effectiveTitleStyle = titleStyle ??
        effectiveAlertTheme.titleStyle ??
        theme.textTheme.p.copyWith(
          color: theme.colorScheme.foreground,
          fontWeight: FontWeight.w500,
          height: 1,
        );

    final effectiveDescriptionStyle = descriptionStyle ??
        effectiveAlertTheme.descriptionStyle ??
        theme.textTheme.muted.copyWith(color: theme.colorScheme.foreground);

    final effectiveMainAxisAlignment = mainAxisAlignment ??
        effectiveAlertTheme.mainAxisAlignment ??
        MainAxisAlignment.start;

    final effectiveCrossAxisAlignment = crossAxisAlignment ??
        effectiveAlertTheme.crossAxisAlignment ??
        CrossAxisAlignment.start;

    final effectiveOrderPolicy = orderPolicy ??
        effectiveAlertTheme.orderPolicy ??
        const WidgetOrderPolicy.linear();

    return ShadDecorator(
      decoration: effectiveDecoration,
      child: Row(
        crossAxisAlignment: effectiveCrossAxisAlignment,
        mainAxisAlignment: effectiveMainAxisAlignment,
        textDirection: textDirection,
        children: [
          if (effectiveIcon != null) effectiveIcon,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null)
                  DefaultTextStyle(
                    style: effectiveTitleStyle,
                    child: title!,
                  ),
                if (description != null)
                  DefaultTextStyle(
                    style: effectiveDescriptionStyle,
                    child: description!,
                  ),
              ],
            ),
          ),
        ].order(effectiveOrderPolicy),
      ),
    );
  }
}
