import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/border.dart';
import 'package:shadcn_ui/src/utils/extensions/double.dart';
import 'package:shadcn_ui/src/utils/mouse_cursor_provider.dart';
import 'package:shadcn_ui/src/utils/provider.dart';

/// The result of resizing a panel
enum ShadResizeResult {
  success,
  failedLeading,
  failedTrailing,
}

/// The size information of a panel
class ShadPanelInfo {
  ShadPanelInfo({
    required this.defaultSize,
    this.minSize = 0,
    this.maxSize = 0,
  })  : _size = defaultSize,
        assert(
          minSize >= 0 && minSize <= 1.0,
          'minSize must be between 0 and 1',
        ),
        assert(
          maxSize >= 0 && maxSize <= 1.0,
          'maxSize must be between 0 and 1',
        ),
        assert(defaultSize >= 0 && defaultSize <= 1);

  double get size => _size;

  set size(double value) {
    if (value < minSize) throw Exception('Size must be greater than minSize');
    if (value > maxSize) throw Exception('Size must be less than maxSize');
    _size = value;
  }

  final double defaultSize;
  final double minSize;
  final double maxSize;
  double _size;
}

class ShadResizableController extends ChangeNotifier {
  ShadResizableController();

  final panelsInfo = <ShadPanelInfo>[];
  final defaultSizes = <double>[];

  /// Register a panel and returns the index of the panel
  int registerPanel(ShadPanelInfo info) {
    panelsInfo.add(info);
    defaultSizes.add(info.defaultSize);
    return panelsInfo.length - 1;
  }

  /// Get the panel info at the given index
  ShadPanelInfo getPanelInfo(int index) {
    final contains = panelsInfo.length > index;
    if (!contains) throw Exception('Panel info not found for index: $index');
    return panelsInfo[index];
  }

  /// Sets the [size] of the panel at the given [index].
  ///
  /// Returns the result of the resize operation:
  /// - If the resize operation is successful, the panel info will be updated
  /// - If the resize operation is unsuccessful, the panel info will not b
  /// updated and the result will be [ShadResizeResult.failedLeading or
  /// [ShadResizeResult.failedTrailing] depending on the resize direction
  ShadResizeResult resize({
    required int index,
    required double size,
  }) {
    final leadingPanelInfo = getPanelInfo(index);
    final trailingPanelInfo = getPanelInfo(index + 1);
    final newLeadingSize = size;
    final offset =
        (-((leadingPanelInfo.size - newLeadingSize) * totalAvailableWidth))
            .asFixed(6);
    final newTrailingSize =
        (trailingPanelInfo.size * totalAvailableWidth - offset) /
            totalAvailableWidth;

    if (newLeadingSize < leadingPanelInfo.minSize ||
        newTrailingSize > trailingPanelInfo.maxSize) {
      return ShadResizeResult.failedLeading;
    }

    if (newTrailingSize < trailingPanelInfo.minSize ||
        newLeadingSize > leadingPanelInfo.maxSize) {
      return ShadResizeResult.failedTrailing;
    }

    leadingPanelInfo.size = newLeadingSize;
    trailingPanelInfo.size = newTrailingSize;
    notifyListeners();
    return ShadResizeResult.success;
  }

  /// Reset the default sizes of the leading and trailing panels.
  void resetDefaultSizes(int leadingIndex, int trailingIndex) {
    assert(
      (leadingIndex - trailingIndex).abs() == 1,
      'The indexes resized must be adjacent',
    );
    final leadingPanelInfo = getPanelInfo(leadingIndex);
    final trailingPanelInfo = getPanelInfo(trailingIndex);
    leadingPanelInfo.size = defaultSizes[leadingIndex];
    trailingPanelInfo.size = defaultSizes[trailingIndex];
    notifyListeners();
  }

  double totalAvailableWidth = 0;
}

class ShadResizablePanelGroup extends StatefulWidget {
  const ShadResizablePanelGroup({
    super.key,
    required this.children,
    this.axis = Axis.horizontal,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.mainAxisSize,
    this.textDirection,
    this.verticalDirection,
    this.controller,
    this.showHandle,
    this.handleIconData,
    this.handleIcon,
    this.dividerSize,
    this.dividerThickness,
    this.onDividerDoubleTap,
    this.resetOnDoubleTap,
    this.dividerColor,
    this.handleDecoration,
    this.handlePadding,
    this.handleSize,
  });

