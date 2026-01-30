import 'package:shadcn_ui/src/utils/extensions/list.dart';
import 'package:shadcn_ui/src/utils/extensions/set.dart';

/// Represents a segment in a path, either a map key or a list index.
class _PathSegment {
  const _PathSegment({
    this.key,
    this.index,
  }) : assert(key != null || index != null);

  /// The map key (if this is a map segment).
  final String? key;

  /// The list index (if this is a list segment).
  final int? index;

  /// Whether this segment is a list index.
  bool get isIndex => index != null;

  @override
  String toString() {
    if (isIndex) {
      return '[${index}]';
    }
    return key!;
  }
}

/// Parses a path string into segments, handling both keys and array indices.
///
/// For example:
/// - `user.name` -> `[_PathSegment(key: 'user'), _PathSegment(key: 'name')]`
/// - `users.[0].name` -> `[_PathSegment(key: 'users'), _PathSegment(index: 0), _PathSegment(key: 'name')]`
List<_PathSegment> _parsePathSegments(String path, String separator) {
  final parts = path.split(separator);
  final segments = <_PathSegment>[];

  for (final part in parts) {
    // Check if this part is an array index like [0], [1], etc.
    if (part.startsWith('[') && part.endsWith(']')) {
      final indexStr = part.substring(1, part.length - 1);
      final index = int.tryParse(indexStr);
      if (index != null && index >= 0) {
        segments.add(_PathSegment(index: index));
        continue;
      }
    }
    // Regular key (including empty strings, which will cause lookup to fail)
    segments.add(_PathSegment(key: part));
  }

  return segments;
}

/// Ensures a list has at least the specified size, filling with null if needed.
void _ensureListSize(List<dynamic> list, int requiredSize) {
  while (list.length <= requiredSize) {
    list.add(null);
  }
}

/// Sets a nested value in a map, traversing through both maps and lists.
void _setNestedValue(
  Map<String, dynamic> root,
  List<_PathSegment> segments,
  dynamic value,
) {
  if (segments.isEmpty) return;

  // Use a list to track the path of containers and their keys/indices
  final containers = <dynamic>[root];
  final keys = <dynamic>[];

  // Build the path
  for (var i = 0; i < segments.length - 1; i++) {
    final segment = segments[i];
    final current = containers.last;

    if (segment.isIndex) {
      // This is a list index
      final index = segment.index!;
      if (current is! List) {
        // Need to create a list at this position
        final newList = <dynamic>[];
        if (keys.isEmpty) {
          // This is the root - shouldn't happen for array notation
          return;
        }
        final parentKey = keys.last;
        if (parentKey is int) {
          // Parent is a list
          final parent = containers[containers.length - 2] as List;
          _ensureListSize(parent, parentKey);
          parent[parentKey] = newList;
        } else {
          // Parent is a map
          final parent = containers[containers.length - 2] as Map<String, dynamic>;
          parent[parentKey as String] = newList;
        }
        containers.removeLast();
        containers.add(newList);
        keys.removeLast();
      }
      final list = containers.last as List;
      _ensureListSize(list, index);
      if (list[index] == null) {
        // Check if next segment is also an index
        if (i + 1 < segments.length && segments[i + 1].isIndex) {
          list[index] = <dynamic>[];
        } else {
          list[index] = <String, dynamic>{};
        }
      }
      containers.add(list[index]);
      keys.add(index);
    } else {
      // This is a map key
      final key = segment.key!;
      if (current is! Map) {
        // Current should be a map but isn't - this is an error case
        return;
      }
      final map = current as Map<String, dynamic>;
      if (!map.containsKey(key)) {
        // Check if the next segment is an index
        if (i + 1 < segments.length && segments[i + 1].isIndex) {
          map[key] = <dynamic>[];
        } else {
          map[key] = <String, dynamic>{};
        }
      } else if (i + 1 < segments.length) {
        // Key exists, check if we need to convert it
        final nextSegment = segments[i + 1];
        if (nextSegment.isIndex && map[key] is! List) {
          // Need to convert to a list
          map[key] = <dynamic>[];
        } else if (!nextSegment.isIndex && map[key] is! Map) {
          // Need to convert to a map
          map[key] = <String, dynamic>{};
        }
      }
      containers.add(map[key]);
      keys.add(key);
    }
  }

  // Set the final value
  final lastSegment = segments.last;
  final parent = containers.last;
  final finalKey = lastSegment.isIndex ? lastSegment.index! : lastSegment.key!;

  if (lastSegment.isIndex) {
    if (parent is! List) {
      // Need to convert parent to a list
      final newList = <dynamic>[];
      if (containers.length > 1) {
        final grandParent = containers[containers.length - 2];
        final parentKey = keys.last;
        if (parentKey is int) {
          final grandParentList = grandParent as List;
          _ensureListSize(grandParentList, parentKey);
          grandParentList[parentKey] = newList;
        } else {
          final grandParentMap = grandParent as Map<String, dynamic>;
          grandParentMap[parentKey as String] = newList;
        }
      }
      _ensureListSize(newList, finalKey as int);
      newList[finalKey as int] = value;
    } else {
      _ensureListSize(parent, finalKey as int);
      parent[finalKey as int] = value;
    }
  } else {
    if (parent is Map) {
      parent[finalKey as String] = value;
    }
  }
}

