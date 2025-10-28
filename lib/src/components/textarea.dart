import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/input.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

/// A customizable multiline textarea widget with
/// adjustable height and optional resizing grip.
///
/// The [ShadTextarea] widget builds on [ShadInput] to provide a rich, multiline
/// text input experience with support for theming, placeholder content, and
/// resize interaction.
///
/// It integrates with [ShadTheme] for consistent appearance, and includes
/// properties for min/max height, editable behavior, styling, and decoration.
///
/// The field grows or shrinks based on content height (number of lines),
/// and supports user-driven resizing using a drag handle,
/// if [resizable] is enabled.
///
/// See also:
/// - [resizeHandleBuilder], for customizing the drag handle
class ShadTextarea extends StatefulWidget {
  const ShadTextarea({
    super.key,
    this.initialValue,
    this.controller,
    this.focusNode,
    this.placeholder,
    this.decoration,
    this.undoController,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.showCursor,
    this.autofocus = false,
    this.enabled = true,
    this.cursorWidth,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorOpacityAnimates,
    this.cursorColor,
    this.selectionHeightStyle = ui.BoxHeightStyle.tight,
    this.selectionWidthStyle = ui.BoxWidthStyle.tight,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20),
    this.dragStartBehavior = DragStartBehavior.start,
    bool? enableInteractiveSelection,
    this.selectionControls,
    this.onPressed,
    this.onPressedAlwaysCalled = false,
    this.onPressedOutside,
    this.mouseCursor,
    this.scrollController,
    this.scrollPhysics,
    this.contentInsertionConfiguration,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.scribbleEnabled = true,
    this.enableIMEPersonalizedLearning = true,
    this.contextMenuBuilder,
    this.spellCheckConfiguration,
    this.magnifierConfiguration = TextMagnifierConfiguration.disabled,
    this.selectionColor,
    this.padding,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.alignment,
    this.placeholderStyle,
    this.placeholderAlignment,
    this.inputPadding,
    this.gap,
    this.constraints,
    this.stylusHandwritingEnabled =
        EditableText.defaultStylusHandwritingEnabled,
    this.groupId,
    this.readOnly = false,
    this.minHeight = 80,
    this.maxHeight = 500,
    this.resizable = true,
    this.onHeightChanged,
    this.resizeHandleBuilder,
    this.scrollbarPadding,
    this.keyboardToolbarBuilder,
    this.top,
    this.bottom,
    this.leading,
    this.trailing,
    this.onLineCountChange,
    this.verticalGap,
  }) : enableInteractiveSelection = enableInteractiveSelection ?? !readOnly,
       assert(
         initialValue == null || controller == null,
         'Either initialValue or controller must be specified',
       );

  /// {@template ShadTextarea.initialValue}
  /// The initial text value of the textarea.
  /// Used if [controller] is null; cannot be used with [controller].
  /// {@endtemplate}
  final String? initialValue;

  /// {@template ShadTextarea.controller}
  /// Controls the text being edited. If null, an internal controller is created
  /// and initialized with [initialValue].
  /// {@endtemplate}
  final TextEditingController? controller;

  /// {@template ShadTextarea.focusNode}
  /// Defines the keyboard focus for this widget.
  /// If null, one will be created automatically.
  /// {@endtemplate}
  final FocusNode? focusNode;

  /// {@template ShadTextarea.placeholder}
  /// The widget shown when the textarea is empty. Typically a [Text] widget.
  /// {@endtemplate}
  final Widget? placeholder;

  /// {@template ShadTextarea.placeholderStyle}
  /// The text style to use for the placeholder.
  /// If not specified, uses the theme's muted style.
  /// {@endtemplate}
  final TextStyle? placeholderStyle;

  /// {@template ShadTextarea.placeholderAlignment}
  /// Alignment for the placeholder inside the field.
  ///
  /// Defaults to direction-aware top start:
  /// [Alignment.topLeft] in LTR, [Alignment.topRight] in RTL.
  /// {@endtemplate}
  final AlignmentGeometry? placeholderAlignment;

  /// {@template ShadTextarea.alignment}
  /// Alignment for the input field.
  /// Defaults to [Alignment.topLeft].
  /// {@endtemplate}
  final AlignmentGeometry? alignment;

  /// {@template ShadTextarea.decoration}
  /// Optional visual decoration for the textarea.
  /// Merged with the theme’s default decoration if provided.
  /// {@endtemplate}
  final ShadDecoration? decoration;

  /// {@template ShadTextarea.undoController}
  /// Optional controller for undo/redo functionality inside the text field.
  /// {@endtemplate}
  final UndoHistoryController? undoController;

  /// {@template ShadTextarea.onChanged}
  /// Called when the text being edited changes.
  /// {@endtemplate}
  final ValueChanged<String>? onChanged;

  /// {@template ShadTextarea.onEditingComplete}
  /// Called when the user indicates they are done editing the text.
  /// {@endtemplate}
  final VoidCallback? onEditingComplete;

  /// {@template ShadTextarea.onSubmitted}
  /// Called when the user submits the text (e.g. presses "done").
  /// {@endtemplate}
  final ValueChanged<String>? onSubmitted;

  /// {@template ShadTextarea.onAppPrivateCommand}
  /// Called for platform-specific app commands sent to the input field.
  /// {@endtemplate}
  final AppPrivateCommandCallback? onAppPrivateCommand;

  /// {@template ShadTextarea.style}
  /// The text style used for the input text inside the textarea.
  /// {@endtemplate}
  final TextStyle? style;

  /// {@template ShadTextarea.strutStyle}
  /// The strut style used to determine the line height.
  /// {@endtemplate}
  final StrutStyle? strutStyle;

  /// {@template ShadTextarea.textAlign}
  /// How the text inside the textarea is aligned horizontally.
  /// {@endtemplate}
  final TextAlign textAlign;

  /// {@template ShadTextarea.textDirection}
  /// The direction of the text. Defaults to the inherited direction.
  /// {@endtemplate}
  final TextDirection? textDirection;

  /// {@template ShadTextarea.readOnly}
  /// Whether the text field is read-only.
  /// {@endtemplate}
  final bool readOnly;

  /// {@template ShadTextarea.enabled}
  /// Whether the textarea is enabled and can be interacted with.
  /// {@endtemplate}
  final bool enabled;

  /// {@template ShadTextarea.autofocus}
  /// Whether the field should focus itself
  /// automatically when the widget is built.
  /// {@endtemplate}
  final bool autofocus;

  /// {@template ShadTextarea.showCursor}
  /// Whether to show the cursor.
  /// {@endtemplate}
  final bool? showCursor;

  /// {@template ShadTextarea.cursorColor}
  /// Color of the cursor.
  /// {@endtemplate}
  final Color? cursorColor;

  /// {@template ShadTextarea.cursorWidth}
  /// Width of the cursor.
  /// {@endtemplate}
  final double? cursorWidth;

  /// {@template ShadTextarea.cursorHeight}
  /// Height of the cursor.
  /// {@endtemplate}
  final double? cursorHeight;

  /// {@template ShadTextarea.cursorRadius}
  /// Radius of the cursor for rounded corners.
  /// {@endtemplate}
  final Radius? cursorRadius;

  /// {@template ShadTextarea.cursorOpacityAnimates}
  /// Whether the cursor opacity should animate.
  /// {@endtemplate}
  final bool? cursorOpacityAnimates;

  /// {@template ShadTextarea.keyboardAppearance}
  /// Appearance (light/dark) for the keyboard.
  /// {@endtemplate}
  final Brightness? keyboardAppearance;

  /// {@template ShadTextarea.selectionColor}
  /// Color used to highlight selected text when focused.
  /// {@endtemplate}
  final Color? selectionColor;

  /// {@template ShadTextarea.selectionHeightStyle}
  /// Style used to calculate height of text selection highlight.
  /// {@endtemplate}
  final ui.BoxHeightStyle selectionHeightStyle;

  /// {@template ShadTextarea.selectionWidthStyle}
  /// Style used to calculate width of text selection highlight.
  /// {@endtemplate}
  final ui.BoxWidthStyle selectionWidthStyle;

  /// {@template ShadTextarea.scrollPadding}
  /// Insets to apply to the input when it's scrolled into view.
  /// {@endtemplate}
  final EdgeInsets scrollPadding;

  /// {@template ShadTextarea.scrollController}
  /// Optional controller for managing scroll position.
  /// {@endtemplate}
  final ScrollController? scrollController;

  /// {@template ShadTextarea.scrollPhysics}
  /// The physics applied to the textarea's scroll behavior.
  /// {@endtemplate}
  final ScrollPhysics? scrollPhysics;

  /// {@template ShadTextarea.clipBehavior}
  /// Clip behavior of the textarea's content. Default is [Clip.hardEdge].
  /// {@endtemplate}
  final Clip clipBehavior;

  /// {@template ShadTextarea.dragStartBehavior}
  /// The kind of drag behavior this widget uses for text selection.
  /// {@endtemplate}
  final DragStartBehavior dragStartBehavior;

  /// {@template ShadTextarea.enableInteractiveSelection}
  /// Whether to allow interactive text selection.
  /// {@endtemplate}
  final bool enableInteractiveSelection;

  /// {@template ShadTextarea.selectionControls}
  /// Controls for displaying custom selection handles.
  /// {@endtemplate}
  final TextSelectionControls? selectionControls;

  /// {@template ShadTextarea.onPressed}
  /// Called when the user taps the textarea.
  /// {@endtemplate}
  final GestureTapCallback? onPressed;

  /// {@template ShadTextarea.onPressedOutside}
  /// Called when a pointer tap happens outside this widget.
  /// {@endtemplate}
  final TapRegionCallback? onPressedOutside;

  /// {@template ShadTextarea.onPressedAlwaysCalled}
  /// Whether [onPressed] is called even when text is selected.
  /// {@endtemplate}
  final bool onPressedAlwaysCalled;

  /// {@template ShadTextarea.mouseCursor}
  /// The mouse cursor to use when hovering over this widget.
  /// {@endtemplate}
  final MouseCursor? mouseCursor;

  /// {@template ShadTextarea.contextMenuBuilder}
  /// Builds the context menu that appears
  /// when text is long-pressed or selected.
  /// {@endtemplate}
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  /// {@template ShadTextarea.spellCheckConfiguration}
  /// Configuration for enabling spell check support.
  /// {@endtemplate}
  final SpellCheckConfiguration? spellCheckConfiguration;

  /// {@template ShadTextarea.magnifierConfiguration}
  /// Configuration for the text magnifier shown during selection.
  /// {@endtemplate}
  final TextMagnifierConfiguration magnifierConfiguration;

  /// {@template ShadTextarea.contentInsertionConfiguration}
  /// Platform-specific configuration for handling content insertion.
  /// {@endtemplate}
  final ContentInsertionConfiguration? contentInsertionConfiguration;

  /// {@template ShadTextarea.restorationId}
  /// Restoration ID used to save the textarea’s state.
  /// {@endtemplate}
  final String? restorationId;

  /// {@template ShadTextarea.scribbleEnabled}
  /// Enables or disables Apple Pencil Scribble input on iPad.
  /// {@endtemplate}
  final bool scribbleEnabled;

  /// {@template ShadTextarea.stylusHandwritingEnabled}
  /// Enables handwriting input using a stylus on supported platforms.
  /// {@endtemplate}
  final bool stylusHandwritingEnabled;

  /// {@template ShadTextarea.enableIMEPersonalizedLearning}
  /// Enables IME (Input Method Editor) to personalize learning.
  /// {@endtemplate}
  final bool enableIMEPersonalizedLearning;

  /// {@template ShadTextarea.padding}
  /// Padding around the field.
  /// This is outer padding including borders and input.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadTextarea.inputPadding}
  /// Inner padding between text and decoration inside the textarea.
  /// {@endtemplate}
  final EdgeInsetsGeometry? inputPadding;

  /// {@template ShadTextarea.gap}
  /// Horizontal spacing between text and any leading/trailing elements.
  /// {@endtemplate}
  final double? gap;

  /// {@template ShadTextarea.mainAxisAlignment}
  /// Layout alignment along the horizontal axis (e.g. leading, text, trailing).
  /// {@endtemplate}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@template ShadTextarea.crossAxisAlignment}
  /// Layout alignment along the vertical axis of the row.
  /// {@endtemplate}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@template ShadTextarea.constraints}
  /// Constraints to control layout of the field (e.g. minHeight).
  /// {@endtemplate}
  final BoxConstraints? constraints;

  /// {@template ShadTextarea.groupId}
  /// ID used to group text fields for focus/interaction.
  /// {@endtemplate}
  final Object? groupId;

  /// {@template ShadTextarea.minHeight}
  /// The minimum height of the textarea (default is 80).
  /// {@endtemplate}
  final double minHeight;

  /// {@template ShadTextarea.maxHeight}
  /// The maximum height of the textarea (default is 500).
  /// {@endtemplate}
  final double maxHeight;

  /// {@template ShadTextarea.resizable}
  /// Whether the textarea can be resized by the user (default is true).
  /// {@endtemplate}
  final bool resizable;

  /// {@template ShadTextarea.onHeightChanged}
  /// Callback triggered whenever the textarea is resized.
  /// {@endtemplate}
  final ValueChanged<double>? onHeightChanged;

  /// {@template ShadTextarea.resizeHandleBuilder}
  /// Allows customizing the resize handle (shown at bottom-right).
  /// {@endtemplate}
  final WidgetBuilder? resizeHandleBuilder;

  /// {@template ShadTextarea.scrollbarPadding}
  /// The padding around the scrollbar.
  ///
  /// Defaults to `EdgeInsets.only(bottom: 10)`.
  /// {@endtemplate}
  final EdgeInsetsGeometry? scrollbarPadding;

  /// {@macro ShadKeyboardToolbar.toolbarBuilder}
  final WidgetBuilder? keyboardToolbarBuilder;

  /// {@macro ShadInput.leading}
  final Widget? leading;

  /// {@macro ShadInput.trailing}
  final Widget? trailing;

  /// {@macro ShadInput.top}
  final Widget? top;

  /// {@macro ShadInput.bottom}
  final Widget? bottom;

  /// {@macro ShadInput.verticalGap}
  final double? verticalGap;

  /// {@macro ShadInput.onLineCountChange}
  final ValueChanged<int>? onLineCountChange;

  @override
  State<ShadTextarea> createState() => _ShadTextareaState();
}

