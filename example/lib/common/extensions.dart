import 'package:flutter_solidart/flutter_solidart.dart';

extension SetOnSignal<T> on Signal<T> {
  void set(T value) {
    this.value = value;
  }
}
