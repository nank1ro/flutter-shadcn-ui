import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/assets.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/image.dart';
import 'package:shadcn_ui/src/raw_components/same_width_column.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

enum ShadAccordionType {
  single,
  multiple,
}

class ShadAccordion<T> extends StatefulWidget {
  const ShadAccordion({
    super.key,
    required this.children,
    this.initialValue,
  }) : type = ShadAccordionType.single;

  const ShadAccordion.multiple({
    super.key,
    required this.children,
    this.initialValue,
  }) : type = ShadAccordionType.multiple;

  final ShadAccordionType type;
  final List<Widget> children;
  final List<T>? initialValue;

  @override
  State<ShadAccordion<T>> createState() => ShadAccordionState<T>();
}

class ShadAccordionState<T> extends State<ShadAccordion<T>> {
  late List<T> values = widget.initialValue ?? <T>[];

  void toggle(T value) {
    setState(() {
      switch (widget.type) {
        case ShadAccordionType.single:
          if (values.contains(value)) {
            values = <T>[];
          } else {
            values = <T>[value];
          }
        case ShadAccordionType.multiple:
          if (values.contains(value)) {
            values.remove(value);
          } else {
            values.add(value);
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShadAccordionInheritedWidget<T>(
      data: this,
      child: ShadSameWidthColumn(
        children: widget.children,
      ),
    );
  }
}

class ShadAccordionInheritedWidget<T> extends InheritedWidget {
  const ShadAccordionInheritedWidget({
    super.key,
    required this.data,
    required super.child,
  });

  final ShadAccordionState<T> data;

  static ShadAccordionState<T> of<T>(BuildContext context) {
    return maybeOf<T>(context)!;
  }

  static ShadAccordionState<T>? maybeOf<T>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ShadAccordionInheritedWidget<T>>()
        ?.data;
  }

  @override
  bool updateShouldNotify(covariant ShadAccordionInheritedWidget<T> oldWidget) {
    return true;
  }
}

class ShadAccordionItem<T> extends StatefulWidget {
  const ShadAccordionItem({
    super.key,
    required this.value,
    required this.title,
    required this.content,
  });

  final T value;
  final Widget title;
  final Widget content;

  @override
  State<ShadAccordionItem<T>> createState() => _ShadAccordionItemState<T>();
}

class _ShadAccordionItemState<T> extends State<ShadAccordionItem<T>> {
  final hovered = ValueNotifier(false);

  @override
  void dispose() {
    hovered.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inherited = ShadAccordionInheritedWidget.of<T>(context);
    final expanded = inherited.values.contains(widget.value);
    final theme = ShadTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ColoredBox(
          color: Colors.red,
          child: MouseRegion(
            onEnter: (_) => hovered.value = true,
            onExit: (_) => hovered.value = false,
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => inherited.toggle(widget.value),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: hovered,
                      builder: (context, hovered, child) {
                        return DefaultTextStyle(
                          style: theme.textTheme.list.copyWith(
                            decoration:
                                hovered ? TextDecoration.underline : null,
                          ),
                          child: child!,
                        );
                      },
                      child: widget.title,
                    ),

                    Animate(
                      target: expanded ? 1 : 0,
                      effects: [
                        RotateEffect(
                          begin: 0,
                          end: .5,
                          duration: 200.milliseconds,
                        )
                      ],
                      child: const ShadImage.square(
                        ShadAssets.chevronDown,
                        size: 16,
                      ),
                    )
                    // AnimatedRotation(
                    //   duration: 200.milliseconds,
                    //   turns: expanded ? 0.5 : 0.0,
                    //   child: const ShadImage.square(
                    //     ShadAssets.chevronDown,
                    //     size: 16,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
        AnimatedSwitcher(
          duration: 200.milliseconds,
          child: expanded ? widget.content : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
