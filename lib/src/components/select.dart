import 'dart:math';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/components/disabled.dart';
import 'package:shadcn_ui/src/components/input.dart';
import 'package:shadcn_ui/src/components/popover.dart';
import 'package:shadcn_ui/src/components/separator.dart';
import 'package:shadcn_ui/src/raw_components/focusable.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/components/select.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';
import 'package:shadcn_ui/src/utils/extensions/text_style.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';
import 'package:shadcn_ui/src/utils/provider.dart';

/// Builder for the selected option widget in [ShadSelect].
typedef ShadSelectedOptionBuilder<T> =
    Widget Function(
      BuildContext context,
      T value,
    );

/// Controls the selection state of a [ShadSelect] widget.
///
/// It extends [ValueNotifier] to provide reactive updates when the selected
/// values change.
class ShadSelectController<T> extends ValueNotifier<Set<T>> {
  ShadSelectController({Set<T>? initialValue}) : super(initialValue ?? {});
}

/// Defines the different variants of the [ShadSelect] widget.
enum ShadSelectVariant { primary, search, multiple, multipleWithSearch }

/// A customizable select dropdown widget with various variants and options.
///
/// It supports single and multiple selection, search functionality, and
/// extensive customization through various properties.
class ShadSelect<T> extends StatefulWidget {
  /// Creates a [ShadSelect] with the primary variant.
  const ShadSelect({
    super.key,
    required this.selectedOptionBuilder,
    this.options,
    this.optionsBuilder,
    this.popoverController,
    this.enabled = true,
    this.placeholder,
    this.placeholderStyle,
    this.initialValue,
    this.onChanged,
    this.focusNode,
    this.closeOnTapOutside = true,
    this.minWidth,
    this.maxWidth,
    this.maxHeight,
    this.decoration,
    this.trailing,
    this.padding,
    this.optionsPadding,
    this.showScrollToBottomChevron,
    this.showScrollToTopChevron,
    this.scrollController,
    this.anchor,
    this.effects,
    this.shadows,
    this.filter,
    this.header,
    this.footer,
    this.closeOnSelect = true,
    this.allowDeselection = false,
    this.groupId,
    this.itemCount,
    this.shrinkWrap,
    this.controller,
    this.popoverReverseDuration,
    this.ensureSelectedVisible,
    this.onPressed,
  }) : variant = ShadSelectVariant.primary,
       initialValues = const {},
       onSearchChanged = null,
       searchDivider = null,
       searchPlaceholder = null,
       searchInputLeading = null,
       onMultipleChanged = null,
       searchPadding = null,
       selectedOptionsBuilder = null,
       search = null,
       clearSearchOnClose = false,
       searchFocusNode = null,
       onSearchSubmitted = null,
       assert(
         options != null || optionsBuilder != null,
         'Either options or optionsBuilder must be provided',
       );

  /// Creates a [ShadSelect] with the search variant.
  const ShadSelect.withSearch({
    super.key,
    this.options,
    this.optionsBuilder,
    required this.selectedOptionBuilder,
    this.onSearchChanged,
    this.onChanged,
    this.popoverController,
    this.searchDivider,
    this.searchInputLeading,
    this.searchPlaceholder,
    this.searchPadding,
    this.search,
    this.clearSearchOnClose,
    this.enabled = true,
    this.placeholder,
    this.placeholderStyle,
    this.initialValue,
    this.focusNode,
    this.closeOnTapOutside = true,
    this.minWidth,
    this.maxWidth,
    this.maxHeight,
    this.decoration,
    this.trailing,
    this.padding,
    this.optionsPadding,
    this.showScrollToBottomChevron,
    this.showScrollToTopChevron,
    this.scrollController,
    this.anchor,
    this.effects,
    this.shadows,
    this.filter,
    this.header,
    this.footer,
    this.closeOnSelect = true,
    this.allowDeselection = false,
    this.groupId,
    this.itemCount,
    this.shrinkWrap,
    this.controller,
    this.popoverReverseDuration,
    this.ensureSelectedVisible,
    this.searchFocusNode,
    this.onSearchSubmitted,
    this.onPressed,
  }) : variant = ShadSelectVariant.search,
       selectedOptionsBuilder = null,
       onMultipleChanged = null,
       initialValues = const {},
       assert(
         options != null || optionsBuilder != null,
         'Either options or optionsBuilder must be provided',
       ),
       assert(
         search != null || onSearchChanged != null,
         'Either search or onSearchChanged must be provided',
       );

  /// Creates a [ShadSelect] with the multiple select variant.
  const ShadSelect.multiple({
    super.key,
    this.options,
    this.optionsBuilder,
    required this.selectedOptionsBuilder,
    this.popoverController,
    this.enabled = true,
    this.placeholder,
    this.placeholderStyle,
    this.initialValues = const {},
    ValueChanged<Set<T>>? onChanged,
    this.focusNode,
    this.closeOnTapOutside = true,
    this.minWidth,
    this.maxWidth,
    this.maxHeight,
    this.decoration,
    this.trailing,
    this.padding,
    this.optionsPadding,
    this.showScrollToBottomChevron,
    this.showScrollToTopChevron,
    this.scrollController,
    this.anchor,
    this.effects,
    this.shadows,
    this.filter,
    this.header,
    this.footer,
    this.allowDeselection = true,
    this.closeOnSelect = true,
    this.groupId,
    this.itemCount,
    this.shrinkWrap,
    this.controller,
    this.popoverReverseDuration,
    this.ensureSelectedVisible,
    this.onPressed,
  }) : variant = ShadSelectVariant.multiple,
       onSearchChanged = null,
       initialValue = null,
       selectedOptionBuilder = null,
       searchDivider = null,
       searchPlaceholder = null,
       searchInputLeading = null,
       searchPadding = null,
       search = null,
       clearSearchOnClose = false,
       onChanged = null,
       onMultipleChanged = onChanged,
       searchFocusNode = null,
       onSearchSubmitted = null,
       assert(
         options != null || optionsBuilder != null,
         'Either options or optionsBuilder must be provided',
       );

