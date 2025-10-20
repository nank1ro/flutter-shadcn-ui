import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/components/separator.dart';
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
    required this.id,
    required this.defaultSize,
    this.minSize = 0,
    this.maxSize = 0,
  }) : _size = defaultSize,
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

  /// {@template ShadPanelInfo.defaultSize}
  /// The default size of the panel, which is set during initialization.
  /// Must be between [minSize] and [maxSize].
  /// {@endtemplate}
  final double defaultSize;

  /// {@template ShadPanelInfo.minSize}
  /// The minimum size the panel can be resized to.
  /// Must be between 0 and 1.
  /// {@endtemplate}
  final double minSize;

  /// {@template ShadPanelInfo.maxSize}
  /// The maximum size the panel can be resized to.
  /// Must be between 0 and 1.
  /// {@endtemplate}
  final double maxSize;

  /// {@template ShadPanelInfo.id}
  /// The unique identifier for the panel.
  /// This must be unique among all panels in the group.
  /// {@endtemplate}
  final Object id;
  double _size;

  @override
  String toString() {
    return '''ShadPanelInfo(size: $size, minSize: $minSize, maxSize: $maxSize, defaultSize: $defaultSize)''';
  }
}

class ShadResizableController extends ChangeNotifier {
  ShadResizableController();

  final panelsInfo = <ShadPanelInfo>[];
  final defaultSizes = <double>[];

  /// {@template ShadResizableController.registerPanel}
  /// This method adds a new panel to the controller and returns its index.
  /// {@endtemplate}
  int registerPanel(ShadPanelInfo info) {
    panelsInfo.add(info);
    defaultSizes.add(info.defaultSize);
    return panelsInfo.length - 1;
  }

  void insertPanel(int index, ShadPanelInfo info) {
    panelsInfo.insert(index, info);
    defaultSizes.insert(index, info.defaultSize);
    notifyListeners();
  }

  void unregisterPanel(Object id) {
    final index = panelsInfo.indexWhere((e) => e.id == id);
    if (index == -1) return;
    panelsInfo.removeAt(index);
    defaultSizes.removeAt(index);
    notifyListeners();
  }

  /// {@template ShadResizableController.getPanelInfo}
  /// This method retrieves the information of a panel at the specified index.
  /// Throws an exception if the index is out of bounds.
  /// {@endtemplate}
  ShadPanelInfo getPanelInfo(int index) {
    final contains = panelsInfo.length > index;
    if (!contains) throw Exception('Panel info not found for index: $index');
    return panelsInfo[index];
  }

  /// Update the panel info with the given [panels]
  void update(List<ShadPanelInfo> panels) {
    clear();
    panels.forEach(registerPanel);
    notifyListeners();
  }

  /// Clear all the panel info and default sizes
  void clear() {
    panelsInfo.clear();
    defaultSizes.clear();
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
        (-((leadingPanelInfo.size - newLeadingSize) *
                (totalAvailableWidth * base)))
            .asFixed(6);
    final newTrailingSize =
        (trailingPanelInfo.size * totalAvailableWidth - offset) /
        totalAvailableWidth /
        base;

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

  /// The total size of all registered panels, used to calculate available
  /// space for resizing.
  double get base => panelsInfo
      .fold<double>(
        0,
        (previousValue, element) => previousValue + element.size,
      )
      .asFixed(6);
}

/// {@template ShadResizablePanelGroup}
/// A widget that provides a group of resizable panels, allowing users to
/// adjust the size of each panel dynamically.
///
/// The [ShadResizablePanelGroup] manages multiple [ShadResizablePanel] widgets
/// and provides functionality to resize them by dragging dividers between them.
/// It supports both horizontal and vertical arrangements of panels, and allows
/// customization of the appearance and behavior of the dividers and handles.
///
/// This widget is useful for creating flexible layouts where users can adjust
/// the size of different sections of the UI according to their preferences.
/// {@endtemplate}
class ShadResizablePanelGroup extends StatefulWidget {
  /// {@macro ShadResizablePanelGroup}
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

  /// {@template ShadResizablePanelGroup.axis}
  /// The axis along which the panels are arranged.
  /// Can be either [Axis.horizontal] or [Axis.vertical].
  /// {@endtemplate}
  final Axis axis;

