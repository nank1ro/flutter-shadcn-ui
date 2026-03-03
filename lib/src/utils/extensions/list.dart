import 'package:shadcn_ui/src/utils/extensions/map.dart';
import 'package:shadcn_ui/src/utils/extensions/set.dart';

/// Deep copy extension for List.
extension ListDeepCopyExtension on List<dynamic> {
  /// Creates a deep copy of the list, including nested maps, lists, and sets.
  List<dynamic> deepCopy([List<dynamic>? list]) {
    final source = list ?? this;
    final copy = <dynamic>[];

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