  /// Creates a [ShadSelect] with the multiple select and search variant.
  const ShadSelect.multipleWithSearch({
    super.key,
    this.options,
    this.optionsBuilder,
    this.onSearchChanged,
    required this.selectedOptionsBuilder,
    ValueChanged<Set<T>>? onChanged,
    this.popoverController,
    this.searchDivider,
    this.searchInputLeading,
    this.searchPlaceholder,
    this.searchPadding,
    this.search,
    this.clearSearchOnClose,
    this.enabled = true,
    this.placeholder,
    this.placeholderStyle,
    this.initialValues = const {},
    this.focusNode,
    this.closeOnTapOutside = true,
    this.minWidth,
    this.maxWidth,
    this.maxHeight,
    this.decoration,
    this.trailing,
    this.padding,
    this.optionsPadding,
    this.showScrollToBottomChevron,
    this.showScrollToTopChevron,
    this.scrollController,
    this.anchor,
    this.effects,
    this.shadows,
    this.filter,
    this.header,
    this.footer,
    this.allowDeselection = true,
    this.closeOnSelect = true,
    this.groupId,
    this.itemCount,
    this.shrinkWrap,
    this.controller,
    this.popoverReverseDuration,
    this.ensureSelectedVisible,
    this.searchFocusNode,
    this.onSearchSubmitted,
    this.onPressed,
  }) : variant = ShadSelectVariant.multipleWithSearch,
       selectedOptionBuilder = null,
       onChanged = null,
       onMultipleChanged = onChanged,
       initialValue = null,
       assert(
         options != null || optionsBuilder != null,
         'Either options or optionsBuilder must be provided',
       ),
       assert(
         search != null || onSearchChanged != null,
         'Either search or onSearchChanged must be provided',
       );

  /// Creates a [ShadSelect] with a raw variant, allowing full customization.
  const ShadSelect.raw({
    super.key,
    required this.variant,
    this.options,
    this.optionsBuilder,
    this.selectedOptionBuilder,
    this.selectedOptionsBuilder,
    this.popoverController,
    this.onSearchChanged,
    this.searchDivider,
    this.searchInputLeading,
    this.searchPlaceholder,
    this.searchPadding,
    this.search,
    this.clearSearchOnClose,
    this.enabled = true,
    this.placeholder,
    this.placeholderStyle,
    this.initialValue,
    this.initialValues = const {},
    this.onChanged,
    this.onMultipleChanged,
    this.focusNode,
    this.closeOnTapOutside = true,
    this.minWidth,
    this.maxWidth,
    this.maxHeight,
    this.decoration,
    this.trailing,
    this.padding,
    this.optionsPadding,
    this.showScrollToBottomChevron,
    this.showScrollToTopChevron,
    this.scrollController,
    this.anchor,
    this.effects,
    this.shadows,
    this.filter,
    this.header,
    this.footer,
    this.allowDeselection = false,
    this.closeOnSelect = true,
    this.groupId,
    this.itemCount,
    this.shrinkWrap,
    this.controller,
    this.popoverReverseDuration,
    this.ensureSelectedVisible,
    this.searchFocusNode,
    this.onSearchSubmitted,
    this.onPressed,
  }) : assert(
         variant == ShadSelectVariant.primary || onSearchChanged != null,
         'onSearchChanged must be provided when variant is search',
       ),
       assert(
         options != null || optionsBuilder != null,
         'Either options or optionsBuilder must be provided',
       ),
       assert(
         (selectedOptionBuilder != null) ^ (selectedOptionsBuilder != null),
         '''Either selectedOptionBuilder or selectedOptionsBuilder must be provided''',
       );

  /// {@template ShadSelect.controller}
  /// The controller of the [ShadSelect].
  /// {@endtemplate}
  final ShadSelectController<T>? controller;

  /// {@template ShadSelect.onChanged}
  /// The callback that is called when the value of the [ShadSelect] changes.
  ///
  /// This is used for single selection [ShadSelect] variants.
  /// {@endtemplate}
  final ValueChanged<T?>? onChanged;

  /// {@template ShadSelect.onMultipleChanged}
  /// The callback that is called when the values of the [ShadSelect] changes.
  /// Called only the variant is [ShadSelect.multiple].
  /// {@endtemplate}
  final ValueChanged<Set<T>>? onMultipleChanged;

  /// {@template ShadSelect.allowDeselection}
  /// Whether the [ShadSelect] allows deselection, defaults to
  /// `false`.
  /// {@endtemplate}
  final bool allowDeselection;

