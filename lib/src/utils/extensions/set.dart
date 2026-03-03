import 'package:shadcn_ui/src/utils/extensions/list.dart';
import 'package:shadcn_ui/src/utils/extensions/map.dart';

/// Deep copy extension for Set.
extension SetDeepCopyExtension on Set<dynamic> {
  /// Creates a deep copy of the set, including nested maps, lists, and sets.
  Set<dynamic> deepCopy([Set<dynamic>? list]) {
    final source = list ?? this;
    final copy = <dynamic>{};

    for (final item in source) {
      switch (item) {
        case final Map<dynamic, dynamic> value:
          copy.add(value.deepCopy(value));
        case final List<dynamic> value:
          copy.add(value.deepCopy(value));
        case final Set<dynamic> value:
          copy.add(value.deepCopy(value));
        default:
          copy.add(item);
      }
    }
    return copy;
  }
}
