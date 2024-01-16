import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';
import 'package:vector_graphics/vector_graphics.dart';

/// {@template image}
/// Unifies the display of an image.
///
/// It takes a [src] that can be remote or local.
///
/// Handles the correct widget to use depending on the [src].
///
/// It can display the following image's extensions:
/// [.png, .jpg, .jpeg, .svg, .svg.vec, .riv] and some more.
///
/// It takes a [width] and [height].
///
/// It takes a [color] or a [gradient] that will be applied to the image.
///
/// Finally it takes a [fit], that defauls to [BoxFit.contain].
/// {@endtemplate}
class ShadcnImage extends StatelessWidget {
  /// {@macro image}
  const ShadcnImage(
    this.src, {
    super.key,
    this.width,
    this.height,
    this.color,
    this.gradient,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.placeholder,
    this.artboard,
    this.stateMachines = const [],
    this.animations = const [],
    this.antialiasing = true,
    this.semanticLabel,
    this.useArtboardSize = false,
    this.controllers = const [],
    this.onInit,
    this.svgTheme,
  });

  /// {@macro image}
  const ShadcnImage.square(
    this.src, {
    super.key,
    required double size,
    this.color,
    this.gradient,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.placeholder,
    this.artboard,
    this.stateMachines = const [],
    this.animations = const [],
    this.antialiasing = true,
    this.semanticLabel,
    this.useArtboardSize = false,
    this.controllers = const [],
    this.onInit,
    this.svgTheme,
  })  : width = size,
        height = size;

  /// The src of the image.
  ///
  /// Can be a remote image url or a local asset (svg is supported)
  ///
  /// Accepted data:
  /// - assets/animation.riv
  /// - assets/doc.jpg
  /// - assets/email.svg
  /// - assets/email.svg.vec
  /// - https://picsum.photos/200
  final String src;

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

  /// The artboard of the rive animation
  final String? artboard;

  /// The animations of the rive animation
  final List<String> animations;

  /// The state machines of the rive animation
  final List<String> stateMachines;

  /// The alignment of the image
  final Alignment alignment;

  /// The antialiasing
  final bool antialiasing;

  /// The semantic label
  final String? semanticLabel;

  /// The size of the artboard of the rive animation
  final bool useArtboardSize;

  /// The controllers of the rive animation
  final List<RiveAnimationController<dynamic>> controllers;

  /// The on init callback of the rive animation
  final void Function(Artboard)? onInit;

  /// The theme of the svg
  final SvgTheme? svgTheme;

  /// Returns `true` if the image is remote.
  bool get isRemote => Uri.tryParse(src)?.host.isNotEmpty ?? false;

  /// Returns `true` if the image is an svg.
  bool get isSvg => src.contains('.svg');

  /// Returns `true` if the image is a rive asset.
  bool get isRive => src.contains('.riv');

  /// Returns `true` if the image is a vector asset.
  bool get isSvgVector => src.contains('.svg.vec');

  @override
  Widget build(BuildContext context) {
    final imageColor = gradient != null ? Colors.white : color;
    final colorFilter = imageColor != null
        ? ColorFilter.mode(imageColor, BlendMode.srcIn)
        : null;

    final Widget image;
    // If the image is remote, download and display it.
    // Otherwise if the image is a svg image, use the [SvgPicture] class
    // In any other case, display the image as a [png/jpg].
    //
    // Finally, if there is a [gradient], apply a shader mask to the image.
    if (isRemote) {
      if (isSvg) {
        image = SvgPicture.network(
          src,
          width: width,
          height: height,
          fit: fit,
          colorFilter: colorFilter,
          clipBehavior: Clip.antiAlias,
          alignment: alignment,
          placeholderBuilder: placeholder != null ? (_) => placeholder! : null,
          semanticsLabel: semanticLabel,
        );
      } else if (isRive) {
        image = SizedBox(
          width: width,
          height: height,
          child: RiveAnimation.network(
            src,
            fit: fit,
            animations: animations,
            artboard: artboard,
            stateMachines: stateMachines,
            placeHolder: placeholder,
            alignment: alignment,
            antialiasing: antialiasing,
            useArtboardSize: useArtboardSize,
            controllers: controllers,
            onInit: onInit,
          ),
        );
      } else if (isSvg) {
        image = SvgPicture.network(
          src,
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
        image = Image.network(
          src,
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
        AssetBytesLoader(src),
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
        src,
        width: width,
        height: height,
        fit: fit,
        colorFilter: colorFilter,
        clipBehavior: Clip.antiAlias,
        alignment: alignment,
        placeholderBuilder: placeholder != null ? (_) => placeholder! : null,
        semanticsLabel: semanticLabel,
      );
    } else if (isRive) {
      image = SizedBox(
        width: width,
        height: height,
        child: RiveAnimation.asset(
          src,
          fit: fit,
          artboard: artboard,
          stateMachines: stateMachines,
          placeHolder: placeholder,
          alignment: alignment,
          antialiasing: antialiasing,
          useArtboardSize: useArtboardSize,
          controllers: controllers,
          onInit: onInit,
        ),
      );
    } else {
      image = Image.asset(
        src,
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
    if (gradient == null) return image;

    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient!.createShader(Offset.zero & bounds.size);
      },
      child: image,
    );
  }
}
