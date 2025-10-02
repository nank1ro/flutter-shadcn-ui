import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:shadcn_ui/src/utils/position.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'toast.g.theme.dart';

@themeGen
@immutable
class ShadToastTheme with _$ShadToastTheme {
  const ShadToastTheme({
    bool canMerge = true,
    this.backgroundColor,
    this.closeIconData,
    this.alignment,
    this.offset,
    this.duration,
    this.animateIn,
    this.animateOut,
    this.textDirection,
    this.crossAxisAlignment,
    this.showCloseIconOnlyWhenHovered,
    this.titleStyle,
    this.descriptionStyle,
    this.actionPadding,
    this.border,
    this.radius,
    this.shadows,
    this.padding,
    this.closeIconPosition,
    this.constraints,
    this.closeIcon,
    this.mainAxisAlignment,
    this.mainAxisSize,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadToast.backgroundColor}
  final Color? backgroundColor;

  /// {@macro ShadToast.closeIconData}
  final IconData? closeIconData;

  /// {@macro ShadToast.alignment}
  final Alignment? alignment;

  /// {@macro ShadToast.offset}
  final Offset? offset;

  /// {@macro ShadToast.duration}
  final Duration? duration;

  /// {@macro ShadToast.animateIn}
  final List<Effect<dynamic>>? animateIn;

  /// {@macro ShadToast.animateOut}
  final List<Effect<dynamic>>? animateOut;

  /// {@macro ShadToast.textDirection}
  final TextDirection? textDirection;

  /// {@macro ShadToast.crossAxisAlignment}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@macro ShadToast.showCloseIconOnlyWhenHovered}
  final bool? showCloseIconOnlyWhenHovered;

  /// {@macro ShadToast.titleStyle}
  final TextStyle? titleStyle;

  /// {@macro ShadToast.descriptionStyle}
  final TextStyle? descriptionStyle;

  /// {@macro ShadToast.actionPadding}
  final EdgeInsetsGeometry? actionPadding;

  /// {@macro ShadToast.border}
  final Border? border;

  /// {@macro ShadToast.radius}
  final BorderRadius? radius;

  /// {@macro ShadToast.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro ShadToast.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadToast.closeIconPosition}
  final ShadPosition? closeIconPosition;

  /// {@macro ShadToast.constraints}
  final BoxConstraints? constraints;

  /// {@macro ShadToast.closeIcon}
  final Widget? closeIcon;

  /// {@macro ShadToast.mainAxisAlignment}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@macro ShadToast.mainAxisSize}
  final MainAxisSize? mainAxisSize;

  static ShadToastTheme? lerp(
    ShadToastTheme? a,
    ShadToastTheme? b,
    double t,
  ) =>
      _$ShadToastTheme.lerp(a, b, t);
}
