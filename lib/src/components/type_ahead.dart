import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/components/disabled.dart';
import 'package:shadcn_ui/src/components/input.dart';
import 'package:shadcn_ui/src/components/popover.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/components/type_ahead.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/animate.dart';
import 'package:shadcn_ui/src/utils/border.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';
import 'package:shadcn_ui/src/utils/extensions/text_style.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';
import 'package:shadcn_ui/src/utils/mouse_area.dart';

/// Callback that asynchronously fetches suggestions based on a query string.
typedef ShadTypeAheadSuggestionsCallback<T> =
    Future<List<T>> Function(
      String query,
    );

/// Builder for rendering each suggestion item in the typeahead dropdown.
typedef ShadTypeAheadItemBuilder<T> =
    Widget Function(
      BuildContext context,
      T value,
    );

/// Converts a suggestion value of type [T] to a display string for the input.
typedef ShadTypeAheadDisplayStringForOption<T> = String Function(T option);

/// Default implementation calls `toString` on the option.
String defaultDisplayStringForOption(dynamic option) => option.toString();

/// Controls the selected value of a [ShadTypeAhead] widget.
///
/// Extends [ValueNotifier] to provide reactive updates when the selected
/// value changes.
class ShadTypeAheadController<T> extends ValueNotifier<T?> {
  ShadTypeAheadController({T? initialValue}) : super(initialValue);
}

/// The internal status of the typeahead suggestion fetch.
enum _TypeAheadStatus { idle, loading, loaded, error }

/// A customizable typeahead (autocomplete) widget with async suggestions.
///
/// The text input is the trigger — typing invokes [suggestionsCallback]
/// (debounced) and displays results in a popover below the input. Supports
/// loading, empty, and error states with keyboard navigation (arrow keys).
///
/// The popover overlay uses [TextFieldTapRegion] to prevent the text input
/// from losing focus when the user interacts with suggestion items. Keyboard
/// navigation highlights items without stealing focus from the input.
class ShadTypeAhead<T> extends StatefulWidget {
  /// Creates a [ShadTypeAhead] widget.
  const ShadTypeAhead({
    super.key,
    required this.suggestionsCallback,
    required this.itemBuilder,
    this.onSelected,
    this.controller,
    this.textController,
    this.popoverController,
    this.focusNode,
    this.enabled = true,
    this.placeholder,
    this.placeholderStyle,
    this.leading,
    this.trailing,
    this.decoration,
    this.inputDecoration,
    this.padding,
    this.optionsPadding,
    this.minWidth,
    this.maxWidth,
    this.maxHeight,
    this.anchor,
    this.effects,
    this.shadows,
    this.filter,
    this.debounceDuration,
    this.closeOnTapOutside = true,
    this.closeOnSelect = true,
    this.clearOnSelect = false,
    this.showScrollToTopChevron,
    this.showScrollToBottomChevron,
    this.scrollController,
    this.header,
    this.footer,
    this.loadingBuilder,
    this.emptyBuilder,
    this.errorBuilder,
    this.groupId,
    this.popoverReverseDuration,
    this.minCharsForSuggestions = 0,
    this.itemCount,
    this.shrinkWrap,
    this.displayStringForOption = defaultDisplayStringForOption,
    this.initialValue,
    this.onTextChanged,
  });

  /// {@template ShadTypeAhead.suggestionsCallback}
  /// Asynchronous callback invoked to fetch suggestions for the given query.
  /// {@endtemplate}
  final ShadTypeAheadSuggestionsCallback<T> suggestionsCallback;

  /// {@template ShadTypeAhead.itemBuilder}
  /// Builder for rendering each suggestion item.
  /// {@endtemplate}
  final ShadTypeAheadItemBuilder<T> itemBuilder;

  /// {@template ShadTypeAhead.onSelected}
  /// Called when a suggestion is selected.
  /// {@endtemplate}
  final ValueChanged<T>? onSelected;

  /// {@template ShadTypeAhead.controller}
  /// Controls the selected value. If null, an internal controller is created.
  /// {@endtemplate}
  final ShadTypeAheadController<T>? controller;

  /// {@template ShadTypeAhead.textController}
  /// Controls the text input. If null, an internal controller is created.
  /// {@endtemplate}
  final TextEditingController? textController;

  /// {@template ShadTypeAhead.popoverController}
  /// Controls the popover visibility. If null, an internal controller is
  /// created.
  /// {@endtemplate}
  final ShadPopoverController? popoverController;

