import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/components/form/field.dart';
import 'package:shadcn_ui/src/components/popover.dart';
import 'package:shadcn_ui/src/components/select.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

class ShadSelectFormField<T> extends ShadFormBuilderField<T> {
  ShadSelectFormField({
    super.id,
    super.key,
    super.onSaved,
    super.label,
    super.error,
    super.description,
    super.onChanged,
    super.valueTransformer,
    super.onReset,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    super.initialValue,
    super.focusNode,
    super.validator,

    /// {@macro ShadSelect.selectedOptionBuilder}
    required ShadSelectedOptionBuilder<T> selectedOptionBuilder,

    /// {@macro ShadSelect.options}
    Iterable<Widget>? options,

    /// {@macro ShadSelect.optionsBuilder}
    Widget? Function(BuildContext, int)? optionsBuilder,

    /// {@macro ShadSelect.placeholder}
    Widget? placeholder,

    /// {@macro ShadSelect.closeOnTapOutside}
    bool closeOnTapOutside = true,

    /// {@macro ShadSelect.minWidth}
    double? minWidth,

    /// {@macro ShadSelect.maxWidth}
    double? maxWidth,

    /// {@macro ShadSelect.maxHeight}
    double? maxHeight,

    /// {@macro ShadSelect.decoration}
    ShadDecoration? decoration,

    /// {@macro ShadSelect.trailing}
    Widget? trailing,

    /// {@macro ShadSelect.padding}
    EdgeInsets? padding,

    /// {@macro ShadSelect.optionsPadding}
    EdgeInsets? optionsPadding,

    /// {@macro ShadSelect.showScrollToTopChevron}
    bool? showScrollToTopChevron,

    /// {@macro ShadSelect.showScrollToBottomChevron}
    bool? showScrollToBottomChevron,

    /// {@macro ShadSelect.scrollController}
    ScrollController? scrollController,

    /// {@macro ShadSelect.anchor}
    ShadAnchorBase? anchor,

    /// {@macro ShadSelect.filter}
    ImageFilter? filter,

    /// {@macro ShadSelect.popoverController}
    ShadPopoverController? popoverController,

    /// {@macro ShadSelect.header}
    Widget? header,

    /// {@macro ShadSelect.footer}
    Widget? footer,

    /// {@macro ShadSelect.allowDeselection}
    bool allowDeselection = false,

    /// {@macro ShadSelect.closeOnSelect}
    bool closeOnSelect = true,

    /// {@macro ShadPopover.groupId}
    Object? groupId,

    /// {@macro ShadSelect.itemCount}
    int? itemCount,

    /// {@macro ShadSelect.shrinkWrap}
    bool? shrinkWrap,
    this.controller,
  }) : super(
          decorationBuilder: (context) =>
              (ShadTheme.of(context).selectTheme.decoration ??
                      const ShadDecoration())
                  .mergeWith(decoration),
          builder: (field) {
            final state = field as _ShadFormBuilderSelectState;

            return ShadSelect<T>(
              options: options,
              allowDeselection: allowDeselection,
              optionsBuilder: optionsBuilder,
              selectedOptionBuilder: selectedOptionBuilder,
              focusNode: state.focusNode,
              placeholder: placeholder,
              initialValue: state.initialValue as T?,
              enabled: state.enabled,
              onChanged: state.didChange,
              closeOnTapOutside: closeOnTapOutside,
              anchor: anchor,
              minWidth: minWidth,
              maxWidth: maxWidth,
              maxHeight: maxHeight,
              decoration: state.decoration,
              trailing: trailing,
              padding: padding,
              optionsPadding: optionsPadding,
              showScrollToTopChevron: showScrollToTopChevron,
              showScrollToBottomChevron: showScrollToBottomChevron,
              scrollController: scrollController,
              filter: filter,
              popoverController: popoverController,
              header: header,
              footer: footer,
              closeOnSelect: closeOnSelect,
              groupId: groupId,
              itemCount: itemCount,
              shrinkWrap: shrinkWrap,
              controller: controller,
            );
          },
        );

