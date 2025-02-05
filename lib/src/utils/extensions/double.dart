extension DoubleToPrecision on double {
  double asFixed(int fractionDigits) {
    return double.parse(toStringAsFixed(fractionDigits));
  }
}