  /// {@template ShadTypeAhead.focusNode}
  /// The focus node for the text input. If null, an internal one is created.
  /// {@endtemplate}
  final FocusNode? focusNode;

  /// {@template ShadTypeAhead.enabled}
  /// Whether the typeahead is enabled. Defaults to true.
  /// {@endtemplate}
  final bool enabled;

  /// {@template ShadTypeAhead.placeholder}
  /// Placeholder widget displayed when the input is empty.
  /// {@endtemplate}
  final Widget? placeholder;

  /// {@template ShadTypeAhead.placeholderStyle}
  /// Text style for the placeholder.
  /// {@endtemplate}
  final TextStyle? placeholderStyle;

  /// {@template ShadTypeAhead.leading}
  /// Widget displayed before the input text.
  /// {@endtemplate}
  final Widget? leading;

  /// {@template ShadTypeAhead.trailing}
  /// Widget displayed after the input text.
  /// {@endtemplate}
  final Widget? trailing;

  /// {@template ShadTypeAhead.decoration}
  /// The decoration applied to the popover container.
  /// {@endtemplate}
  final ShadDecoration? decoration;

  /// {@template ShadTypeAhead.inputDecoration}
  /// The decoration applied to the text input itself.
  /// {@endtemplate}
  final ShadDecoration? inputDecoration;

  /// {@template ShadTypeAhead.padding}
  /// Padding around the input field.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadTypeAhead.optionsPadding}
  /// Padding around the suggestions list inside the popover.
  /// {@endtemplate}
  final EdgeInsetsGeometry? optionsPadding;

  /// {@template ShadTypeAhead.minWidth}
  /// Minimum width of the popover. Defaults to 128.
  /// {@endtemplate}
  final double? minWidth;

  /// {@template ShadTypeAhead.maxWidth}
  /// Maximum width of the popover.
  /// {@endtemplate}
  final double? maxWidth;

  /// {@template ShadTypeAhead.maxHeight}
  /// Maximum height of the popover. Defaults to 384.
  /// {@endtemplate}
  final double? maxHeight;

  /// {@template ShadTypeAhead.anchor}
  /// Positioning anchor for the popover relative to the input.
  /// {@endtemplate}
  final ShadAnchorBase? anchor;

  /// {@template ShadTypeAhead.effects}
  /// Animation effects for the popover.
  /// {@endtemplate}
  final List<Effect<dynamic>>? effects;

  /// {@template ShadTypeAhead.shadows}
  /// Box shadows for the popover.
  /// {@endtemplate}
  final List<BoxShadow>? shadows;

  /// {@template ShadTypeAhead.filter}
  /// Image filter applied to the popover background.
  /// {@endtemplate}
  final ImageFilter? filter;

  /// {@template ShadTypeAhead.debounceDuration}
  /// Duration to debounce input changes before invoking
  /// [suggestionsCallback]. Defaults to 300ms via theme.
  /// {@endtemplate}
  final Duration? debounceDuration;

  /// {@template ShadTypeAhead.closeOnTapOutside}
  /// Whether tapping outside the popover closes it. Defaults to true.
  /// {@endtemplate}
  final bool closeOnTapOutside;

  /// {@template ShadTypeAhead.closeOnSelect}
  /// Whether the popover closes after selecting a suggestion.
  /// Defaults to true.
  /// {@endtemplate}
  final bool closeOnSelect;

  /// {@template ShadTypeAhead.clearOnSelect}
  /// Whether the text input is cleared after selecting a suggestion.
  /// Defaults to false.
  /// {@endtemplate}
  final bool clearOnSelect;

  /// {@template ShadTypeAhead.showScrollToTopChevron}
  /// Whether to show a scroll-to-top chevron in the suggestions list.
  /// {@endtemplate}
  final bool? showScrollToTopChevron;

  /// {@template ShadTypeAhead.showScrollToBottomChevron}
  /// Whether to show a scroll-to-bottom chevron in the suggestions list.
  /// {@endtemplate}
  final bool? showScrollToBottomChevron;

  /// {@template ShadTypeAhead.scrollController}
  /// Custom scroll controller for the suggestions list.
  /// {@endtemplate}
  final ScrollController? scrollController;

  /// {@template ShadTypeAhead.header}
  /// Widget displayed above the suggestions list in the popover.
  /// {@endtemplate}
  final Widget? header;

  /// {@template ShadTypeAhead.footer}
  /// Widget displayed below the suggestions list in the popover.
  /// {@endtemplate}
  final Widget? footer;

