import 'package:flutter/widgets.dart';

class EnhancedTextEditingController extends TextEditingController {
  TextEditingValue? previousValue;

  @override
  set value(TextEditingValue newValue) {
    if (newValue == value) return;
    previousValue = value;
    super.value = newValue;
  }
}
