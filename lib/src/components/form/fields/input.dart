import 'dart:ui' as ui;

import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/form/field.dart';
import 'package:shadcn_ui/src/components/input.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

class ShadInputFormField extends ShadFormBuilderField<String> {
  ShadInputFormField({
    super.id,
    super.key,
    super.onSaved,
    super.forceErrorText,
    String? Function(String)? validator,
    String? initialValue,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    this.controller,
    super.label,
    super.error,
    super.description,
    void Function(String)? onChanged,
    super.valueTransformer,
    super.onReset,
    super.focusNode,

    /// {@macro ShadInput.decoration}
    ShadDecoration? decoration,

    /// {@macro ShadInput.placeholder}
    Widget? placeholder,

    /// {@macro ShadInput.magnifierConfiguration}
    TextMagnifierConfiguration magnifierConfiguration =
        TextMagnifierConfiguration.disabled,

    /// {@macro ShadInput.keyboardType}
    TextInputType? keyboardType,

    /// {@macro ShadInput.textInputAction}
    TextInputAction? textInputAction,

    /// {@macro ShadInput.textCapitalization}
    TextCapitalization textCapitalization = TextCapitalization.none,

    /// {@macro ShadInput.style}
    TextStyle? style,

    /// {@macro ShadInput.strutStyle}
    StrutStyle? strutStyle,

    /// {@macro ShadInput.textAlign}
    TextAlign textAlign = TextAlign.start,

    /// {@macro ShadInput.textDirection}
    TextDirection? textDirection,

    /// {@macro ShadInput.autofocus}
    bool autofocus = false,

    /// {@macro ShadInput.obscuringCharacter}
    String obscuringCharacter = '•',

    /// {@macro ShadInput.obscureText}
    bool obscureText = false,

    /// {@macro ShadInput.autocorrect}
    bool autocorrect = true,

    /// {@macro ShadInput.smartDashesType}
    SmartDashesType? smartDashesType,

    /// {@macro ShadInput.smartQuotesType}
    SmartQuotesType? smartQuotesType,

    /// {@macro ShadInput.enableSuggestions}
    bool enableSuggestions = true,

    /// {@macro ShadInput.maxLines}
    int? maxLines = 1,

    /// {@macro ShadInput.minLines}
    int? minLines,

    /// {@macro ShadInput.expands}
    bool expands = false,

    /// {@macro ShadFormBuilderField.readOnly}
    super.readOnly,

    /// {@macro ShadInput.showCursor}
    bool? showCursor,

    /// {@macro ShadInput.maxLength}
    int? maxLength,

    /// {@macro ShadInput.maxLengthEnforcement}
    MaxLengthEnforcement? maxLengthEnforcement,

    /// {@macro ShadInput.onEditingComplete}
    VoidCallback? onEditingComplete,

    /// {@macro ShadInput.onSubmitted}
    ValueChanged<String>? onSubmitted,

    /// {@macro ShadInput.onAppPrivateCommand}
    AppPrivateCommandCallback? onAppPrivateCommand,

    /// {@macro ShadInput.inputFormatters}
    List<TextInputFormatter>? inputFormatters,

    /// {@macro ShadInput.cursorWidth}
    double? cursorWidth,

    /// {@macro ShadInput.cursorHeight}
    double? cursorHeight,

    /// {@macro ShadInput.cursorRadius}
    Radius? cursorRadius,

    /// {@macro ShadInput.cursorOpacityAnimates}
    bool? cursorOpacityAnimates,

    /// {@macro ShadInput.cursorColor}
    Color? cursorColor,

    /// {@macro ShadInput.selectionHeightStyle}
    ui.BoxHeightStyle selectionHeightStyle = ui.BoxHeightStyle.tight,

    /// {@macro ShadInput.selectionWidthStyle}
    ui.BoxWidthStyle selectionWidthStyle = ui.BoxWidthStyle.tight,

    /// {@macro ShadInput.keyboardAppearance}
    Brightness? keyboardAppearance,

    /// {@macro ShadInput.scrollPadding}
    EdgeInsets scrollPadding = const EdgeInsets.all(20),

    /// {@macro ShadInput.enableInteractiveSelection}
    bool? enableInteractiveSelection,

    /// {@macro ShadInput.selectionControls}
    TextSelectionControls? selectionControls,

    /// {@macro ShadInput.dragStartBehavior}
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,

    /// {@macro ShadInput.onPressed}
    GestureTapCallback? onPressed,

    /// {@macro ShadInput.onPressedAlwaysCalled}
    bool onPressedAlwaysCalled = false,

    /// {@macro ShadInput.onPressedOutside}
    TapRegionCallback? onPressedOutside,

    /// {@macro ShadInput.mouseCursor}
    MouseCursor? mouseCursor,

    /// {@macro ShadInput.scrollPhysics}
    ScrollPhysics? scrollPhysics,

    /// {@macro ShadInput.scrollController}
    ScrollController? scrollController,

    /// {@macro ShadInput.autofillHints}
    Iterable<String>? autofillHints,

    /// {@macro ShadInput.clipBehavior}
    Clip clipBehavior = Clip.hardEdge,

    /// {@macro ShadInput.scribbleEnabled}
    bool scribbleEnabled = true,

    /// {@macro ShadInput.enableIMEPersonalizedLearning}
    bool enableIMEPersonalizedLearning = true,

    /// {@macro ShadInput.contentInsertionConfiguration}
    ContentInsertionConfiguration? contentInsertionConfiguration,

    /// {@macro ShadInput.contextMenuBuilder}
    EditableTextContextMenuBuilder? contextMenuBuilder,

    /// {@macro ShadInput.undoController}
    UndoHistoryController? undoController,

    /// {@macro ShadInput.spellCheckConfiguration}
    SpellCheckConfiguration? spellCheckConfiguration,

    /// {@macro ShadInput.selectionColor}
    Color? selectionColor,

    /// {@macro ShadInput.padding}
    EdgeInsetsGeometry? padding,

    /// {@macro ShadInput.leading}
    Widget? leading,

    /// {@macro ShadInput.trailing}
    Widget? trailing,

    /// {@macro ShadInput.mainAxisAlignment}
    MainAxisAlignment? mainAxisAlignment,

    /// {@macro ShadInput.crossAxisAlignment}
    CrossAxisAlignment? crossAxisAlignment,

    /// {@macro ShadInput.placeholderStyle}
    TextStyle? placeholderStyle,

    /// {@macro ShadInput.alignment}
    AlignmentGeometry? alignment,

    /// {@macro ShadInput.placeholderAlignment}
    AlignmentGeometry? placeholderAlignment,

    /// {@macro ShadInput.inputPadding}
    EdgeInsetsGeometry? inputPadding,

    /// {@macro ShadInput.gap}
    double? gap,

    /// {@macro ShadInput.constraints}
    BoxConstraints? constraints,

    /// {@macro flutter.widgets.editableText.groupId}
    Object? groupId,

    /// {@macro ShadKeyboardToolbar.toolbarBuilder}
    WidgetBuilder? keyboardToolbarBuilder,

    /// {@macro ShadInput.top}
    Widget? top,

    /// {@macro ShadInput.bottom}
    Widget? bottom,

    /// {@macro ShadInput.onLineCountChange}
    ValueChanged<int>? onLineCountChange,

    /// {@macro ShadInput.editableTextSize}
    Size? editableTextSize,
  }) : super(
         initialValue: controller != null ? controller.text : initialValue,
         validator: validator == null ? null : (v) => validator(v ?? ''),
         onChanged: onChanged == null ? null : (v) => onChanged(v ?? ''),
         decorationBuilder: (context) =>
             (ShadTheme.of(context).inputTheme.decoration ??
                     const ShadDecoration())
                 .merge(decoration),
         builder: (field) {
           final state = field as _ShadFormBuilderInputState;
           return ShadInput(
             key: state.inputKey,
             controller: state.controller,
             restorationId: restorationId,
             enabled: state.enabled,
             focusNode: state.focusNode,
             decoration: state.decoration,
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
             placeholder: placeholder,
             onPressed: onPressed,
             onPressedAlwaysCalled: onPressedAlwaysCalled,
             onPressedOutside: onPressedOutside,
             keyboardAppearance: keyboardAppearance,
             cursorOpacityAnimates: cursorOpacityAnimates,
             readOnly: readOnly,
             strutStyle: strutStyle,
             textAlign: textAlign,
             textDirection: textDirection,
             obscuringCharacter: obscuringCharacter,
             showCursor: showCursor,
             maxLength: maxLength,
             maxLengthEnforcement: maxLengthEnforcement,
             padding: padding,
             leading: leading,
             trailing: trailing,
             mainAxisAlignment: mainAxisAlignment,
             crossAxisAlignment: crossAxisAlignment,
             alignment: alignment,
             placeholderStyle: placeholderStyle,
             placeholderAlignment: placeholderAlignment,
             inputPadding: inputPadding,
             gap: gap,
             constraints: constraints,
             groupId: groupId,
             keyboardToolbarBuilder: keyboardToolbarBuilder,
             top: top,
             bottom: bottom,
             onLineCountChange: onLineCountChange,
             editableTextSize: editableTextSize,
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
    if (widget.controller == null) {
      _controller = TextEditingController(text: value);
    }
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
  void didUpdateWidget(covariant ShadInputFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller == null && widget.controller != null) {
      _controller?.dispose();
    }
    if (oldWidget.controller != null && widget.controller == null) {
      _controller = TextEditingController(text: value);
    }
  }

  @override
  void reset() {
    super.reset();
    controller.text = initialValue ?? '';
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
