import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/components/form/field.dart';
import 'package:shadcn_ui/src/components/select.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

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
    super.decoration,
    super.focusNode,
    super.validator,
    required ShadSelectedOptionBuilder<T> selectedOptionBuilder,
    required Iterable<Widget> options,
    Widget? placeholder,
    bool closeOnTapOutside = true,
    double? minWidth,
    double? maxHeight,
    ShadDecoration? inputDecoration,
    Offset? offset,
    Widget? trailing,
    EdgeInsets? padding,
    Color? backgroundColor,
    BorderRadius? radius,
    Border? border,
    EdgeInsets? optionsPadding,
    bool? showScrollToTopChevron,
    bool? showScrollToBottomChevron,
    ScrollController? scrollController,
  }) : super(
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
              minWidth: minWidth,
              maxHeight: maxHeight,
              decoration: inputDecoration,
              offset: offset,
              trailing: trailing,
              padding: padding,
              backgroundColor: backgroundColor,
              radius: radius,
              border: border,
              optionsPadding: optionsPadding,
              showScrollToTopChevron: showScrollToTopChevron,
              showScrollToBottomChevron: showScrollToBottomChevron,
              scrollController: scrollController,
            );
          },
        );

  @override
  ShadFormBuilderFieldState<ShadSelectFormField<T>, T> createState() =>
      _ShadFormBuilderSelectState<T>();
}

class _ShadFormBuilderSelectState<T>
    extends ShadFormBuilderFieldState<ShadSelectFormField<T>, T> {}