  /// {@template ShadSelect.enabled}
  /// Whether the [ShadSelect] is enabled.
  ///
  /// When disabled, the select cannot be interacted with and visually appears
  /// disabled. Defaults to `true`.
  /// {@endtemplate}
  final bool enabled;

  /// {@template ShadSelect.initialValue}
  /// The initially selected value for single select [ShadSelect] variants.
  ///
  /// Defaults to `null`.
  /// {@endtemplate}
  final T? initialValue;

  /// {@template ShadSelect.initialValues}
  /// The initial values of the [ShadSelect], defaults to `[]`.
  /// {@endtemplate}
  final Set<T> initialValues;

  /// {@template ShadSelect.placeholder}
  /// The widget to display as a placeholder when no option is selected.
  ///
  /// Typically a [Text] widget prompting the user to make a selection.
  /// {@endtemplate}
  final Widget? placeholder;

  /// {@template ShadSelect.placeholderStyle}
  /// The text style to apply by default to the placeholder widget.
  /// If the placeholder contains a [Text] widget, this style will be merged
  /// with its existing style.
  /// {@endtemplate}
  final TextStyle? placeholderStyle;

  /// {@template ShadSelect.selectedOptionBuilder}
  /// Builder function for rendering the currently selected option in single
  /// select [ShadSelect] variants.
  ///
  /// This function is called with the current [BuildContext] and the selected
  /// value of type `T`.
  /// {@endtemplate}
  final ShadSelectedOptionBuilder<T>? selectedOptionBuilder;

  /// {@template ShadSelect.selectedOptionsBuilder}
  /// Builder function for rendering the currently selected options in multiple
  /// select [ShadSelect] variants.
  ///
  /// This function is called with the current [BuildContext] and a list of
  /// selected values of type `T`.
  /// {@endtemplate}
  final ShadSelectedOptionBuilder<List<T>>? selectedOptionsBuilder;

  /// {@template ShadSelect.options}
  /// An iterable of widgets representing the selectable options.
  ///
  /// Use this for a small, static set of options. For larger or dynamic lists,
  /// consider using [optionsBuilder] for better performance.
  ///
  /// Each widget in this iterable should typically be a [ShadOption] widget.
  /// {@endtemplate}
  final Iterable<Widget>? options;

  /// {@template ShadSelect.optionsBuilder}
  /// A builder function for creating options widgets on demand.
  ///
  /// This is efficient for large or dynamically generated lists of options, as
  /// it only builds options that are currently visible.
  ///
  /// The builder is called with the [BuildContext] and the index of the option
  /// to build. It should return a widget, typically a [ShadOption].
  /// {@endtemplate}
  final Widget? Function(BuildContext, int)? optionsBuilder;

  /// {@template ShadSelect.focusNode}
  /// The focus node to control the focus state of the [ShadSelect].
  ///
  /// If null, a default [FocusNode] will be created internally.
  /// {@endtemplate}
  final FocusNode? focusNode;

  /// {@template ShadSelect.closeOnTapOutside}
  /// Whether to close the select popover when tapping outside of it.
  ///
  /// Defaults to `true`.
  /// {@endtemplate}
  final bool closeOnTapOutside;

  /// {@template ShadSelect.minWidth}
  /// The minimum width of the select input and popover.
  ///
  /// Defaults to `max(kDefaultSelectMinWidth, constraints.minWidth)`.
  /// The actual minimum width will be the maximum of this value and the
  /// intrinsic minimum width of the widget.
  /// {@endtemplate}
  final double? minWidth;

  /// {@template ShadSelect.maxWidth}
  /// The maximum width of the select input and popover.
  ///
  /// Defaults to `double.infinity`.
  /// {@endtemplate}
  final double? maxWidth;

  /// {@template ShadSelect.maxHeight}
  /// The maximum height of the select popover.
  ///
  /// Defaults to `kDefaultSelectMaxHeight`.
  /// {@endtemplate}
  final double? maxHeight;

  /// {@template ShadSelect.decoration}
  /// The visual decoration of the select input.
  ///
  /// Uses [ShadDecoration] to define borders, colors, and more.
  /// {@endtemplate}
  final ShadDecoration? decoration;

  /// {@template ShadSelect.trailing}
  /// The widget to display at the end of the select input, typically an icon.
  ///
  /// Defaults to a chevron-down icon.
  /// {@endtemplate}
  final Widget? trailing;

  /// {@template ShadSelect.padding}
  /// The padding around the content of the select input.
  ///
  /// Defaults to `EdgeInsets.symmetric(horizontal: 12, vertical: 8)`.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadSelect.optionsPadding}
  /// The padding around the options within the popover.
  ///
  /// Defaults to `EdgeInsets.all(4)`.
  /// {@endtemplate}
  final EdgeInsetsGeometry? optionsPadding;

  /// {@template ShadSelect.showScrollToTopChevron}
  /// Whether to display a chevron icon at the top of the popover when
  /// scrollable. Defaults to `true`.
  /// {@endtemplate}
  final bool? showScrollToTopChevron;

  /// {@template ShadSelect.showScrollToBottomChevron}
  /// Whether to display a chevron icon at the bottom of the popover when
  /// scrollable. Defaults to `true`.
  /// {@endtemplate}
  final bool? showScrollToBottomChevron;

