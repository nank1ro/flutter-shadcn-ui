// // ignore_for_file: lines_longer_than_80_chars
//

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
extension ShadBorderSideToBorderSide on ShadBorderSide {
  BorderSide toBorderSide() {
    if (width == null || width == 0) return BorderSide.none;
    return BorderSide(
      color: color ?? Colors.transparent,
      width: width ?? 1,
      style: style ?? BorderStyle.solid,
      strokeAlign: strokeAlign ?? BorderSide.strokeAlignInside,
    );
  }
}

extension ShadBorderToBorder on ShadBorder {
  Border toBorder() {
    return Border(
      top: top?.toBorderSide() ?? BorderSide.none,
      right: right?.toBorderSide() ?? BorderSide.none,
      bottom: bottom?.toBorderSide() ?? BorderSide.none,
      left: left?.toBorderSide() ?? BorderSide.none,
    );
  }
}
//
// /// Base class for box borders that can paint as rectangles, circles, or rounded
// /// rectangles.
// ///
// /// This class is extended by [Border] and [ShadBorderDirectional] to provide
// /// concrete versions of four-sided borders using different conventions for
// /// specifying the sides.
// ///
// /// The only API difference that this class introduces over [ShapeBorder] is
// /// that its [paint] method takes additional arguments.
// ///
// /// See also:
// ///
// ///  * [ShadBorderSide], which is used to describe each side of the box.
// ///  * [RoundedRectangleBorder], another way of describing a box's border.
// ///  * [CircleBorder], another way of describing a circle border.
// ///  * [BoxDecoration], which uses a [ShadBoxBorder] to describe its borders.
// abstract class ShadBoxBorder extends ShapeBorder {
//   /// Abstract const constructor. This constructor enables subclasses to provide
//   /// const constructors so that they can be used in const expressions.
//   const ShadBoxBorder();
//
//   /// The top side of this border.
//   ///
//   /// This getter is available on both [Border] and [ShadBorderDirectional]. If
//   /// [isUniform] is true, then this is the same style as all the other sides.
//   ShadBorderSide? get top;
//
//   /// The bottom side of this border.
//   ShadBorderSide? get bottom;
//
//   /// Whether all four sides of the border are identical. Uniform borders are
//   /// typically more efficient to paint.
//   ///
//   /// A uniform border by definition has no text direction dependency and
//   /// therefore could be expressed as a [Border], even if it is currently a
//   /// [ShadBorderDirectional]. A uniform border can also be expressed as a
//   /// [RoundedRectangleBorder].
//   bool get isUniform;
//
//   // We override this to tighten the return value, so that callers can assume
//   // that we'll return a [BoxBorder].
//   @override
//   ShadBoxBorder? add(ShapeBorder other, {bool reversed = false}) => null;
//
//   /// Linearly interpolate between two borders.
//   ///
//   /// If a border is null, it is treated as having four [ShadBorderSide.none]
//   /// borders.
//   ///
//   /// This supports interpolating between [Border] and [ShadBorderDirectional]
//   /// objects. If both objects are different types but both have sides on one or
//   /// both of their lateral edges (the two sides that aren't the top and bottom)
//   /// other than [ShadBorderSide.none], then the sides are interpolated by reducing
//   /// `a`'s lateral edges to [ShadBorderSide.none] over the first half of the
//   /// animation, and then bringing `b`'s lateral edges _from_ [ShadBorderSide.none]
//   /// over the second half of the animation.
//   ///
//   /// For a more flexible approach, consider [ShapeBorder.lerp], which would
//   /// instead [add] the two sets of sides and interpolate them simultaneously.
//   ///
//   /// {@macro dart.ui.shadow.lerp}
//   static ShadBoxBorder? lerp(ShadBoxBorder? a, ShadBoxBorder? b, double t) {
//     if (identical(a, b)) return a;
//
//     if ((a is ShadBorder?) && (b is ShadBorder?)) {
//       return ShadBorder.lerp(a, b, t);
//     }
//     if ((a is ShadBorderDirectional?) && (b is ShadBorderDirectional?)) {
//       return ShadBorderDirectional.lerp(a, b, t);
//     }
//     if (b is ShadBorder && a is ShadBorderDirectional) {
//       // ignore: parameter_assignments
//       (a, b) = (b, a);
//       // ignore: parameter_assignments
//       t = 1.0 - t;
//       // fall through to next case
//     }
//
//     if (a is ShadBorder && b is ShadBorderDirectional) {
//       if (b.start == ShadBorderSide.none && b.end == ShadBorderSide.none) {
//         // The fact that b is a BorderDirectional really doesn't matter, it turns out.
//         return ShadBorder(
//           top: ShadBorderSide.lerp(
//             a.top ?? ShadBorderSide.none,
//             b.top ?? ShadBorderSide.none,
//             t,
//           ),
//           right: ShadBorderSide.lerp(
//             a.right ?? ShadBorderSide.none,
//             ShadBorderSide.none,
//             t,
//           ),
//           bottom: ShadBorderSide.lerp(
//             a.bottom ?? ShadBorderSide.none,
//             b.bottom ?? ShadBorderSide.none,
//             t,
//           ),
//           left: ShadBorderSide.lerp(
//             a.left ?? ShadBorderSide.none,
//             ShadBorderSide.none,
//             t,
//           ),
//         );
//       }
//       if (a.left == ShadBorderSide.none && a.right == ShadBorderSide.none) {
//         // The fact that a is a Border really doesn't matter, it turns out.
//         return ShadBorderDirectional(
//           top: ShadBorderSide.lerp(
//             a.top ?? ShadBorderSide.none,
//             b.top ?? ShadBorderSide.none,
//             t,
//           ),
//           start: ShadBorderSide.lerp(
//             ShadBorderSide.none,
//             b.start ?? ShadBorderSide.none,
//             t,
//           ),
//           end: ShadBorderSide.lerp(
//             ShadBorderSide.none,
//             b.end ?? ShadBorderSide.none,
//             t,
//           ),
//           bottom: ShadBorderSide.lerp(
//             a.bottom ?? ShadBorderSide.none,
//             b.bottom ?? ShadBorderSide.none,
//             t,
//           ),
//         );
//       }
//       // Since we have to swap a visual border for a directional one,
//       // we speed up the horizontal sides' transitions and switch from
//       // one mode to the other at t=0.5.
//       if (t < 0.5) {
//         return ShadBorder(
//           top: ShadBorderSide.lerp(
//             a.top ?? ShadBorderSide.none,
//             b.top ?? ShadBorderSide.none,
//             t,
//           ),
//           right: ShadBorderSide.lerp(
//             a.right ?? ShadBorderSide.none,
//             ShadBorderSide.none,
//             t * 2.0,
//           ),
//           bottom: ShadBorderSide.lerp(
//             a.bottom ?? ShadBorderSide.none,
//             b.bottom ?? ShadBorderSide.none,
//             t,
//           ),
//           left: ShadBorderSide.lerp(
//             a.left ?? ShadBorderSide.none,
//             ShadBorderSide.none,
//             t * 2.0,
//           ),
//         );
//       }
//       return ShadBorderDirectional(
//         top: ShadBorderSide.lerp(
//           a.top ?? ShadBorderSide.none,
//           b.top ?? ShadBorderSide.none,
//           t,
//         ),
//         start: ShadBorderSide.lerp(
//           ShadBorderSide.none,
//           b.start ?? ShadBorderSide.none,
//           (t - 0.5) * 2.0,
//         ),
//         end: ShadBorderSide.lerp(
//           ShadBorderSide.none,
//           b.end ?? ShadBorderSide.none,
//           (t - 0.5) * 2.0,
//         ),
//         bottom: ShadBorderSide.lerp(
//           a.bottom ?? ShadBorderSide.none,
//           b.bottom ?? ShadBorderSide.none,
//           t,
//         ),
//       );
//     }
//     throw FlutterError.fromParts(<DiagnosticsNode>[
//       ErrorSummary(
//         'BoxBorder.lerp can only interpolate Border and BorderDirectional classes.',
//       ),
//       ErrorDescription(
//         'BoxBorder.lerp() was called with two objects of type ${a.runtimeType} and ${b.runtimeType}:\n'
//         '  $a\n'
//         '  $b\n'
//         'However, only Border and BorderDirectional classes are supported by this method.',
//       ),
//       ErrorHint(
//         'For a more general interpolation method, consider using ShapeBorder.lerp instead.',
//       ),
//     ]);
//   }
//
//   @override
//   Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
//     assert(
//       textDirection != null,
//       'The textDirection argument to $runtimeType.getInnerPath must not be null.',
//     );
//     return Path()..addRect(dimensions.resolve(textDirection).deflateRect(rect));
//   }
//
//   @override
//   Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
//     assert(
//       textDirection != null,
//       'The textDirection argument to $runtimeType.getOuterPath must not be null.',
//     );
//     return Path()..addRect(rect);
//   }
//
//   @override
//   void paintInterior(
//     Canvas canvas,
//     Rect rect,
//     Paint paint, {
//     TextDirection? textDirection,
//   }) {
//     // For `ShapeDecoration(shape: Border.all())`, a rectangle with sharp edges
//     // is always painted. There is no borderRadius parameter for
//     // ShapeDecoration or Border, only for BoxDecoration, which doesn't call
//     // this method.
//     canvas.drawRect(rect, paint);
//   }
//
//   @override
//   bool get preferPaintInterior => true;
//
//   /// Paints the border within the given [Rect] on the given [Canvas].
//   ///
//   /// This is an extension of the [ShapeBorder.paint] method. It allows
//   /// [ShadBoxBorder] borders to be applied to different [BoxShape]s and with
//   /// different [borderRadius] parameters, without changing the [ShadBoxBorder]
//   /// object itself.
//   ///
//   /// The `shape` argument specifies the [BoxShape] to draw the border on.
//   ///
//   /// If the `shape` is specifies a rectangular box shape
//   /// ([BoxShape.rectangle]), then the `borderRadius` argument describes the
//   /// corners of the rectangle.
//   ///
//   /// The [getInnerPath] and [getOuterPath] methods do not know about the
//   /// `shape` and `borderRadius` arguments.
//   ///
//   /// See also:
//   ///
//   ///  * [paintBorder], which is used if the border has non-uniform colors or styles and no borderRadius.
//   ///  * [Border.paint], similar to this method, includes additional comments
//   ///    and provides more details on each parameter than described here.
//   @override
//   void paint(
//     Canvas canvas,
//     Rect rect, {
//     TextDirection? textDirection,
//     BoxShape shape = BoxShape.rectangle,
//     BorderRadius? borderRadius,
//   });
//
//   static void _paintUniformBorderWithRadius(
//     Canvas canvas,
//     Rect rect,
//     ShadBorderSide side,
//     BorderRadius borderRadius,
//   ) {
//     assert(side.style != BorderStyle.none);
//     final paint = Paint()..color = side.color ?? Colors.transparent;
//     final width = side.width;
//     if (width == 0.0) {
//       paint
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = 0.0;
//       canvas.drawRRect(borderRadius.toRRect(rect), paint);
//     } else {
//       final borderRect = borderRadius.toRRect(rect);
//       final inner = borderRect.deflate(side.strokeInset);
//       final outer = borderRect.inflate(side.strokeOutset);
//       canvas.drawDRRect(outer, inner, paint);
//     }
//   }
//
//   /// Paints a Border with different widths, styles and strokeAligns, on any
//   /// borderRadius while using a single color.
//   ///
//   /// See also:
//   ///
//   ///  * [paintBorder], which supports multiple colors but not borderRadius.
//   ///  * [paint], which calls this method.
//   static void paintNonUniformBorder(
//     Canvas canvas,
//     Rect rect, {
//     required BorderRadius? borderRadius,
//     required TextDirection? textDirection,
//     BoxShape shape = BoxShape.rectangle,
//     ShadBorderSide? top,
//     ShadBorderSide? right,
//     ShadBorderSide? bottom,
//     ShadBorderSide? left,
//     Color? color,
//   }) {
//     final RRect borderRect;
//     switch (shape) {
//       case BoxShape.rectangle:
//         borderRect = (borderRadius ?? BorderRadius.zero)
//             .resolve(textDirection)
//             .toRRect(rect);
//       case BoxShape.circle:
//         assert(
//           borderRadius == null,
//           'A borderRadius cannot be given when shape is a BoxShape.circle.',
//         );
//         borderRect = RRect.fromRectAndRadius(
//           Rect.fromCircle(center: rect.center, radius: rect.shortestSide / 2.0),
//           Radius.circular(rect.width),
//         );
//     }
//     final paint = Paint();
//     if (color != null) {
//       paint.color = color;
//     }
//     final inner = _deflateRRect(
//       borderRect,
//       EdgeInsets.fromLTRB(
//         left?.strokeInset ?? ShadBorderSide.strokeAlignInside,
//         top?.strokeInset ?? ShadBorderSide.strokeAlignInside,
//         right?.strokeInset ?? ShadBorderSide.strokeAlignInside,
//         bottom?.strokeInset ?? ShadBorderSide.strokeAlignInside,
//       ),
//     );
//     final outer = _inflateRRect(
//       borderRect,
//       EdgeInsets.fromLTRB(
//         left?.strokeOutset ?? ShadBorderSide.strokeAlignInside,
//         top?.strokeOutset ?? ShadBorderSide.strokeAlignInside,
//         right?.strokeOutset ?? ShadBorderSide.strokeAlignInside,
//         bottom?.strokeOutset ?? ShadBorderSide.strokeAlignInside,
//       ),
//     );
//     canvas.drawDRRect(outer, inner, paint);
//   }
//
//   static RRect _inflateRRect(RRect rect, EdgeInsets insets) {
//     return RRect.fromLTRBAndCorners(
//       rect.left - insets.left,
//       rect.top - insets.top,
//       rect.right + insets.right,
//       rect.bottom + insets.bottom,
//       topLeft: (rect.tlRadius + Radius.elliptical(insets.left, insets.top))
//           .clamp(minimum: Radius.zero),
//       topRight: (rect.trRadius + Radius.elliptical(insets.right, insets.top))
//           .clamp(minimum: Radius.zero),
//       bottomRight:
//           (rect.brRadius + Radius.elliptical(insets.right, insets.bottom))
//               .clamp(minimum: Radius.zero),
//       bottomLeft:
//           (rect.blRadius + Radius.elliptical(insets.left, insets.bottom))
//               .clamp(minimum: Radius.zero),
//     );
//   }
//
//   static RRect _deflateRRect(RRect rect, EdgeInsets insets) {
//     return RRect.fromLTRBAndCorners(
//       rect.left + insets.left,
//       rect.top + insets.top,
//       rect.right - insets.right,
//       rect.bottom - insets.bottom,
//       topLeft: (rect.tlRadius - Radius.elliptical(insets.left, insets.top))
//           .clamp(minimum: Radius.zero),
//       topRight: (rect.trRadius - Radius.elliptical(insets.right, insets.top))
//           .clamp(minimum: Radius.zero),
//       bottomRight:
//           (rect.brRadius - Radius.elliptical(insets.right, insets.bottom))
//               .clamp(minimum: Radius.zero),
//       bottomLeft:
//           (rect.blRadius - Radius.elliptical(insets.left, insets.bottom))
//               .clamp(minimum: Radius.zero),
//     );
//   }
//
//   static void _paintUniformBorderWithCircle(
//     Canvas canvas,
//     Rect rect,
//     ShadBorderSide side,
//   ) {
//     assert(side.style != BorderStyle.none);
//     final radius = (rect.shortestSide + side.strokeOffset) / 2;
//     canvas.drawCircle(rect.center, radius, side.toPaint());
//   }
//
//   static void _paintUniformBorderWithRectangle(
//     Canvas canvas,
//     Rect rect,
//     ShadBorderSide side,
//   ) {
//     assert(side.style != BorderStyle.none);
//     canvas.drawRect(rect.inflate(side.strokeOffset / 2), side.toPaint());
//   }
// }
//
// /// A border of a box, comprised of four sides: top, right, bottom, left.
// ///
// /// The sides are represented by [ShadBorderSide] objects.
// ///
// /// {@tool snippet}
// ///
// /// All four borders the same, two-pixel wide solid white:
// ///
// /// ```dart
// /// Border.all(width: 2.0, color: const Color(0xFFFFFFFF))
// /// ```
// /// {@end-tool}
// /// {@tool snippet}
// ///
// /// The border for a Material Design divider:
// ///
// /// ```dart
// /// Border(bottom: BorderSide(color: Theme.of(context).dividerColor))
// /// ```
// /// {@end-tool}
// /// {@tool snippet}
// ///
// /// A 1990s-era "OK" button:
// ///
// /// ```dart
// /// Container(
// ///   decoration: const BoxDecoration(
// ///     border: Border(
// ///       top: BorderSide(color: Color(0xFFFFFFFF)),
// ///       left: BorderSide(color: Color(0xFFFFFFFF)),
// ///       right: BorderSide(),
// ///       bottom: BorderSide(),
// ///     ),
// ///   ),
// ///   child: Container(
// ///     padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
// ///     decoration: const BoxDecoration(
// ///       border: Border(
// ///         top: BorderSide(color: Color(0xFFDFDFDF)),
// ///         left: BorderSide(color: Color(0xFFDFDFDF)),
// ///         right: BorderSide(color: Color(0xFF7F7F7F)),
// ///         bottom: BorderSide(color: Color(0xFF7F7F7F)),
// ///       ),
// ///       color: Color(0xFFBFBFBF),
// ///     ),
// ///     child: const Text(
// ///       'OK',
// ///       textAlign: TextAlign.center,
// ///       style: TextStyle(color: Color(0xFF000000))
// ///     ),
// ///   ),
// /// )
// /// ```
// /// {@end-tool}
// ///
// /// See also:
// ///
// ///  * [BoxDecoration], which uses this class to describe its edge decoration.
// ///  * [ShadBorderSide], which is used to describe each side of the box.
// ///  * [paint], which explains the behavior of [BoxDecoration] parameters.
// ///  * <https://pub.dev/packages/non_uniform_border>, a package that implements
// ///    a Non-Uniform Border on ShapeBorder, which is used by Material Design
// ///    buttons and other widgets, under the "shape" field.

