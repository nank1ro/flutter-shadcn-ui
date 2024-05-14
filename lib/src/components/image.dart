import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

typedef ShadImageSrc = Object;

/// {@template image}
/// Unifies the display of an image.
///
/// It takes a [src] that can be remote or local.
///
/// Handles the correct widget to use depending on the [src].
///
/// It can display the following image's extensions:
/// [.png, .jpg, .jpeg, .svg, .svg.vec] and some more.
///
/// It takes a [width] and [height].
///
/// It takes a [color] or a [gradient] that will be applied to the image.
///
/// Finally it takes a [fit], that defauls to [BoxFit.contain].
/// {@endtemplate}
class ShadImage<T extends ShadImageSrc> extends StatelessWidget {
  /// {@macro image}
  const ShadImage(
    this.src, {
    super.key,
    this.width,
    this.height,
    this.color,
    this.gradient,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.placeholder,
    this.antialiasing = true,
    this.semanticLabel,
    this.svgTheme,
  }) : assert(
          src is String || src is IconData,
          'src must be a String or IconData',
        );

  /// {@macro image}
  const ShadImage.square(
    this.src, {
    super.key,
    required double size,
    this.color,
    this.gradient,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.placeholder,
    this.antialiasing = true,
    this.semanticLabel,
    this.svgTheme,
  })  : width = size,
        height = size,
        assert(
          src is String || src is IconData,
          'src must be a String or IconData',
        );

  /// The src of the image.
  ///
  /// Can be a remote image url or a local asset (svg is supported)
  ///
  /// Accepted data:
  /// - assets/doc.jpg
  /// - assets/email.svg
  /// - assets/email.svg.vec
  /// - https://picsum.photos/200
  final T src;

  /// The width of the image
  final double? width;

  /// The height of the image
  final double? height;

  /// The color of the image
  final Color? color;

  /// The gradient color applied to the image as a mask.
  final Gradient? gradient;

  /// The fit of the image, defaults to BoxFit.contain.
  final BoxFit fit;

  /// An optional placeholder that will be displayed while the image is loading.
  final Widget? placeholder;

  /// The alignment of the image
  final Alignment alignment;

  /// The antialiasing
  final bool antialiasing;

  /// The semantic label
  final String? semanticLabel;

  /// The theme of the svg
  final SvgTheme? svgTheme;

  /// Returns `true` if the image is remote.
  bool get isRemote => Uri.tryParse(src as String)?.host.isNotEmpty ?? false;

  /// Returns `true` if the image is an svg.
  bool get isSvg => (src as String).contains('.svg');

  /// Returns `true` if the image is a vector asset.
  bool get isSvgVector => (src as String).contains('.svg.vec');

  @override
  Widget build(BuildContext context) {
    final imageColor = gradient != null ? Colors.white : color;
    final colorFilter = imageColor != null
        ? ColorFilter.mode(imageColor, BlendMode.srcIn)
        : null;

    final Widget image;

    // If the image is an IconData, use it as an icon
    if (src is IconData) {
      image = Icon(
        src as IconData,
        size: width,
        color: imageColor,
        semanticLabel: semanticLabel,
      );
    } else {
      final sourceString = src as String;
      // If the image is remote, download and display it.
      // Otherwise if the image is a svg image, use the [SvgPicture] class
      // In any other case, display the image as a [png/jpg].
      //
      // Finally, if there is a [gradient], apply a shader mask to the image.
      if (isRemote) {
        if (isSvg) {
          image = SvgPicture.network(
            sourceString,
            width: width,
            height: height,
            fit: fit,
            colorFilter: colorFilter,
            clipBehavior: Clip.antiAlias,
            alignment: alignment,
            placeholderBuilder:
                placeholder != null ? (_) => placeholder! : null,
            semanticsLabel: semanticLabel,
          );
        } else if (isSvg) {
          image = SvgPicture.network(
            sourceString,
            width: width,
            height: height,
            fit: fit,
            colorFilter: colorFilter,
            clipBehavior: Clip.antiAlias,
            alignment: alignment,
            placeholderBuilder:
                placeholder != null ? (_) => placeholder! : null,
            semanticsLabel: semanticLabel,
          );
        } else {
          image = Image.network(
            sourceString,
            width: width,
            height: height,
            fit: fit,
            semanticLabel: semanticLabel,
            color: imageColor,
            alignment: alignment,
            isAntiAlias: antialiasing,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (frame == null) {
                return placeholder ?? const SizedBox.shrink();
              }
              return child;
            },
          );
        }
      } else if (isSvgVector) {
        image = SvgPicture(
          AssetBytesLoader(sourceString),
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
          colorFilter: colorFilter,
          clipBehavior: Clip.antiAlias,
          placeholderBuilder: placeholder != null ? (_) => placeholder! : null,
          semanticsLabel: semanticLabel,
        );
      } else if (isSvg) {
        image = SvgPicture.asset(
          sourceString,
          width: width,
          height: height,
          fit: fit,
          colorFilter: colorFilter,
          clipBehavior: Clip.antiAlias,
          alignment: alignment,
          placeholderBuilder: placeholder != null ? (_) => placeholder! : null,
          semanticsLabel: semanticLabel,
        );
      } else {
        image = Image.asset(
          sourceString,
          width: width,
          height: height,
          fit: fit,
          color: imageColor,
          isAntiAlias: antialiasing,
          alignment: alignment,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (frame == null) {
              return placeholder ?? const SizedBox.shrink();
            }
            return child;
          },
          semanticLabel: semanticLabel,
        );
      }
    }

    if (gradient == null) return image;

    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient!.createShader(Offset.zero & bounds.size);
      },
      child: image,
    );
  }
}
