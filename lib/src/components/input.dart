import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/src/components/disabled.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/separated_iterable.dart';

/// A customizable text input field with optional leading and trailing widgets.
///
/// The [ShadInput] widget provides a styled text field with support for
/// placeholders, leading/trailing decorations, and extensive text editing features. It integrates
/// with [ShadTheme] for consistent styling and supports advanced interactions
/// like selection, context menus, and autofill.
class ShadInput extends StatefulWidget {
  /// Creates a text input widget with customizable properties.
  const ShadInput({
    super.key,
    this.initialValue,
    this.placeholder,
    this.controller,
    this.focusNode,
    this.decoration,
    this.undoController,
    TextInputType? keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.readOnly = false,
    this.showCursor,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled = true,
    this.cursorWidth = 2.0,
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
    this.autofillHints = const <String>[],
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
    @Deprecated('Use leading instead') this.prefix,
    @Deprecated('Use trailing instead') this.suffix,
    this.leading,
    this.trailing,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.placeholderStyle,
    this.placeholderAlignment,
    this.inputPadding,
    this.gap,
    this.constraints,
  })  : smartDashesType = smartDashesType ??
            (obscureText ? SmartDashesType.disabled : SmartDashesType.enabled),
        smartQuotesType = smartQuotesType ??
            (obscureText ? SmartQuotesType.disabled : SmartQuotesType.enabled),
        keyboardType = keyboardType ??
            (maxLines == 1 ? TextInputType.text : TextInputType.multiline),
        enableInteractiveSelection =
            enableInteractiveSelection ?? (!readOnly || !obscureText),
        assert(
          initialValue == null || controller == null,
          'Either initialValue or controller must be specified',
        );

  /// {@template ShadInput.initialValue}
  /// The initial text value of the input.
  /// Used if [controller] is null; cannot be used with [controller].
  /// {@endtemplate}
  final String? initialValue;

  /// {@template ShadInput.placeholder}
  /// The widget displayed when the input is empty.
  /// Typically a [Text] widget, styled with [placeholderStyle].
  /// {@endtemplate}
  final Widget? placeholder;

  /// {@template ShadInput.controller}
  /// The controller for managing the text input’s value and selection.
  /// If null, an internal controller is created with [initialValue].
  /// {@endtemplate}
  final TextEditingController? controller;

  /// {@template ShadInput.focusNode}
  /// The focus node for controlling focus behavior.
  /// If null, an internal focus node is created.
  /// {@endtemplate}
  final FocusNode? focusNode;

  /// {@template ShadInput.decoration}
  /// The decoration applied to the input field.
  /// Merged with the theme’s default decoration if provided.
  /// {@endtemplate}
  final ShadDecoration? decoration;

  /// {@template ShadInput.undoController}
  /// The controller for managing undo/redo history.
  /// If null, undo functionality is not provided.
  /// {@endtemplate}
  final UndoHistoryController? undoController;

  /// {@template ShadInput.keyboardType}
  /// The type of keyboard to display for the input.
  /// Defaults to [TextInputType.text] for single-line,
  /// [TextInputType.multiline] otherwise.
  /// {@endtemplate}
  final TextInputType keyboardType;

  /// {@template ShadInput.textInputAction}
  /// The action to perform when the user submits the input.
  /// Defaults to null, relying on platform behavior.
  /// {@endtemplate}
  final TextInputAction? textInputAction;

  /// {@template ShadInput.textCapitalization}
  /// The capitalization behavior for the input text.
  /// Defaults to [TextCapitalization.none].
  /// {@endtemplate}
  final TextCapitalization textCapitalization;

  /// {@template ShadInput.style}
  /// The text style for the input content.
  /// Defaults to the theme’s muted style with foreground color if not
  /// specified.
  /// {@endtemplate}
  final TextStyle? style;

  /// {@template ShadInput.strutStyle}
  /// The strut style for controlling line spacing.
  /// Defaults to null, relying on the text style.
  /// {@endtemplate}
  final StrutStyle? strutStyle;

