import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/border.dart';

/// Variants available for the [ShadAlert] widget.
enum ShadAlertVariant {
  primary,
  destructive,
}

/// A customizable alert widget that displays a message with optional icon and
/// styling.
///
/// The [ShadAlert] widget can be used to show informational or warning messages
/// to users. It supports two variants: primary (default) and destructive, which
/// can be styled through the [ShadTheme].
/// Use the named constructors [ShadAlert.destructive] or [ShadAlert.raw] for
/// specific configurations.
class ShadAlert extends StatelessWidget {
  /// Creates a primary variant alert widget.
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
    this.leading,
    this.trailing,
    this.top,
    this.bottom,
  }) : variant = ShadAlertVariant.primary;

  /// Creates a destructive variant alert widget, typically used for error or
  /// warning messages.
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
    this.leading,
    this.trailing,
    this.top,
    this.bottom,
  }) : variant = ShadAlertVariant.destructive;

  /// Creates a raw alert widget with a specified [variant], allowing full
  /// control over configuration.
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
    this.leading,
    this.trailing,
    this.top,
    this.bottom,
  });

  /// {@template ShadAlert.variant}
  /// The variant of the alert, either [ShadAlertVariant.primary] or
  /// [ShadAlertVariant.destructive].
  /// Determines the visual style applied through the [ShadTheme].
  /// {@endtemplate}
  final ShadAlertVariant variant;

  /// {@template ShadAlert.icon}
  /// A custom widget to use as the alert's icon, takes precedence over
  /// [iconData]. If provided, this widget will be displayed instead of an icon
  /// generated from [iconData].
  /// {@endtemplate}
  final Widget? icon;

  /// {@template ShadAlert.iconData}
  /// The icon data to display if [icon] is not provided.
  /// Used to create a default [Icon] widget with the specified [iconColor].
  /// {@endtemplate}
  final IconData? iconData;

  /// {@template ShadAlert.title}
  /// The title widget of the alert, typically a [Text] widget.
  /// Displayed with the style defined by [titleStyle] or theme defaults.
  /// {@endtemplate}
  final Widget? title;

  /// {@template ShadAlert.description}
  /// The description widget of the alert, typically a [Text] widget providing
  /// additional details.
  /// Displayed with the style defined by [descriptionStyle] or theme defaults.
  /// {@endtemplate}
  final Widget? description;

  /// {@template ShadAlert.textDirection}
  /// The text direction for the alert's content, overrides the default
  /// direction if specified. Can be set to [TextDirection.ltr] or
  /// [TextDirection.rtl].
  /// {@endtemplate}
  final TextDirection? textDirection;

  /// {@template ShadAlert.decoration}
  /// Custom decoration for the alert, merged with theme defaults if provided.
  /// Allows customization of border, padding, and other visual properties.
  /// {@endtemplate}
  final ShadDecoration? decoration;

  /// {@template ShadAlert.iconPadding}
  /// Padding around the icon, defaults to right padding of 12 if not specified.
  /// Controls the spacing between the icon and adjacent content.
  /// {@endtemplate}
  final EdgeInsetsGeometry? iconPadding;

  /// {@template ShadAlert.iconColor}
  /// Color of the icon, overrides theme default if provided.
  /// Applied to the [Icon] created from [iconData] if [icon] is null.
  /// {@endtemplate}
  final Color? iconColor;

  /// {@template ShadAlert.titleStyle}
  /// Style for the title text, overrides theme default if provided.
  /// Controls font size, weight, color, and other text properties of the
  /// [title].
  /// {@endtemplate}
  final TextStyle? titleStyle;

  /// {@template ShadAlert.descriptionStyle}
  /// Style for the description text, overrides theme default if provided.
  /// Controls font size, weight, color, and other text properties of the
  /// [description].
  /// {@endtemplate}
  final TextStyle? descriptionStyle;

  /// {@template ShadAlert.mainAxisAlignment}
  /// Main axis alignment for the alert's content, defaults to start if not
  /// specified. Controls horizontal arrangement of icon and text content within
  /// the [Row].
  /// {@endtemplate}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@template ShadAlert.crossAxisAlignment}
  /// Cross axis alignment for the alert's content, defaults to start if not
  /// specified. Controls vertical alignment of icon and text content within the
  /// [Row].
  /// {@endtemplate}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@template ShadAlert.top}
  /// An optional widget to display at the top of the alert, above the main
  /// content. This can be used to add additional information or controls.
  /// {@endtemplate}
  final Widget? top;

  /// {@template ShadAlert.bottom}
  /// An optional widget to display at the bottom of the alert, below the main
  /// content. This can be used to add additional information or controls.
  /// {@endtemplate}
  final Widget? bottom;

  /// {@template ShadAlert.leading}
  /// An optional widget to display at the leading edge of the alert, before the
  /// main content. This can be used to add additional information or controls.
  /// {@endtemplate}
  final Widget? leading;

  /// {@template ShadAlert.trailing}
  /// An optional widget to display at the trailing edge of the alert, after the
  /// main content. This can be used to add additional information or controls.
  /// {@endtemplate}
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveAlertTheme = variant == ShadAlertVariant.primary
        ? theme.primaryAlertTheme
        : theme.destructiveAlertTheme;

    final effectiveIconPadding = iconPadding ??
        effectiveAlertTheme.iconPadding ??
        const EdgeInsetsDirectional.only(end: 12);

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

    final effectiveTitleStyle = theme.textTheme.p
        .copyWith(
          color: theme.colorScheme.foreground,
          fontWeight: FontWeight.w500,
          height: 1,
        )
        .merge(effectiveAlertTheme.titleStyle)
        .merge(titleStyle);

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (top != null) top!,
          Row(
            crossAxisAlignment: effectiveCrossAxisAlignment,
            mainAxisAlignment: effectiveMainAxisAlignment,
            textDirection: textDirection,
            children: [
              if (leading != null) leading!,
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
              if (trailing != null) trailing!,
            ],
          ),
          if (bottom != null) bottom!,
        ],
      ),
    );
  }
}
