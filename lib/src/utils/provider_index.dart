import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/utils/provider.dart';

/// An immutable class that holds an [index].
///
/// Used by [ShadIndexProvider] to provide the index to the child
/// widget.
@immutable
class ShadProviderIndex {
  const ShadProviderIndex(this.index);

  final int index;
}

/// Provides an [index] to the [child] widget.
/// The child widget can access the index using
/// `context.watch<ShadProviderIndex>().index`.
class ShadIndexProvider extends StatelessWidget {
  /// Creates a [ShadIndexProvider].
  const ShadIndexProvider({
    super.key,
    required this.index,
    required this.child,
  });

  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShadProvider(
      data: ShadProviderIndex(index),
      notifyUpdate: (oldWidget) => oldWidget.data.index != index,
      child: child,
    );
  }
}
