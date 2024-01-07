import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

bool debugCheckHasShadcnTheme(BuildContext context) {
  assert(() {
    if (context.widget is! ShadcnInheritedTheme &&
        context.getElementForInheritedWidgetOfExactType<
                ShadcnInheritedTheme>() ==
            null) {
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary('No ShadcnTheme widget ancestor found.'),
        ErrorDescription(
          '''${context.widget.runtimeType} widgets require a ShadcnTheme widget ancestor.''',
        ),
        context.describeWidget(
          'The specific widget that could not find a ShadcnTheme ancestor was',
        ),
        context.describeOwnershipChain(
          'The ownership chain for the affected widget is',
        ),
        ErrorHint(
            'No ShadcnTheme ancestor could be found starting from the context '
            'that was passed to ShadcnTheme.of(). This can happen because the '
            'app is not wrapped with the Shadcn widget.'),
      ]);
    }
    return true;
  }());
  return true;
}