  /// {@template ShadResizablePanelGroup.children}
  /// The list of resizable panels to be displayed in the group.
  /// Each panel must be a [ShadResizablePanel].
  /// {@endtemplate}
  final List<ShadResizablePanel> children;

  /// {@template ShadResizablePanelGroup.mainAxisAlignment}
  /// The alignment of the panels along the main axis.
  /// {@endtemplate}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@template ShadResizablePanelGroup.crossAxisAlignment}
  /// The alignment of the panels along the cross axis.
  /// {@endtemplate}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@template ShadResizablePanelGroup.mainAxisSize}
  /// The size of the main axis for the panels.
  /// {@endtemplate}
  final MainAxisSize? mainAxisSize;

  /// {@template ShadResizablePanelGroup.textDirection}
  /// The text direction for the panels' content.
  /// Can be set to [TextDirection.ltr] or [TextDirection.rtl].
  /// {@endtemplate}
  final TextDirection? textDirection;

  /// {@template ShadResizablePanelGroup.verticalDirection}
  /// The vertical direction for the panels' layout.
  /// Can be set to [VerticalDirection.down] or [VerticalDirection.up].
  /// {@endtemplate}
  final VerticalDirection? verticalDirection;

  /// {@template ShadResizablePanelGroup.controller}
  /// The controller that manages the resizable panels.
  /// If not provided, a new controller will be created.
  /// {@endtemplate}
  final ShadResizableController? controller;

  /// {@template ShadResizablePanelGroup.showHandle}
  /// Whether to show the resize handle between panels.
  /// {@endtemplate}
  final bool? showHandle;

  /// {@template ShadResizablePanelGroup.handleIconData}
  /// The icon data for the resize handle.
  /// {@endtemplate}
  final IconData? handleIconData;

  /// {@template ShadResizablePanelGroup.handleIcon}
  /// A custom widget to use as the resize handle.
  /// If provided, this will be displayed instead of the default icon.
  /// {@endtemplate}
  final Widget? handleIcon;

  /// {@template ShadResizablePanelGroup.dividerSize}
  /// The size of the divider between panels.
  /// {@endtemplate}
  final double? dividerSize;

  /// {@template ShadResizablePanelGroup.dividerThickness}
  /// The thickness of the divider between panels.
  /// {@endtemplate}
  final double? dividerThickness;

  /// {@template ShadResizablePanelGroup.onDividerDoubleTap}
  /// Callback function that is triggered when the divider is double-tapped.
  /// {@endtemplate}
  final VoidCallback? onDividerDoubleTap;

  /// {@template ShadResizablePanelGroup.resetOnDoubleTap}
  /// Whether to reset the panel sizes on double-tap of the divider.
  /// {@endtemplate}
  final bool? resetOnDoubleTap;

  /// {@template ShadResizablePanelGroup.dividerColor}
  /// The color of the divider between panels.
  /// {@endtemplate}
  final Color? dividerColor;

  /// {@template ShadResizablePanelGroup.handleDecoration}
  /// Custom decoration for the resize handle.
  /// {@endtemplate}
  final ShadDecoration? handleDecoration;

  /// {@template ShadResizablePanelGroup.handlePadding}
  /// Padding around the resize handle.
  /// {@endtemplate}
  final EdgeInsetsGeometry? handlePadding;

  /// {@template ShadResizablePanelGroup.handleSize}
  /// The size of the resize handle icon.
  /// {@endtemplate}
  final double? handleSize;

  @override
  ShadResizablePanelGroupState createState() => ShadResizablePanelGroupState();
}

class ShadResizablePanelGroupState extends State<ShadResizablePanelGroup> {
  ShadResizableController? _internalController;

  late final mouseCursorController = context.read<ShadMouseCursorController>();

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
    dragging.addListener(() {
      if (!dragging.value) mouseCursorController.cursor = MouseCursor.defer;
    });
    registerPanels();
  }

