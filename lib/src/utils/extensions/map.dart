import 'package:shadcn_ui/src/utils/extensions/list.dart';
import 'package:shadcn_ui/src/utils/extensions/set.dart';

/// Extensions for Map operations with String keys and dynamic values.
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
    assert(separator.isNotEmpty, 'Separator cannot be empty');
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

  /// Gets a value from a nested map using dot notation.
  ///
  /// For example:
  /// ```dart
  /// {
  ///   'user': {
  ///     'email': 'test@example.com',
  ///     'profile': {
  ///       'age': 30
  ///     }
  ///   }
  /// }.getByPath('user.profile.age')
  /// ```
  ///
  /// Returns `30`.
  ///
  /// The [separator] parameter allows customizing the separator used for
  /// splitting the path. Defaults to `.`.
  ///
  /// Returns `null` if the path doesn't exist or any intermediate value
  /// is not a Map.
  dynamic getByPath(String path, {String separator = '.'}) {
    assert(separator.isNotEmpty, 'Separator cannot be empty');

    final keys = path.split(separator);
    dynamic current = this;

    for (final key in keys) {
      if (current is Map && current.containsKey(key)) {
        current = current[key];
      } else {
        return null;
      }
    }

    return current;
  }

  /// Deeply merges another map into this map, recursively combining nested
  /// maps.
  ///
  /// For example:
  /// ```dart
  /// {
  ///   'user': {
  ///     'name': 'John',
  ///     'country': 'Italy'
  ///   },
  ///   'active': true
  /// }.deepMerge({
  ///   'user': {
  ///     'name': 'Jane'
  ///   }
  /// })
  /// ```
  ///
  /// Results in:
  /// ```dart
  /// {
  ///   'user': {
  ///     'name': 'Jane',      // Updated value
  ///     'country': 'Italy'   // Preserved from original
  ///   },
  ///   'active': true         // Preserved from original
  /// }
  /// ```
  ///
  /// When both maps have the same key:
  /// - If both values are `Map<String, dynamic>`, they are recursively merged
  /// - Otherwise (including Lists, Sets, primitives), the value from [other]
  ///   completely replaces the original value
  Map<String, dynamic> deepMerge(Map<String, dynamic> other) {
    // Create a deep copy to avoid mutating nested structures
    // final thisAsGeneric = this as Map<dynamic, dynamic>;
    // final copied = thisAsGeneric.deepCopy();
    final result = Map<String, dynamic>.from(this);

    for (final entry in other.entries) {
      if (result.containsKey(entry.key) &&
          result[entry.key] is Map &&
          entry.value is Map) {
        // Both are maps, recursively merge them
        final existingMap = Map<String, dynamic>.from(result[entry.key] as Map);
        final newMap = Map<String, dynamic>.from(entry.value as Map);
        result[entry.key] = existingMap.deepMerge(newMap);
      } else {
        // Otherwise replace the value
        result[entry.key] = entry.value;
      }
    }

    return result;
  }
}

/// Deep copy extension for Map.
extension MapDeepCopyExtension on Map<dynamic, dynamic> {
  /// Creates a deep copy of the map, including nested maps, lists, and sets.
  Map<dynamic, dynamic> deepCopy([Map<dynamic, dynamic>? map]) {
    final source = map ?? this;
    final copy = <dynamic, dynamic>{};

    for (final entry in source.entries) {
      final key = entry.key;
      final value = entry.value;

      switch (value) {
        case final Map<dynamic, dynamic> value:
          copy[key] = deepCopy(value);
        case final List<dynamic> value:
          copy[key] = value.deepCopy(value);
        case final Set<dynamic> value:
          copy[key] = value.deepCopy(value);
        default:
          copy[key] = value;
      }
    }
    return copy;
  }
}