  /// {@template ShadTypeAhead.loadingBuilder}
  /// Builder for the loading indicator shown while suggestions are fetched.
  /// {@endtemplate}
  final WidgetBuilder? loadingBuilder;

  /// {@template ShadTypeAhead.emptyBuilder}
  /// Builder for the widget shown when no suggestions are found.
  /// {@endtemplate}
  final WidgetBuilder? emptyBuilder;

  /// {@template ShadTypeAhead.errorBuilder}
  /// Builder for the widget shown when suggestion fetching fails.
  /// {@endtemplate}
  final Widget Function(BuildContext context, Object error)? errorBuilder;

  /// {@template ShadTypeAhead.groupId}
  /// Group ID for tap-outside detection. Used to identify which taps
  /// are "inside" the typeahead (input + overlay) vs "outside".
  /// {@endtemplate}
  final Object? groupId;

  /// {@template ShadTypeAhead.popoverReverseDuration}
  /// The reverse duration of the popover's animation.
  /// {@endtemplate}
  final Duration? popoverReverseDuration;

  /// {@template ShadTypeAhead.minCharsForSuggestions}
  /// Minimum number of characters required before triggering
  /// [suggestionsCallback]. Defaults to 0.
  /// {@endtemplate}
  final int minCharsForSuggestions;

  /// {@template ShadTypeAhead.itemCount}
  /// The number of items when using [ListView.builder] for the suggestions.
  /// {@endtemplate}
  final int? itemCount;

  /// {@template ShadTypeAhead.shrinkWrap}
  /// Whether the suggestions list should shrink-wrap its content.
  /// Defaults to true. Consider setting to false for very large lists.
  /// {@endtemplate}
  final bool? shrinkWrap;

  /// {@template ShadTypeAhead.displayStringForOption}
  /// Converts a selected option of type [T] to a display string that is
  /// placed in the text input after selection. Defaults to calling
  /// [toString].
  /// {@endtemplate}
  final ShadTypeAheadDisplayStringForOption<T> displayStringForOption;

  /// {@template ShadTypeAhead.initialValue}
  /// Initial text value for the input field.
  /// {@endtemplate}
  final String? initialValue;

  /// {@template ShadTypeAhead.onTextChanged}
  /// Called when the text input value changes (before debouncing).
  /// {@endtemplate}
  final ValueChanged<String>? onTextChanged;

  @override
  State<ShadTypeAhead<T>> createState() => ShadTypeAheadState<T>();
}