  @override
  void didUpdateWidget(covariant ShadResizablePanelGroup oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Adding and removing panels
    if (oldWidget.children.length != widget.children.length) {
      oldWidget.children
          .map((e) => e.id)
          .where((e) => !widget.children.map((e) => e.id).contains(e))
          .forEach(controller.unregisterPanel);
      final addedIds = widget.children
          .map((e) => e.id)
          .where((e) => !oldWidget.children.map((e) => e.id).contains(e))
          .toList();

      final totalSize = controller.panelsInfo.fold<double>(
        0,
        (previousValue, element) => previousValue + element.size,
      );
      final availableSize = 1 - totalSize;
      final availableSizePerPanel = availableSize / addedIds.length;
      for (final id in addedIds) {
        final index = widget.children.indexWhere((e) => e.id == id);
        final info = widget.children[index];
        controller.insertPanel(
          index,
          ShadPanelInfo(
            id: info.id,
            defaultSize: availableSizePerPanel,
            minSize: info.minSize,
            maxSize: info.maxSize,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    dragging.dispose();
    _internalController?.dispose();
    super.dispose();
  }

  void registerPanels() {
    for (final c in widget.children) {
      controller.registerPanel(
        ShadPanelInfo(
          id: c.id,
          defaultSize: c.defaultSize,
          minSize: c.minSize,
          maxSize: c.maxSize,
        ),
      );
    }
  }

  int registerPanel(ShadPanelInfo info) => controller.registerPanel(info);

  ShadPanelInfo getPanelInfo(int index) => controller.getPanelInfo(index);

  void onHandleDrag({
    required int index,
    required Offset offset,
  }) {
    final rtl = Directionality.of(context) == TextDirection.rtl;
    var axisOffset = (widget.axis == Axis.horizontal ? offset.dx : offset.dy)
        .asFixed(6);

    // Invert the offset for RTL horizontal dragging
    if (rtl && widget.axis == Axis.horizontal) {
      axisOffset = -axisOffset;
    }

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
    final effectiveResetOnDoubleTap =
        widget.resetOnDoubleTap ??
        theme.resizableTheme.resetOnDoubleTap ??
        true;

    final effectiveDividerColor =
        widget.dividerColor ??
        theme.resizableTheme.dividerColor ??
        theme.colorScheme.border;

    final effectiveHandleDecoration =
        ShadDecoration(
              color: theme.colorScheme.border,
              border: ShadBorder.all(
                radius: const BorderRadius.all(Radius.circular(4)),
                width: 0,
              ),
              disableSecondaryBorder: true,
            )
            .merge(theme.resizableTheme.handleDecoration)
            .merge(widget.handleDecoration);

    final effectiveHandlePadding =
        widget.handlePadding ??
        theme.resizableTheme.handlePadding ??
        EdgeInsets.symmetric(
          horizontal: widget.axis == Axis.vertical ? 3 : 1,
          vertical: widget.axis == Axis.vertical ? 1 : 3,
        );
    final effectiveHandleSize =
        widget.handleSize ?? theme.resizableTheme.handleSize ?? 10;

    final effectiveMainAxisAlignment =
        widget.mainAxisAlignment ??
        theme.resizableTheme.mainAxisAlignment ??
        MainAxisAlignment.start;
    final effectiveCrossAxisAlignment =
        widget.crossAxisAlignment ??
        theme.resizableTheme.crossAxisAlignment ??
        CrossAxisAlignment.center;
    final effectiveMainAxisSize =
        widget.mainAxisSize ??
        theme.resizableTheme.mainAxisSize ??
        MainAxisSize.max;
    final effectiveVerticalDirection =
        widget.verticalDirection ??
        theme.resizableTheme.verticalDirection ??
        VerticalDirection.down;
    final effectiveTextDirection =
        widget.textDirection ?? theme.resizableTheme.textDirection;

    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        final effectivesSizes = controller.panelsInfo
            .map((e) => e.size)
            .toList();

        final rtl = Directionality.of(context) == TextDirection.rtl;

        final divider = switch (widget.axis) {
          Axis.horizontal => ShadSeparator.vertical(
            margin: EdgeInsets.symmetric(horizontal: effectiveDividerSize / 2),
            thickness: effectiveDividerThickness,
            color: effectiveDividerColor,
          ),
          Axis.vertical => SizedBox(
            // double.infinity doesn't work, just providing a big number
            width: 50000,
            child: ShadSeparator.horizontal(
              margin: EdgeInsets.symmetric(vertical: effectiveDividerSize / 2),
              thickness: effectiveDividerThickness,
              color: effectiveDividerColor,
            ),
          ),
        };

        return LayoutBuilder(
          builder: (context, constraints) {
            currentConstraints = constraints;

            controller.totalAvailableWidth = isHorizontal
                ? currentConstraints!.maxWidth
                : currentConstraints!.maxHeight;
            final child = Flex(
              direction: widget.axis,
              mainAxisAlignment: effectiveMainAxisAlignment,
              crossAxisAlignment: effectiveCrossAxisAlignment,
              mainAxisSize: effectiveMainAxisSize,
              textDirection: effectiveTextDirection,
              verticalDirection: effectiveVerticalDirection,
              children: widget.children.mapIndexed(
                (i, e) {
                  final flex =
                      ((effectivesSizes.elementAtOrNull(i) ?? 1) * 1000)
                          .toInt();
                  return KeyedSubtree(
                    key: ValueKey(e.id),
                    child: Expanded(
                      flex: flex,
                      child: Offstage(
                        offstage: flex <= 0.015,
                        child: e,
                      ),
                    ),
                  );
                },
              ).toList(),
            );

            // lazy, will be initialized when the handle is needed
            late final handle =
                widget.handleIcon ??
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
              var leadingPosition = effectivesSizes
                  .sublist(0, i + 1)
                  .fold<double>(
                    0,
                    (previousValue, element) => previousValue + element,
                  );

              leadingPosition = isHorizontal
                  ? leadingPosition * constraints.maxWidth / controller.base
                  : leadingPosition * constraints.maxHeight / controller.base;

              leadingPosition -= effectiveDividerSize > effectiveHandleSize
                  ? effectiveDividerSize / 2
                  : effectiveHandleSize / 2;

              dividers.add(
                Positioned(
                  top: isHorizontal ? 0 : leadingPosition,
                  left: isHorizontal && !rtl ? leadingPosition : null,
                  right: isHorizontal && rtl ? leadingPosition : null,
                  bottom: isHorizontal ? 0 : null,
                  child: GestureDetector(
                    onDoubleTap:
                        widget.onDividerDoubleTap ??
                        () {
                          if (!effectiveResetOnDoubleTap) return;
                          resetDefaultSizes(i, i + 1);
                        },
                    onHorizontalDragStart: isHorizontal
                        ? (_) => dragging.value = true
                        : null,
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
                    onVerticalDragStart: isVertical
                        ? (_) => dragging.value = true
                        : null,
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

            return Stack(
              alignment: AlignmentDirectional.center,
              children: [
                child,
                ...dividers,
              ],
            );
          },
        );
      },
    );
  }
}

/// {@template ShadResizablePanel}
/// A widget that represents a single resizable panel within a
/// [ShadResizablePanelGroup].
///
/// The [ShadResizablePanel] allows users to define a panel that can be resized
/// dynamically. It requires an ID for uniqueness, a child widget to display,
/// and size constraints to control the resizing behavior. This panel can be
/// part of a larger group of panels that can be resized relative to each other.
/// {@endtemplate}
class ShadResizablePanel extends StatelessWidget {
  /// {@macro ShadResizablePanel}
  const ShadResizablePanel({
    super.key,
    required this.id,
    required this.child,
    required this.defaultSize,
    this.minSize = 0.0,
    this.maxSize = 1.0,
  }) : assert(
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

  /// {@template ShadResizablePanel.id}
  /// The unique identifier for the panel.
  /// This ID must be unique among all panels in the group to ensure proper
  /// management and resizing behavior.
  /// {@endtemplate}
  final Object id;

  /// {@template ShadResizablePanel.child}
  /// The child widget displayed within the panel.
  /// This can be any widget that represents the content of the panel.
  /// {@endtemplate}
  final Widget child;

  /// {@template ShadResizablePanel.defaultSize}
  /// The default size of the panel when it is first displayed.
  /// This value must be between [minSize] and [maxSize].
  /// {@endtemplate}
  final double defaultSize;

  /// {@template ShadResizablePanel.minSize}
  /// The minimum size the panel can be resized to.
  /// This value must be greater than or equal to 0.
  /// {@endtemplate}
  final double minSize;

  /// {@template ShadResizablePanel.maxSize}
  /// The maximum size the panel can be resized to.
  /// This value must be greater than or equal to 0.
  /// {@endtemplate}
  final double maxSize;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      child: child,
    );
  }
}
