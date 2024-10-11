extension ShadDurationExt on Duration {
  Duration operator +(Duration other) {
    return Duration(
      microseconds: inMicroseconds + other.inMicroseconds,
    );
  }

  Duration operator -(Duration other) {
    return Duration(
      microseconds: inMicroseconds - other.inMicroseconds,
    );
  }

  Duration operator *(Duration other) {
    return Duration(
      microseconds: inMicroseconds * other.inMicroseconds,
    );
  }

  Duration times(int by) {
    return Duration(
      microseconds: inMicroseconds * by,
    );
  }

  Duration operator /(Duration other) {
    return Duration(
      microseconds: inMicroseconds ~/ other.inMicroseconds,
    );
  }

  Duration divide(int by) {
    return Duration(
      microseconds: inMicroseconds ~/ by,
    );
  }
}