  /// {@template ShadSelect.scrollController}
  /// The scroll controller for the options list in the popover.
  ///
  /// If null, a default [ScrollController] will be created internally.
  /// {@endtemplate}
  final ScrollController? scrollController;

  /// {@template ShadSelect.anchor}
  /// The anchor configuration for positioning the popover relative to the
  /// select input.
  ///
  /// Defaults to `ShadAnchorAuto(offset: Offset(0, 4))`
  /// {@endtemplate}
  final ShadAnchorBase? anchor;

  /// {@template ShadSelect.variant}
  /// The variant of the [ShadSelect] widget, determining its behavior and
  /// appearance.
  ///
  /// See [ShadSelectVariant] for available variants.
  /// Defaults to [ShadSelectVariant.primary] for the default constructor.
  /// {@endtemplate}
  final ShadSelectVariant variant;

  /// {@template ShadSelect.onSearchChanged}
  /// Callback function invoked when the search query changes in search-enabled
  /// [ShadSelect] variants.
  ///
  /// Provides the current search string as an argument.
  /// {@endtemplate}
  final ValueChanged<String>? onSearchChanged;

  /// {@template ShadSelect.searchDivider}
  /// Widget to display as a divider between the search input and the options
  /// list
  /// in search-enabled [ShadSelect] variants.
  ///
  /// Defaults to a Divider with height 1.
  /// {@endtemplate}
  final Widget? searchDivider;

  /// {@template ShadSelect.searchInputLeading}
  /// Widget to display at the leading edge of the search input field.
  ///
  /// Typically an icon, like a search icon.
  /// {@endtemplate}
  final Widget? searchInputLeading;

  /// {@template ShadSelect.searchPlaceholder}
  /// Placeholder text to display in the search input field when no query is
  /// entered.
  /// {@endtemplate}
  final Widget? searchPlaceholder;

  /// {@template ShadSelect.searchPadding}
  /// Padding around the search input field.
  ///
  /// Defaults to `EdgeInsets.all(12)`.
  /// {@endtemplate}
  final EdgeInsetsGeometry? searchPadding;

  /// {@template ShadSelect.search}
  /// A completely customizable search input widget.
  ///
  /// If provided, this widget will be used instead of the default [ShadInput]
  /// for search functionality.
  /// {@endtemplate}
  final Widget? search;

  /// {@template ShadSelect.clearSearchOnClose}
  /// Whether to clear the search input when the popover is closed.
  ///
  /// Defaults to `true`. Can be overridden by `ShadThemeData.selectTheme`.
  /// {@endtemplate}
  final bool? clearSearchOnClose;

  /// {@macro ShadPopover.effects}
  final List<Effect<dynamic>>? effects;

  /// {@macro ShadPopover.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro ShadPopover.filter}
  final ImageFilter? filter;

  /// {@template ShadSelect.popoverController}
  /// Controller for managing the visibility and behavior of the popover.
  ///
  /// If null, a default [ShadPopoverController] is created internally.
  /// {@endtemplate}
  final ShadPopoverController? popoverController;

  /// {@template ShadSelect.header}
  /// Widget to display at the top of the popover, above the options list.
  ///
  /// Useful for titles or additional information.
  /// {@endtemplate}
  final Widget? header;

  /// {@template ShadSelect.footer}
  /// Widget to display at the bottom of the popover, below the options list.
  ///
  /// Useful for actions or additional information.
  /// {@endtemplate}
  final Widget? footer;

  /// {@template ShadSelect.closeOnSelect}
  /// Whether to automatically close the popover when an option is selected.
  ///
  /// Defaults to `true`.
  /// {@endtemplate}
  final bool closeOnSelect;

  /// {@template ShadSelect.groupId}
  /// Group ID for the popover, used for managing popover visibility in groups.
  ///
  /// See [ShadPopover.groupId] for more details.
  /// {@endtemplate}
  final Object? groupId;

  /// {@template ShadSelect.itemCount}
  /// The number of items to display when using [optionsBuilder].
  ///
  /// Required when using [optionsBuilder] to determine the scrollable extent.
  /// {@endtemplate}
  final int? itemCount;

  /// {@template ShadSelect.shrinkWrap}
  /// Whether the options list should shrink-wrap its content.
  ///
  /// Defaults to `false`. Set to `true` for smaller lists to reduce popover
  /// size.
  /// {@endtemplate}
  final bool? shrinkWrap;

  /// {@template ShadSelect.popoverReverseDuration}
  /// The duration of the popover's exit animation.
  ///
  /// Defaults to [Duration.zero ].
  /// {@endtemplate}
  final Duration? popoverReverseDuration;

  /// {@template ShadSelect.ensureSelectedVisible}
  /// Whether to automatically scroll the options list to ensure the selected
  /// option is visible when the popover opens.
  /// Defaults to true if the variant is [ShadSelectVariant.primary] or
  /// [ShadSelectVariant.search], false otherwise.
  /// {@endtemplate}
  final bool? ensureSelectedVisible;

  /// {@template ShadSelect.searchFocusNode}
  /// Focus node for the search input field in search-enabled variants.
  /// If null, a default [FocusNode] will be created internally.
  /// {@endtemplate}
  final FocusNode? searchFocusNode;

  /// {@template ShadSelect.onSearchSubmitted}
  /// Callback function invoked when the search query is submitted in
  /// search-enabled
  /// [ShadSelect] variants.
  /// Provides the current search string as an argument.
  /// {@endtemplate}
  final ValueChanged<String>? onSearchSubmitted;

