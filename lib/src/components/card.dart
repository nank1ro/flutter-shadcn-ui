import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

class ShadcnCard extends StatelessWidget {
  const ShadcnCard({
    super.key,
    this.title,
    this.description,
    this.content,
    this.footer,
    this.padding,
    this.backgroundColor,
    this.radius,
    this.border,
    this.shadows,
  });

  final Widget? title;
  final Widget? description;
  final Widget? content;
  final Widget? footer;

  final EdgeInsets? padding;
  final Color? backgroundColor;
  final BorderRadius? radius;
  final Border? border;
  final List<BoxShadow>? shadows;

  @override
  Widget build(BuildContext context) {
    final theme = ShadcnTheme.of(context);

    final effectivePadding =
        padding ?? theme.cardTheme.padding ?? const EdgeInsets.all(24);
    final effectiveBackgroundColor = backgroundColor ??
        theme.cardTheme.backgroundColor ??
        theme.colorScheme.card;
    final effectiveRadius = radius ?? theme.cardTheme.radius ?? theme.radius;
    final effectiveBorder = border ??
        theme.cardTheme.border ??
        Border.all(color: theme.colorScheme.border);
    final effectiveShadows = shadows ?? theme.cardTheme.shadows;

    return Container(
      padding: effectivePadding,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: effectiveRadius,
        border: effectiveBorder,
        boxShadow: effectiveShadows,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            DefaultTextStyle(
              style: theme.textTheme.h3
                  .copyWith(color: theme.colorScheme.cardForeground),
              child: title!,
            ),
          if (description != null)
            DefaultTextStyle(
              style: theme.textTheme.muted,
              child: description!,
            ),
          if (content != null) content!,
          if (footer != null) footer!,
        ],
      ),
    );
  }
}