class _ShadTextareaState extends State<ShadTextarea> {
  late double _textareaHeight;
  FocusNode? _focusNode;

  FocusNode get focusNode => widget.focusNode ?? _focusNode!;

  @override
  void initState() {
    super.initState();
    _textareaHeight = widget.minHeight;
    if (widget.focusNode == null) {
      _focusNode = FocusNode();
    }
  }

  @override
  void didUpdateWidget(covariant ShadTextarea oldWidget) {
    super.didUpdateWidget(oldWidget);
    final clamped = _textareaHeight.clamp(widget.minHeight, widget.maxHeight);
    if (clamped != _textareaHeight) {
      setState(() => _textareaHeight = clamped);
      widget.onHeightChanged?.call(clamped);
    }
  }

  @override
  void dispose() {
    _focusNode?.dispose();
    super.dispose();
  }

  /// Handles the drag gesture to resize the textarea.
  ///
  /// Updates [_textareaHeight] based on the vertical drag delta
  /// and clamps the result
  void _handleResize(DragUpdateDetails details) {
    focusNode.requestFocus();
    final newHeight = (_textareaHeight + details.delta.dy).clamp(
      widget.minHeight,
      widget.maxHeight,
    );
    if (newHeight != _textareaHeight) {
      setState(() => _textareaHeight = newHeight);
      widget.onHeightChanged?.call(newHeight);
    }
  }