  ShadSelectFormField.withSearch({
    super.id,
    super.key,
    super.onSaved,
    super.label,
    super.error,
    super.description,
    super.onChanged,
    super.valueTransformer,
    super.onReset,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    super.initialValue,
    super.focusNode,
    super.validator,
    required ShadSelectedOptionBuilder<T> selectedOptionBuilder,
    Iterable<Widget>? options,

    /// The builder for the options of the [ShadSelect].
    Widget? Function(BuildContext, int)? optionsBuilder,
    required ValueChanged<String> onSearchChanged,
    Widget? placeholder,
    bool closeOnTapOutside = true,
    double? minWidth,
    double? maxWidth,
    double? maxHeight,
    ShadDecoration? decoration,
    Widget? trailing,
    EdgeInsets? padding,
    EdgeInsets? optionsPadding,
    bool? showScrollToTopChevron,
    bool? showScrollToBottomChevron,
    ScrollController? scrollController,
    ShadAnchorBase? anchor,
    ImageFilter? filter,
    Widget? searchDivider,
    @Deprecated('Use searchInputLeading instead') Widget? searchInputPrefix,
    Widget? searchInputLeading,
    Widget? searchPlaceholder,
    EdgeInsets? searchPadding,
    Widget? search,
    bool? clearSearchOnClose,
    ShadPopoverController? popoverController,

    /// {@macro select.header}
    Widget? header,

    /// {@macro select.footer}
    Widget? footer,
    bool allowDeselection = false,
    bool closeOnSelect = true,

    /// {@macro ShadPopover.groupId}
    Object? groupId,

    /// {@macro ShadSelect.itemCount}
    int? itemCount,

    /// {@macro ShadSelect.shrinkWrap}
    bool? shrinkWrap,

    /// {@macro ShadSelect.controller}
    this.controller,
  }) : super(
          decorationBuilder: (context) =>
              (ShadTheme.of(context).selectTheme.decoration ??
                      const ShadDecoration())
                  .mergeWith(decoration),
          builder: (field) {
            final state = field as _ShadFormBuilderSelectState;

            return ShadSelect<T>.withSearch(
              options: options,
              allowDeselection: allowDeselection,
              optionsBuilder: optionsBuilder,
              selectedOptionBuilder: selectedOptionBuilder,
              focusNode: state.focusNode,
              placeholder: placeholder,
              initialValue: state.initialValue as T?,
              enabled: state.enabled,
              onChanged: onChanged != null ? state.didChange : null,
              closeOnTapOutside: closeOnTapOutside,
              anchor: anchor,
              minWidth: minWidth,
              maxWidth: maxWidth,
              maxHeight: maxHeight,
              decoration: state.decoration,
              trailing: trailing,
              padding: padding,
              optionsPadding: optionsPadding,
              showScrollToTopChevron: showScrollToTopChevron,
              showScrollToBottomChevron: showScrollToBottomChevron,
              scrollController: scrollController,
              filter: filter,
              onSearchChanged: onSearchChanged,
              searchDivider: searchDivider,
              searchInputPrefix: searchInputPrefix,
              searchInputLeading: searchInputLeading,
              searchPlaceholder: searchPlaceholder,
              searchPadding: searchPadding,
              search: search,
              clearSearchOnClose: clearSearchOnClose,
              popoverController: popoverController,
              header: header,
              footer: footer,
              closeOnSelect: closeOnSelect,
              groupId: groupId,
              itemCount: itemCount,
              shrinkWrap: shrinkWrap,
              controller: controller,
            );
          },
        );

