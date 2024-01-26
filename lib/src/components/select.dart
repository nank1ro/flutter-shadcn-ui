import 'dart:math';

import 'package:boxy/boxy.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/popover.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

@immutable
class ShadcnSelectedOption<T> {
  const ShadcnSelectedOption({
    required this.value,
  });

  final T? value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadcnSelectedOption<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class ShadcnSelect<T> extends StatefulWidget {
  const ShadcnSelect({
    super.key,
    required this.options,
    this.child,
  });

  final Widget? child;
  final List<ShadcnOption<T>> options;

  static ShadcnSelectState<dynamic> of(BuildContext context) {
    return maybeOf(context)!;
  }

  static ShadcnSelectState<dynamic>? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedStateContainer>()
        ?.data;
  }

  @override
  ShadcnSelectState<T> createState() => ShadcnSelectState();
}

class ShadcnSelectState<T> extends State<ShadcnSelect<T>> {
  ShadcnSelectedOption<T>? selected;
  bool visible = false;

  void select(T value) {
    if (selected == value) return;
    setState(() => selected = ShadcnSelectedOption(value: value));
  }

  @override
  Widget build(BuildContext context) {
    final optionValues = widget.options.map((e) => e.value).toList();
    assert(
      listEquals(optionValues.toSet().toList(), optionValues),
      'The values of the options must be unique',
    );

    return _InheritedStateContainer(
      data: this,
      // child: Column(
      //   children: [
      //     ShadcnButton(
      //       text: const Text('Select'),
      //       onPressed: () {
      //         setState(() {
      //           visible = !visible;
      //         });
      //       },
      //     ),
      //     EvenSized(
      //       children: widget.options,
      //     ),
      //   ],
      // ),
      child: ShadcnPopover(
        padding: EdgeInsets.zero,
        visible: visible,
        alignment: Alignment.bottomLeft,
        childAlignment: Alignment.topLeft,
        popoverBuilder: (_) => ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 384,
          ),
          child: EvenSized(
            children: widget.options,
          ),
        ),
        child: ShadcnButton(
          text: const Text('Select'),
          onPressed: () {
            setState(() {
              visible = !visible;
            });
          },
        ),
      ),
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  // You must pass through a child and your state.
  const _InheritedStateContainer({
    required this.data,
    required super.child,
  });

  // Data is your entire state. In our case just 'User'
  final ShadcnSelectState<dynamic> data;

  // This is a built in method which you can use to check if
  // any state has changed. If not, no reason to rebuild all the widgets
  // that rely on your state.
  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}

// class ShadcnSelect<T> extends StatefulWidget {
//   const ShadcnSelect({
//     super.key,
//     required this.options,
//   });

//   final List<ShadcnOption<T>> options;

//   static ShadcnSeleectState of(BuildContext context) {
//     return maybeOf(context)!;
//   }

//   static ShadcnSeleectState? maybeOf(BuildContext context) {
//     return context
//         .dependOnInheritedWidgetOfExactType<_InheritedStateContainer>()
//         ?.data;
//   }

//   @override
//   State<ShadcnSelect<T>> createState() => _ShadcnSelectState<T>();
// }

// class _ShadcnSelectState<T> extends State<ShadcnSelect<T>> {
//   var visible = false;

//   @override
//   Widget build(BuildContext context) {
//     final optionValues = widget.options.map((e) => e.value).toList();
//     assert(
//       listEquals(optionValues.toSet().toList(), optionValues),
//       'The values of the options must be unique',
//     );

//     return Container(
//       child: ShadcnPopover(
//         padding: EdgeInsets.zero,
//         visible: visible,
//         alignment: Alignment.bottomLeft,
//         childAlignment: Alignment.topLeft,
//         popover: ConstrainedBox(
//           constraints: const BoxConstraints(
//             maxHeight: 384,
//           ),
//           child: EvenSized(
//             children: widget.options,
//           ),
//         ),
//         child: ShadcnButton(
//           text: const Text('Select'),
//           onPressed: () {
//             setState(() {
//               visible = !visible;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }

class ShadcnOption<T> extends StatefulWidget {
  const ShadcnOption({
    super.key,
    required this.value,
    required this.child,
  });

  final T value;
  final Widget child;

  @override
  State<ShadcnOption<T>> createState() => _ShadcnOptionState<T>();
}

class _ShadcnOptionState<T> extends State<ShadcnOption<T>> {
  bool hovered = false;
  final focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadcnTheme.of(context);
    assert(
      ShadcnSelect.maybeOf(context) != null,
      'Cannot find ShadcnSelect InheritedWidget',
    );
    final selected = ShadcnSelect.of(context).selected?.value == widget.value;
    return Focus(
      focusNode: focusNode,
      child: MouseRegion(
        onEnter: (_) {
          if (!hovered) setState(() => hovered = true);
        },
        onExit: (_) {
          if (hovered) setState(() => hovered = false);
        },
        child: GestureDetector(
          onTap: () {
            ShadcnSelect.of(context).select(widget.value);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: hovered ? theme.colorScheme.accent : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility.maintain(
                  visible: selected,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(
                      Icons.check,
                      size: 24,
                    ),
                  ),
                ),
                DefaultTextStyle(
                  style: theme.textTheme.muted,
                  child: widget.child,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EvenSized extends StatelessWidget {
  const EvenSized({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return CustomBoxy(
      delegate: EvenSizedBoxy(),
      children: children,
    );
  }
}

class EvenSizedBoxy extends BoxyDelegate {
  @override
  Size layout() {
    var childWidth = 0.0;
    for (final child in children) {
      childWidth = max(
        childWidth,
        child.render.getMaxIntrinsicWidth(double.infinity),
      );
    }

    var childHeight = 0.0;
    for (final child in children) {
      childHeight = max(
        childHeight,
        child.render.getMinIntrinsicHeight(childWidth),
      );
    }

    final childConstraints = BoxConstraints.tight(
      Size(childWidth, childHeight),
    );

    var x = 0.0;
    for (final child in children) {
      child
        ..layout(childConstraints)
        ..position(Offset(0, x));
      x += childHeight;
    }

    return Size(childWidth, childHeight * children.length);
  }
}
