import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

enum _ShadDividerType { vertical, horizontal }

class ShadDivider extends StatelessWidget {
  const ShadDivider.vertical({
    this.margin,
    this.thickness,
    this.color,
    super.key,
  }) : _type = _ShadDividerType.vertical;

  const ShadDivider.horizontal({
    this.margin,
    this.thickness,
    this.color,
    super.key,
  }) : _type = _ShadDividerType.horizontal;

  final EdgeInsets? margin;
  final double? thickness;
  final Color? color;
  final _ShadDividerType _type;

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
        switch (_type) {
          _ShadDividerType.vertical => dividerTheme.verticalDividerMargin,
          _ShadDividerType.horizontal => dividerTheme.horizontalDividerMargin,
        };

    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: switch (_type) {
        _ShadDividerType.vertical => Container(
            width: thickness,
            decoration: BoxDecoration(border: Border(left: borderSide)),
          ),
        _ShadDividerType.horizontal => Container(
            height: thickness,
            decoration: BoxDecoration(border: Border(bottom: borderSide)),
          ),
      },
    );
  }
}
