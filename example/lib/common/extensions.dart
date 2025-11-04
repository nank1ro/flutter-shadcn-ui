import 'package:flutter_solidart/flutter_solidart.dart';

extension SetOnSignal<T> on Signal<T> {
  void set(T value) {
    this.value = value;
  }
}

extension IterableMultipler<T> on Iterable<T> {
  /// Multiplies the iterable by the given [times], repeating its elements.
  Iterable<T> operator *(int times) sync* {
    for (var i = 0; i < times; i++) {
      yield* this;
    }
  }
}