class ShadBorder {
  /// Creates a border.
  ///
  /// All the sides of the border default to [ShadBorderSide.none].
  const ShadBorder({
    this.merge = true,
    this.padding,
    this.radius,
    this.top,
    this.right,
    this.bottom,
    this.left,
  });

  /// Creates a border whose sides are all the same.
  const ShadBorder.fromBorderSide(
    ShadBorderSide side, {
    this.merge = true,
    this.padding,
    this.radius,
  })  : top = side,
        right = side,
        bottom = side,
        left = side;

  /// Creates a border with symmetrical vertical and horizontal sides.
  ///
  /// The `vertical` argument applies to the [left] and [right] sides, and the
  /// `horizontal` argument applies to the [top] and [bottom] sides.
  const ShadBorder.symmetric({
    ShadBorderSide? vertical,
    ShadBorderSide? horizontal,
    this.merge = true,
    this.padding,
    this.radius,
  })  : left = vertical,
        top = horizontal,
        right = vertical,
        bottom = horizontal;

  /// A uniform border with all sides the same color and width.
  ///
  /// The sides default to black solid borders, one logical pixel wide.
  factory ShadBorder.all({
    bool merge = true,
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
    EdgeInsets? padding,
    BorderRadiusGeometry? radius,
  }) {
    final side = ShadBorderSide(
      color: color,
      width: width,
      style: style,
      strokeAlign: strokeAlign,
    );
    return ShadBorder.fromBorderSide(
      side,
      padding: padding,
      merge: merge,
      radius: radius,
    );
  }