  /// {@template ShadSelect.onPressed}
  /// Callback function invoked when the select input is pressed.
  ///
  /// If provided, this callback will be called instead of toggling the
  /// popover.
  /// {@endtemplate}
  final VoidCallback? onPressed;

  @override
  ShadSelectState<T> createState() => ShadSelectState();
}

class ShadSelectState<T> extends State<ShadSelect<T>> {
  FocusNode? internalFocusNode;
  FocusNode? _internalSearchFocusNode;

  // ignore: use_late_for_private_fields_and_variables
  ShadSelectController<T>? _controller;

  ShadSelectController<T> get controller => widget.controller ?? _controller!;

  VoidCallback? _popoverControllerListener;

  ShadPopoverController? _popoverController;

  ShadPopoverController get popoverController =>
      widget.popoverController ??
      (_popoverController ??= ShadPopoverController());

  VoidCallback? _scrollControllerListener;

  ScrollController? _scrollController;

  final showScrollToBottom = ValueNotifier(false);
  final showScrollToTop = ValueNotifier(false);
  bool shouldAnimateToTop = false;
  bool shouldAnimateToBottom = false;

  FocusNode get focusNode => widget.focusNode ?? internalFocusNode!;
  FocusNode get searchFocusNode =>
      widget.searchFocusNode ?? (_internalSearchFocusNode ??= FocusNode());

  ScrollController get scrollController =>
      widget.scrollController ?? _scrollController!;

