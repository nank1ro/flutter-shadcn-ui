import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

/// Extension on [WidgetTester] to provide asynchronous widget pumping
/// capabilities.
extension PumpAsyncWidget on WidgetTester {
  /// Pumps a widget asynchronously using [runAsync].
  ///
  /// Parameters:
  /// - [widget]: The widget to pump
  /// - [duration]: Optional duration to pump for
  /// - [phase]: The phase to pump to, defaults to
  /// [EnginePhase.sendSemanticsUpdate]
  /// - [wrapWithView]: Whether to wrap the widget with a view, defaults to true
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
