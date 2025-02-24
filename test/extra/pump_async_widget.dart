import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

extension PumpAsyncWidget on WidgetTester {
  Future<void> pumpAsyncWidget(
    Widget widget, {
    Duration? duration,
    EnginePhase phase = EnginePhase.sendSemanticsUpdate,
    bool wrapWithView = true,
  }) async {
    return runAsync(
      () => pumpWidget(
        widget,
        duration: duration,
        phase: phase,
        wrapWithView: wrapWithView,
      ),
    );
  }
}