  bool get ensureSelectedVisible =>
      widget.ensureSelectedVisible ??
      (widget.variant == ShadSelectVariant.primary ||
          widget.variant == ShadSelectVariant.search);

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = ShadSelectController<T>(
        initialValue: {
          if (widget.initialValue is T) widget.initialValue as T,
          ...widget.initialValues,
        },
      );
    }

    if (widget.scrollController == null) {
      _scrollController = ScrollController();
    }
    if (widget.focusNode == null) internalFocusNode = FocusNode();

    // react to the scroll position
    void scrollControllerListener() {
      if (!context.mounted) return;

      if (!scrollController.hasClients) return;
      showScrollToBottom.value =
          scrollController.offset < scrollController.position.maxScrollExtent;
      showScrollToTop.value = scrollController.offset > 0;
    }

    _scrollControllerListener = scrollControllerListener;
    scrollController.addListener(scrollControllerListener);

    if (isSearchVariant()) {
      void popoverListener() {
        if (!context.mounted) return;
        if (popoverController.isOpen) return;

        if (searchFocusNode.hasFocus) {
          searchFocusNode.unfocus();
        }
        final effectiveClearSearchOnClose =
            widget.clearSearchOnClose ??
            ShadTheme.of(
              context,
              listen: false,
            ).selectTheme.clearSearchOnClose ??
            true;

        if (effectiveClearSearchOnClose) {
          widget.onSearchChanged?.call('');
        }
      }

      _popoverControllerListener = popoverListener;
      popoverController.addListener(popoverListener);
    }
  }

  bool isSearchVariant() {
    return widget.variant == ShadSelectVariant.search ||
        widget.variant == ShadSelectVariant.multipleWithSearch;
  }

  void desktopTogglePopover() {
    popoverController.toggle();
    if (popoverController.isOpen && isSearchVariant()) {
      searchFocusNode.requestFocus();
    }
  }

  @override
  void didUpdateWidget(covariant ShadSelect<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      if (widget.initialValue is T) {
        controller.value
          ..clear()
          ..add(widget.initialValue as T);
      }
    }
    if (widget.initialValues != oldWidget.initialValues) {
      controller.value
        ..clear()
        ..addAll(widget.initialValues);
    }
  }

  @override
  void dispose() {
    final popoverControllerListener = _popoverControllerListener;
    if (popoverControllerListener != null) {
      popoverController.removeListener(popoverControllerListener);
      _popoverControllerListener = null;
    }

    final scrollControllerListener = _scrollControllerListener;
    if (scrollControllerListener != null) {
      scrollController.removeListener(scrollControllerListener);
      _scrollControllerListener = null;
    }

    _internalSearchFocusNode?.dispose();
    _popoverController?.dispose();
    internalFocusNode?.dispose();
    _scrollController?.dispose();
    showScrollToBottom.dispose();
    showScrollToTop.dispose();
    super.dispose();
  }

  Future<void> animateToTop() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    while (shouldAnimateToTop) {
      shouldAnimateToTop = scrollController.offset > 0;
      await scrollController.animateTo(
        max(scrollController.offset - 30, 0),
        duration: const Duration(milliseconds: 20),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  Future<void> animateToBottom() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    while (shouldAnimateToBottom) {
      shouldAnimateToBottom =
          scrollController.offset < scrollController.position.maxScrollExtent;
      await scrollController.animateTo(
        min(
          scrollController.offset + 30,
          scrollController.position.maxScrollExtent,
        ),
        duration: const Duration(milliseconds: 20),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void select(T value) {
    final isMultiSelection =
        widget.variant == ShadSelectVariant.multiple ||
        widget.variant == ShadSelectVariant.multipleWithSearch;

    final prevList = controller.value.toList(growable: false);
    if (widget.closeOnSelect) popoverController.hide();
    setState(() {
      if (!isMultiSelection) controller.value.clear();
      if (widget.allowDeselection && prevList.contains(value)) {
        controller.value.remove(value);
      } else {
        controller.value.add(value);
      }
    });

    final newList = controller.value.toList(growable: false);
    final changed = !ListEquality<T>().equals(prevList, newList);

    if (widget.closeOnSelect) {
      focusNode.requestFocus();
    }

    if (changed) {
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      controller.notifyListeners();
      if (isMultiSelection) {
        widget.onMultipleChanged?.call(controller.value.toSet());
      } else {
        widget.onChanged?.call(controller.value.firstOrNull);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    final theme = ShadTheme.of(context);

    final effectiveDecoration = theme.decoration
        .merge(theme.selectTheme.decoration)
        .merge(widget.decoration);

    final decorationHorizontalPadding =
        (effectiveDecoration.border?.padding?.horizontal ?? 0.0) +
        (effectiveDecoration.secondaryBorder?.padding?.horizontal ?? 0.0);

    final effectivePadding =
        widget.padding ??
        theme.selectTheme.padding ??
        const EdgeInsets.symmetric(horizontal: 12, vertical: 8);

    final effectiveShowScrollToTopChevron =
        widget.showScrollToTopChevron ??
        theme.selectTheme.showScrollToTopChevron ??
        true;

    final effectiveShowScrollToBottomChevron =
        widget.showScrollToBottomChevron ??
        theme.selectTheme.showScrollToBottomChevron ??
        true;

    final effectivePopoverReverseDuration =
        widget.popoverReverseDuration ??
        theme.selectTheme.popoverReverseDuration ??
        Duration.zero;

    final effectiveAnchor =
        widget.anchor ?? theme.selectTheme.anchor ?? const ShadAnchorAuto();

    final effectiveEffects = widget.effects ?? theme.selectTheme.effects;

    final effectiveShadows = widget.shadows ?? theme.selectTheme.shadows;

    final effectiveFilter = widget.filter ?? theme.selectTheme.filter;

    final isMultiSelect = widget.selectedOptionsBuilder != null;

    // make effectiveText listen to controller changes
    final effectiveText = ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        final Widget result;
        final TextStyle resultDefaultTextStyle;

        if (controller.value.isNotEmpty) {
          resultDefaultTextStyle =
              theme.optionTheme.selectedTextStyle ??
              theme.textTheme.muted.fallback(
                color: theme.colorScheme.foreground,
              );
          switch (isMultiSelect) {
            case true:
              result = widget.selectedOptionsBuilder!(
                context,
                controller.value.toList(),
              );
            case false:
              result = widget.selectedOptionBuilder!(
                context,
                controller.value.first,
              );
          }
        } else {
          assert(
            widget.placeholder != null,
            'placeholder must not be null when value is null',
          );
          resultDefaultTextStyle =
              widget.placeholderStyle ??
              theme.selectTheme.placeholderStyle ??
              theme.textTheme.muted.fallback(
                color: theme.colorScheme.foreground,
              );
          result = widget.placeholder!;
        }
        return DefaultTextStyle(style: resultDefaultTextStyle, child: result);
      },
    );

    final effectiveTrailing =
        widget.trailing ??
        Icon(
          LucideIcons.chevronDown,
          size: 16,
          color: theme.colorScheme.popoverForeground.withValues(alpha: .5),
        );

    final effectiveMinWidth =
        widget.minWidth ?? theme.selectTheme.minWidth ?? kDefaultSelectMinWidth;
    final effectiveMaxWidth =
        widget.maxWidth ?? theme.selectTheme.maxWidth ?? double.infinity;
    final effectiveMaxHeight =
        widget.maxHeight ??
        theme.selectTheme.maxHeight ??
        kDefaultSelectMaxHeight;
    final effectiveOptionsPadding =
        widget.optionsPadding ??
        theme.selectTheme.optionsPadding ??
        const EdgeInsets.all(4);

    final search = switch (widget.variant) {
      ShadSelectVariant.primary || ShadSelectVariant.multiple => null,
      ShadSelectVariant.search ||
      ShadSelectVariant.multipleWithSearch => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.search ??
              ShadInput(
                focusNode: searchFocusNode,
                leading: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(
                    LucideIcons.search,
                    size: 16,
                    color: theme.colorScheme.popoverForeground,
                  ),
                ),
                padding:
                    widget.searchPadding ??
                    theme.selectTheme.searchPadding ??
                    const EdgeInsets.all(12),
                placeholder: widget.searchPlaceholder,
                decoration: ShadDecoration.none,
                onChanged: widget.onSearchChanged,
                onSubmitted: widget.onSearchSubmitted,
              ),
          widget.searchDivider ??
              const ShadSeparator.horizontal(margin: EdgeInsets.zero),
        ],
      ),
    };

    return ListenableBuilder(
      listenable: searchFocusNode,
      builder: (context, child) {
        return CallbackShortcuts(
          bindings: searchFocusNode.hasFocus
              ? const {}
              : {
                  const SingleActivator(LogicalKeyboardKey.enter):
                      desktopTogglePopover,
                  const SingleActivator(LogicalKeyboardKey.space):
                      desktopTogglePopover,
                  const SingleActivator(LogicalKeyboardKey.escape):
                      popoverController.hide,
                },
          child: child!,
        );
      },
      child: FocusTraversalGroup(
        policy: WidgetOrderTraversalPolicy(),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final calculatedMinWidth =
                max(effectiveMinWidth, constraints.minWidth) -
                decorationHorizontalPadding;

            final effectiveConstraints = BoxConstraints(
              minWidth: calculatedMinWidth,
              maxWidth: effectiveMaxWidth,
            );

            late final Widget effectiveChild;

            if (widget.options != null) {
              effectiveChild = SingleChildScrollView(
                padding: effectiveOptionsPadding,
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: widget.options!.toList(),
                ),
              );
            } else {
              effectiveChild = ListView.builder(
                padding: effectiveOptionsPadding,
                controller: scrollController,
                itemCount: widget.itemCount,
                shrinkWrap: widget.shrinkWrap ?? false,
                itemBuilder: (context, index) {
                  return widget.optionsBuilder?.call(context, index);
                },
              );
            }

            final Widget select = ShadDisabled(
              disabled: !widget.enabled,
              child: ShadFocusable(
                canRequestFocus: widget.enabled,
                focusNode: focusNode,
                builder: (context, focused, child) {
                  return ShadDecorator(
                    focused: focused,
                    decoration: effectiveDecoration,
                    child: child,
                  );
                },
                child: ShadGestureDetector(
                  cursor: SystemMouseCursors.click,
                  behavior: HitTestBehavior.opaque,
                  onTapDown: (details) {
                    if (widget.onPressed != null) {
                      widget.onPressed!();
                      return;
                    }
                    FocusScope.of(context).unfocus();
                    if (details.kind == PointerDeviceKind.touch) {
                      popoverController.toggle();
                    } else {
                      desktopTogglePopover();
                    }
                  },
                  child: ConstrainedBox(
                    constraints: effectiveConstraints,
                    child: Padding(
                      padding: effectivePadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(child: effectiveText),
                          effectiveTrailing,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );

            final scrollToTopChild = effectiveShowScrollToTopChevron
                ? ValueListenableBuilder(
                    valueListenable: showScrollToTop,
                    builder: (context, show, child) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: show
                            ? MouseRegion(
                                onEnter: (_) {
                                  shouldAnimateToTop = true;
                                  animateToTop();
                                },
                                onExit: (_) => shouldAnimateToTop = false,
                                child: Container(
                                  width: calculatedMinWidth,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                  ),
                                  child: Icon(
                                    LucideIcons.chevronUp,
                                    size: 16,
                                    color: theme.colorScheme.popoverForeground,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      );
                    },
                  )
                : null;

            final scrollToBottomChild = effectiveShowScrollToBottomChevron
                ? ValueListenableBuilder(
                    valueListenable: showScrollToBottom,
                    builder: (context, show, child) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: show
                            ? MouseRegion(
                                onEnter: (_) {
                                  shouldAnimateToBottom = true;
                                  animateToBottom();
                                },
                                onExit: (_) => shouldAnimateToBottom = false,
                                child: Container(
                                  width: calculatedMinWidth,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                  ),
                                  child: Icon(
                                    LucideIcons.chevronDown,
                                    size: 16,
                                    color: theme.colorScheme.popoverForeground,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      );
                    },
                  )
                : null;

            return ShadProvider(
              data: this as ShadSelectState<dynamic>,
              notifyUpdate: (_) => true,
              child: ShadPopover(
                groupId: widget.groupId,
                padding: EdgeInsets.zero,
                controller: popoverController,
                anchor: effectiveAnchor,
                closeOnTapOutside: widget.closeOnTapOutside,
                effects: effectiveEffects,
                reverseDuration: effectivePopoverReverseDuration,
                shadows: effectiveShadows,
                filter: effectiveFilter,
                popover: (_) {
                  // set the initial value for showScrollToBottom and
                  // showScrollToTop, after the popover is rendered
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    if (scrollController.hasClients) {
                      showScrollToBottom.value =
                          scrollController.offset <
                          scrollController.position.maxScrollExtent;
                      showScrollToTop.value = scrollController.offset > 0;
                    }
                  });

                  final effectiveColumn = SizedBox(
                    width: calculatedMinWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (search != null)
                          Flexible(
                            child: ConstrainedBox(
                              constraints: effectiveConstraints,
                              child: search,
                            ),
                          ),
                        if (widget.header != null)
                          Flexible(
                            child: ConstrainedBox(
                              constraints: effectiveConstraints,
                              child: widget.header,
                            ),
                          ),
                        ?scrollToTopChild,
                        Flexible(
                          child: ConstrainedBox(
                            constraints: effectiveConstraints,
                            child: effectiveChild,
                          ),
                        ),
                        ?scrollToBottomChild,
                        if (widget.footer != null)
                          Flexible(
                            child: ConstrainedBox(
                              constraints: effectiveConstraints,
                              child: widget.footer,
                            ),
                          ),
                      ],
                    ),
                  );

                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: effectiveMaxHeight,
                      minWidth: calculatedMinWidth,
                      maxWidth: effectiveMaxWidth,
                    ),
                    child: effectiveColumn,
                  );
                },
                child: select,
              ),
            );
          },
        ),
      ),
    );
  }
}