  /// {@template ShadInput.textAlign}
  /// The horizontal alignment of the text within the input.
  /// Defaults to [TextAlign.start].
  /// {@endtemplate}
  final TextAlign textAlign;

  /// {@template ShadInput.textDirection}
  /// The directionality of the text (e.g., LTR or RTL).
  /// Defaults to null, inheriting from the context.
  /// {@endtemplate}
  final TextDirection? textDirection;

  /// {@template ShadInput.readOnly}
  /// Whether the input is read-only.
  /// Defaults to false; if true, editing is disabled but selection may still be
  /// enabled.
  /// {@endtemplate}
  final bool readOnly;

  /// {@template ShadInput.showCursor}
  /// Whether to display the cursor in the input.
  /// Defaults to null, relying on Flutter’s default behavior.
  /// {@endtemplate}
  final bool? showCursor;

  /// {@template ShadInput.autofocus}
  /// Whether the input automatically receives focus when built.
  /// Defaults to false.
  /// {@endtemplate}
  final bool autofocus;

  /// {@template ShadInput.obscuringCharacter}
  /// The character used to obscure text when [obscureText] is true.
  /// Defaults to '•'.
  /// {@endtemplate}
  final String obscuringCharacter;

  /// {@template ShadInput.obscureText}
  /// Whether the input text is obscured (e.g., for passwords).
  /// Defaults to false; affects [smartDashesType] and [smartQuotesType].
  /// {@endtemplate}
  final bool obscureText;

  /// {@template ShadInput.autocorrect}
  /// Whether autocorrect is enabled for the input.
  /// Defaults to true.
  /// {@endtemplate}
  final bool autocorrect;

  /// {@template ShadInput.smartDashesType}
  /// The smart dashes behavior for the input.
  /// Defaults to enabled if not obscured, disabled if obscured.
  /// {@endtemplate}
  final SmartDashesType smartDashesType;

  /// {@template ShadInput.smartQuotesType}
  /// The smart quotes behavior for the input.
  /// Defaults to enabled if not obscured, disabled if obscured.
  /// {@endtemplate}
  final SmartQuotesType smartQuotesType;

  /// {@template ShadInput.enableSuggestions}
  /// Whether text suggestions are enabled for the input.
  /// Defaults to true.
  /// {@endtemplate}
  final bool enableSuggestions;

  /// {@template ShadInput.maxLines}
  /// The maximum number of lines the input can span.
  /// Defaults to 1; affects [keyboardType].
  /// {@endtemplate}
  final int? maxLines;

  /// {@template ShadInput.minLines}
  /// The minimum number of lines the input should display.
  /// Defaults to null; must be less than or equal to [maxLines].
  /// {@endtemplate}
  final int? minLines;

  /// {@template ShadInput.expands}
  /// Whether the input expands to fill available vertical space.
  /// Defaults to false; requires [maxLines] and [minLines] to be null.
  /// {@endtemplate}
  final bool expands;

  /// {@template ShadInput.maxLength}
  /// The maximum length of the input text.
  /// Defaults to null (no limit); enforced by [maxLengthEnforcement].
  /// {@endtemplate}
  final int? maxLength;

  /// {@template ShadInput.maxLengthEnforcement}
  /// How the [maxLength] is enforced.
  /// Defaults to platform-specific behavior if not specified.
  /// {@endtemplate}
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// {@template ShadInput.onChanged}
  /// Callback invoked when the input text changes.
  /// Provides the new text value.
  /// {@endtemplate}
  final ValueChanged<String>? onChanged;

  /// {@template ShadInput.onEditingComplete}
  /// Callback invoked when editing is completed (e.g., via keyboard action).
  /// Does not provide the text value.
  /// {@endtemplate}
  final VoidCallback? onEditingComplete;

  /// {@template ShadInput.onSubmitted}
  /// Callback invoked when the user submits the input (e.g., pressing Enter).
  /// Provides the submitted text value.
  /// {@endtemplate}
  final ValueChanged<String>? onSubmitted;