  ShadSelectFormField.raw({
    super.id,
    super.key,
    super.onSaved,
    super.label,
    super.error,
    super.description,
    super.onChanged,
    super.valueTransformer,
    super.onReset,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    super.initialValue,
    super.focusNode,
    super.validator,
    required ShadSelectVariant variant,
    required ShadSelectedOptionBuilder<T> selectedOptionBuilder,
    Iterable<Widget>? options,

    /// The builder for the options of the [ShadSelect].
    Widget? Function(BuildContext, int)? optionsBuilder,
    ValueChanged<String>? onSearchChanged,
    Widget? placeholder,
    bool closeOnTapOutside = true,
    double? minWidth,
    double? maxHeight,
    ShadDecoration? decoration,
    Widget? trailing,
    EdgeInsets? padding,
    EdgeInsets? optionsPadding,
    bool? showScrollToTopChevron,
    bool? showScrollToBottomChevron,
    ScrollController? scrollController,
    ShadAnchorBase? anchor,
    ImageFilter? filter,
    Widget? searchDivider,
    @Deprecated('Use searchInputLeading instead') Widget? searchInputPrefix,
    Widget? searchInputLeading,
    Widget? searchPlaceholder,
    EdgeInsets? searchPadding,
    Widget? search,
    bool? clearSearchOnClose,
    ShadPopoverController? popoverController,

    /// {@macro select.header}
    Widget? header,

    /// {@macro select.footer}
    Widget? footer,
    bool allowDeselection = false,
    bool closeOnSelect = true,

    /// {@macro ShadPopover.groupId}
    Object? groupId,

    /// {@macro ShadSelect.itemCount}
    int? itemCount,

    /// {@macro ShadSelect.shrinkWrap}
    bool? shrinkWrap,

    /// {@macro ShadSelect.controller}
    this.controller,
  })  : assert(
          variant == ShadSelectVariant.primary || onSearchChanged != null,
          'onSearchChanged must be provided when variant is search',
        ),
        assert(
          variant == ShadSelectVariant.primary ||
              variant == ShadSelectVariant.search,
          '''The variant is not supported. Use primary or search or use ShadSelectMultipleFormField instead.''',
        ),
        super(
          decorationBuilder: (context) =>
              (ShadTheme.of(context).selectTheme.decoration ??
                      const ShadDecoration())
                  .mergeWith(decoration),
          builder: (field) {
            final state = field as _ShadFormBuilderSelectState;

            return ShadSelect<T>.raw(
              variant: variant,
              options: options,
              optionsBuilder: optionsBuilder,
              selectedOptionBuilder: selectedOptionBuilder,
              focusNode: state.focusNode,
              placeholder: placeholder,
              initialValue: state.initialValue as T?,
              enabled: state.enabled,
              onChanged: onChanged != null ? state.didChange : null,
              closeOnTapOutside: closeOnTapOutside,
              anchor: anchor,
              minWidth: minWidth,
              maxHeight: maxHeight,
              decoration: state.decoration,
              trailing: trailing,
              padding: padding,
              optionsPadding: optionsPadding,
              showScrollToTopChevron: showScrollToTopChevron,
              showScrollToBottomChevron: showScrollToBottomChevron,
              scrollController: scrollController,
              filter: filter,
              onSearchChanged: onSearchChanged,
              searchDivider: searchDivider,
              searchInputPrefix: searchInputPrefix,
              searchInputLeading: searchInputLeading,
              searchPlaceholder: searchPlaceholder,
              searchPadding: searchPadding,
              search: search,
              clearSearchOnClose: clearSearchOnClose,
              popoverController: popoverController,
              header: header,
              footer: footer,
              allowDeselection: allowDeselection,
              closeOnSelect: closeOnSelect,
              groupId: groupId,
              itemCount: itemCount,
              shrinkWrap: shrinkWrap,
              controller: controller,
            );
          },
        );

  /// {@macro ShadSelect.controller}
  final ShadSelectController<T>? controller;

  @override
  ShadFormBuilderFieldState<ShadSelectFormField<T>, T> createState() =>
      _ShadFormBuilderSelectState<T>();
}

class _ShadFormBuilderSelectState<T>
    extends ShadFormBuilderFieldState<ShadSelectFormField<T>, T> {
  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller!.addListener(() {
        didChange(widget.controller!.value.firstOrNull);
      });
    }
  }
}

