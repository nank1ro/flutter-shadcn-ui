import 'package:flutter/cupertino.dart';

extension ProviderReadExt on BuildContext {
  T read<T>() => ShadProvider.of<T>(this, listen: false);
  T? maybeRead<T>() => ShadProvider.maybeOf<T>(this, listen: false);
}

extension ProviderWatchExt on BuildContext {
  T watch<T>() => ShadProvider.of<T>(this);
  T? maybeWatch<T>() => ShadProvider.maybeOf<T>(this);
}

class ShadProvider<T> extends InheritedWidget {
  const ShadProvider({
    super.key,
    required super.child,
    required this.data,
    this.notifyUpdate,
  });

  /// The data to be provided
  final T data;

  /// Whether to notify the update of the provider, defaults to false
  final bool Function(ShadProvider<T> oldWidget)? notifyUpdate;

  static T of<T>(BuildContext context, {bool listen = true}) {
    final inherited = maybeOf<T>(context, listen: listen);
    if (inherited == null) {
      throw FlutterError(
        'Could not find $T InheritedWidget in the ancestor widget tree.',
      );
    }
    return inherited;
  }

  static T? maybeOf<T>(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<ShadProvider<T>>()
          ?.data;
    }
    final provider = context
        .getElementForInheritedWidgetOfExactType<ShadProvider<T>>()
        ?.widget;
    return (provider as ShadProvider<T>?)?.data;
  }

  @override
  bool updateShouldNotify(covariant ShadProvider<T> oldWidget) {
    return notifyUpdate?.call(oldWidget) ?? false;
  }
}