class ShadTypeAheadState<T> extends State<ShadTypeAhead<T>>
    with SingleTickerProviderStateMixin {
  ShadTypeAheadController<T>? _controller;
  TextEditingController? _textController;
  ShadPopoverController? _popoverController;
  FocusNode? _internalFocusNode;
  ScrollController? _scrollController;
  Timer? _debounceTimer;

  /// Drives the overlay open/close animation. Managed directly instead
  /// of delegating to ShadPopover, because ShadPopover's FocusScope
  /// unconditionally steals focus on open — wrong for a typeahead where
  /// the text input must retain focus.
  late final AnimationController _animationController;

  /// Shared TapRegion group so taps on the input and overlay are both
  /// treated as "inside", while taps elsewhere close the overlay.
  late final Object _tapRegionGroupId;

  final showScrollToBottom = ValueNotifier(false);
  final showScrollToTop = ValueNotifier(false);
  bool shouldAnimateToTop = false;
  bool shouldAnimateToBottom = false;

  /// The current suggestions list. Retained across loading cycles to prevent
  /// flicker (similar to flutter_typeahead's retainOnLoading).
  List<T> _suggestions = [];
  Object? _error;

  /// Plain status field — not a ValueNotifier because ValueNotifier won't
  /// fire when reassigning the same enum value (e.g. loaded→loaded with
  /// new data). Instead we use an epoch counter (_epoch) to trigger rebuilds.
  _TypeAheadStatus _status = _TypeAheadStatus.idle;

  /// Monotonically increasing counter. Incrementing this always triggers
  /// a rebuild of the popover content, even when _status hasn't changed.
  final _epoch = ValueNotifier<int>(0);

  /// Keyboard-navigated highlight index. -1 means nothing highlighted.
  final _highlightedIndex = ValueNotifier<int>(-1);

  /// Guards against duplicate fetches for the same text value.
  String _lastFetchedQuery = '';

  /// Guards against concurrent in-flight requests (queue pattern).
  bool _isFetching = false;
  String? _queuedQuery;

  /// Whether we are programmatically updating the text controller (e.g.
  /// inside [select]). Avoids re-triggering [_onTextChanged].
  bool _isUpdatingText = false;

  ShadTypeAheadController<T> get controller =>
      widget.controller ?? (_controller ??= ShadTypeAheadController<T>());

  TextEditingController get textController =>
      widget.textController ?? (_textController ??= TextEditingController());

  ShadPopoverController get popoverController =>
      widget.popoverController ??
      (_popoverController ??= ShadPopoverController());

  FocusNode get focusNode =>
      widget.focusNode ?? (_internalFocusNode ??= FocusNode());

  ScrollController get scrollController =>
      widget.scrollController ?? (_scrollController ??= ScrollController());

  VoidCallback? _scrollControllerListener;

  /// Cached debounce duration resolved from widget/theme/default.
  Duration? _resolvedDebounceDuration;

  /// Increments [_epoch] so that [ValueListenableBuilder] rebuilds.
  void _notifyEpoch() => _epoch.value++;

  @override
  void initState() {
    super.initState();

    _tapRegionGroupId = widget.groupId ?? UniqueKey();

    _animationController = AnimationController(
      vsync: this,
      duration: Animate.defaultDuration,
    );

    // Set initial text value if provided.
    if (widget.initialValue != null && widget.initialValue!.isNotEmpty) {
      textController.text = widget.initialValue!;
    }

    _addScrollListener();
    popoverController.addListener(_onPopoverToggle);
    focusNode.addListener(_onFocusChange);
  }

  void _addScrollListener() {
    void scrollListener() {
      if (!context.mounted) return;
      if (!scrollController.hasClients) return;
      showScrollToBottom.value =
          scrollController.offset < scrollController.position.maxScrollExtent;
      showScrollToTop.value = scrollController.offset > 0;
    }

    _scrollControllerListener = scrollListener;
    scrollController.addListener(scrollListener);
  }

  void _removeScrollListener() {
    final listener = _scrollControllerListener;
    if (listener != null) {
      scrollController.removeListener(listener);
      _scrollControllerListener = null;
    }
  }

  /// Drives animation forward/reverse when the popover opens/closes.
  void _onPopoverToggle() {
    if (!mounted) return;
    if (popoverController.isOpen) {
      _animationController.forward(from: 0);
    } else {
      _animationController.reverse();
      _highlightedIndex.value = -1;
    }
  }

  /// Re-opens the overlay when focus returns to the input and cached
  /// suggestions exist (e.g. user tabs away then tabs back).
  void _onFocusChange() {
    if (!mounted) return;
    if (focusNode.hasFocus &&
        _suggestions.isNotEmpty &&
        !popoverController.isOpen &&
        textController.text.length >= widget.minCharsForSuggestions) {
      popoverController.show();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Cache debounce duration so we don't call ShadTheme.of on every keystroke.
    _resolvedDebounceDuration =
        widget.debounceDuration ??
        ShadTheme.of(context, listen: false).typeAheadTheme.debounceDuration ??
        kDefaultTypeAheadDebounceDuration;
  }

  @override
  void didUpdateWidget(covariant ShadTypeAhead<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Re-resolve debounce duration if widget property changed.
    if (widget.debounceDuration != oldWidget.debounceDuration) {
      _resolvedDebounceDuration =
          widget.debounceDuration ??
          ShadTheme.of(
            context,
            listen: false,
          ).typeAheadTheme.debounceDuration ??
          kDefaultTypeAheadDebounceDuration;
    }

    // Handle external textController swap.
    if (widget.textController != oldWidget.textController) {
      if (widget.textController != null && oldWidget.textController == null) {
        _textController?.dispose();
        _textController = null;
      } else if (widget.textController == null &&
          oldWidget.textController != null) {
        _textController = TextEditingController(
          text: oldWidget.textController!.text,
        );
      }
    }

    // Handle external controller swap.
    if (widget.controller != oldWidget.controller) {
      if (widget.controller != null && oldWidget.controller == null) {
        _controller?.dispose();
        _controller = null;
      }
    }

    // Handle popoverController swap.
    if (widget.popoverController != oldWidget.popoverController) {
      (oldWidget.popoverController ?? _popoverController)?.removeListener(
        _onPopoverToggle,
      );

      if (widget.popoverController != null &&
          oldWidget.popoverController == null) {
        _popoverController?.dispose();
        _popoverController = null;
      }

      popoverController.addListener(_onPopoverToggle);
    }

    // Handle scrollController swap.
    if (widget.scrollController != oldWidget.scrollController) {
      _removeScrollListener();

      if (widget.scrollController != null &&
          oldWidget.scrollController == null) {
        _scrollController?.dispose();
        _scrollController = null;
      }

      _addScrollListener();
    }

    // Handle focusNode swap.
    if (widget.focusNode != oldWidget.focusNode) {
      (oldWidget.focusNode ?? _internalFocusNode)?.removeListener(
        _onFocusChange,
      );

      if (widget.focusNode != null && oldWidget.focusNode == null) {
        _internalFocusNode?.dispose();
        _internalFocusNode = null;
      }

      focusNode.addListener(_onFocusChange);
    }
  }

  @override
  void dispose() {
    popoverController.removeListener(_onPopoverToggle);
    focusNode.removeListener(_onFocusChange);
    _removeScrollListener();

    _debounceTimer?.cancel();
    _animationController.dispose();
    _controller?.dispose();
    _textController?.dispose();
    _popoverController?.dispose();
    _internalFocusNode?.dispose();
    _scrollController?.dispose();
    _epoch.dispose();
    _highlightedIndex.dispose();
    showScrollToBottom.dispose();
    showScrollToTop.dispose();
    super.dispose();
  }

  void _onTextChanged(String value) {
    // Avoid re-triggering from programmatic text updates (e.g. select()).
    if (_isUpdatingText) return;

    widget.onTextChanged?.call(value);

    _debounceTimer?.cancel();

    // Reset highlight on every text change.
    _highlightedIndex.value = -1;

    if (value.length < widget.minCharsForSuggestions) {
      if (popoverController.isOpen) popoverController.hide();
      _suggestions = [];
      _lastFetchedQuery = '';
      _status = _TypeAheadStatus.idle;
      _notifyEpoch();
      return;
    }

    // Skip if the text is identical to the last fetched query.
    if (value == _lastFetchedQuery) {
      // Re-open popover if suggestions exist but popover is closed.
      if (_suggestions.isNotEmpty && !popoverController.isOpen) {
        popoverController.show();
      }
      return;
    }

    _debounceTimer = Timer(
      _resolvedDebounceDuration ?? kDefaultTypeAheadDebounceDuration,
      () => _fetchSuggestions(value),
    );
  }

  Future<void> _fetchSuggestions(String query) async {
    // Queue pattern: if a fetch is already in progress, queue and return.
    if (_isFetching) {
      _queuedQuery = query;
      return;
    }
    _isFetching = true;

    // Keep _suggestions intact during loading (retainOnLoading).
    // Only show the loading indicator if we have no prior suggestions.
    if (_suggestions.isEmpty) {
      _status = _TypeAheadStatus.loading;
      _notifyEpoch();
    }

    if (!popoverController.isOpen) {
      popoverController.show();
    }

    try {
      final results = await widget.suggestionsCallback(query);
      if (!mounted) return;
      // Discard stale results if the input changed while we were fetching.
      final currentText = textController.text;
      if (currentText != query ||
          currentText.length < widget.minCharsForSuggestions) {
        return;
      }
      _suggestions = results;
      _error = null;
      _lastFetchedQuery = query;
      _status = _TypeAheadStatus.loaded;
      _highlightedIndex.value = -1;
      _notifyEpoch();
    } on Object catch (e) {
      if (!mounted) return;
      // Discard stale errors if the input changed while we were fetching.
      final currentText = textController.text;
      if (currentText != query ||
          currentText.length < widget.minCharsForSuggestions) {
        return;
      }
      _error = e;
      _status = _TypeAheadStatus.error;
      _notifyEpoch();
    } finally {
      _isFetching = false;

      // If another query was queued while we were fetching, run it only when
      // the current input still matches the queued query and meets the minimum
      // character threshold — otherwise the fetch would reopen the popover for
      // text the user has already deleted past.
      if (mounted && _queuedQuery != null) {
        final next = _queuedQuery!;
        _queuedQuery = null;
        final currentText = textController.text;
        if (currentText == next &&
            currentText.length >= widget.minCharsForSuggestions) {
          unawaited(_fetchSuggestions(next));
        }
      }
    }
  }

  /// Selects the given [value] and optionally closes the popover / clears
  /// the text input.
  void select(T value) {
    controller.value = value;
    widget.onSelected?.call(value);

    _isUpdatingText = true;
    if (widget.clearOnSelect) {
      textController.clear();
      _lastFetchedQuery = '';
    } else {
      final displayText = widget.displayStringForOption(value);
      textController
        ..text = displayText
        ..selection = TextSelection.collapsed(offset: displayText.length);
      _lastFetchedQuery = displayText;
    }
    _isUpdatingText = false;

    _highlightedIndex.value = -1;

    if (widget.closeOnSelect) {
      popoverController.hide();
    }
  }

  /// Resets the text input to [text], clears suggestions, and closes the
  /// popover. Used by the form field variant when resetting to an initial
  /// value.
  void resetText(String text) {
    _isUpdatingText = true;
    textController
      ..text = text
      ..selection = TextSelection.collapsed(offset: text.length);
    _isUpdatingText = false;
    _suggestions = [];
    _lastFetchedQuery = text;
    _status = _TypeAheadStatus.idle;
    _highlightedIndex.value = -1;
    _notifyEpoch();
    if (popoverController.isOpen) popoverController.hide();
  }

  /// Clears the text input, resets suggestions, and closes the popover.
  ///
  /// Typically called by the form field variant when the form is reset.
  void clearText() {
    _isUpdatingText = true;
    textController.clear();
    _isUpdatingText = false;
    _suggestions = [];
    _lastFetchedQuery = '';
    _status = _TypeAheadStatus.idle;
    _highlightedIndex.value = -1;
    _notifyEpoch();
    if (popoverController.isOpen) popoverController.hide();
  }

  /// The number of items actually rendered in the ListView, respecting
  /// both the suggestions list and the optional [ShadTypeAhead.itemCount] cap.
  int get _visibleCount => min(
    widget.itemCount ?? _suggestions.length,
    _suggestions.length,
  );

  void _onArrowDown() {
    final count = _visibleCount;
    if (count == 0 || _status != _TypeAheadStatus.loaded) return;
    final maxIndex = count - 1;
    final next = _highlightedIndex.value + 1;
    _highlightedIndex.value = next > maxIndex ? 0 : next;
  }

  void _onArrowUp() {
    final count = _visibleCount;
    if (count == 0 || _status != _TypeAheadStatus.loaded) return;
    final maxIndex = count - 1;
    final prev = _highlightedIndex.value - 1;
    _highlightedIndex.value = prev < 0 ? maxIndex : prev;
  }

  void _onEnter() {
    final idx = _highlightedIndex.value;
    if (idx >= 0 && idx < _visibleCount) {
      select(_suggestions[idx]);
    }
  }

  Future<void> animateToTop() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    while (shouldAnimateToTop) {
      if (!mounted || !scrollController.hasClients) break;
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
      if (!mounted || !scrollController.hasClients) break;
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

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    final theme = ShadTheme.of(context);

    // Resolve the overlay decoration the same way ShadPopover does:
    // start from popoverTheme, merge widget overrides, apply shadows,
    // then strip the top secondary-border padding.
    var overlayDecoration =
        (theme.popoverTheme.decoration ?? const ShadDecoration())
            .merge(theme.typeAheadTheme.decoration)
            .merge(widget.decoration)
            .copyWith(
              shadows: widget.shadows ?? theme.typeAheadTheme.shadows,
            );
    final secondaryPadding =
        theme.decoration.secondaryBorder?.padding?.resolve(
          Directionality.of(context),
        ) ??
        EdgeInsets.zero;
    overlayDecoration = overlayDecoration.copyWith(
      secondaryBorder: ShadBorder(
        padding: secondaryPadding.copyWith(top: 0),
      ),
    );

    final decorationHorizontalPadding =
        (overlayDecoration.border?.padding?.horizontal ?? 0.0) +
        (overlayDecoration.secondaryBorder?.padding?.horizontal ?? 0.0);

    final effectivePadding =
        widget.padding ??
        theme.typeAheadTheme.padding ??
        const EdgeInsets.symmetric(horizontal: 12, vertical: 8);

    final effectiveShowScrollToTopChevron =
        widget.showScrollToTopChevron ??
        theme.typeAheadTheme.showScrollToTopChevron ??
        true;

    final effectiveShowScrollToBottomChevron =
        widget.showScrollToBottomChevron ??
        theme.typeAheadTheme.showScrollToBottomChevron ??
        true;

    final effectiveReverseDuration =
        widget.popoverReverseDuration ??
        theme.typeAheadTheme.popoverReverseDuration ??
        Duration.zero;

    _animationController.reverseDuration = effectiveReverseDuration;

    final effectiveAnchor =
        widget.anchor ??
        theme.typeAheadTheme.anchor ??
        const ShadAnchorAuto(
          followerAnchor: Alignment.bottomLeft,
          targetAnchor: Alignment.bottomLeft,
        );

    final effectiveEffects = widget.effects ?? theme.typeAheadTheme.effects;

    final effectiveFilter = widget.filter ?? theme.typeAheadTheme.filter;

    final effectiveFilterRadius =
        overlayDecoration.border?.radius ?? BorderRadius.zero;

    final effectiveMinWidth =
        widget.minWidth ??
        theme.typeAheadTheme.minWidth ??
        kDefaultTypeAheadMinWidth;
    final effectiveMaxWidth =
        widget.maxWidth ?? theme.typeAheadTheme.maxWidth ?? double.infinity;
    final effectiveMaxHeight =
        widget.maxHeight ??
        theme.typeAheadTheme.maxHeight ??
        kDefaultTypeAheadMaxHeight;
    final effectiveOptionsPadding =
        widget.optionsPadding ??
        theme.typeAheadTheme.optionsPadding ??
        const EdgeInsets.all(4);

    final inputWidget = ShadInput(
      controller: textController,
      focusNode: focusNode,
      enabled: widget.enabled,
      placeholder: widget.placeholder,
      placeholderStyle:
          widget.placeholderStyle ?? theme.typeAheadTheme.placeholderStyle,
      padding: effectivePadding,
      leading: widget.leading,
      trailing: widget.trailing,
      decoration: widget.inputDecoration,
      onChanged: _onTextChanged,
    );

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.escape):
            popoverController.hide,
        const SingleActivator(LogicalKeyboardKey.arrowDown): _onArrowDown,
        const SingleActivator(LogicalKeyboardKey.arrowUp): _onArrowUp,
        const SingleActivator(LogicalKeyboardKey.enter): _onEnter,
      },
      child: FocusTraversalGroup(
        policy: WidgetOrderTraversalPolicy(),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // When the parent provides a finite max width, use it so the
            // popover matches the text-field width exactly. Fall back to the
            // theme/widget minWidth for unconstrained layouts.
            final calculatedMinWidth = max(
              0.0, // ignore: prefer_int_literals
              constraints.maxWidth.isFinite
                  ? constraints.maxWidth - decorationHorizontalPadding
                  : max(effectiveMinWidth, constraints.minWidth) -
                        decorationHorizontalPadding,
            );

            // Build popover content based on current status.
            Widget buildPopoverContent() {
              switch (_status) {
                case _TypeAheadStatus.idle:
                  return const SizedBox.shrink();
                case _TypeAheadStatus.loading:
                  return widget.loadingBuilder?.call(context) ??
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: _TypeAheadLoadingIndicator(),
                          ),
                        ),
                      );
                case _TypeAheadStatus.error:
                  return widget.errorBuilder?.call(context, _error!) ??
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Center(
                          child: Text(
                            'Something went wrong',
                            style: theme.textTheme.muted,
                          ),
                        ),
                      );
                case _TypeAheadStatus.loaded:
                  if (_suggestions.isEmpty) {
                    return widget.emptyBuilder?.call(context) ??
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Center(
                            child: Text(
                              'No results found',
                              style: theme.textTheme.muted,
                            ),
                          ),
                        );
                  }

                  return ValueListenableBuilder<int>(
                    valueListenable: _highlightedIndex,
                    builder: (context, highlightedIdx, _) {
                      return ListView.builder(
                        padding: effectiveOptionsPadding,
                        controller: scrollController,
                        itemCount: _visibleCount,
                        shrinkWrap: widget.shrinkWrap ?? true,
                        itemBuilder: (context, index) {
                          final item = _suggestions[index];
                          return _TypeAheadItemWrapper(
                            highlighted: index == highlightedIdx,
                            onTap: () => select(item),
                            child: widget.itemBuilder(context, item),
                          );
                        },
                      );
                    },
                  );
              }
            }

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

            // Build the overlay content column.
            final overlayColumn = Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.header != null) Flexible(child: widget.header!),
                ?scrollToTopChild,
                Flexible(
                  child: ValueListenableBuilder<int>(
                    valueListenable: _epoch,
                    builder: (context, _, _) => buildPopoverContent(),
                  ),
                ),
                ?scrollToBottomChild,
                if (widget.footer != null) Flexible(child: widget.footer!),
              ],
            );

            // Compose the overlay widget with decoration, animation,
            // tap-outside handling, and TextFieldTapRegion — but NO
            // FocusScope/requestFocus (which is why we use ShadPortal
            // directly instead of ShadPopover).
            Widget overlay = ShadMouseArea(
              child: ShadDecorator(
                decoration: overlayDecoration,
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: theme.colorScheme.popoverForeground,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: effectiveMaxHeight,
                      minWidth: calculatedMinWidth,
                      maxWidth: constraints.maxWidth.isFinite
                          ? calculatedMinWidth
                          : effectiveMaxWidth,
                    ),
                    child: overlayColumn,
                  ),
                ),
              ),
            );

            if (effectiveFilter != null) {
              overlay = ClipRRect(
                borderRadius: effectiveFilterRadius,
                child: BackdropFilter(
                  filter: effectiveFilter,
                  child: overlay,
                ),
              );
            }

            if (effectiveEffects != null && effectiveEffects.isNotEmpty) {
              overlay = ShadAnimate(
                controller: _animationController,
                effects: effectiveEffects,
                autoPlay: false,
                child: overlay,
              );
            }

            if (widget.closeOnTapOutside) {
              overlay = TapRegion(
                groupId: _tapRegionGroupId,
                behavior: HitTestBehavior.opaque,
                onTapOutside: (_) => popoverController.hide(),
                child: overlay,
              );
            }

            // TextFieldTapRegion tells Flutter's text input system that
            // taps inside the overlay should NOT dismiss the input's
            // focus — this is the correct mechanism, not a workaround.
            overlay = TextFieldTapRegion(child: overlay);

            return ShadDisabled(
              disabled: !widget.enabled,
              child: TapRegion(
                groupId: _tapRegionGroupId,
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, _) {
                    return ShadPortal(
                      visible: !_animationController.isDismissed,
                      anchor: effectiveAnchor,
                      portalBuilder: (_) => overlay,
                      child: inputWidget,
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// A simple animated loading indicator for the typeahead.
class _TypeAheadLoadingIndicator extends StatefulWidget {
  const _TypeAheadLoadingIndicator();

  @override
  State<_TypeAheadLoadingIndicator> createState() =>
      _TypeAheadLoadingIndicatorState();
}

class _TypeAheadLoadingIndicatorState extends State<_TypeAheadLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animationController.value * 2 * pi,
          child: Icon(
            LucideIcons.loaderCircle,
            size: 16,
            color: theme.colorScheme.mutedForeground,
          ),
        );
      },
    );
  }
}