  /// {@template ShadInput.onAppPrivateCommand}
  /// Callback for handling private app commands.
  /// Provides action and data for platform-specific features.
  /// {@endtemplate}
  final AppPrivateCommandCallback? onAppPrivateCommand;

  /// {@template ShadInput.inputFormatters}
  /// The list of formatters to apply to the input text.
  /// Controls text transformation (e.g., masking, filtering).
  /// {@endtemplate}
  final List<TextInputFormatter>? inputFormatters;

  /// {@template ShadInput.enabled}
  /// Whether the input is interactive.
  /// Defaults to true; if false, the input is disabled and visually dimmed.
  /// {@endtemplate}
  final bool enabled;

  /// {@template ShadInput.cursorWidth}
  /// The width of the cursor.
  /// Defaults to 2.0 pixels.
  /// {@endtemplate}
  final double cursorWidth;

  /// {@template ShadInput.cursorHeight}
  /// The height of the cursor.
  /// Defaults to null, matching the text height.
  /// {@endtemplate}
  final double? cursorHeight;

  /// {@template ShadInput.cursorRadius}
  /// The radius of the cursor’s corners.
  /// Defaults to null (sharp edges).
  /// {@endtemplate}
  final Radius? cursorRadius;

  /// {@template ShadInput.cursorOpacityAnimates}
  /// Whether the cursor opacity animates when blinking.
  /// Defaults to null, relying on platform behavior.
  /// {@endtemplate}
  final bool? cursorOpacityAnimates;

  /// {@template ShadInput.cursorColor}
  /// The color of the cursor.
  /// Defaults to the theme’s primary color if not specified.
  /// {@endtemplate}
  final Color? cursorColor;

  /// {@template ShadInput.selectionHeightStyle}
  /// The height style of the selection highlight.
  /// Defaults to [ui.BoxHeightStyle.tight].
  /// {@endtemplate}
  final ui.BoxHeightStyle selectionHeightStyle;

  /// {@template ShadInput.selectionWidthStyle}
  /// The width style of the selection highlight.
  /// Defaults to [ui.BoxWidthStyle.tight].
  /// {@endtemplate}
  final ui.BoxWidthStyle selectionWidthStyle;

  /// {@template ShadInput.keyboardAppearance}
  /// The appearance (brightness) of the keyboard.
  /// Defaults to the theme’s brightness if not specified.
  /// {@endtemplate}
  final Brightness? keyboardAppearance;

  /// {@template ShadInput.scrollPadding}
  /// The padding applied around the input when scrolling to keep it visible.
  /// Defaults to EdgeInsets.all(20).
  /// {@endtemplate}
  final EdgeInsets scrollPadding;

  /// {@template ShadInput.dragStartBehavior}
  /// The behavior for starting a drag gesture.
  /// Defaults to [DragStartBehavior.start].
  /// {@endtemplate}
  final DragStartBehavior dragStartBehavior;

  /// {@template ShadInput.enableInteractiveSelection}
  /// Whether interactive text selection is enabled.
  /// Defaults to true unless [readOnly] or [obscureText] is true.
  /// {@endtemplate}
  final bool enableInteractiveSelection;

  /// {@template ShadInput.selectionControls}
  /// Custom controls for text selection handles.
  /// Defaults to platform-specific controls if not specified.
  /// {@endtemplate}
  final TextSelectionControls? selectionControls;

  /// {@template ShadInput.onPressed}
  /// Callback invoked when the input field is tapped.
  /// Useful for custom tap handling, e.g., in read-only mode.
  /// {@endtemplate}
  final GestureTapCallback? onPressed;

  /// {@template ShadInput.onPressedAlwaysCalled}
  /// Whether [onPressed] is called even when selection is active.
  /// Defaults to false; if true, always triggers on tap.
  /// {@endtemplate}
  final bool onPressedAlwaysCalled;

  /// {@template ShadInput.onPressedOutside}
  /// Callback invoked when tapping outside the input field.
  /// Useful for handling focus dismissal or other actions.
  /// {@endtemplate}
  final TapRegionCallback? onPressedOutside;

