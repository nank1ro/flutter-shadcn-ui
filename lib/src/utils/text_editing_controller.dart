import 'package:flutter/widgets.dart';

/// An extension of [TextEditingController] that stores the previous value.
class ShadTextEditingController extends TextEditingController {
  ShadTextEditingController({super.text});

  ShadTextEditingController.fromValue(TextEditingValue super.value)
      : super.fromValue();

  TextEditingValue? previousValue;

  @override
  set value(TextEditingValue newValue) {
    if (newValue == value) return;
    previousValue = value;
    super.value = newValue;
  }
}
