import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/components/form/field.dart';
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
    required ShadSelectedOptionBuilder<T> selectedOptionBuilder,
    required Iterable<Widget> options,
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
  }) : super(
          decorationBuilder: (context) =>
              (ShadTheme.of(context).selectTheme.decoration ??
                      const ShadDecoration())
                  .mergeWith(decoration),
          builder: (field) {
            final state = field as _ShadFormBuilderSelectState;

            return ShadSelect<T>(
              options: options,
              selectedOptionBuilder: selectedOptionBuilder,
              focusNode: state.focusNode,
              placeholder: placeholder,
              initialValue: initialValue,
              enabled: state.enabled,
              onChanged: state.didChange,
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
    required Iterable<Widget> options,
    required ValueChanged<String> onSearchChanged,
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
    Widget? searchInputPrefix,
    Widget? searchPlaceholder,
    EdgeInsets? searchPadding,
    Widget? search,
    bool? clearSearchOnClose,
  }) : super(
          decorationBuilder: (context) =>
              (ShadTheme.of(context).selectTheme.decoration ??
                      const ShadDecoration())
                  .mergeWith(decoration),
          builder: (field) {
            final state = field as _ShadFormBuilderSelectState;

            return ShadSelect<T>.withSearch(
              options: options,
              selectedOptionBuilder: selectedOptionBuilder,
              focusNode: state.focusNode,
              placeholder: placeholder,
              initialValue: initialValue,
              enabled: state.enabled,
              onChanged: state.didChange,
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
              searchPlaceholder: searchPlaceholder,
              searchPadding: searchPadding,
              search: search,
              clearSearchOnClose: clearSearchOnClose,
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
    required Iterable<Widget> options,
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
    Widget? searchInputPrefix,
    Widget? searchPlaceholder,
    EdgeInsets? searchPadding,
    Widget? search,
    bool? clearSearchOnClose,
  })  : assert(
          variant == ShadSelectVariant.primary || onSearchChanged != null,
          'onSearchChanged must be provided when variant is search',
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
              selectedOptionBuilder: selectedOptionBuilder,
              focusNode: state.focusNode,
              placeholder: placeholder,
              initialValue: initialValue,
              enabled: state.enabled,
              onChanged: state.didChange,
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
              searchPlaceholder: searchPlaceholder,
              searchPadding: searchPadding,
              search: search,
              clearSearchOnClose: clearSearchOnClose,
            );
          },
        );

  @override
  ShadFormBuilderFieldState<ShadSelectFormField<T>, T> createState() =>
      _ShadFormBuilderSelectState<T>();
}

class _ShadFormBuilderSelectState<T>
    extends ShadFormBuilderFieldState<ShadSelectFormField<T>, T> {}
