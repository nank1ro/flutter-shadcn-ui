import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
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
    final provider = maybeOf<T>(context);
    if (provider == null) {
      throw Exception('No ShadTabs widget found in context');
    }
    return provider;
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

class ShadTabs<T> extends StatefulWidget implements PreferredSizeWidget {
  const ShadTabs({
    super.key,
    required this.defaultValue,
    required this.tabs,
    this.gap,
    this.scrollable,
    this.dragStartBehavior,
    this.physics,
    this.padding,
  });

  final T defaultValue;
  final List<ShadTab<T>> tabs;

  /// The gap between the header and the content.
  final double? gap;

  /// Whether the tabs should be scrollable, defaults to false.
  final bool? scrollable;

  /// The drag start behavior of the tabs, defaults to [DragStartBehavior.start]
  final DragStartBehavior? dragStartBehavior;

  final ScrollPhysics? physics;

  final EdgeInsets? padding;

  @override
  State<ShadTabs<T>> createState() => ShadTabsState<T>();

  @override
  Size get preferredSize {
    var maxHeight = 32.0;
    for (final tab in tabs) {
      final itemHeight = tab.preferredSize.height;
      maxHeight = math.max(itemHeight, maxHeight);
    }
    return Size.fromHeight(maxHeight);
  }
}

class ShadTabsState<T> extends State<ShadTabs<T>> {
  late T selectedValue;
  late List<T> orderedValues;

  late final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    selectedValue = widget.defaultValue;
    orderedValues = widget.tabs.map((e) => e.value).toList();
  }

  @override
  void didUpdateWidget(covariant ShadTabs<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listEquals(widget.tabs, oldWidget.tabs)) {
      orderedValues = widget.tabs.map((e) => e.value).toList();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void select(T value) {
    if (value == selectedValue) return;
    setState(() => selectedValue = value);
  }

  bool get scrollable => widget.scrollable ?? false;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveDragStartBehavior =
        widget.dragStartBehavior ?? DragStartBehavior.start;

    final effectivePadding =
        widget.padding ?? const EdgeInsets.symmetric(horizontal: 0);

    Widget tabBar = Row(children: widget.tabs);

    if (scrollable) {
      tabBar = ScrollConfiguration(
        // The scrolling tabs should not show an overscroll indicator.
        behavior: ScrollConfiguration.of(context).copyWith(overscroll: false),
        child: SingleChildScrollView(
          dragStartBehavior: effectiveDragStartBehavior,
          scrollDirection: Axis.horizontal,
          controller: scrollController,
          padding: effectivePadding,
          physics: widget.physics,
          child: SizedBox(
            child: tabBar,
          ),
        ),
        // child: ListView.builder(
        //   scrollDirection: Axis.horizontal,
        //   itemCount: widget.tabs.length,
        //   itemBuilder: (context, index) {
        //     return widget.tabs[index];
        //   },
        // )),
        // ),
      );
    } else {
      tabBar = Padding(padding: effectivePadding, child: tabBar);
    }

    final selectedContent =
        widget.tabs.firstWhere((e) => e.value == selectedValue).content;

    return ShadTabsInheritedWidget<T>(
      data: this,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ShadDecorator(
            decoration: ShadDecoration(
              merge: false,
              color: theme.colorScheme.muted,
              border: ShadBorder(radius: theme.radius),
            ),
            child: tabBar,
          ),
          SizedBox(height: widget.gap ?? 8),
          KeyedSubtree(key: ValueKey(selectedValue), child: selectedContent),
        ],
      ),
    );
  }
}

class ShadTab<T> extends StatefulWidget implements PreferredSizeWidget {
  const ShadTab({
    super.key,
    required this.value,
    required this.child,
    required this.content,
    this.enabled = true,
    this.flex = 1,
    this.height,
  });

  final T value;
  final Widget child;
  final Widget content;
  final bool enabled;
  final int flex;
  final double? height;

  @override
  State<ShadTab<T>> createState() => _ShadTabState<T>();

  @override
  Size get preferredSize {
    return Size.fromHeight(height ?? 32);
  }
}

class _ShadTabState<T> extends State<ShadTab<T>> {
  final focusNode = FocusNode();
  late bool focused = focusNode.hasFocus;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() => focused = focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inherited = ShadTabsInheritedWidget.of<T>(context);
    final selected = inherited.selectedValue == widget.value;
    final theme = ShadTheme.of(context);

    final isFirstTab = inherited.orderedValues.first == widget.value;
    final isLastTab = inherited.orderedValues.last == widget.value;

    final unfocusedPadding =
        EdgeInsets.fromLTRB(isFirstTab ? 4 : 0, 4, isLastTab ? 4 : 0, 4);

    Widget tab = ShadButton.secondary(
      focusNode: focusNode,
      height: widget.preferredSize.height,
      width: inherited.scrollable ? null : double.infinity,
      backgroundColor:
          selected ? theme.colorScheme.background : Colors.transparent,
      hoverBackgroundColor:
          selected ? theme.colorScheme.background : Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: ShadDecoration(
        border: ShadBorder(radius: BorderRadius.circular(2)),
        secondaryBorder: ShadBorder(
          radius: BorderRadius.circular(2),
          padding: unfocusedPadding,
        ),
        secondaryFocusedBorder: ShadBorder(
          radius: theme.radius,
          padding:
              EdgeInsets.fromLTRB(isFirstTab ? 2 : 0, 2, isLastTab ? 2 : 0, 2),
          // padding: EdgeInsets.all(2),
          // padding:
          //     EdgeInsets.fromLTRB(isFirstTab ? 4 : 2, 2, isLastTab ? 4 : 2, 2),
        ),
      ),
      foregroundColor: theme.colorScheme.foreground,
      text: DefaultTextStyle(
        style: theme.textTheme.small,
        child: widget.child,
      ),
      shadows: selected ? ShadShadows.sm : null,
      onPressed: () => inherited.select(widget.value),
      enabled: widget.enabled,
    );

    if (!inherited.scrollable) {
      tab = Expanded(
        flex: widget.flex,
        child: tab,
      );
    }

    return tab;
  }
}