class ShadOption<T> extends StatefulWidget {
  const ShadOption({
    super.key,
    required this.value,
    required this.child,
    this.hoveredBackgroundColor,
    this.padding,
    this.selectedIcon,
    this.radius,
    this.direction,
    this.backgroundColor,
    this.selectedBackgroundColor,
    this.textStyle,
    this.selectedTextStyle,
  });

  /// The value of the [ShadOption], it must be unique above the options.
  final T value;

  /// The child widget.
  final Widget child;

  /// The background color of the [ShadOption] when hovered, defaults to
  /// `ShadThemeData.accent`.
  final Color? hoveredBackgroundColor;

  /// The padding of the [ShadOption], defaults to
  /// `EdgeInsets.symmetric(horizontal: 8, vertical: 6)`
  final EdgeInsetsGeometry? padding;

  /// The icon of the [ShadOption] when selected.
  final Widget? selectedIcon;

  /// The radius of the [ShadOption], defaults to `ShadThemeData.radius`.
  final BorderRadius? radius;

  /// The background color of the [ShadOption], defaults to
  /// `ShadThemeData.optionTheme.backgroundColor`.
  final Color? backgroundColor;

  /// The background color of the [ShadOption] when selected, defaults to
  /// `ShadThemeData.optionTheme.selectedBackgroundColor`.
  final Color? selectedBackgroundColor;