  /// {@template ShadInput.mouseCursor}
  /// The cursor displayed when hovering over the input.
  /// Defaults to [WidgetStateMouseCursor.textable].
  /// {@endtemplate}
  final MouseCursor? mouseCursor;

  /// {@template ShadInput.scrollController}
  /// The controller for managing scrolling within the input.
  /// Defaults to null (no custom scrolling).
  /// {@endtemplate}
  final ScrollController? scrollController;

  /// {@template ShadInput.scrollPhysics}
  /// The physics applied to scrolling within the input.
  /// Defaults to null, relying on platform defaults.
  /// {@endtemplate}
  final ScrollPhysics? scrollPhysics;

  /// {@template ShadInput.autofillHints}
  /// Hints for autofill services to suggest values.
  /// Defaults to an empty list.
  /// {@endtemplate}
  final Iterable<String>? autofillHints;

  /// {@template ShadInput.contentInsertionConfiguration}
  /// Configuration for content insertion (e.g., paste handling).
  /// Defaults to null, using default behavior.
  /// {@endtemplate}
  final ContentInsertionConfiguration? contentInsertionConfiguration;

  /// {@template ShadInput.clipBehavior}
  /// The clip behavior for the input’s content.
  /// Defaults to [Clip.hardEdge].
  /// {@endtemplate}
  final Clip clipBehavior;

  /// {@template ShadInput.restorationId}
  /// The ID for restoring the input’s state across sessions.
  /// Defaults to null (no restoration).
  /// {@endtemplate}
  final String? restorationId;

  /// {@template ShadInput.scribbleEnabled}
  /// Whether scribble (handwriting) input is enabled.
  /// Defaults to true.
  /// {@endtemplate}
  final bool scribbleEnabled;

  /// {@template ShadInput.enableIMEPersonalizedLearning}
  /// Whether the IME can use personalized learning data.
  /// Defaults to true.
  /// {@endtemplate}
  final bool enableIMEPersonalizedLearning;

  /// {@template ShadInput.contextMenuBuilder}
  /// Custom builder for the context menu (e.g., copy/paste).
  /// Defaults to an adaptive toolbar if not specified.
  /// {@endtemplate}
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  /// {@template ShadInput.spellCheckConfiguration}
  /// Configuration for spell checking in the input.
  /// Defaults to null (no spell checking).
  /// {@endtemplate}
  final SpellCheckConfiguration? spellCheckConfiguration;

  /// {@template ShadInput.magnifierConfiguration}
  /// Configuration for the text magnifier.
  /// Defaults to [TextMagnifierConfiguration.disabled].
  /// {@endtemplate}
  final TextMagnifierConfiguration magnifierConfiguration;

  /// {@template ShadInput.selectionColor}
  /// The color of the text selection highlight.
  /// Defaults to the theme’s selection color when focused.
  /// {@endtemplate}
  final Color? selectionColor;

  /// {@template ShadInput.padding}
  /// The padding around the entire input, including decorations.
  /// Defaults to theme’s input padding if not specified.
  /// {@endtemplate}
  final EdgeInsets? padding;

  /// {@template ShadInput.prefix}
  /// Deprecated widget displayed before the input (use [leading] instead).
  /// {@endtemplate}
  @Deprecated('Use leading instead')
  final Widget? prefix;

  /// {@template ShadInput.suffix}
  /// Deprecated widget displayed after the input (use [trailing] instead).
  /// {@endtemplate}
  @Deprecated('Use trailing instead')
  final Widget? suffix;

  /// {@template ShadInput.leading}
  /// The widget displayed before the input field.
  /// Typically an icon or small graphic.
  /// {@endtemplate}
  final Widget? leading;

  /// {@template ShadInput.trailing}
  /// The widget displayed after the input field.
  /// Typically an icon or small graphic.
  /// {@endtemplate}
  final Widget? trailing;

