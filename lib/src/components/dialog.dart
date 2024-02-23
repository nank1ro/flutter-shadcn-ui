import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/assets.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/image.dart';
import 'package:shadcn_ui/src/raw_components/same_width_column.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/position.dart';
import 'package:shadcn_ui/src/utils/separated_iterable.dart';

enum ShadDialogVariant {
  primary,
  alert,
}

class ShadDialog extends StatelessWidget {
  const ShadDialog({
    super.key,
    this.title,
    this.description,
    this.content,
    this.actions = const [],
    this.closeIcon,
    this.closeIconSrc,
    this.closeIconPosition,
    this.radius,
  }) : variant = ShadDialogVariant.primary;

  const ShadDialog.alert({
    super.key,
    this.title,
    this.description,
    this.content,
    this.actions = const [],
    this.closeIcon,
    this.closeIconSrc,
    this.closeIconPosition,
    this.radius,
  }) : variant = ShadDialogVariant.alert;

  final Widget? title;
  final Widget? description;
  final Widget? content;
  final ShadDialogVariant variant;
  final List<Widget> actions;
  final Widget? closeIcon;
  final String? closeIconSrc;
  final ShadPosition? closeIconPosition;
  final BorderRadius? radius;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveDialogTheme = switch (variant) {
      ShadDialogVariant.primary => theme.primaryDialogTheme,
      ShadDialogVariant.alert => theme.alertDialogTheme,
    };

    final effectiveCloseIcon = closeIcon ??
        (closeIconSrc == null && effectiveDialogTheme.closeIconSrc == null
            ? null
            : ShadButton.ghost(
                icon: ShadImage.square(
                  size: 16,
                  closeIconSrc ??
                      effectiveDialogTheme.closeIconSrc ??
                      ShadAssets.x,
                ),
                width: 20,
                height: 20,
                padding: EdgeInsets.zero,
                foregroundColor: theme.colorScheme.foreground.withOpacity(.5),
                hoverBackgroundColor: Colors.transparent,
                hoverForegroundColor: theme.colorScheme.foreground,
                pressedForegroundColor: theme.colorScheme.foreground,
                onPressed: () => Navigator.of(context).pop(),
              ));

    final effectiveCloseIconPosition = closeIconPosition ??
        effectiveDialogTheme.closeIconPosition ??
        const ShadPosition(top: 8, right: 8);

    final effectiveRadius =
        radius ?? effectiveDialogTheme.radius ?? theme.radius;

    return Align(
      child: Animate(
        effects: const [
          FadeEffect(),
          ScaleEffect(begin: Offset(.95, .95), end: Offset(1, 1)),
        ],
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 512),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme.colorScheme.background,
              borderRadius: effectiveRadius,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: ShadSameWidthColumn(
                    children: [
                      if (title != null)
                        DefaultTextStyle(
                          style: theme.textTheme.large.copyWith(
                            color: theme.colorScheme.foreground,
                          ),
                          textAlign: TextAlign.start,
                          child: title!,
                        ),
                      if (description != null)
                        DefaultTextStyle(
                          style: theme.textTheme.muted,
                          textAlign: TextAlign.start,
                          child: description!,
                        ),
                      if (content != null) content!,
                      if (actions.isNotEmpty)
                        Flex(
                          direction: Axis.horizontal,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: actions,
                        ),
                    ].separatedBy(const SizedBox(height: 8)),
                  ),
                ),
                if (effectiveCloseIcon != null)
                  effectiveCloseIcon.positionedWith(effectiveCloseIconPosition),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
