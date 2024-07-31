import 'package:flutter/cupertino.dart';
import 'package:shadcn_ui/src/components/image.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

enum ShadAlertVariant {
  primary,
  destructive,
}

class ShadAlert extends StatelessWidget {
  const ShadAlert({
    super.key,
    this.icon,
    this.iconSrc,
    this.title,
    this.description,
    this.textDirection,
    this.decoration,
    this.iconPadding,
    this.iconColor,
    this.iconSize,
    this.titleStyle,
    this.descriptionStyle,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  }) : variant = ShadAlertVariant.primary;

  const ShadAlert.destructive({
    super.key,
    this.icon,
    this.iconSrc,
    this.title,
    this.description,
    this.textDirection,
    this.decoration,
    this.iconPadding,
    this.iconColor,
    this.iconSize,
    this.titleStyle,
    this.descriptionStyle,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  }) : variant = ShadAlertVariant.destructive;

  const ShadAlert.raw({
    super.key,
    required this.variant,
    this.icon,
    this.iconSrc,
    this.title,
    this.description,
    this.textDirection,
    this.decoration,
    this.iconPadding,
    this.iconColor,
    this.iconSize,
    this.titleStyle,
    this.descriptionStyle,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  });

  final ShadAlertVariant variant;
  final Widget? icon;
  final ShadImageSrc? iconSrc;
  final Widget? title;
  final Widget? description;
  final TextDirection? textDirection;
  final ShadDecoration? decoration;
  final EdgeInsets? iconPadding;
  final Color? iconColor;
  final Size? iconSize;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveAlertTheme = variant == ShadAlertVariant.primary
        ? theme.primaryAlertTheme
        : theme.destructiveAlertTheme;

    final effectiveIconPadding = iconPadding ??
        effectiveAlertTheme.iconPadding ??
        const EdgeInsets.only(right: 12);

    final effectiveDecoration = decoration ??
        effectiveAlertTheme.decoration ??
        ShadDecoration(
          border: ShadBorder.all(
            color: theme.colorScheme.border,
            radius: theme.radius,
            padding: const EdgeInsets.all(16),
          ),
        );

    final effectiveIconColor = iconColor ??
        effectiveAlertTheme.iconColor ??
        theme.colorScheme.foreground;

    final effectiveIconSize =
        iconSize ?? effectiveAlertTheme.iconSize ?? const Size.square(16);

    final hasIcon = icon != null || iconSrc != null;
    final effectiveIcon = hasIcon
        ? Padding(
            padding: effectiveIconPadding,
            child: icon ??
                ShadImage(
                  iconSrc!,
                  width: effectiveIconSize.width,
                  height: effectiveIconSize.height,
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

    return ShadDecorator(
      decoration: effectiveDecoration,
      child: Row(
        crossAxisAlignment: effectiveCrossAxisAlignment,
        mainAxisAlignment: effectiveMainAxisAlignment,
        textDirection: textDirection,
        children: [
          if (effectiveIcon != null) effectiveIcon,
          Flexible(
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
        ],
      ),
    );
  }
}
