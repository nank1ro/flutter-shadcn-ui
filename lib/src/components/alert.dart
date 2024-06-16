import 'package:flutter/widgets.dart';
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
  })  : variant = ShadAlertVariant.primary,
        assert(
          (icon != null) ^ (iconSrc != null),
          'Either icon or iconSrc must be provided',
        );

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
  })  : variant = ShadAlertVariant.destructive,
        assert(
          (icon != null) ^ (iconSrc != null),
          'Either icon or iconSrc must be provided',
        );

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
          border: ShadBorder(
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

    final effectiveIcon = Padding(
      padding: effectiveIconPadding,
      child: icon ??
          ShadImage(
            iconSrc!,
            width: effectiveIconSize.width,
            height: effectiveIconSize.height,
            color: effectiveIconColor,
          ),
    );

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

    return ShadDecorator(
      decoration: effectiveDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: textDirection,
        children: [
          effectiveIcon,
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
