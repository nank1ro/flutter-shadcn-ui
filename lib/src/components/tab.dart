import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';

class ShadTabsInheritedWidget<T> extends InheritedWidget {
  const ShadTabsInheritedWidget({
    super.key,
    required this.data,
    required super.child,
  });

  final ShadTabsState<T> data;

  static ShadTabsState<T> of<T>(BuildContext context) {
    return maybeOf<T>(context)!;
  }

  static ShadTabsState<T>? maybeOf<T>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ShadTabsInheritedWidget<T>>()
        ?.data;
  }

  @override
  bool updateShouldNotify(covariant ShadTabsInheritedWidget<T> oldWidget) {
    return true;
  }
}

class ShadTabs<T> extends StatefulWidget {
  const ShadTabs({
    super.key,
    required this.defaultValue,
    required this.tabs,
    this.gap,
  });

  final T defaultValue;
  final List<ShadTab<T>> tabs;

  /// The gap between the header and the content.
  final double? gap;

  @override
  State<ShadTabs<T>> createState() => ShadTabsState<T>();
}

class ShadTabsState<T> extends State<ShadTabs<T>> {
  late T selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.defaultValue;
  }

  void select(T value) {
    if (value == selectedValue) return;
    setState(() => selectedValue = value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final selectedContent =
        widget.tabs.firstWhere((e) => e.value == selectedValue).content;

    return ShadTabsInheritedWidget<T>(
      data: this,
      child: Column(
        children: [
          ShadDecorator(
            decoration: ShadDecoration(
              merge: false,
              color: theme.colorScheme.muted,
              border: ShadBorder(radius: theme.radius),
            ),
            child: Row(children: widget.tabs),
          ),
          SizedBox(height: widget.gap ?? 8),
          KeyedSubtree(key: ValueKey(selectedValue), child: selectedContent),
        ],
      ),
    );
  }
}

class ShadTab<T> extends StatelessWidget {
  const ShadTab({
    super.key,
    required this.value,
    required this.child,
    required this.content,
    this.enabled = true,
    this.flex = 1,
  });

  final T value;
  final Widget child;
  final Widget content;
  final bool enabled;
  final int flex;

  @override
  Widget build(BuildContext context) {
    final inherited = ShadTabsInheritedWidget.of<T>(context);
    final selected = inherited.selectedValue == value;
    final theme = ShadTheme.of(context);
    return Expanded(
      flex: flex,
      child: ShadButton.secondary(
        height: 32,
        width: double.infinity,
        backgroundColor:
            selected ? theme.colorScheme.background : Colors.transparent,
        hoverBackgroundColor:
            selected ? theme.colorScheme.background : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: ShadDecoration(
          border: ShadBorder(
            radius: BorderRadius.circular(2),
          ),
        ),
        foregroundColor: theme.colorScheme.foreground,
        text: DefaultTextStyle(
          style: theme.textTheme.small,
          child: child,
        ),
        shadows: selected ? ShadShadows.sm : null,
        onPressed: () => inherited.select(value),
        enabled: enabled,
      ),
    );
  }
}