/// Wraps each typeahead suggestion item with ShadOption-like hover styling
/// and keyboard highlight support.
class _TypeAheadItemWrapper extends StatefulWidget {
  const _TypeAheadItemWrapper({
    required this.highlighted,
    required this.onTap,
    required this.child,
  });

  final bool highlighted;
  final VoidCallback onTap;
  final Widget child;

  @override
  State<_TypeAheadItemWrapper> createState() => _TypeAheadItemWrapperState();
}

class _TypeAheadItemWrapperState extends State<_TypeAheadItemWrapper> {
  final _hovered = ValueNotifier(false);

  @override
  void dispose() {
    _hovered.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveHoveredBackgroundColor =
        theme.optionTheme.hoveredBackgroundColor ?? theme.colorScheme.accent;

    final effectivePadding =
        theme.optionTheme.padding ??
        const EdgeInsets.symmetric(horizontal: 8, vertical: 6);

    final effectiveRadius = theme.optionTheme.radius ?? theme.radius;

    final effectiveTextStyle =
        theme.optionTheme.textStyle ??
        theme.textTheme.muted.fallback(
          color: theme.colorScheme.popoverForeground,
        );

    return ShadGestureDetector(
      behavior: HitTestBehavior.opaque,
      cursor: SystemMouseCursors.click,
      onHoverChange: (value) {
        _hovered.value = value;
      },
      onTap: widget.onTap,
      child: ValueListenableBuilder(
        valueListenable: _hovered,
        builder: (context, hovered, child) {
          final isActive = hovered || widget.highlighted;
          return Container(
            padding: effectivePadding,
            decoration: BoxDecoration(
              color: isActive ? effectiveHoveredBackgroundColor : null,
              borderRadius: effectiveRadius,
            ),
            child: child,
          );
        },
        child: DefaultTextStyle(
          style: effectiveTextStyle,
          child: widget.child,
        ),
      ),
    );
  }
}
