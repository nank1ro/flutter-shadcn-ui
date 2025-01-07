import 'package:flutter/widgets.dart';

typedef WidgetOrderPolicy = OrderPolicy<Widget>;
typedef LinearWidgetOrderPolicy = LinearOrderPolicy<Widget>;
typedef ReverseWidgetOrderPolicy = ReverseOrderPolicy<Widget>;
typedef CustomWidgetOrderPolicy = CustomOrderPolicy<Widget>;

/// Defines the order policy of a list of items.
// ignore: one_member_abstracts
abstract class OrderPolicy<T> {
  const OrderPolicy();

  /// {@macro LinearOrderPolicy}
  const factory OrderPolicy.linear() = LinearOrderPolicy<T>;

  /// {@macro ReverseOrderPolicy}
  const factory OrderPolicy.reverse() = ReverseOrderPolicy<T>;

  /// {@macro CustomOrderPolicy}
  const factory OrderPolicy.custom({required List<int> indexes}) =
      CustomOrderPolicy<T>;

  List<T> order(List<T> items);
}

/// {@template LinearOrderPolicy}
/// A linear order policy, keeps the order of the items as they are
/// {@endtemplate}
class LinearOrderPolicy<T> extends OrderPolicy<T> {
  const LinearOrderPolicy();

  @override
  List<T> order(List<T> items) => items;
}

/// {@template ReverseOrderPolicy}
/// A reverse order policy, reverses the order of the items
/// {@endtemplate}
class ReverseOrderPolicy<T> extends OrderPolicy<T> {
  const ReverseOrderPolicy();

  @override
  List<T> order(List<T> items) => items.reversed.toList();
}

/// {@template CustomOrderPolicy}
/// A custom order policy, orders the items based on the provided indexes
/// For example an indexes value of [2, 0, 1] will order the items as follows:
/// [last, first, second]
/// {@endtemplate}
class CustomOrderPolicy<T> extends OrderPolicy<T> {
  const CustomOrderPolicy({required this.indexes});

  final List<int> indexes;

  @override
  List<T> order(List<T> items) {
    final orderedItems = <T>[];

    for (final index in indexes) {
      if (index >= 0 && index < items.length) {
        orderedItems.add(items[index]);
      } else {
        throw IndexError.withLength(
          index,
          items.length,
          message: 'Index is out of bounds',
        );
      }
    }

    return orderedItems;
  }
}

extension WidgetsOrderPolicy on List<Widget> {
  List<Widget> order(OrderPolicy<Widget> orderPolicy) {
    return orderPolicy.order(this);
  }
}
