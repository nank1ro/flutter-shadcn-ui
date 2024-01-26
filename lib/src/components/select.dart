import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/popover.dart';
import 'package:shadcn_ui/src/raw_components/even_sized_column.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';

typedef ShadcnSelectedOptionBuilder<T> = Widget Function(
  BuildContext context,
  T value,
);

class ShadcnSelect<T> extends StatefulWidget {
  const ShadcnSelect({
    super.key,
    required this.options,
    required this.selectedOptionBuilder,
    this.placeholder,
    this.initialValue,
  });

  final T? initialValue;
  final Widget? placeholder;
  final ShadcnSelectedOptionBuilder<T> selectedOptionBuilder;
  final List<ShadcnOption<T>> options;

  static ShadcnSelectState<T> of<T>(BuildContext context) {
    return maybeOf<T>(context)!;
  }

  static ShadcnSelectState<T>? maybeOf<T>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedSelectContainer<T>>()
        ?.data;
  }

  @override
  ShadcnSelectState<T> createState() => ShadcnSelectState();
}

class ShadcnSelectState<T> extends State<ShadcnSelect<T>> {
  late T? selected = widget.initialValue;
  bool visible = false;

  void select(T value, {bool hideOptions = true}) {
    if (selected == value) return;
    setState(() {
      selected = value;
      if (hideOptions) visible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final optionValues = widget.options.map((e) => e.value).toList();
    assert(
      listEquals(optionValues.toSet().toList(), optionValues),
      'The values of the options must be unique',
    );
    assert(debugCheckHasShadcnTheme(context));
    final theme = ShadcnTheme.of(context);

    return _InheritedSelectContainer(
      data: this,
      child: ShadcnPopover(
        padding: EdgeInsets.zero,
        visible: visible,
        alignment: Alignment.bottomLeft,
        childAlignment: Alignment.topLeft,
        popoverBuilder: (_) => Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.popover,
            borderRadius: theme.radius,
            border: Border.all(color: theme.colorScheme.border),
          ),
          constraints: const BoxConstraints(
            maxHeight: 384,
            minWidth: 128,
          ),
          child: ShadEvenSizedColumn(
            children: widget.options,
          ),
        ),
        child: ShadcnButton(
          text: selected is T
              ? widget.selectedOptionBuilder(context, selected as T)
              : widget.placeholder,
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

class _InheritedSelectContainer<T> extends InheritedWidget {
  const _InheritedSelectContainer({
    required this.data,
    required super.child,
  });

  final ShadcnSelectState<T> data;

  @override
  bool updateShouldNotify(_InheritedSelectContainer<T> old) => true;
}

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
      ShadcnSelect.maybeOf<T>(context) != null,
      'Cannot find ShadcnSelect InheritedWidget',
    );
    final inheritedSelect = ShadcnSelect.of<T>(context);
    final selected = inheritedSelect.selected == widget.value;
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
          onTap: () => inheritedSelect.select(widget.value),
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
                  style: theme.textTheme.muted.copyWith(
                    color: theme.colorScheme.popoverForeground,
                  ),
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
