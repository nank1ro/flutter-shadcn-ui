import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';
import 'package:universal_image/universal_image.dart';

/// A widget that displays an avatar image with customizable size, shape, and
/// fallback.
///
/// The [ShadAvatar] widget renders an image from a provided source, falling
/// back to a placeholder if the image fails to load or is still loading.
class ShadAvatar extends StatelessWidget {
  /// Creates an avatar widget with a specified image source.
  const ShadAvatar(
    this.src, {
    super.key,
    this.placeholder,
    this.size,
    this.shape,
    this.backgroundColor,
    this.package,
    this.fit,
  });

  /// {@template ShadAvatar.src}
  /// The source of the image to display, which can be a network URL, asset
  /// path, or other supported types.
  /// Handled by [UniversalImage] for rendering.
  /// {@endtemplate}
  final dynamic src;

  /// {@template ShadAvatar.placeholder}
  /// The widget to display while the image is loading or if it fails to load.
  /// Defaults to an empty [SizedBox] if not provided.
  /// {@endtemplate}
  final Widget? placeholder;

  /// {@template ShadAvatar.size}
  /// The size of the avatar, overriding the theme default if specified.
  /// Defines both width and height; defaults to 40x40 if not set.
  /// {@endtemplate}
  final Size? size;

  /// {@template ShadAvatar.shape}
  /// The shape of the avatar's border, overriding the theme default if
  /// specified.
  /// Typically a [CircleBorder], but can be customized
  /// (e.g., [RoundedRectangleBorder]).
  /// {@endtemplate}
  final ShapeBorder? shape;

  /// {@template ShadAvatar.backgroundColor}
  /// The background color of the avatar, displayed behind the image.
  /// Overrides the theme's muted color if provided.
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template ShadAvatar.package}
  /// The package name for asset images, used when [src] is an asset path.
  /// Optional and only relevant for asset-based images.
  /// {@endtemplate}
  final String? package;

  /// {@template ShadAvatar.fit}
  /// How the image should fit within the avatar's bounds.
  /// Overrides the theme default if specified; affects image scaling and
  /// cropping.
  /// {@endtemplate}
  final BoxFit? fit;

  Size effectiveSize(ShadThemeData theme) {
    return size ?? theme.avatarTheme.size ?? const Size.square(40);
  }

  ShapeBorder effectiveShape(ShadThemeData theme) {
    return shape ?? theme.avatarTheme.shape ?? const CircleBorder();
  }

  Color? effectiveBackgroundColor(ShadThemeData theme) {
    return backgroundColor ??
        theme.avatarTheme.backgroundColor ??
        theme.colorScheme.muted;
  }

  BoxFit? effectiveFit(ShadThemeData theme) {
    return fit ?? theme.avatarTheme.fit;
  }

  Widget frameBuilder(
    BuildContext context,
    Widget child,
    int? frame,
    bool wasSynchronouslyLoaded,
  ) {
    return frame == null ? placeholder ?? const SizedBox.shrink() : child;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    final theme = ShadTheme.of(context);
    final size = effectiveSize(theme);

    return Container(
      width: size.width,
      height: size.height,
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        shape: effectiveShape(theme),
        color: effectiveBackgroundColor(theme),
      ),
      child: UniversalImage(
        src,
        width: size.width,
        height: size.height,
        placeholder: placeholder != null ? Center(child: placeholder) : null,
        fit: effectiveFit(theme),
      ),
    );
  }
}
