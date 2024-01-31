import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

bool debugCheckHasShadTheme(BuildContext context) {
  assert(() {
    if (context.widget is! ShadInheritedTheme &&
        context.getElementForInheritedWidgetOfExactType<ShadInheritedTheme>() ==
            null) {
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary('No ShadTheme widget ancestor found.'),
        ErrorDescription(
          '''${context.widget.runtimeType} widgets require a ShadTheme widget ancestor.''',
        ),
        context.describeWidget(
          'The specific widget that could not find a ShadTheme ancestor was',
        ),
        context.describeOwnershipChain(
          'The ownership chain for the affected widget is',
        ),
        ErrorHint(
            'No ShadTheme ancestor could be found starting from the context '
            'that was passed to ShadTheme.of(). This can happen because the '
            'app is not wrapped with the Shad widget.'),
      ]);
    }
    return true;
  }());
  return true;
}