class ShadSelectMultipleFormField<T> extends ShadFormBuilderField<List<T>> {
  ShadSelectMultipleFormField({
    super.id,
    super.key,
    super.onSaved,
    super.label,
    super.error,
    super.description,
    super.onChanged,
    super.valueTransformer,
    super.onReset,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    super.initialValue,
    super.focusNode,
    super.validator,
    required ShadSelectedOptionBuilder<List<T>> selectedOptionsBuilder,
    Iterable<Widget>? options,

    /// The builder for the options of the [ShadSelect].
    Widget? Function(BuildContext, int)? optionsBuilder,
    Widget? placeholder,
    bool closeOnTapOutside = true,
    double? minWidth,
    double? maxWidth,
    double? maxHeight,
    ShadDecoration? decoration,
    Widget? trailing,
    EdgeInsets? padding,
    EdgeInsets? optionsPadding,
    bool? showScrollToTopChevron,
    bool? showScrollToBottomChevron,
    ScrollController? scrollController,
    ShadAnchorBase? anchor,
    ImageFilter? filter,
    ShadPopoverController? popoverController,

    /// {@macro ShadSelect.header}
    Widget? header,

    /// {@macro ShadSelect.footer}
    Widget? footer,
    bool closeOnSelect = true,

    /// {@macro ShadSelect.allowDeselection}
    bool allowDeselection = true,
    this.controller,
  }) : super(
          decorationBuilder: (context) =>
              (ShadTheme.of(context).selectTheme.decoration ??
                      const ShadDecoration())
                  .mergeWith(decoration),
          builder: (field) {
            final state = field as _ShadFormBuilderSelectMultipleState;

            return ShadSelect<T>.multiple(
              options: options,
              optionsBuilder: optionsBuilder,
              selectedOptionsBuilder: selectedOptionsBuilder,
              focusNode: state.focusNode,
              placeholder: placeholder,
              initialValues: state.initialValue as List<T>? ?? [],
              enabled: state.enabled,
              onChanged: state.didChange,
              closeOnTapOutside: closeOnTapOutside,
              anchor: anchor,
              minWidth: minWidth,
              maxWidth: maxWidth,
              maxHeight: maxHeight,
              decoration: state.decoration,
              trailing: trailing,
              padding: padding,
              optionsPadding: optionsPadding,
              showScrollToTopChevron: showScrollToTopChevron,
              showScrollToBottomChevron: showScrollToBottomChevron,
              scrollController: scrollController,
              filter: filter,
              popoverController: popoverController,
              header: header,
              footer: footer,
              closeOnSelect: closeOnSelect,
              allowDeselection: allowDeselection,
              controller: controller,
            );
          },
        );

  ShadSelectMultipleFormField.withSearch({
    super.id,
    super.key,
    super.onSaved,
    super.label,
    super.error,
    super.description,
    super.onChanged,
    super.valueTransformer,
    super.onReset,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    super.initialValue,
    super.focusNode,
    super.validator,
    required ShadSelectedOptionBuilder<List<T>> selectedOptionsBuilder,
    Iterable<Widget>? options,

    /// The builder for the options of the [ShadSelect].
    Widget? Function(BuildContext, int)? optionsBuilder,
    required ValueChanged<String> onSearchChanged,
    Widget? placeholder,
    bool closeOnTapOutside = true,
    double? minWidth,
    double? maxWidth,
    double? maxHeight,
    ShadDecoration? decoration,
    Widget? trailing,
    EdgeInsets? padding,
    EdgeInsets? optionsPadding,
    bool? showScrollToTopChevron,
    bool? showScrollToBottomChevron,
    ScrollController? scrollController,
    ShadAnchorBase? anchor,
    ImageFilter? filter,
    Widget? searchDivider,
    @Deprecated('Use searchInputLeading instead') Widget? searchInputPrefix,
    Widget? searchInputLeading,
    Widget? searchPlaceholder,
    EdgeInsets? searchPadding,
    Widget? search,
    bool? clearSearchOnClose,
    ShadPopoverController? popoverController,

    /// {@macro select.header}
    Widget? header,

    /// {@macro select.footer}
    Widget? footer,
    bool closeOnSelect = true,

    /// {@macro ShadSelect.allowDeselection}
    bool allowDeselection = true,
    this.controller,
  }) : super(
          decorationBuilder: (context) =>
              (ShadTheme.of(context).selectTheme.decoration ??
                      const ShadDecoration())
                  .mergeWith(decoration),
          builder: (field) {
            final state = field as _ShadFormBuilderSelectMultipleState;

            return ShadSelect<T>.multipleWithSearch(
              options: options,
              optionsBuilder: optionsBuilder,
              selectedOptionsBuilder: selectedOptionsBuilder,
              focusNode: state.focusNode,
              placeholder: placeholder,
              initialValues: state.initialValue as List<T>? ?? [],
              enabled: state.enabled,
              onChanged: state.didChange,
              closeOnTapOutside: closeOnTapOutside,
              anchor: anchor,
              minWidth: minWidth,
              maxWidth: maxWidth,
              maxHeight: maxHeight,
              decoration: state.decoration,
              trailing: trailing,
              padding: padding,
              optionsPadding: optionsPadding,
              showScrollToTopChevron: showScrollToTopChevron,
              showScrollToBottomChevron: showScrollToBottomChevron,
              scrollController: scrollController,
              filter: filter,
              onSearchChanged: onSearchChanged,
              searchDivider: searchDivider,
              searchInputPrefix: searchInputPrefix,
              searchInputLeading: searchInputLeading,
              searchPlaceholder: searchPlaceholder,
              searchPadding: searchPadding,
              search: search,
              clearSearchOnClose: clearSearchOnClose,
              popoverController: popoverController,
              header: header,
              footer: footer,
              closeOnSelect: closeOnSelect,
              allowDeselection: allowDeselection,
              controller: controller,
            );
          },
        );

