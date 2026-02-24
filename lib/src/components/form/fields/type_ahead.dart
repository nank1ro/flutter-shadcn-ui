import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/components/form/field.dart';
import 'package:shadcn_ui/src/components/popover.dart';
import 'package:shadcn_ui/src/components/type_ahead.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

class ShadTypeAheadFormField<T> extends ShadFormBuilderField<T> {
  ShadTypeAheadFormField({
    super.id,
    super.key,
    super.onSaved,
    super.forceErrorText,
    super.label,
    super.error,
    super.description,
    super.onChanged,
    @Deprecated('Use toValueTransformer instead') super.valueTransformer,
    super.toValueTransformer,
    super.fromValueTransformer,
    super.onReset,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    super.initialValue,
    super.focusNode,
    super.validator,

    /// {@macro ShadTypeAhead.suggestionsCallback}
    required ShadTypeAheadSuggestionsCallback<T> suggestionsCallback,

    /// {@macro ShadTypeAhead.itemBuilder}
    required ShadTypeAheadItemBuilder<T> itemBuilder,

    /// {@macro ShadTypeAhead.placeholder}
    Widget? placeholder,

    /// {@macro ShadTypeAhead.placeholderStyle}
    TextStyle? placeholderStyle,

    /// {@macro ShadTypeAhead.leading}
    Widget? leading,

    /// {@macro ShadTypeAhead.trailing}
    Widget? trailing,

    /// {@macro ShadTypeAhead.decoration}
    ShadDecoration? decoration,

    /// {@macro ShadTypeAhead.inputDecoration}
    ShadDecoration? inputDecoration,

    /// {@macro ShadTypeAhead.padding}
    EdgeInsetsGeometry? padding,

    /// {@macro ShadTypeAhead.optionsPadding}
    EdgeInsetsGeometry? optionsPadding,

    /// {@macro ShadTypeAhead.minWidth}
    double? minWidth,

    /// {@macro ShadTypeAhead.maxWidth}
    double? maxWidth,

    /// {@macro ShadTypeAhead.maxHeight}
    double? maxHeight,

    /// {@macro ShadTypeAhead.anchor}
    ShadAnchorBase? anchor,

    /// {@macro ShadTypeAhead.effects}
    List<Effect<dynamic>>? effects,

    /// {@macro ShadTypeAhead.shadows}
    List<BoxShadow>? shadows,

    /// {@macro ShadTypeAhead.filter}
    ImageFilter? filter,

    /// {@macro ShadTypeAhead.debounceDuration}
    Duration? debounceDuration,

    /// {@macro ShadTypeAhead.closeOnTapOutside}
    bool closeOnTapOutside = true,

    /// {@macro ShadTypeAhead.closeOnSelect}
    bool closeOnSelect = true,

    /// {@macro ShadTypeAhead.clearOnSelect}
    bool clearOnSelect = false,

    /// {@macro ShadTypeAhead.showScrollToTopChevron}
    bool? showScrollToTopChevron,

    /// {@macro ShadTypeAhead.showScrollToBottomChevron}
    bool? showScrollToBottomChevron,

    /// {@macro ShadTypeAhead.scrollController}
    ScrollController? scrollController,

    /// {@macro ShadTypeAhead.header}
    Widget? header,

    /// {@macro ShadTypeAhead.footer}
    Widget? footer,

    /// {@macro ShadTypeAhead.loadingBuilder}
    WidgetBuilder? loadingBuilder,

    /// {@macro ShadTypeAhead.emptyBuilder}
    WidgetBuilder? emptyBuilder,

    /// {@macro ShadTypeAhead.errorBuilder}
    Widget Function(BuildContext context, Object error)? errorBuilder,

    /// {@macro ShadPopover.groupId}
    Object? groupId,

    /// {@macro ShadTypeAhead.popoverReverseDuration}
    Duration? popoverReverseDuration,

    /// {@macro ShadTypeAhead.minCharsForSuggestions}
    int minCharsForSuggestions = 0,

    /// {@macro ShadTypeAhead.itemCount}
    int? itemCount,

    /// {@macro ShadTypeAhead.shrinkWrap}
    bool? shrinkWrap,

    /// {@macro ShadTypeAhead.displayStringForOption}
    ShadTypeAheadDisplayStringForOption<T> displayStringForOption =
        defaultDisplayStringForOption,

    /// {@macro ShadTypeAhead.popoverController}
    ShadPopoverController? popoverController,

    /// {@macro ShadTypeAhead.textController}
    TextEditingController? textController,

    /// {@macro ShadTypeAhead.initialValue}
    this.initialTextValue,

    /// {@macro ShadTypeAhead.onTextChanged}
    ValueChanged<String>? onTextChanged,

    /// {@macro ShadTypeAhead.controller}
    this.controller,
  }) : super(
         decorationBuilder: (context) =>
             (ShadTheme.of(context).typeAheadTheme.decoration ??
                     const ShadDecoration())
                 .merge(decoration),
         builder: (field) {
           final state = field as _ShadFormBuilderTypeAheadState<T>;

           return ShadTypeAhead<T>(
             key: state._typeAheadKey,
             suggestionsCallback: suggestionsCallback,
             itemBuilder: itemBuilder,
             focusNode: state.focusNode,
             enabled: state.enabled,
             placeholder: placeholder,
             placeholderStyle: placeholderStyle,
             leading: leading,
             trailing: trailing,
             decoration: state.decoration,
             inputDecoration: inputDecoration,
             padding: padding,
             optionsPadding: optionsPadding,
             minWidth: minWidth,
             maxWidth: maxWidth,
             maxHeight: maxHeight,
             anchor: anchor,
             effects: effects,
             shadows: shadows,
             filter: filter,
             debounceDuration: debounceDuration,
             closeOnTapOutside: closeOnTapOutside,
             closeOnSelect: closeOnSelect,
             clearOnSelect: clearOnSelect,
             showScrollToTopChevron: showScrollToTopChevron,
             showScrollToBottomChevron: showScrollToBottomChevron,
             scrollController: scrollController,
             header: header,
             footer: footer,
             loadingBuilder: loadingBuilder,
             emptyBuilder: emptyBuilder,
             errorBuilder: errorBuilder,
             groupId: groupId,
             popoverReverseDuration: popoverReverseDuration,
             minCharsForSuggestions: minCharsForSuggestions,
             itemCount: itemCount,
             shrinkWrap: shrinkWrap,
             displayStringForOption: displayStringForOption,
             popoverController: popoverController,
             textController: textController,
             initialValue: initialTextValue,
             onTextChanged: onTextChanged,
             controller: state.controller,
             onSelected: state.didChange,
           );
         },
       );

