import 'dart:ui';

double? lerpDoubleOpt(num? a, num? b, double t) {
  return a != null && b != null
      ? lerpDouble(a, b, t)
      : t < .5
          ? a?.toDouble()
          : b?.toDouble();
}