  /// Calculates the number of visible text lines that can fit in
  /// the current [_textareaHeight], based on the given [TextStyle].
  ///
  /// Falls back to the theme's [Theme.of(context).textTheme.bodyMedium] style
  /// or a default
  /// size of 14px and line height of 20/4 if not provided.
  ///
  /// Returns a clamped value between 1 and 100.
  int _calculateLineCount(TextStyle style) {
    final fontSize = style.fontSize ?? 14;
    final heightFactor = style.height ?? 20 / 4;
    final lineHeight = fontSize * heightFactor;
    return (_textareaHeight / lineHeight).floor().clamp(1, 100);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveTextStyle = theme.textTheme.muted
        .copyWith(
          color: theme.colorScheme.foreground,
        )
        .merge(theme.textareaTheme.style)
        .merge(widget.style);

    final lineCount = _calculateLineCount(effectiveTextStyle);

    final effectiveDecoration =
        (theme.textareaTheme.decoration ?? const ShadDecoration()).merge(
          widget.decoration,
        );

    final effectivePadding =
        widget.padding ??
        theme.inputTheme.padding ??
        const EdgeInsets.symmetric(horizontal: 12, vertical: 8);

    final effectiveInputPadding =
        widget.inputPadding ?? theme.inputTheme.inputPadding ?? EdgeInsets.zero;

    final effectivePlaceholderStyle = theme.textTheme.muted
        .merge(theme.inputTheme.placeholderStyle)
        .merge(widget.placeholderStyle);

    final effectivePlaceholderAlignment =
        widget.placeholderAlignment ??
        theme.inputTheme.placeholderAlignment ??
        AlignmentDirectional.topStart;

    final effectiveAlignment =
        widget.alignment ??
        theme.inputTheme.alignment ??
        AlignmentDirectional.topStart;

    final effectiveMainAxisAlignment =
        widget.mainAxisAlignment ??
        theme.inputTheme.mainAxisAlignment ??
        MainAxisAlignment.start;

    final effectiveCrossAxisAlignment =
        widget.crossAxisAlignment ??
        theme.inputTheme.crossAxisAlignment ??
        CrossAxisAlignment.center;
    final effectiveMouseCursor =
        widget.mouseCursor ?? WidgetStateMouseCursor.textable;

    final effectiveGap = widget.gap ?? theme.inputTheme.gap ?? 8.0;

    final textScaler = MediaQuery.textScalerOf(context);

    final maxFontSize = math.max(
      (effectivePlaceholderStyle.fontSize ?? 0) *
          (effectivePlaceholderStyle.height ?? 0),
      (effectiveTextStyle.fontSize ?? 0) * (effectiveTextStyle.height ?? 0),
    );
    final maxFontSizeScaled = textScaler.scale(maxFontSize);

    final effectiveConstraints =
        widget.constraints ??
        BoxConstraints(
          minHeight: maxFontSizeScaled,
        );

    final effectiveScrollbarPadding =
        widget.scrollbarPadding ??
        theme.textareaTheme.scrollbarPadding ??
        const EdgeInsets.only(bottom: 10);

    return Stack(
      children: [
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ShadInput(
            editableTextSize: Size(double.infinity, _textareaHeight),
            initialValue: widget.initialValue,
            controller: widget.controller,
            focusNode: focusNode,
            placeholder: widget.placeholder,
            placeholderAlignment: effectivePlaceholderAlignment,
            alignment: effectiveAlignment,
            maxLines: lineCount,
            minLines: lineCount,
            keyboardType: TextInputType.multiline,
            readOnly: widget.readOnly,
            enabled: widget.enabled,
            autofocus: widget.autofocus,
            onChanged: widget.onChanged,
            onEditingComplete: widget.onEditingComplete,
            onSubmitted: widget.onSubmitted,
            onAppPrivateCommand: widget.onAppPrivateCommand,
            style: effectiveTextStyle,
            strutStyle: widget.strutStyle,
            textAlign: widget.textAlign,
            textDirection: widget.textDirection,
            showCursor: widget.showCursor,
            cursorWidth: widget.cursorWidth,
            cursorHeight: widget.cursorHeight,
            cursorRadius: widget.cursorRadius,
            cursorOpacityAnimates: widget.cursorOpacityAnimates,
            cursorColor: widget.cursorColor,
            selectionHeightStyle: widget.selectionHeightStyle,
            selectionWidthStyle: widget.selectionWidthStyle,
            keyboardAppearance: widget.keyboardAppearance,
            scrollPadding: widget.scrollPadding,
            dragStartBehavior: widget.dragStartBehavior,
            enableInteractiveSelection: widget.enableInteractiveSelection,
            selectionControls: widget.selectionControls,
            onPressed: widget.onPressed,
            onPressedAlwaysCalled: widget.onPressedAlwaysCalled,
            onPressedOutside: widget.onPressedOutside,
            mouseCursor: effectiveMouseCursor,
            scrollController: widget.scrollController,
            scrollPhysics: widget.scrollPhysics,
            contentInsertionConfiguration: widget.contentInsertionConfiguration,
            clipBehavior: widget.clipBehavior,
            restorationId: widget.restorationId,
            scribbleEnabled: widget.scribbleEnabled,
            stylusHandwritingEnabled: widget.stylusHandwritingEnabled,
            enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
            contextMenuBuilder: widget.contextMenuBuilder,
            spellCheckConfiguration: widget.spellCheckConfiguration,
            magnifierConfiguration: widget.magnifierConfiguration,
            selectionColor: widget.selectionColor,
            padding: effectivePadding,
            decoration: effectiveDecoration,
            mainAxisAlignment: effectiveMainAxisAlignment,
            crossAxisAlignment: effectiveCrossAxisAlignment,
            placeholderStyle: effectivePlaceholderStyle,
            inputPadding: effectiveInputPadding,
            gap: effectiveGap,
            constraints: effectiveConstraints,
            groupId: widget.groupId,
            undoController: widget.undoController,
            scrollbarPadding: effectiveScrollbarPadding,
            keyboardToolbarBuilder: widget.keyboardToolbarBuilder,
            top: widget.top,
            bottom: widget.bottom,
            leading: widget.leading,
            trailing: widget.trailing,
            onLineCountChange: widget.onLineCountChange,
            verticalGap: widget.verticalGap,
          ),
        ),
        if (widget.resizable)
          Positioned(
            bottom: 2,
            right: 2,
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeUpDown,
              child: GestureDetector(
                onPanUpdate: _handleResize,
                behavior: HitTestBehavior.translucent,
                child: widget.resizeHandleBuilder != null
                    ? Builder(builder: widget.resizeHandleBuilder!)
                    : const ShadDefaultResizeGrip(),
              ),
            ),
          ),
      ],
    );
  }
}

