/// Extensions for Map operations.
extension MapExtensions on Map<String, dynamic> {
  /// Converts a flat map with separator-based keys into a nested map structure.
  ///
  /// For example:
  /// ```dart
  /// {
  ///   'user.email': 'test@example.com',
  ///   'user.name': 'John',
  ///   'user.profile.age': 30
  /// }.toNestedMap()
  /// ```
  ///
  /// Results in:
  /// ```dart
  /// {
  ///   'user': {
  ///     'email': 'test@example.com',
  ///     'name': 'John',
  ///     'profile': {
  ///       'age': 30
  ///     }
  ///   }
  /// }
  /// ```
  ///
  /// The [separator] parameter allows customizing the separator used for
  /// splitting keys. Defaults to `.`.
  Map<String, dynamic> toNestedMap({String separator = '.'}) {
    final result = <String, dynamic>{};

    for (final entry in entries) {
      final keys = entry.key.split(separator);
      if (keys.length == 1) {
        // No separator, just add directly
        result[entry.key] = entry.value;
      } else {
        // Navigate/create nested structure
        var current = result;
        for (var i = 0; i < keys.length - 1; i++) {
          final key = keys[i];
          if (!current.containsKey(key)) {
            current[key] = <String, dynamic>{};
          }
          // If the existing value is not a Map, we need to convert it
          if (current[key] is! Map<String, dynamic>) {
            current[key] = <String, dynamic>{};
          }
          current = current[key] as Map<String, dynamic>;
        }
        // Set the final value
        current[keys.last] = entry.value;
      }
    }

    return result;
  }
}