  /// {@template ShadInput.mainAxisAlignment}
  /// The main axis alignment of the input’s row (horizontal).
  /// Defaults to [MainAxisAlignment.start] if not specified.
  /// {@endtemplate}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@template ShadInput.crossAxisAlignment}
  /// The cross axis alignment of the input’s row (vertical).
  /// Defaults to [CrossAxisAlignment.center] if not specified.
  /// {@endtemplate}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@template ShadInput.placeholderStyle}
  /// The text style for the placeholder when the input is empty.
  /// Defaults to the theme’s muted style if not specified.
  /// {@endtemplate}
  final TextStyle? placeholderStyle;

  /// {@template ShadInput.placeholderAlignment}
  /// The alignment of the placeholder within the input field.
  /// Defaults to [Alignment.topLeft] if not specified.
  /// {@endtemplate}
  final Alignment? placeholderAlignment;

  /// {@template ShadInput.inputPadding}
  /// The padding around the editable text within the input field.
  /// Defaults to [EdgeInsets.zero] if not specified.
  /// {@endtemplate}
  final EdgeInsets? inputPadding;

  /// {@template ShadInput.gap}
  /// The gap between the input field and its leading/trailing widgets.
  /// Defaults to 8 if not specified.
  /// {@endtemplate}
  final double? gap;

  /// {@template ShadInput.constraints}
  /// The constraints of the input field.
  ///
  /// By default only minHeight is set, based on the [style] and
  /// [placeholderStyle].
  /// {@endtemplate}
  final BoxConstraints? constraints;

  /// A constant representing no maximum length for the input.
  static const int noMaxLength = -1;

  /// Whether text selection is enabled, based on [enableInteractiveSelection].
  bool get selectionEnabled => enableInteractiveSelection;

  @override
  State<ShadInput> createState() => ShadInputState();
}