/// A small visual grip used to indicate that the [ShadTextarea]
/// is resizable by the user.
///
/// This widget appears in the bottom-right corner and allows
/// the user to drag and resize the textarea vertically.
class ShadDefaultResizeGrip extends StatelessWidget {
  const ShadDefaultResizeGrip({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return SizedBox(
      width: 8,
      height: 8,
      child: CustomPaint(
        painter: ShadResizeGripPainter(color: theme.colorScheme.ring),
      ),
    );
  }
}

/// A customizable painter for drawing diagonal resize grip lines,
/// typically used in the bottom-right corner of a resizable widget.
class ShadResizeGripPainter extends CustomPainter {
  /// Creates a painter that draws multiple diagonal lines to represent a resize
  /// grip.
  ///
  /// - [color]: The color of the lines.
  /// - [strokeWidth]: Thickness of each grip line. Default is 0.8.
  /// - [lineCount]: Number of diagonal lines to draw. Default is 3.
  /// - [spacing]: Spacing between each line. Default is 4.0.
  const ShadResizeGripPainter({
    required this.color,
    this.strokeWidth = 0.8,
    this.lineCount = 3,
    this.spacing = 4.0,
  });

  /// The color of the grip lines.
  final Color color;

  /// The thickness of the lines.
  final double strokeWidth;

  /// The number of diagonal lines in the grip.
  final int lineCount;

  /// The spacing between each grip line.
  final double spacing;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth;

    for (var i = 0; i < lineCount; i++) {
      final offset = spacing * i;
      canvas.drawLine(
        Offset(size.width - offset, size.height),
        Offset(size.width, size.height - offset),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant ShadResizeGripPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.lineCount != lineCount ||
        oldDelegate.spacing != spacing;
  }
}