  ShadSelectMultipleFormField.raw({
    super.id,
    super.key,
    super.onSaved,
    super.label,
    super.error,
    super.description,
    super.onChanged,
    super.valueTransformer,
    super.onReset,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    super.initialValue,
    super.focusNode,
    super.validator,
    required ShadSelectVariant variant,
    required ShadSelectedOptionBuilder<List<T>> selectedOptionsBuilder,
    Iterable<Widget>? options,

    /// The builder for the options of the [ShadSelect].
    Widget? Function(BuildContext, int)? optionsBuilder,
    ValueChanged<String>? onSearchChanged,
    Widget? placeholder,
    bool closeOnTapOutside = true,
    double? minWidth,
    double? maxHeight,
    ShadDecoration? decoration,
    Widget? trailing,
    EdgeInsets? padding,
    EdgeInsets? optionsPadding,
    bool? showScrollToTopChevron,
    bool? showScrollToBottomChevron,
    ScrollController? scrollController,
    ShadAnchorBase? anchor,
    ImageFilter? filter,
    Widget? searchDivider,
    @Deprecated('Use searchInputLeading instead') Widget? searchInputPrefix,
    Widget? searchInputLeading,
    Widget? searchPlaceholder,
    EdgeInsets? searchPadding,
    Widget? search,
    bool? clearSearchOnClose,
    ShadPopoverController? popoverController,

    /// {@macro select.header}
    Widget? header,

    /// {@macro select.footer}
    Widget? footer,
    bool allowDeselection = true,
    bool closeOnSelect = true,
    this.controller,
  })  : assert(
          variant == ShadSelectVariant.multiple ||
              variant == ShadSelectVariant.multipleWithSearch,
          '''The variant is not supported. Use multiple or multipleWithSearch or use ShadSelectFormField instead.''',
        ),
        super(
          decorationBuilder: (context) =>
              (ShadTheme.of(context).selectTheme.decoration ??
                      const ShadDecoration())
                  .mergeWith(decoration),
          builder: (field) {
            final state = field as _ShadFormBuilderSelectMultipleState;

            return ShadSelect<T>.raw(
              variant: variant,
              options: options,
              optionsBuilder: optionsBuilder,
              selectedOptionsBuilder: selectedOptionsBuilder,
              focusNode: state.focusNode,
              placeholder: placeholder,
              initialValues: state.initialValue as List<T>? ?? [],
              enabled: state.enabled,
              onMultipleChanged: state.didChange,
              closeOnTapOutside: closeOnTapOutside,
              anchor: anchor,
              minWidth: minWidth,
              maxHeight: maxHeight,
              decoration: state.decoration,
              trailing: trailing,
              padding: padding,
              optionsPadding: optionsPadding,
              showScrollToTopChevron: showScrollToTopChevron,
              showScrollToBottomChevron: showScrollToBottomChevron,
              scrollController: scrollController,
              filter: filter,
              onSearchChanged: onSearchChanged,
              searchDivider: searchDivider,
              searchInputPrefix: searchInputPrefix,
              searchInputLeading: searchInputLeading,
              searchPlaceholder: searchPlaceholder,
              searchPadding: searchPadding,
              search: search,
              clearSearchOnClose: clearSearchOnClose,
              popoverController: popoverController,
              header: header,
              footer: footer,
              allowDeselection: allowDeselection,
              closeOnSelect: closeOnSelect,
              controller: controller,
            );
          },
        );

  /// {@macro ShadSelect.controller}
  final ShadSelectController<T>? controller;

  @override
  ShadFormBuilderFieldState<ShadSelectMultipleFormField<T>, List<T>>
      createState() => _ShadFormBuilderSelectMultipleState<T>();
}

class _ShadFormBuilderSelectMultipleState<T>
    extends ShadFormBuilderFieldState<ShadSelectMultipleFormField<T>, List<T>> {
  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller!.addListener(() {
        didChange(widget.controller!.value.toList());
      });
    }
  }
}