  final ShadTypeAheadController<T>? controller;

  /// The initial text to display in the input field. Persisted so that
  /// reset can restore it even when [initialValue] is null.
  final String? initialTextValue;

  @override
  ShadFormBuilderFieldState<ShadTypeAheadFormField<T>, T> createState() =>
      _ShadFormBuilderTypeAheadState<T>();
}

class _ShadFormBuilderTypeAheadState<T>
    extends ShadFormBuilderFieldState<ShadTypeAheadFormField<T>, T> {
  ShadTypeAheadController<T>? _controller;

  /// Key to access [ShadTypeAheadState] for clearing text on reset.
  final _typeAheadKey = GlobalKey<ShadTypeAheadState<T>>();

  ShadTypeAheadController<T> get controller =>
      widget.controller ??
      (_controller ??= ShadTypeAheadController<T>(
        initialValue: initialValue,
      ));

  @override
  void initState() {
    super.initState();
    controller.addListener(_onControllerChange);
  }

  @override
  void didUpdateWidget(covariant ShadTypeAheadFormField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      // Detach from the previous controller.
      (oldWidget.controller ?? _controller)?.removeListener(
        _onControllerChange,
      );

      // Manage internal controller ownership.
      if (widget.controller != null && oldWidget.controller == null) {
        // External controller provided — dispose the internal one.
        _controller?.dispose();
        _controller = null;
      } else if (widget.controller == null && oldWidget.controller != null) {
        // External controller removed — create a new internal one,
        // carrying over the current value.
        _controller = ShadTypeAheadController<T>(initialValue: value);
      }

      // Attach to the resolved controller.
      controller.addListener(_onControllerChange);
    }
  }

  @override
  void didChange(T? value) {
    super.didChange(value);
    controller.value = value;
  }

  @override
  void dispose() {
    controller.removeListener(_onControllerChange);
    _controller?.dispose();
    super.dispose();
  }

  void _onControllerChange() {
    if (controller.value != value) {
      didChange(controller.value);
    }
  }

  @override
  void reset() {
    super.reset();
    controller.value = initialValue;
    final state = _typeAheadKey.currentState;
    if (state == null) return;
    if (initialValue != null) {
      // Restore the display text for the initial value.
      final displayText = state.widget.displayStringForOption(
        initialValue as T,
      );
      state.resetText(displayText);
    } else if (widget.initialTextValue != null) {
      // No typed initial value, but an initial text was provided.
      state.resetText(widget.initialTextValue!);
    } else {
      state.clearText();
    }
  }
}
