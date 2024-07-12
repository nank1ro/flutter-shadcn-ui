import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ShadInputDecorator extends StatelessWidget {
  const ShadInputDecorator({
    super.key,
    this.child,
    this.label,
    this.error,
    this.description,
    this.decoration,
  });

  final Widget? child;
  final Widget? label;
  final Widget? error;
  final Widget? description;
  final ShadDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveDecoration = theme.decoration.mergeWith(decoration);
    final hasError = effectiveDecoration.hasError ?? false;

    final effectiveFallbackToLabelStyle =
        effectiveDecoration.fallbackToLabelStyle ?? true;

    final defaultErrorStyle = theme.textTheme.muted.copyWith(
      fontWeight: FontWeight.w500,
      color: theme.colorScheme.destructive,
    );

    final defaultLabelStyle = theme.textTheme.muted.copyWith(
      fontWeight: FontWeight.w500,
      color: theme.colorScheme.foreground,
    );

    final effectiveErrorStyle =
        effectiveDecoration.errorStyle ?? defaultErrorStyle;

    var effectiveLabelStyle = switch (hasError) {
      true => effectiveDecoration.errorLabelStyle,
      false => effectiveDecoration.labelStyle,
    };

    if (effectiveFallbackToLabelStyle && effectiveLabelStyle == null) {
      effectiveLabelStyle = effectiveDecoration.labelStyle ??
          switch (hasError) {
            true => defaultErrorStyle,
            false => defaultLabelStyle,
          };
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: effectiveDecoration.labelPadding ??
                const EdgeInsets.only(bottom: 8),
            child: DefaultTextStyle(
              style: effectiveLabelStyle!,
              child: label!,
            ),
          ),
        if (child != null) child!,
        if (description != null)
          Padding(
            padding: effectiveDecoration.descriptionPadding ??
                const EdgeInsets.only(top: 8),
            child: DefaultTextStyle(
              style:
                  effectiveDecoration.descriptionStyle ?? theme.textTheme.muted,
              child: description!,
            ),
          ),
        if (error != null)
          Padding(
            padding: effectiveDecoration.errorPadding ??
                const EdgeInsets.only(top: 8),
            child: DefaultTextStyle(
              style: effectiveErrorStyle,
              child: error!,
            ),
          ),
      ],
    );
  }
}
