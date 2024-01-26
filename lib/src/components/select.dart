import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/assets.dart';
import 'package:shadcn_ui/src/components/disabled.dart';
import 'package:shadcn_ui/src/components/focusable.dart';

import 'package:shadcn_ui/src/components/image.dart';
import 'package:shadcn_ui/src/components/popover.dart';
import 'package:shadcn_ui/src/raw_components/even_sized_column.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';
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
    this.enabled = true,
    this.focusNode,
  });

  final bool enabled;
  final T? initialValue;
  final Widget? placeholder;
  final ShadcnSelectedOptionBuilder<T> selectedOptionBuilder;
  final List<Widget> options;
  final FocusNode? focusNode;

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
  FocusNode? internalFocusNode;
  late T? selected = widget.initialValue;
  bool visible = false;

  FocusNode get focusNode => widget.focusNode ?? internalFocusNode!;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode == null) internalFocusNode = FocusNode();
  }

  @override
  void dispose() {
    internalFocusNode?.dispose();
    super.dispose();
  }

  void select(T value, {bool hideOptions = true}) {
    setState(() {
      if (hideOptions) visible = false;
      selected = value;
    });
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadcnTheme(context));

    final theme = ShadcnTheme.of(context);
    final effectiveDecoration = theme.decoration;
    final decorationHorizontalPadding =
        effectiveDecoration.border?.padding?.horizontal ?? 0.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        return _InheritedSelectContainer(
          data: this,
          child: ShadcnPopover(
            padding: EdgeInsets.zero,
            visible: visible,
            offset: const Offset(4, 2),
            alignment: Alignment.bottomLeft,
            childAlignment: Alignment.topLeft,
            popoverBuilder: (_) => Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.popover,
                borderRadius: theme.radius,
                border: Border.all(color: theme.colorScheme.border),
                boxShadow: ShadcnShadows.md,
              ),
              constraints: BoxConstraints(
                maxHeight: 384,
                minWidth: max(128, constraints.minWidth) -
                    decorationHorizontalPadding,
              ),
              padding: const EdgeInsets.all(4),
              child: ShadEvenSizedColumn(children: widget.options),
            ),
            child: ShadDisabled(
              disabled: !widget.enabled,
              child: ShadFocused(
                focusNode: focusNode,
                builder: (context, focused) {
                  return ShadcnDecorator(
                    focused: focused,
                    decoration: effectiveDecoration,
                    child: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        setState(() {
                          visible = !visible;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.background,
                          borderRadius: theme.radius,
                          border: Border.all(color: theme.colorScheme.input),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (selected is T)
                              widget.selectedOptionBuilder(
                                context,
                                selected as T,
                              )
                            else
                              widget.placeholder!,
                            ShadcnImage.square(
                              ShadAssets.chevronDown,
                              size: 16,
                              color: theme.colorScheme.popoverForeground
                                  .withOpacity(.5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
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
              borderRadius: theme.radius,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility.maintain(
                  visible: selected,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ShadcnImage.square(
                      ShadAssets.check,
                      size: 16,
                      color: theme.colorScheme.popoverForeground,
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