  static ShadBorder? lerp(ShadBorder? a, ShadBorder? b, double t) {
    if (identical(a, b)) return a;
    return ShadBorder(
      merge: b?.merge ?? a?.merge ?? true,
      padding: EdgeInsets.lerp(a?.padding, b?.padding, t),
      radius: BorderRadiusGeometry.lerp(a?.radius, b?.radius, t),
      top: ShadBorderSide.lerp(
        a?.top,
        b?.top,
        t,
      ),
      right: ShadBorderSide.lerp(
        a?.right,
        b?.right,
        t,
      ),
      bottom: ShadBorderSide.lerp(
        a?.bottom,
        b?.bottom,
        t,
      ),
      left: ShadBorderSide.lerp(
        a?.left,
        b?.left,
        t,
      ),
    );
  }

  bool get hasBorder =>
      (top?.width ?? 0) != 0 ||
      (right?.width ?? 0) != 0 ||
      (bottom?.width ?? 0) != 0 ||
      (left?.width ?? 0) != 0;

  static const ShadBorder none = ShadBorder(merge: false);

  /// Creates a [ShadBorder] that represents the addition of the two given
  /// [ShadBorder]s.
  ShadBorder mergeWith(ShadBorder? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      top: top?.mergeWith(other.top) ?? other.top,
      right: right?.mergeWith(other.right) ?? other.right,
      bottom: bottom?.mergeWith(other.bottom) ?? other.bottom,
      left: left?.mergeWith(other.left) ?? other.left,
      padding: other.padding,
      radius: other.radius,
    );
  }

  ShadBorder copyWith({
    EdgeInsets? padding,
    ShadBorderSide? top,
    ShadBorderSide? right,
    ShadBorderSide? bottom,
    ShadBorderSide? left,
    BorderRadiusGeometry? radius,
  }) {
    return ShadBorder(
      top: top ?? this.top,
      right: right ?? this.right,
      bottom: bottom ?? this.bottom,
      left: left ?? this.left,
      padding: padding ?? this.padding,
      radius: radius ?? this.radius,
    );
  }

  /// Whether to merge with another border, defaults to true.
  final bool merge;

  /// The padding of the border, defaults to null.
  final EdgeInsets? padding;

  /// The border radius of the border, defaults to null.
  final BorderRadiusGeometry? radius;

  final ShadBorderSide? top;

  /// The right side of this border.
  final ShadBorderSide? right;

  final ShadBorderSide? bottom;

  /// The left side of this border.
  final ShadBorderSide? left;

  @override
  String toString() {
    return '''ShadBorder(merge: $merge, padding: $padding, radius: $radius, top: $top, right: $right, bottom: $bottom, left: $left)''';
  }
}

