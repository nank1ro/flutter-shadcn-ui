import 'package:flutter/gestures.dart';

extension TapDownDetailsExtension on TapDownDetails {
  TapDownDetails copyWith({
    Offset? globalPosition,
    Offset? localPosition,
    PointerDeviceKind? kind,
  }) {
    return TapDownDetails(
      globalPosition: globalPosition ?? this.globalPosition,
      localPosition: localPosition ?? this.localPosition,
      kind: kind ?? this.kind,
    );
  }
}

extension TapUpDetailsExtension on TapUpDetails {
  TapUpDetails copyWith({
    Offset? globalPosition,
    Offset? localPosition,
    PointerDeviceKind? kind,
  }) {
    return TapUpDetails(
      globalPosition: globalPosition ?? this.globalPosition,
      localPosition: localPosition ?? this.localPosition,
      kind: kind ?? this.kind,
    );
  }
}

extension LongPressStartDetailsExtension on LongPressStartDetails {
  LongPressStartDetails copyWith({
    Offset? globalPosition,
    Offset? localPosition,
  }) {
    return LongPressStartDetails(
      globalPosition: globalPosition ?? this.globalPosition,
      localPosition: localPosition ?? this.localPosition,
    );
  }
}

extension LongPressMoveUpdateDetailsExtension on LongPressMoveUpdateDetails {
  LongPressMoveUpdateDetails copyWith({
    Offset? globalPosition,
    Offset? localPosition,
    Offset? offsetFromOrigin,
    Offset? localOffsetFromOrigin,
  }) {
    return LongPressMoveUpdateDetails(
      globalPosition: globalPosition ?? this.globalPosition,
      localPosition: localPosition ?? this.localPosition,
      offsetFromOrigin: offsetFromOrigin ?? this.offsetFromOrigin,
      localOffsetFromOrigin:
          localOffsetFromOrigin ?? this.localOffsetFromOrigin,
    );
  }
}

extension LongPressEndDetailsExtension on LongPressEndDetails {
  LongPressEndDetails copyWith({
    Velocity? velocity,
    Offset? globalPosition,
    Offset? localPosition,
  }) {
    return LongPressEndDetails(
      velocity: velocity ?? this.velocity,
      globalPosition: globalPosition ?? this.globalPosition,
      localPosition: localPosition ?? this.localPosition,
    );
  }
}

extension LongPressDownDetailsExtension on LongPressDownDetails {
  LongPressDownDetails copyWith({
    Offset? globalPosition,
    Offset? localPosition,
    PointerDeviceKind? kind,
  }) {
    return LongPressDownDetails(
      globalPosition: globalPosition ?? this.globalPosition,
      localPosition: localPosition ?? this.localPosition,
      kind: kind ?? this.kind,
    );
  }
}