  final Axis axis;
  final List<ShadResizablePanel> children;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final TextDirection? textDirection;
  final VerticalDirection? verticalDirection;
  final ShadResizableController? controller;
  final bool? showHandle;
  final IconData? handleIconData;
  final Widget? handleIcon;
  final double? dividerSize;
  final double? dividerThickness;
  final VoidCallback? onDividerDoubleTap;
  final bool? resetOnDoubleTap;
  final Color? dividerColor;
  final ShadDecoration? handleDecoration;
  final EdgeInsets? handlePadding;
  final double? handleSize;

  @override
  ShadResizablePanelGroupState createState() => ShadResizablePanelGroupState();
}

class ShadResizablePanelGroupState extends State<ShadResizablePanelGroup> {
  ShadResizableController? _internalController;

  late final mouseCursorController = context.read<ShadMouseCursorController>();

  late final List<double> defaultSizes;

  final dragging = ValueNotifier<bool>(false);

  BoxConstraints? currentConstraints;

  bool get isHorizontal => widget.axis == Axis.horizontal;

  bool get isVertical => widget.axis == Axis.vertical;

  int get dividersCount => widget.children.length - 1;

  ShadResizableController get controller {
    if (widget.controller != null) return widget.controller!;
    return _internalController ??= ShadResizableController();
  }

  @override
  void initState() {
    super.initState();
    defaultSizes = widget.children.map((e) => e.defaultSize).toList();
    dragging.addListener(() {
      if (!dragging.value) mouseCursorController.cursor = MouseCursor.defer;
    });
  }

  @override
  void dispose() {
    dragging.dispose();
    _internalController?.dispose();
    super.dispose();
  }

  int registerPanel(ShadPanelInfo info) => controller.registerPanel(info);

  ShadPanelInfo getPanelInfo(int index) => controller.getPanelInfo(index);

  void onHandleDrag({
    required int index,
    required Offset offset,
  }) {
    final axisOffset =
        (widget.axis == Axis.horizontal ? offset.dx : offset.dy).asFixed(6);
    final leadingPanelInfo = getPanelInfo(index);
    final newLeadingSize =
        (leadingPanelInfo.size * controller.totalAvailableWidth + axisOffset) /
            controller.totalAvailableWidth;

    final result = controller.resize(
      index: index,
      size: newLeadingSize,
    );
    switch (result) {
      case ShadResizeResult.success:
        final cursor = switch (widget.axis) {
          Axis.horizontal => SystemMouseCursors.resizeLeftRight,
          Axis.vertical => SystemMouseCursors.resizeUpDown,
        };
        mouseCursorController.cursor = cursor;
      case ShadResizeResult.failedLeading:
        final cursor = switch (widget.axis) {
          Axis.horizontal => SystemMouseCursors.resizeRight,
          Axis.vertical => SystemMouseCursors.resizeDown,
        };
        mouseCursorController.cursor = cursor;
      case ShadResizeResult.failedTrailing:
        final cursor = switch (widget.axis) {
          Axis.horizontal => SystemMouseCursors.resizeLeft,
          Axis.vertical => SystemMouseCursors.resizeUp,
        };
        mouseCursorController.cursor = cursor;
    }
  }

