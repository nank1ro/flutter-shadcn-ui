import 'package:flutter/widgets.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'avatar.g.theme.dart';

@themeGen
@immutable
class ShadAvatarTheme with _$ShadAvatarTheme {
  const ShadAvatarTheme({
    bool canMerge = true,
    this.size,
    this.shape,
    this.backgroundColor,
    this.fit,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadAvatar.size}
  final Size? size;

  /// {@macro ShadAvatar.shape}
  final ShapeBorder? shape;

  /// {@macro ShadAvatar.backgroundColor}
  final Color? backgroundColor;

  /// {@macro ShadAvatar.fit}
  final BoxFit? fit;

  static ShadAvatarTheme? lerp(
    ShadAvatarTheme? a,
    ShadAvatarTheme? b,
    double t,
  ) =>
      _$ShadAvatarTheme.lerp(a, b, t);
}