/// Extensions for Map operations with String keys and dynamic values.
extension MapExtensions on Map<String, dynamic> {
  /// Converts a flat map with separator-based keys into a nested map structure.
  ///
  /// Supports both dot notation for nested maps and bracket notation for array indices.
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
  /// With array indices:
  /// ```dart
  /// {
  ///   'users.[0].name': 'John',
  ///   'users.[1].name': 'Jane'
  /// }.toNestedMap()
  /// ```
  ///
  /// Results in:
  /// ```dart
  /// {
  ///   'users': [
  ///     {'name': 'John'},
  ///     {'name': 'Jane'}
  ///   ]
  /// }
  /// ```
  ///
  /// The [separator] parameter allows customizing the separator used for
  /// splitting keys. Defaults to `.`.
  Map<String, dynamic> toNestedMap({String separator = '.'}) {
    assert(separator.isNotEmpty, 'Separator cannot be empty');
    final result = <String, dynamic>{};

    for (final entry in entries) {
      final segments = _parsePathSegments(entry.key, separator);
      if (segments.length == 1 && !segments.first.isIndex) {
        // No separator or array notation, just add directly
        result[entry.key] = entry.value;
      } else {
        // Use the new nested value setter that handles arrays
        _setNestedValue(result, segments, entry.value);
      }
    }

    return result;
  }

  /// Gets a value from a nested map using dot notation.
  ///
  /// Supports both dot notation for nested maps and bracket notation for array indices.
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
  /// With array indices:
  /// ```dart
  /// {
  ///   'users': [
  ///     {'name': 'John'},
  ///     {'name': 'Jane'}
  ///   ]
  /// }.getByPath('users.[0].name')
  /// ```
  ///
  /// Returns `'John'`.
  ///
  /// The [separator] parameter allows customizing the separator used for
  /// splitting the path. Defaults to `.`.
  ///
  /// Returns `null` if the path doesn't exist, any intermediate value
  /// is not the expected type, or an array index is out of bounds.
  dynamic getByPath(String path, {String separator = '.'}) {
    assert(separator.isNotEmpty, 'Separator cannot be empty');

    final segments = _parsePathSegments(path, separator);
    dynamic current = this;

    for (final segment in segments) {
      if (segment.isIndex) {
        final index = segment.index!;
        if (current is List && index < current.length) {
          current = current[index];
        } else {
          return null;
        }
      } else {
        final key = segment.key!;
        // Use a general Map check to handle const maps and different Map types
        if (current is Map && current.containsKey(key)) {
          current = current[key];
        } else {
          return null;
        }
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