  /// The text style of the [ShadOption], defaults to
  /// `ShadThemeData.optionTheme.textStyle`.
  final TextStyle? textStyle;

  /// The text style of the [ShadOption] when selected, defaults to
  /// `ShadThemeData.optionTheme.selectedTextStyle`.
  final TextStyle? selectedTextStyle;

  /// {@template ShadOption.direction}
  /// The direction of the ambient.
  /// {@endtemplate}
  final TextDirection? direction;

  @override
  State<ShadOption<T>> createState() => _ShadOptionState<T>();
}

class _ShadOptionState<T> extends State<ShadOption<T>> {
  final hovered = ValueNotifier(false);
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(onFocusChange);

    final inherited =
        context.read<ShadSelectState<dynamic>>() as ShadSelectState<T>;
    final selected = inherited.controller.value.contains(widget.value);
    if (selected && inherited.ensureSelectedVisible) {
      focusNode.requestFocus();
      // scroll to the selected option
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        Scrollable.maybeOf(
          context,
        )?.position.ensureVisible(context.findRenderObject()!);
      });
    }
  }

  @override
  void dispose() {
    focusNode
      ..removeListener(onFocusChange)
      ..dispose();
    hovered.dispose();
    super.dispose();
  }

  void onFocusChange() {
    hovered.value = focusNode.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final inheritedSelect =
        context.watch<ShadSelectState<dynamic>>() as ShadSelectState<T>;
    final selected = inheritedSelect.controller.value.contains(widget.value);

    final effectiveHoveredBackgroundColor =
        theme.optionTheme.hoveredBackgroundColor ?? theme.colorScheme.accent;

    final effectivePadding =
        widget.padding ??
        theme.optionTheme.padding ??
        const EdgeInsets.symmetric(horizontal: 8, vertical: 6);

    final effectiveTextStyle =
        widget.textStyle ??
        theme.optionTheme.textStyle ??
        theme.textTheme.muted.fallback(
          color: theme.colorScheme.popoverForeground,
        );

    final effectiveSelectedTextStyle =
        widget.selectedTextStyle ??
        theme.optionTheme.selectedTextStyle ??
        theme.textTheme.muted.fallback(
          color: theme.colorScheme.popoverForeground,
        );

    final effectiveSelectedBackgroundColor =
        widget.selectedBackgroundColor ??
        theme.optionTheme.selectedBackgroundColor;

    final effectiveBackgroundColor =
        widget.backgroundColor ?? theme.optionTheme.backgroundColor;

    final effectiveRadius =
        widget.radius ?? theme.optionTheme.radius ?? theme.radius;

    final effectiveSelectedIcon = Visibility.maintain(
      visible: selected,
      child:
          widget.selectedIcon ??
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(
              LucideIcons.check,
              size: 16,
              color: theme.colorScheme.popoverForeground,
            ),
          ),
    );

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.enter): () {
          inheritedSelect.select(widget.value);
        },
      },
      child: Focus(
        focusNode: focusNode,
        child: ShadGestureDetector(
          behavior: HitTestBehavior.opaque,
          cursor: SystemMouseCursors.click,
          onHoverChange: (value) {
            hovered.value = value;
          },
          onTap: () => inheritedSelect.select(widget.value),
          child: ValueListenableBuilder(
            valueListenable: hovered,
            builder: (context, hovered, child) {
              final resolvedBackgroundColor = hovered
                  ? effectiveHoveredBackgroundColor
                  : selected
                  ? effectiveSelectedBackgroundColor
                  : effectiveBackgroundColor;

              return Container(
                padding: effectivePadding,
                decoration: BoxDecoration(
                  color: resolvedBackgroundColor,
                  borderRadius: effectiveRadius,
                ),
                child: child,
              );
            },
            child: Row(
              textDirection: widget.direction,
              children: [
                Expanded(
                  child: DefaultTextStyle(
                    style: selected
                        ? effectiveSelectedTextStyle
                        : effectiveTextStyle,
                    child: widget.child,
                  ),
                ),
                effectiveSelectedIcon,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
