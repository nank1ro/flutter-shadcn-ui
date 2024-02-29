import 'package:flutter/widgets.dart';

enum ShadState {
  focused,
  hovered,
  pressed,
  disabled,
}

class ShadStatesController extends ValueNotifier<Set<ShadState>> {
  ShadStatesController([Set<ShadState>? value]) : super(<ShadState>{...?value});

  /// Adds [state] to [value] if [add] is true, and removes it otherwise,
  /// and notifies listeners if [value] has changed.
  void update(ShadState state, bool add) {
    final valueChanged = add ? value.add(state) : value.remove(state);
    if (valueChanged) {
      notifyListeners();
    }
  }
}