class ShadInputState extends State<ShadInput>
    with RestorationMixin
    implements TextSelectionGestureDetectorBuilderDelegate {
  // ignore: use_late_for_private_fields_and_variables
  FocusNode? _focusNode;
  FocusNode get effectiveFocusNode => widget.focusNode ?? _focusNode!;
  final hasFocus = ValueNotifier(false);
  RestorableTextEditingController? _controller;
  TextEditingController get effectiveController =>
      widget.controller ?? _controller!.value;
  bool _showSelectionHandles = false;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode == null) {
      _focusNode = FocusNode(canRequestFocus: !widget.readOnly);
    }
    effectiveFocusNode.addListener(onFocusChange);

    if (widget.controller == null) {
      _createLocalController(TextEditingValue(text: widget.initialValue ?? ''));
    }
  }

  @override
  void didUpdateWidget(ShadInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.focusNode != oldWidget.focusNode) {
      oldWidget.focusNode?.removeListener(onFocusChange);
      effectiveFocusNode.addListener(onFocusChange);
    }
    if (widget.controller == null && oldWidget.controller != null) {
      _createLocalController(oldWidget.controller!.value);
    } else if (widget.controller != null && oldWidget.controller == null) {
      unregisterFromRestoration(_controller!);
      _controller!.dispose();
      _controller = null;
    }

    if (widget.readOnly != oldWidget.readOnly) {
      effectiveFocusNode.canRequestFocus = !widget.readOnly;
      if (effectiveFocusNode.hasFocus &&
          effectiveController.selection.isCollapsed) {
        _showSelectionHandles = !widget.readOnly;
      }
    }
  }

  @override
  void dispose() {
    effectiveFocusNode.removeListener(onFocusChange);

    if (widget.focusNode == null) effectiveFocusNode.dispose();
    _controller?.dispose();
    super.dispose();
  }

  void _registerController() {
    assert(_controller != null);
    registerForRestoration(_controller!, 'controller');
  }

  void _createLocalController([TextEditingValue? value]) {
    assert(_controller == null);
    _controller = value == null
        ? RestorableTextEditingController()
        : RestorableTextEditingController.fromValue(value);
    if (!restorePending) {
      _registerController();
    }
  }

  void onFocusChange() {
    hasFocus.value = effectiveFocusNode.hasFocus;
  }

  @override
  final GlobalKey<EditableTextState> editableTextKey =
      GlobalKey<EditableTextState>();

  late final _selectionGestureDetectorBuilder =
      _InputSelectionGestureDetectorBuilder(state: this);

  @override
  bool get forcePressEnabled {
    return switch (Theme.of(context).platform) {
      TargetPlatform.iOS => true,
      _ => false,
    };
  }

  @override
  bool get selectionEnabled => widget.enableInteractiveSelection;

  @override
  String? get restorationId => widget.restorationId;

  EditableTextState? get _editableText => editableTextKey.currentState;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    if (_controller != null) _registerController();
  }

  void _handleSelectionChanged(
    TextSelection selection,
    SelectionChangedCause? cause,
  ) {
    final willShowSelectionHandles = _shouldShowSelectionHandles(cause);
    if (willShowSelectionHandles != _showSelectionHandles) {
      setState(() {
        _showSelectionHandles = willShowSelectionHandles;
      });
    }

    switch (Theme.of(context).platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
      case TargetPlatform.fuchsia:
      case TargetPlatform.android:
        if (cause == SelectionChangedCause.longPress) {
          _editableText?.bringIntoView(selection.extent);
        }
    }

    switch (Theme.of(context).platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
      case TargetPlatform.android:
        break;
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        if (cause == SelectionChangedCause.drag) {
          _editableText?.hideToolbar();
        }
    }
  }

  bool _shouldShowSelectionHandles(SelectionChangedCause? cause) {
    // When the text field is activated by something that doesn't trigger the
    // selection overlay, we shouldn't show the handles either.
    if (!_selectionGestureDetectorBuilder.shouldShowSelectionToolbar) {
      return false;
    }

    if (cause == SelectionChangedCause.keyboard) {
      return false;
    }

    if (widget.readOnly && effectiveController.selection.isCollapsed) {
      return false;
    }

    if (!widget.enabled) {
      return false;
    }

    if (cause == SelectionChangedCause.longPress ||
        cause == SelectionChangedCause.scribble) {
      return true;
    }

    if (effectiveController.text.isNotEmpty) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveTextStyle = theme.textTheme.muted
        .copyWith(
          color: theme.colorScheme.foreground,
        )
        .merge(theme.inputTheme.style)
        .merge(widget.style);

    final effectiveDecoration =
        (theme.inputTheme.decoration ?? const ShadDecoration())
            .mergeWith(widget.decoration);

    final effectivePadding = widget.padding ??
        theme.inputTheme.padding ??
        const EdgeInsets.symmetric(horizontal: 12, vertical: 8);

    final effectiveInputPadding =
        widget.inputPadding ?? theme.inputTheme.inputPadding ?? EdgeInsets.zero;

    final effectivePlaceholderStyle = theme.textTheme.muted
        .merge(theme.inputTheme.placeholderStyle)
        .merge(widget.placeholderStyle);

    final effectivePlaceholderAlignment = widget.placeholderAlignment ??
        theme.inputTheme.placeholderAlignment ??
        Alignment.topLeft;

    final effectiveMainAxisAlignment = widget.mainAxisAlignment ??
        theme.inputTheme.mainAxisAlignment ??
        MainAxisAlignment.start;

    final effectiveCrossAxisAlignment = widget.crossAxisAlignment ??
        theme.inputTheme.crossAxisAlignment ??
        CrossAxisAlignment.center;
    final effectiveMouseCursor =
        widget.mouseCursor ?? WidgetStateMouseCursor.textable;

    final effectiveGap = widget.gap ?? theme.inputTheme.gap ?? 8.0;

    final defaultSelectionControls = switch (Theme.of(context).platform) {
      TargetPlatform.iOS => cupertinoTextSelectionHandleControls,
      TargetPlatform.macOS => cupertinoDesktopTextSelectionHandleControls,
      TargetPlatform.android ||
      TargetPlatform.fuchsia =>
        materialTextSelectionHandleControls,
      TargetPlatform.linux ||
      TargetPlatform.windows =>
        desktopTextSelectionHandleControls,
    };
    final effectiveSelectionControls =
        widget.selectionControls ?? defaultSelectionControls;

    final effectiveContextMenuBuilder = widget.contextMenuBuilder ??
        (context, editableState) {
          return AdaptiveTextSelectionToolbar.editableText(
            editableTextState: _editableText!,
          );
        };

    final effectiveMaxLengthEnforcement = widget.maxLengthEnforcement ??
        LengthLimitingTextInputFormatter.getDefaultMaxLengthEnforcement(
          Theme.of(context).platform,
        );

    final effectiveInputFormatters = <TextInputFormatter>[
      ...?widget.inputFormatters,
      if (widget.maxLength != null)
        LengthLimitingTextInputFormatter(
          widget.maxLength,
          maxLengthEnforcement: effectiveMaxLengthEnforcement,
        ),
    ];

    final textScaler = MediaQuery.textScalerOf(context);

    final maxFontSize = max(
      (effectivePlaceholderStyle.fontSize ?? 0) *
          (effectivePlaceholderStyle.height ?? 0),
      (effectiveTextStyle.fontSize ?? 0) * (effectiveTextStyle.height ?? 0),
    );
    final maxFontSizeScaled = textScaler.scale(maxFontSize);

    final effectiveConstraints = widget.constraints ??
        BoxConstraints(
          minHeight: maxFontSizeScaled,
        );

    return ShadDisabled(
      disabled: !widget.enabled,
      child: _selectionGestureDetectorBuilder.buildGestureDetector(
        behavior: HitTestBehavior.translucent,
        child: ValueListenableBuilder(
          valueListenable: hasFocus,
          builder: (context, focused, _) {
            return ValueListenableBuilder(
              valueListenable: effectiveController,
              builder: (context, textEditingValue, child) {
                return ShadDecorator(
                  decoration: effectiveDecoration,
                  focused: focused,
                  child: Padding(
                    padding: effectivePadding,
                    child: Row(
                      mainAxisAlignment: effectiveMainAxisAlignment,
                      crossAxisAlignment: effectiveCrossAxisAlignment,
                      children: [
                        if (widget.leading != null) widget.leading!,
                        if (widget.prefix != null) widget.prefix!,
                        Flexible(
                          child: ConstrainedBox(
                            constraints: effectiveConstraints,
                            child: AbsorbPointer(
                              // AbsorbPointer is needed when the input is
                              // readOnly so the onTap callback is fired on each
                              // part of the input
                              absorbing: widget.readOnly,
                              child: Padding(
                                padding: effectiveInputPadding,
                                child: Stack(
                                  children: [
                                    // placeholder
                                    if (textEditingValue.text.isEmpty &&
                                        widget.placeholder != null)
                                      Positioned.fill(
                                        child: Align(
                                          alignment:
                                              effectivePlaceholderAlignment,
                                          child: DefaultTextStyle(
                                            style: effectivePlaceholderStyle,
                                            child: widget.placeholder!,
                                          ),
                                        ),
                                      ),
                                    RepaintBoundary(
                                      child: UnmanagedRestorationScope(
                                        bucket: bucket,
                                        child: EditableText(
                                          showSelectionHandles:
                                              _showSelectionHandles,
                                          key: editableTextKey,
                                          controller: effectiveController,
                                          obscuringCharacter:
                                              widget.obscuringCharacter,
                                          readOnly: widget.readOnly,
                                          focusNode: effectiveFocusNode,
                                          // ! Selection handler section here
                                          onSelectionChanged:
                                              _handleSelectionChanged,
                                          selectionColor: focused
                                              ? widget.selectionColor ??
                                                  theme.colorScheme.selection
                                              : null,
                                          selectionHeightStyle:
                                              widget.selectionHeightStyle,
                                          selectionWidthStyle:
                                              widget.selectionWidthStyle,
                                          contextMenuBuilder:
                                              effectiveContextMenuBuilder,
                                          selectionControls:
                                              effectiveSelectionControls,
                                          // ! End of selection handler section
                                          mouseCursor: effectiveMouseCursor,
                                          enableInteractiveSelection:
                                              widget.enableInteractiveSelection,
                                          style: effectiveTextStyle,
                                          strutStyle: widget.strutStyle,
                                          cursorColor: widget.cursorColor ??
                                              theme.colorScheme.primary,
                                          backgroundCursorColor: Colors.grey,
                                          keyboardType: widget.keyboardType,
                                          keyboardAppearance:
                                              widget.keyboardAppearance ??
                                                  theme.brightness,
                                          textInputAction:
                                              widget.textInputAction,
                                          textCapitalization:
                                              widget.textCapitalization,
                                          autofocus: widget.autofocus,
                                          obscureText: widget.obscureText,
                                          autocorrect: widget.autocorrect,
                                          magnifierConfiguration:
                                              widget.magnifierConfiguration,
                                          smartDashesType:
                                              widget.smartDashesType,
                                          smartQuotesType:
                                              widget.smartQuotesType,
                                          enableSuggestions:
                                              widget.enableSuggestions,
                                          maxLines: widget.maxLines,
                                          minLines: widget.minLines,
                                          expands: widget.expands,
                                          onChanged: widget.onChanged,
                                          onEditingComplete:
                                              widget.onEditingComplete,
                                          onSubmitted: widget.onSubmitted,
                                          onAppPrivateCommand:
                                              widget.onAppPrivateCommand,
                                          inputFormatters:
                                              effectiveInputFormatters,
                                          cursorWidth: widget.cursorWidth,
                                          cursorHeight: widget.cursorHeight,
                                          cursorRadius: widget.cursorRadius,
                                          scrollPadding: widget.scrollPadding,
                                          dragStartBehavior:
                                              widget.dragStartBehavior,
                                          scrollController:
                                              widget.scrollController,
                                          scrollPhysics: widget.scrollPhysics,
                                          autofillHints: widget.autofillHints,
                                          clipBehavior: widget.clipBehavior,
                                          restorationId: 'editable',
                                          scribbleEnabled:
                                              widget.scribbleEnabled,
                                          enableIMEPersonalizedLearning: widget
                                              .enableIMEPersonalizedLearning,
                                          contentInsertionConfiguration: widget
                                              .contentInsertionConfiguration,
                                          undoController: widget.undoController,
                                          spellCheckConfiguration:
                                              widget.spellCheckConfiguration,
                                          textAlign: widget.textAlign,
                                          onTapOutside: widget.onPressedOutside,
                                          rendererIgnoresPointer: true,
                                          showCursor: widget.showCursor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (widget.suffix != null) widget.suffix!,
                        if (widget.trailing != null) widget.trailing!,
                      ].separatedBy(SizedBox(width: effectiveGap)),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _InputSelectionGestureDetectorBuilder
    extends TextSelectionGestureDetectorBuilder {
  _InputSelectionGestureDetectorBuilder({
    required ShadInputState state,
  })  : _state = state,
        super(delegate: state);

  final ShadInputState _state;

  @override
  void onForcePressStart(ForcePressDetails details) {
    super.onForcePressStart(details);
    if (delegate.selectionEnabled && shouldShowSelectionToolbar) {
      editableText.showToolbar();
    }
  }

  @override
  void onForcePressEnd(ForcePressDetails details) {
    // Not required.
  }

  @override
  void onUserTap() {
    _state.widget.onPressed?.call();
  }

  @override
  bool get onUserTapAlwaysCalled => _state.widget.onPressedAlwaysCalled;

  @override
  void onSingleLongTapStart(LongPressStartDetails details) {
    super.onSingleLongTapStart(details);
    if (delegate.selectionEnabled) {
      switch (Theme.of(_state.context).platform) {
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          break;
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          Feedback.forLongPress(_state.context);
      }
    }
  }
}