//
// /// A border of a box, comprised of four sides, the lateral sides of which
// /// flip over based on the reading direction.
// ///
// /// The lateral sides are called [start] and [end]. When painted in
// /// left-to-right environments, the [start] side will be painted on the left and
// /// the [end] side on the right; in right-to-left environments, it is the
// /// reverse. The other two sides are [top] and [bottom].
// ///
// /// The sides are represented by [ShadBorderSide] objects.
// ///
// /// If the [start] and [end] sides are the same, then it is slightly more
// /// efficient to use a [ShadBorder] object rather than a [ShadBorderDirectional] object.
// ///
// /// See also:
// ///
// ///  * [BoxDecoration], which uses this class to describe its edge decoration.
// ///  * [ShadBorderSide], which is used to describe each side of the box.
// ///  * <https://pub.dev/packages/non_uniform_border>, a package that implements
// ///    a Non-Uniform Border on ShapeBorder, which is used by Material Design
// ///    buttons and other widgets, under the "shape" field.
// class ShadBorderDirectional extends ShadBoxBorder {
//   /// Creates a border.
//   ///
//   /// The [start] and [end] sides represent the horizontal sides; the start side
//   /// is on the leading edge given the reading direction, and the end side is on
//   /// the trailing edge. They are resolved during [paint].
//   const ShadBorderDirectional({
//     this.merge = true,
//     this.top,
//     this.start,
//     this.end,
//     this.bottom,
//   });
//
//   /// Creates a [ShadBorderDirectional] that represents the addition of the two
//   /// given [ShadBorderDirectional]s.
//   ShadBorderDirectional mergeWith(ShadBorderDirectional? other) {
//     if (other == null) return this;
//     if (!other.merge) return other;
//     return copyWith(
//       top: top?.mergeWith(other.top) ?? other.top,
//       start: start?.mergeWith(other.start) ?? other.start,
//       end: end?.mergeWith(other.end) ?? other.end,
//       bottom: bottom?.mergeWith(other.bottom) ?? other.bottom,
//     );
//   }
//
//   ShadBorderDirectional copyWith({
//     bool? merge,
//     ShadBorderSide? top,
//     ShadBorderSide? start,
//     ShadBorderSide? end,
//     ShadBorderSide? bottom,
//   }) {
//     return ShadBorderDirectional(
//       merge: merge ?? this.merge,
//       top: top ?? this.top,
//       start: start ?? this.start,
//       end: end ?? this.end,
//       bottom: bottom ?? this.bottom,
//     );
//   }
//
//   final bool merge;
//
//   @override
//   final ShadBorderSide? top;
//
//   /// The start side of this border.
//   ///
//   /// This is the side on the left in left-to-right text and on the right in
//   /// right-to-left text.
//   ///
//   /// See also:
//   ///
//   ///  * [TextDirection], which is used to describe the reading direction.
//   final ShadBorderSide? start;
//
//   /// The end side of this border.
//   ///
//   /// This is the side on the right in left-to-right text and on the left in
//   /// right-to-left text.
//   ///
//   /// See also:
//   ///
//   ///  * [TextDirection], which is used to describe the reading direction.
//   final ShadBorderSide? end;
//
//   @override
//   final ShadBorderSide? bottom;
//
//   @override
//   EdgeInsetsGeometry get dimensions {
//     if (isUniform) {
//       return EdgeInsetsDirectional.all(
//         top?.strokeInset ?? BorderSide.strokeAlignInside,
//       );
//     }
//     return EdgeInsetsDirectional.fromSTEB(
//       start?.strokeInset ?? BorderSide.strokeAlignInside,
//       top?.strokeInset ?? BorderSide.strokeAlignInside,
//       end?.strokeInset ?? BorderSide.strokeAlignInside,
//       bottom?.strokeInset ?? BorderSide.strokeAlignInside,
//     );
//   }
//
//   @override
//   bool get isUniform =>
//       _colorIsUniform &&
//       _widthIsUniform &&
//       _styleIsUniform &&
//       _strokeAlignIsUniform;
//
//   bool get _colorIsUniform {
//     final topColor = top?.color;
//     return start?.color == topColor &&
//         bottom?.color == topColor &&
//         end?.color == topColor;
//   }
//
//   bool get _widthIsUniform {
//     final topWidth = top?.width;
//     return start?.width == topWidth &&
//         bottom?.width == topWidth &&
//         end?.width == topWidth;
//   }
//
//   bool get _styleIsUniform {
//     final topStyle = top?.style;
//     return start?.style == topStyle &&
//         bottom?.style == topStyle &&
//         end?.style == topStyle;
//   }
//
//   bool get _strokeAlignIsUniform {
//     final topStrokeAlign = top?.strokeAlign;
//     return start?.strokeAlign == topStrokeAlign &&
//         bottom?.strokeAlign == topStrokeAlign &&
//         end?.strokeAlign == topStrokeAlign;
//   }
//
//   Set<Color> _distinctVisibleColors() {
//     return <Color>{
//       if (top?.style != BorderStyle.none) top?.color ?? Colors.transparent,
//       if (end?.style != BorderStyle.none) end?.color ?? Colors.transparent,
//       if (bottom?.style != BorderStyle.none)
//         bottom?.color ?? Colors.transparent,
//       if (start?.style != BorderStyle.none) start?.color ?? Colors.transparent,
//     };
//   }
//
//   bool get _hasHairlineBorder =>
//       ((top?.style ?? BorderStyle.solid) == BorderStyle.solid &&
//           (top?.width ?? 0) == 0.0) ||
//       ((end?.style ?? BorderStyle.solid) == BorderStyle.solid &&
//           (end?.width ?? 0) == 0.0) ||
//       ((bottom?.style ?? BorderStyle.solid) == BorderStyle.solid &&
//           (bottom?.width ?? 0) == 0.0) ||
//       ((start?.style ?? BorderStyle.solid) == BorderStyle.solid &&
//           (start?.width ?? 0) == 0.0);
//
//   @override
//   ShadBoxBorder? add(ShapeBorder other, {bool reversed = false}) {
//     if (other is ShadBorderDirectional) {
//       return mergeWith(other);
//     }
//     if (other is ShadBorder) {
//       final typedOther = other;
//       // if (start != ShadBorderSide.none || end != ShadBorderSide.none) {
//       //   if (typedOther.left != ShadBorderSide.none ||
//       //       typedOther.right != ShadBorderSide.none) {
//       //     return null;
//       //   }
//       //   assert(typedOther.left == ShadBorderSide.none);
//       //   assert(typedOther.right == ShadBorderSide.none);
//       //   return ShadBorderDirectional(
//       //     top: ShadBorderSide.merge(typedOther.top ?? ShadBorderSide.none, top),
//       //     start: start,
//       //     end: end,
//       //     bottom: ShadBorderSide.merge(
//       //       typedOther.bottom ?? ShadBorderSide.none,
//       //       bottom,
//       //     ),
//       //   );
//       // }
//       // assert(start == ShadBorderSide.none);
//       // assert(end == ShadBorderSide.none);
//       final left = reversed ? typedOther.right : typedOther.left;
//       final right = reversed ? typedOther.left : typedOther.right;
//       return ShadBorder(
//         top: top?.mergeWith(typedOther.top) ?? typedOther.top,
//         right: right?.mergeWith(typedOther.right) ?? typedOther.right,
//         bottom: bottom?.mergeWith(typedOther.bottom) ?? typedOther.bottom,
//         left: left?.mergeWith(typedOther.left) ?? typedOther.left,
//       );
//     }
//     return null;
//   }
//
//   @override
//   ShadBorderDirectional scale(double t) {
//     return ShadBorderDirectional(
//       merge: merge,
//       top: top?.scale(t),
//       start: start?.scale(t),
//       end: end?.scale(t),
//       bottom: bottom?.scale(t),
//     );
//   }
//
//   @override
//   ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
//     if (a is ShadBorderDirectional) {
//       return ShadBorderDirectional.lerp(a, this, t);
//     }
//     return super.lerpFrom(a, t);
//   }
//
//   @override
//   ShapeBorder? lerpTo(ShapeBorder? b, double t) {
//     if (b is ShadBorderDirectional) {
//       return ShadBorderDirectional.lerp(this, b, t);
//     }
//     return super.lerpTo(b, t);
//   }
//
//   /// Linearly interpolate between two borders.
//   ///
//   /// If a border is null, it is treated as having four [ShadBorderSide.none]
//   /// borders.
//   ///
//   /// {@macro dart.ui.shadow.lerp}
//   static ShadBorderDirectional? lerp(
//     ShadBorderDirectional? a,
//     ShadBorderDirectional? b,
//     double t,
//   ) {
//     if (identical(a, b)) return a;
//     return ShadBorderDirectional(
//       top: ShadBorderSide.lerp(
//         a?.top ?? ShadBorderSide.none,
//         b?.top ?? ShadBorderSide.none,
//         t,
//       ),
//       end: ShadBorderSide.lerp(
//         a?.end ?? ShadBorderSide.none,
//         b?.end ?? ShadBorderSide.none,
//         t,
//       ),
//       bottom: ShadBorderSide.lerp(
//         a?.bottom ?? ShadBorderSide.none,
//         b?.bottom ?? ShadBorderSide.none,
//         t,
//       ),
//       start: ShadBorderSide.lerp(
//         a?.start ?? ShadBorderSide.none,
//         b?.start ?? ShadBorderSide.none,
//         t,
//       ),
//     );
//   }
//
//   /// Paints the border within the given [Rect] on the given [Canvas].
//   ///
//   /// Uniform borders are more efficient to paint than more complex borders.
//   ///
//   /// You can provide a [BoxShape] to draw the border on. If the `shape` in
//   /// [BoxShape.circle], there is the requirement that the border [isUniform].
//   ///
//   /// If you specify a rectangular box shape ([BoxShape.rectangle]), then you
//   /// may specify a [BorderRadius]. If a `borderRadius` is specified, there is
//   /// the requirement that the border [isUniform].
//   ///
//   /// The [getInnerPath] and [getOuterPath] methods do not know about the
//   /// `shape` and `borderRadius` arguments.
//   ///
//   /// The `textDirection` argument is used to determine which of [start] and
//   /// [end] map to the left and right. For [TextDirection.ltr], the [start] is
//   /// the left and the [end] is the right; for [TextDirection.rtl], it is the
//   /// reverse.
//   ///
//   /// See also:
//   ///
//   ///  * [paintBorder], which is used if the border has non-uniform colors or styles and no borderRadius.
//   @override
//   void paint(
//     Canvas canvas,
//     Rect rect, {
//     TextDirection? textDirection,
//     BoxShape shape = BoxShape.rectangle,
//     BorderRadius? borderRadius,
//   }) {
//     if (top == null) return;
//     if (isUniform) {
//       switch (top?.style ?? BorderStyle.none) {
//         case BorderStyle.none:
//           return;
//         case BorderStyle.solid:
//           switch (shape) {
//             case BoxShape.circle:
//               assert(
//                 borderRadius == null,
//                 'A borderRadius cannot be given when shape is a BoxShape.circle.',
//               );
//               ShadBoxBorder._paintUniformBorderWithCircle(canvas, rect, top!);
//             case BoxShape.rectangle:
//               if (borderRadius != null && borderRadius != BorderRadius.zero) {
//                 ShadBoxBorder._paintUniformBorderWithRadius(
//                   canvas,
//                   rect,
//                   top!,
//                   borderRadius,
//                 );
//                 return;
//               }
//               ShadBoxBorder._paintUniformBorderWithRectangle(
//                 canvas,
//                 rect,
//                 top!,
//               );
//           }
//           return;
//       }
//     }
//
//     if (_styleIsUniform &&
//         ((top?.style ?? BorderStyle.none) == BorderStyle.none)) {
//       return;
//     }
//
//     assert(
//       textDirection != null,
//       'Non-uniform BorderDirectional objects require a TextDirection when painting.',
//     );
//     final (ShadBorderSide? left, ShadBorderSide? right) =
//         switch (textDirection!) {
//       TextDirection.rtl => (end, start),
//       TextDirection.ltr => (start, end),
//     };
//
//     // Allow painting non-uniform borders if the visible colors are uniform.
//     final visibleColors = _distinctVisibleColors();
//     final hasHairlineBorder = _hasHairlineBorder;
//     if (visibleColors.length == 1 &&
//         !hasHairlineBorder &&
//         (shape == BoxShape.circle ||
//             (borderRadius != null && borderRadius != BorderRadius.zero))) {
//       ShadBoxBorder.paintNonUniformBorder(
//         canvas,
//         rect,
//         shape: shape,
//         borderRadius: borderRadius,
//         textDirection: textDirection,
//         top: top,
//         right: right,
//         bottom: bottom,
//         left: left,
//         color: visibleColors.first,
//       );
//       return;
//     }
//
//     if (hasHairlineBorder) {
//       assert(
//         borderRadius == null || borderRadius == BorderRadius.zero,
//         'A side like `BorderSide(width: 0.0, style: BorderStyle.solid)` can only be drawn when BorderRadius is zero or null. 2',
//       );
//     }
//     assert(
//       borderRadius == null,
//       'A borderRadius can only be given for borders with uniform colors.',
//     );
//     assert(
//       shape == BoxShape.rectangle,
//       'A Border can only be drawn as a circle on borders with uniform colors.',
//     );
//     assert(
//       _strokeAlignIsUniform &&
//           (top?.strokeAlign ?? ShadBorderSide.strokeAlignInside) ==
//               ShadBorderSide.strokeAlignInside,
//       'A Border can only draw strokeAlign different than strokeAlignInside on borders with uniform colors.',
//     );
//
//     paintBorder(
//       canvas,
//       rect,
//       top: top?.toBorderSide() ?? BorderSide.none,
//       left: left?.toBorderSide() ?? BorderSide.none,
//       bottom: bottom?.toBorderSide() ?? BorderSide.none,
//       right: right?.toBorderSide() ?? BorderSide.none,
//     );
//   }
//
//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) {
//       return true;
//     }
//     if (other.runtimeType != runtimeType) {
//       return false;
//     }
//     return other is ShadBorderDirectional &&
//         other.top == top &&
//         other.start == start &&
//         other.end == end &&
//         other.bottom == bottom;
//   }
//
//   @override
//   int get hashCode => Object.hash(top, start, end, bottom);
//
//   @override
//   String toString() {
//     final arguments = <String>[
//       if (top != ShadBorderSide.none) 'top: $top',
//       if (start != ShadBorderSide.none) 'start: $start',
//       if (end != ShadBorderSide.none) 'end: $end',
//       if (bottom != ShadBorderSide.none) 'bottom: $bottom',
//     ];
//     return '${objectRuntimeType(this, 'BorderDirectional')}(${arguments.join(", ")})';
//   }
// }
//
// /// Creates the side of a border.
@immutable
class ShadBorderSide with Diagnosticable {
  /// Creates the side of a border.
  const ShadBorderSide({
    this.merge = true,
    this.color,
    this.width,
    this.style,
    this.strokeAlign,
  }) : assert(width == null || width >= 0.0);

