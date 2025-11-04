import 'dart:ui' as ui;

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/form/field.dart';
import 'package:shadcn_ui/src/components/textarea.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

class ShadTextareaFormField extends ShadFormBuilderField<String> {
  ShadTextareaFormField({
    super.key,
    super.id,
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
    super.valueTransformer,
    super.onReset,
    super.focusNode,
    void Function(String)? onChanged,

    /// {@macro ShadTextarea.decoration}
    ShadDecoration? decoration,

    /// {@macro ShadTextarea.placeholder}
    Widget? placeholder,

    /// {@macro ShadTextarea.placeholderStyle}
    TextStyle? placeholderStyle,

    /// {@macro ShadTextarea.alignment}
    AlignmentGeometry? alignment,

    /// {@macro ShadTextarea.placeholderAlignment}
    AlignmentGeometry? placeholderAlignment,

    /// {@macro ShadTextarea.padding}
    EdgeInsetsGeometry? padding,

    /// {@macro ShadTextarea.inputPadding}
    EdgeInsetsGeometry? inputPadding,

    /// {@macro ShadTextarea.gap}
    double? gap,

    /// {@macro ShadTextarea.constraints}
    BoxConstraints? constraints,

    /// {@macro ShadTextarea.mainAxisAlignment}
    MainAxisAlignment? mainAxisAlignment,

    /// {@macro ShadTextarea.crossAxisAlignment}
    CrossAxisAlignment? crossAxisAlignment,

    /// {@macro ShadTextarea.readOnly}
    bool readOnly = false,

    /// {@macro ShadTextarea.autofocus}
    bool autofocus = false,

    /// {@macro ShadTextarea.showCursor}
    bool? showCursor,

    /// {@macro ShadTextarea.onPressedAlwaysCalled}
    bool onPressedAlwaysCalled = false,

    /// {@macro ShadTextarea.onPressedOutside}
    TapRegionCallback? onPressedOutside,

    /// {@macro ShadTextarea.onPressed}
    GestureTapCallback? onPressed,

    /// {@macro ShadTextarea.scrollController}
    ScrollController? scrollController,

    /// {@macro ShadTextarea.scrollPhysics}
    ScrollPhysics? scrollPhysics,

    /// {@macro ShadTextarea.mouseCursor}
    MouseCursor? mouseCursor,

    /// {@macro ShadTextarea.magnifierConfiguration}
    TextMagnifierConfiguration magnifierConfiguration =
        TextMagnifierConfiguration.disabled,

    /// {@macro ShadTextarea.cursorWidth}
    double? cursorWidth,

    /// {@macro ShadTextarea.cursorHeight}
    double? cursorHeight,

    /// {@macro ShadTextarea.cursorRadius}
    Radius? cursorRadius,

    /// {@macro ShadTextarea.cursorOpacityAnimates}
    bool? cursorOpacityAnimates,

    /// {@macro ShadTextarea.cursorColor}
    Color? cursorColor,

    /// {@macro ShadTextarea.selectionColor}
    Color? selectionColor,

    /// {@macro ShadTextarea.keyboardAppearance}
    Brightness? keyboardAppearance,

    /// {@macro ShadTextarea.textDirection}
    TextDirection? textDirection,

    /// {@macro ShadTextarea.textAlign}
    TextAlign textAlign = TextAlign.start,

    /// {@macro ShadTextarea.onEditingComplete}
    VoidCallback? onEditingComplete,

    /// {@macro ShadTextarea.onSubmitted}
    ValueChanged<String>? onSubmitted,

    /// {@macro ShadTextarea.onAppPrivateCommand}
    AppPrivateCommandCallback? onAppPrivateCommand,

    /// {@macro ShadTextarea.style}
    TextStyle? style,

    /// {@macro ShadTextarea.strutStyle}
    StrutStyle? strutStyle,

    /// {@macro ShadTextarea.scribbleEnabled}
    bool scribbleEnabled = true,

    /// {@macro ShadTextarea.stylusHandwritingEnabled}
    bool stylusHandwritingEnabled = true,

    /// {@macro ShadTextarea.enableIMEPersonalizedLearning}
    bool enableIMEPersonalizedLearning = true,

    /// {@macro ShadTextarea.contextMenuBuilder}
    EditableTextContextMenuBuilder? contextMenuBuilder,

    /// {@macro ShadTextarea.spellCheckConfiguration}
    SpellCheckConfiguration? spellCheckConfiguration,

    /// {@macro ShadTextarea.contentInsertionConfiguration}
    ContentInsertionConfiguration? contentInsertionConfiguration,

    /// {@macro ShadTextarea.selectionControls}
    TextSelectionControls? selectionControls,

    /// {@macro ShadTextarea.enableInteractiveSelection}
    bool? enableInteractiveSelection,

    /// {@macro ShadTextarea.selectionHeightStyle}
    ui.BoxHeightStyle selectionHeightStyle = ui.BoxHeightStyle.tight,

    /// {@macro ShadTextarea.selectionWidthStyle}
    ui.BoxWidthStyle selectionWidthStyle = ui.BoxWidthStyle.tight,

    /// {@macro ShadTextarea.clipBehavior}
    Clip clipBehavior = Clip.hardEdge,

    /// {@macro ShadTextarea.dragStartBehavior}
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,

    /// {@macro ShadTextarea.minHeight}
    double minHeight = 80,

    /// {@macro ShadTextarea.maxHeight}
    double maxHeight = 500,

    /// {@macro ShadTextarea.resizable}
    bool resizable = true,

    /// {@macro ShadTextarea.onHeightChanged}
    ValueChanged<double>? onHeightChanged,

    /// {@macro ShadTextarea.resizeHandleBuilder}
    WidgetBuilder? resizeHandleBuilder,

    /// {@macro ShadTextarea.groupId}
    Object? groupId,

    /// {@macro ShadKeyboardToolbar.toolbarBuilder}
    WidgetBuilder? keyboardToolbarBuilder,

    /// {@macro ShadInput.leading}
    Widget? leading,

    /// {@macro ShadInput.trailing}
    Widget? trailing,

    /// {@macro ShadInput.top}
    Widget? top,

    /// {@macro ShadInput.bottom}
    Widget? bottom,

    /// {@macro ShadInput.onLineCountChange}
    ValueChanged<int>? onLineCountChange,

    /// {@macro ShadInput.verticalGap}
    double? verticalGap,
  }) : super(
         initialValue: controller != null ? controller.text : initialValue,
         validator: validator == null ? null : (v) => validator(v ?? ''),
         onChanged: onChanged == null ? null : (v) => onChanged(v ?? ''),
         decorationBuilder: (context) =>
             (ShadTheme.of(context).inputTheme.decoration ??
                     const ShadDecoration())
                 .merge(decoration),
         builder: (field) {
           final state = field as _ShadFormBuilderTextareaState;
           return ShadTextarea(
             key: state.textareaKey,
             controller: state.controller,
             restorationId: restorationId,
             enabled: state.enabled,
             focusNode: state.focusNode,
             readOnly: readOnly,
             decoration: state.decoration,
             style: style,
             cursorColor: cursorColor,
             selectionColor: selectionColor,
             textAlign: textAlign,
             textDirection: textDirection,
             keyboardAppearance: keyboardAppearance,
             autofocus: autofocus,
             showCursor: showCursor,
             placeholder: placeholder,
             placeholderStyle: placeholderStyle,
             placeholderAlignment: placeholderAlignment,
             alignment: alignment,
             padding: padding,
             inputPadding: inputPadding,
             gap: gap,
             constraints: constraints,
             mainAxisAlignment: mainAxisAlignment,
             crossAxisAlignment: crossAxisAlignment,
             onEditingComplete: onEditingComplete,
             onSubmitted: onSubmitted,
             onAppPrivateCommand: onAppPrivateCommand,
             scrollController: scrollController,
             scrollPhysics: scrollPhysics,
             mouseCursor: mouseCursor,
             magnifierConfiguration: magnifierConfiguration,
             cursorWidth: cursorWidth,
             cursorHeight: cursorHeight,
             cursorRadius: cursorRadius,
             cursorOpacityAnimates: cursorOpacityAnimates,
             scribbleEnabled: scribbleEnabled,
             stylusHandwritingEnabled: stylusHandwritingEnabled,
             enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
             contextMenuBuilder: contextMenuBuilder,
             spellCheckConfiguration: spellCheckConfiguration,
             contentInsertionConfiguration: contentInsertionConfiguration,
             selectionControls: selectionControls,
             enableInteractiveSelection: enableInteractiveSelection,
             selectionHeightStyle: selectionHeightStyle,
             selectionWidthStyle: selectionWidthStyle,
             clipBehavior: clipBehavior,
             dragStartBehavior: dragStartBehavior,
             onPressed: onPressed,
             onPressedAlwaysCalled: onPressedAlwaysCalled,
             onPressedOutside: onPressedOutside,
             minHeight: minHeight,
             maxHeight: maxHeight,
             resizable: resizable,
             onHeightChanged: onHeightChanged,
             resizeHandleBuilder: resizeHandleBuilder,
             strutStyle: strutStyle,
             groupId: groupId,
             keyboardToolbarBuilder: keyboardToolbarBuilder,
             top: top,
             bottom: bottom,
             leading: leading,
             trailing: trailing,
             onLineCountChange: onLineCountChange,
             verticalGap: verticalGap,
           );
         },
       );

  final TextEditingController? controller;

  @override
  ShadFormBuilderFieldState<ShadTextareaFormField, String> createState() =>
      _ShadFormBuilderTextareaState();
}

class _ShadFormBuilderTextareaState
    extends ShadFormBuilderFieldState<ShadTextareaFormField, String> {
  final GlobalKey<State<StatefulWidget>> textareaKey = GlobalKey();
  TextEditingController? _controller;

  TextEditingController get controller => widget.controller ?? _controller!;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = TextEditingController(text: value);
    }
    controller.addListener(onControllerChanged);
  }

  @override
  void dispose() {
    controller.removeListener(onControllerChanged);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ShadTextareaFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller == null && widget.controller != null) {
      _controller?.dispose();
    }
    if (oldWidget.controller != null && widget.controller == null) {
      _controller = TextEditingController(text: value);
    }
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
    widget.onChanged?.call(controller.text);
  }

  void onControllerChanged() {
    if (controller.text != value) {
      didChange(controller.text);
    }
  }
}
