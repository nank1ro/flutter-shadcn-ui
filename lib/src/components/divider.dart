import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

enum ShadDividerVariant { vertical, horizontal }

class ShadDivider extends StatelessWidget {
  const ShadDivider.vertical({
    this.margin,
    this.thickness,
    this.color,
    super.key,
  }) : variant = ShadDividerVariant.vertical;

  const ShadDivider.horizontal({
    this.margin,
    this.thickness,
    this.color,
    super.key,
  }) : variant = ShadDividerVariant.horizontal;

  const ShadDivider.raw({
    this.margin,
    this.thickness,
    this.color,
    required this.variant,
    super.key,
  });

  final EdgeInsets? margin;
  final double? thickness;
  final Color? color;
  final ShadDividerVariant variant;

  @override
  Widget build(BuildContext context) {
    final shadTheme = ShadTheme.of(context);
    final dividerTheme = shadTheme.dividerTheme;

    final thickness = this.thickness ?? dividerTheme.thickness;
    final color = this.color ?? dividerTheme.color;
    final borderSide = BorderSide(
      color: color ?? shadTheme.colorScheme.border,
      width: thickness ?? 1,
    );

    final margin = this.margin ??
        switch (variant) {
          ShadDividerVariant.vertical => dividerTheme.verticalMargin,
          ShadDividerVariant.horizontal => dividerTheme.horizontalMargin,
        } ??
        EdgeInsets.zero;

    return Padding(
      padding: margin,
      child: switch (variant) {
        ShadDividerVariant.vertical => Container(
            width: thickness,
            decoration: BoxDecoration(border: Border(left: borderSide)),
          ),
        ShadDividerVariant.horizontal => Container(
            height: thickness,
            decoration: BoxDecoration(border: Border(bottom: borderSide)),
          ),
      },
    );
  }
}
