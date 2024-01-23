import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';

class ShadcnCard extends StatelessWidget {
  const ShadcnCard({
    super.key,
    this.title,
    this.description,
    this.content,
    this.footer,
  });

  final Widget? title;
  final Widget? description;
  final Widget? content;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final theme = ShadcnTheme.of(context);
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.card,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: theme.colorScheme.border),
        boxShadow: ShadcnShadows.sm,
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
