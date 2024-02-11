import 'dart:ui' as ui;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/src/components/form/field.dart';
import 'package:shadcn_ui/src/components/input.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

class ShadInputFormField extends ShadFormBuilderField<String> {
  ShadInputFormField({
    required super.id,
    super.key,
    super.onSaved,
    super.validator,
    String? initialValue,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    this.controller,
    super.label,
    super.error,
    super.description,
    super.onChanged,
    ShadDecoration? decoration,
    ShadDecoration? inputDecoration,
    Widget? placeholder,
    TextMagnifierConfiguration magnifierConfiguration =
        TextMagnifierConfiguration.disabled,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    TextDirection? textDirection,
    bool autofocus = false,
    String obscuringCharacter = '•',
    bool obscureText = false,
    bool autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool enableSuggestions = true,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
    bool readOnly = false,
    bool? showCursor = false,
    int? maxLength,
    MaxLengthEnforcement? maxLengthEnforcement,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onSubmitted,
    AppPrivateCommandCallback? onAppPrivateCommand,
    List<TextInputFormatter>? inputFormatters,
    double cursorWidth = 2.0,
    double? cursorHeight,
    Radius? cursorRadius,
    bool? cursorOpacityAnimates,
    Color? cursorColor,
    ui.BoxHeightStyle selectionHeightStyle = ui.BoxHeightStyle.tight,
    ui.BoxWidthStyle selectionWidthStyle = ui.BoxWidthStyle.tight,
    Brightness? keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20),
    bool? enableInteractiveSelection,
    TextSelectionControls? selectionControls,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    GestureTapCallback? onTap,
    TapRegionCallback? onTapOutside,
    MouseCursor? mouseCursor,
    ScrollPhysics? scrollPhysics,
    ScrollController? scrollController,
    Iterable<String>? autofillHints,
    Clip clipBehavior = Clip.hardEdge,
    bool scribbleEnabled = true,
    bool enableIMEPersonalizedLearning = true,
    ContentInsertionConfiguration? contentInsertionConfiguration,
    EditableTextContextMenuBuilder? contextMenuBuilder,
    UndoHistoryController? undoController,
    SpellCheckConfiguration? spellCheckConfiguration,
    Color? selectionColor,
    EdgeInsets? padding,
    Border? border,
    BorderRadius? radius,
  }) : super(
          initialValue: controller != null ? controller.text : initialValue,
          builder: (field) {
            final state = field as _ShadFormBuilderInputState;
            final theme = ShadTheme.of(field.context);
            final hasError = state.hasError;

            final effectiveError = state.errorText == null
                ? null
                : error ?? Text(state.errorText!);

            // Move the placeholder based on the padding and border of the input
            final effectiveInputPadding = padding ??
                theme.inputTheme.padding ??
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
            final effectiveInputBorder =
                border ?? theme.inputTheme.border ?? Border.all(width: 2);
            final effectivePlaceholder = Padding(
              padding: EdgeInsets.only(
                top: effectiveInputPadding.top + effectiveInputBorder.top.width,
                left: effectiveInputPadding.left +
                    effectiveInputBorder.left.width,
              ),
              child: placeholder,
            );

            return ShadDecorator(
              decoration: decoration,
              label: label,
              hasError: hasError,
              error: effectiveError,
              description: description,
              child: ShadInput(
                key: state.inputKey,
                controller: state.controller,
                initialValue: initialValue,
                restorationId: restorationId,
                enabled: enabled,
                focusNode: state.focusNode,
                decoration: inputDecoration,
                style: style,
                cursorColor: cursorColor,
                selectionColor: selectionColor,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                textCapitalization: textCapitalization,
                autofocus: autofocus,
                obscureText: obscureText,
                autocorrect: autocorrect,
                magnifierConfiguration: magnifierConfiguration,
                smartDashesType: smartDashesType,
                smartQuotesType: smartQuotesType,
                enableSuggestions: enableSuggestions,
                maxLines: maxLines,
                minLines: minLines,
                expands: expands,
                onChanged: onChanged,
                onEditingComplete: onEditingComplete,
                onSubmitted: onSubmitted,
                onAppPrivateCommand: onAppPrivateCommand,
                inputFormatters: inputFormatters,
                cursorWidth: cursorWidth,
                cursorHeight: cursorHeight,
                cursorRadius: cursorRadius,
                selectionHeightStyle: selectionHeightStyle,
                selectionWidthStyle: selectionWidthStyle,
                scrollPadding: scrollPadding,
                dragStartBehavior: dragStartBehavior,
                scrollController: scrollController,
                scrollPhysics: scrollPhysics,
                autofillHints: autofillHints,
                clipBehavior: clipBehavior,
                scribbleEnabled: scribbleEnabled,
                enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
                contentInsertionConfiguration: contentInsertionConfiguration,
                contextMenuBuilder: contextMenuBuilder,
                selectionControls: selectionControls,
                mouseCursor: mouseCursor,
                enableInteractiveSelection: enableInteractiveSelection,
                undoController: undoController,
                spellCheckConfiguration: spellCheckConfiguration,
                onTapOutside: onTapOutside,
                placeholder: effectivePlaceholder,
                onTap: onTap,
                keyboardAppearance: keyboardAppearance,
                cursorOpacityAnimates: cursorOpacityAnimates,
                readOnly: readOnly,
                strutStyle: strutStyle,
                textAlign: textAlign,
                textAlignVertical: textAlignVertical,
                textDirection: textDirection,
                obscuringCharacter: obscuringCharacter,
                showCursor: showCursor,
                maxLength: maxLength,
                maxLengthEnforcement: maxLengthEnforcement,
                padding: effectiveInputPadding,
                border: effectiveInputBorder,
                radius: radius,
              ),
            );
          },
        );

  final TextEditingController? controller;

  @override
  ShadFormBuilderFieldState<ShadInputFormField, String> createState() =>
      _ShadFormBuilderInputState();
}

class _ShadFormBuilderInputState
    extends ShadFormBuilderFieldState<ShadInputFormField, String> {
  TextEditingController? _controller;

  TextEditingController get controller => widget.controller ?? _controller!;
  final GlobalKey<ShadInputState> inputKey = GlobalKey<ShadInputState>();

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController(text: value);
    controller.addListener(onControllerChanged);
  }

  @override
  void didChange(String? value) {
    super.didChange(value);

    if (controller.text != value) {
      controller.text = value ?? '';
    }
  }

  @override
  void reset() {
    super.reset();
    controller.text = initialValue ?? '';
    super.reset();
    widget.onChanged?.call(controller.text);
  }

  @override
  void dispose() {
    controller.removeListener(onControllerChanged);
    _controller?.dispose();
    super.dispose();
  }

  void onControllerChanged() {
    if (controller.text != value) {
      didChange(controller.text);
    }
  }
}