  void resetDefaultSizes(int leadingIndex, int trailingIndex) {
    assert((leadingIndex - trailingIndex).abs() == 1);
    controller.resetDefaultSizes(leadingIndex, trailingIndex);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveShowHandle =
        widget.showHandle ?? theme.resizableTheme.showHandle ?? false;
    final effectiveDividerSize =
        widget.dividerSize ?? theme.resizableTheme.dividerSize ?? 8.0;

    final effectiveDividerThickness =
        widget.dividerThickness ?? theme.resizableTheme.dividerThickness ?? 1.0;
    final effectiveResetOnDoubleTap = widget.resetOnDoubleTap ??
        theme.resizableTheme.resetOnDoubleTap ??
        true;

    final effectiveDividerColor = widget.dividerColor ??
        theme.resizableTheme.dividerColor ??
        theme.colorScheme.border;

    final effectiveHandleDecoration = ShadDecoration(
      color: theme.colorScheme.border,
      border: ShadBorder.all(
        radius: const BorderRadius.all(Radius.circular(4)),
        width: 0,
      ),
    )
        .mergeWith(theme.resizableTheme.handleDecoration)
        .mergeWith(widget.handleDecoration);

    final effectiveHandlePadding = widget.handlePadding ??
        theme.resizableTheme.handlePadding ??
        EdgeInsets.symmetric(
          horizontal: widget.axis == Axis.vertical ? 3 : 1,
          vertical: widget.axis == Axis.vertical ? 1 : 3,
        );
    final effectiveHandleSize =
        widget.handleSize ?? theme.resizableTheme.handleSize ?? 10;

    final effectiveMainAxisAlignment = widget.mainAxisAlignment ??
        theme.resizableTheme.mainAxisAlignment ??
        MainAxisAlignment.start;
    final effectiveCrossAxisAlignment = widget.crossAxisAlignment ??
        theme.resizableTheme.crossAxisAlignment ??
        CrossAxisAlignment.center;
    final effectiveMainAxisSize = widget.mainAxisSize ??
        theme.resizableTheme.mainAxisSize ??
        MainAxisSize.max;
    final effectiveVerticalDirection = widget.verticalDirection ??
        theme.resizableTheme.verticalDirection ??
        VerticalDirection.down;
    final effectiveTextDirection =
        widget.textDirection ?? theme.resizableTheme.textDirection;

    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        var effectivesSizes =
            controller.panelsInfo.length == widget.children.length
                ? controller.panelsInfo.map((e) => e.size).toList()
                : defaultSizes;

        final rtl = Directionality.of(context) == TextDirection.rtl;
        if (rtl && isHorizontal) {
          effectivesSizes = effectivesSizes.reversed.toList();
        }

        final divider = switch (widget.axis) {
          Axis.horizontal => VerticalDivider(
              indent: 0,
              endIndent: 0,
              thickness: effectiveDividerThickness,
              width: effectiveDividerSize,
              color: effectiveDividerColor,
            ),
          Axis.vertical => SizedBox(
              // double.infinity doesn't work, just providing a big number
              width: 50000,
              child: Divider(
                indent: 0,
                endIndent: 0,
                height: effectiveDividerSize,
                thickness: effectiveDividerThickness,
                color: effectiveDividerColor,
              ),
            ),
        };

        return LayoutBuilder(
          builder: (context, constraints) {
            currentConstraints = constraints;

            controller.totalAvailableWidth = widget.axis == Axis.horizontal
                ? currentConstraints!.maxWidth
                : currentConstraints!.maxHeight;
            Widget child = Flex(
              direction: widget.axis,
              mainAxisAlignment: effectiveMainAxisAlignment,
              crossAxisAlignment: effectiveCrossAxisAlignment,
              mainAxisSize: effectiveMainAxisSize,
              textDirection: effectiveTextDirection,
              verticalDirection: effectiveVerticalDirection,
              children: widget.children.mapIndexed(
                (i, e) {
                  final flex = (effectivesSizes[i] * 1000).toInt();
                  return Expanded(
                    flex: flex,
                    child: Offstage(
                      offstage: flex <= 0.015,
                      child: ColoredBox(color: Colors.primaries[i], child: e),
                    ),
                  );
                },
              ).toList(),
            );

            // lazy, will be initialized when the handle is needed
            late final handle = widget.handleIcon ??
                ShadDecorator(
                  decoration: effectiveHandleDecoration,
                  child: Padding(
                    padding: effectiveHandlePadding,
                    child: Icon(
                      widget.handleIconData ??
                          (isHorizontal
                              ? LucideIcons.gripVertical
                              : LucideIcons.gripHorizontal),
                      size: effectiveHandleSize,
                    ),
                  ),
                );

            final dividers = <Widget>[];
            for (var i = 0; i < dividersCount; i++) {
              var leadingPosition =
                  effectivesSizes.sublist(0, i + 1).fold<double>(
                        0,
                        (previousValue, element) => previousValue + element,
                      );
              leadingPosition = isHorizontal
                  ? leadingPosition * constraints.maxWidth
                  : leadingPosition * constraints.maxHeight;

              leadingPosition -=
                  effectiveDividerSize / 2 + effectiveDividerThickness / 2;

              if (effectiveShowHandle) {
                leadingPosition -= effectiveHandlePadding.horizontal / 2;
                if (!theme.disableSecondaryBorder) {
                  leadingPosition -= effectiveHandleSize / 2;
                }
              }

              dividers.add(
                Positioned(
                  top: isHorizontal ? 0 : leadingPosition,
                  left: isHorizontal && !rtl ? leadingPosition : null,
                  right: isHorizontal && rtl ? leadingPosition : null,
                  bottom: isHorizontal ? 0 : null,
                  child: GestureDetector(
                    onDoubleTap: widget.onDividerDoubleTap ??
                        () {
                          if (!effectiveResetOnDoubleTap) return;
                          resetDefaultSizes(i, i + 1);
                        },
                    onHorizontalDragStart:
                        isHorizontal ? (_) => dragging.value = true : null,
                    onHorizontalDragEnd: (_) =>
                        isHorizontal ? dragging.value = false : null,
                    onHorizontalDragCancel: () =>
                        isHorizontal ? dragging.value = false : null,
                    onHorizontalDragUpdate: (details) => isHorizontal
                        ? onHandleDrag(
                            offset: details.delta,
                            index: i,
                          )
                        : null,
                    onVerticalDragStart:
                        isVertical ? (_) => dragging.value = true : null,
                    onVerticalDragEnd: (_) =>
                        isVertical ? dragging.value = false : null,
                    onVerticalDragCancel: () =>
                        isVertical ? dragging.value = false : null,
                    onVerticalDragUpdate: (details) => isVertical
                        ? onHandleDrag(
                            offset: details.delta,
                            index: i,
                          )
                        : null,
                    child: MouseRegion(
                      onEnter: (_) {
                        final cursor = switch (widget.axis) {
                          Axis.horizontal => SystemMouseCursors.resizeLeftRight,
                          Axis.vertical => SystemMouseCursors.resizeUpDown,
                        };

                        mouseCursorController.cursor = cursor;
                      },
                      onExit: (details) async {
                        if (dragging.value) return;
                        mouseCursorController.cursor = MouseCursor.defer;
                      },
                      child: effectiveShowHandle
                          ? Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                divider,
                                handle,
                              ],
                            )
                          : divider,
                    ),
                  ),
                ),
              );
            }

            child = Stack(
              fit: StackFit.expand,
              alignment: AlignmentDirectional.center,
              children: [
                child,
                ...dividers,
              ],
            );

            return ShadProvider(
              data: this,
              notifyUpdate: (_) => true,
              child: child,
            );
          },
        );
      },
    );
  }
}

class ShadResizablePanel extends StatefulWidget {
  const ShadResizablePanel({
    super.key,
    required this.child,
    required this.defaultSize,
    this.minSize = 0.0,
    this.maxSize = 1.0,
  })  : assert(
          minSize >= 0,
          'minSize must be greater than or equal to 0',
        ),
        assert(
          maxSize >= 0,
          'maxSize must be greater than or equal to 0',
        ),
        assert(
          minSize <= maxSize,
          'minSize must be less than or equal to maxSize',
        ),
        assert(
          defaultSize >= minSize && defaultSize <= maxSize,
          'defaultSize must be greater than or equal to minSize and less than'
          ' or equal to maxSize',
        );

  final Widget child;
  final double defaultSize;
  final double minSize;
  final double maxSize;

  @override
  State<ShadResizablePanel> createState() => _ShadResizablePanelState();
}

class _ShadResizablePanelState extends State<ShadResizablePanel> {
  late final int index;

  @override
  void initState() {
    super.initState();
    index = context.read<ShadResizablePanelGroupState>().registerPanel(
          ShadPanelInfo(
            defaultSize: widget.defaultSize,
            minSize: widget.minSize,
            maxSize: widget.maxSize,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      child: widget.child,
    );
  }
}