  /// Merges two border sides into one
  ShadBorderSide mergeWith(ShadBorderSide? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      color: other.color,
      width: other.width,
      style: other.style,
      strokeAlign: other.strokeAlign,
    );
  }

  /// Whether to merge the border side
  final bool merge;

  /// The color of this side of the border.
  final Color? color;

  /// The width of this side of the border, in logical pixels.
  ///
  /// Setting width to 0.0 will result in a hairline border. This means that
  /// the border will have the width of one physical pixel. Hairline
  /// rendering takes shortcuts when the path overlaps a pixel more than once.
  /// This means that it will render faster than otherwise, but it might
  /// double-hit pixels, giving it a slightly darker/lighter result.
  final double? width;

  /// The style of this side of the border.
  final BorderStyle? style;

  /// A hairline black border that is not rendered.
  static const ShadBorderSide none = ShadBorderSide(merge: false);

  /// The relative position of the stroke on a [ShadBorderSide] in an
  /// [OutlinedBorder] or [Border].
  ///
  /// Values typically range from -1.0 ([BorderSide.strokeAlignInside], inside
  /// border, default) to 1.0 ([BorderSide.strokeAlignOutside], outside border),
  /// without any bound constraints (e.g., a value of -2.0 is not typical, but
  /// allowed).
  /// A value of 0 ([BorderSide.strokeAlignCenter]) will center the border on
  /// the edge of the widget.
  ///
  /// When set to [BorderSide.strokeAlignInside], the stroke is drawn completely
  /// inside
  /// the widget. For [BorderSide.strokeAlignCenter] and
  /// [BorderSide.strokeAlignOutside], a property
  /// such as [Container.clipBehavior] can be used in an outside widget to clip
  /// it. If [Container.decoration] has a border, the container may incorporate
  /// [width] as additional padding:
  /// - [BorderSide.strokeAlignInside] provides padding with full [width].
  /// - [BorderSide.strokeAlignCenter] provides padding with half [width].
  /// - [BorderSide.strokeAlignOutside] provides zero padding, as stroke is
  /// drawn entirely outside.
  ///
  /// This property is not honored by toPaint (because the [Paint] object
  /// cannot represent it); it is intended that classes that use
  /// [ShadBorderSide] objects implement this property when painting borders by
  /// suitably inflating or deflating their regions.
  final double? strokeAlign;

  /// Creates a copy of this border but with the given fields replaced with the
  /// new values.
  ShadBorderSide copyWith({
    bool? merge,
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return ShadBorderSide(
      merge: merge ?? this.merge,
      color: color ?? this.color,
      width: width ?? this.width,
      style: style ?? this.style,
      strokeAlign: strokeAlign ?? this.strokeAlign,
    );
  }

  static ShadBorderSide? lerp(ShadBorderSide? a, ShadBorderSide? b, double t) {
    if (identical(a, b)) return a;
    return ShadBorderSide(
      merge: b?.merge ?? a?.merge ?? true,
      color: Color.lerp(a?.color, b?.color, t),
      width: lerpDouble(a?.width, b?.width, t),
      style: t < 0.5 ? a?.style : b?.style,
      strokeAlign: lerpDouble(a?.strokeAlign, b?.strokeAlign, t),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is ShadBorderSide &&
        other.merge == merge &&
        other.color == color &&
        other.width == width &&
        other.style == style &&
        other.strokeAlign == strokeAlign;
  }

  @override
  int get hashCode => Object.hash(merge, color, width, style, strokeAlign);

  @override
  String toStringShort() => 'ShadBorderSide';

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<Color>(
          'color',
          color,
          defaultValue: const Color(0xFF000000),
        ),
      )
      ..add(
        DiagnosticsProperty<bool>(
          'merge',
          merge,
          defaultValue: true,
        ),
      );

    // ignore: cascade_invocations
    properties
      ..add(DoubleProperty('width', width, defaultValue: 1.0))
      ..add(
        DoubleProperty(
          'strokeAlign',
          strokeAlign,
          defaultValue: BorderSide.strokeAlignInside,
        ),
      )
      ..add(
        EnumProperty<BorderStyle>(
          'style',
          style,
          defaultValue: BorderStyle.solid,
        ),
      );
  }
}
