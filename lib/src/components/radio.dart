import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/components/disabled.dart';
import 'package:shadcn_ui/src/raw_components/focusable.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';
import 'package:shadcn_ui/src/utils/provider.dart';

class ShadRadioController<T> extends ValueNotifier<T?> {
  ShadRadioController({T? value, bool enabled = true})
    : _enabled = enabled,
      super(value);

  late bool _enabled;
  bool get enabled => _enabled;
  set enabled(bool value) {
    if (_enabled == value) return;
    _enabled = value;
    notifyListeners();
  }
}

/// A customizable radio group widget that allows selection of one item from
/// a list of options.
///
/// The [ShadRadioGroup] widget is designed to manage a group of radio buttons
/// and handle their state. It supports various configurations such as
/// alignment, spacing, and initial value selection.
class ShadRadioGroup<T> extends StatefulWidget {
  /// Creates a [ShadRadioGroup] with the given [items] and optional
  /// parameters.
  ///
  /// The [items] parameter is required and should contain the list of radio
  /// options. The [initialValue] can be used to set the initially selected
  /// item. The [onChanged] callback is triggered when the selected value
  /// changes.
  const ShadRadioGroup({
    super.key,
    required this.items,
    this.initialValue,
    this.onChanged,
    this.enabled = true,
    this.axis,
    this.alignment,
    this.runAlignment,
    this.crossAxisAlignment,
    this.spacing,
    this.runSpacing,
    this.controller,
  });

  /// {@template ShadRadioGroup.initialValue}
  /// The initial value of the radio group.
  /// {@endtemplate}
  final T? initialValue;

  /// {@template ShadRadioGroup.items}
  /// The items of the radio group, any Widget can be used.
  /// {@endtemplate}
  final Iterable<Widget> items;

  /// {@template ShadRadioGroup.onChanged}
  /// Called when the user toggles a radio on.
  /// {@endtemplate}
  final ValueChanged<T?>? onChanged;

  /// {@template ShadRadioGroup.enabled}
  /// Whether the radio [items] are enabled, defaults to true.
  /// {@endtemplate}
  final bool enabled;

  /// {@template ShadRadioGroup.axis}
  /// The axis of the radio group, defaults to [Axis.vertical].
  /// {@endtemplate}
  final Axis? axis;

  /// {@template ShadRadioGroup.spacing}
  /// The main axis spacing of the radio group items, defaults to 4
  /// {@endtemplate}
  final double? spacing;

  /// {@template ShadRadioGroup.runSpacing}
  /// The cross axis spacing of the radio group items, defaults to 0
  /// {@endtemplate}
  final double? runSpacing;

  /// {@template ShadRadioGroup.alignment}
  /// The main axis alignment of the radio group items, defaults to
  /// [WrapAlignment.start]
  /// {@endtemplate}
  final WrapAlignment? alignment;

  /// {@template ShadRadioGroup.runAlignment}
  /// The cross axis alignment of the radio group items, defaults to
  /// [WrapAlignment.start]
  /// {@endtemplate}
  final WrapAlignment? runAlignment;

  /// {@template ShadRadioGroup.crossAxisAlignment}
  /// The cross axis alignment of the radio group items, defaults to
  /// [WrapCrossAlignment.start]
  /// {@endtemplate}
  final WrapCrossAlignment? crossAxisAlignment;

  /// {@template ShadRadioGroup.controller}
  /// An optional controller to programmatically control the selected value.
  /// {@endtemplate}
  final ShadRadioController<T>? controller;

  @override
  State<ShadRadioGroup<T>> createState() => ShadRadioGroupState<T>();
}

class ShadRadioGroupState<T> extends State<ShadRadioGroup<T>> {
  ShadRadioController<T>? _controller;

  ShadRadioController<T> get effectiveController =>
      widget.controller ??
      (_controller ??= ShadRadioController<T>(
        value: widget.initialValue,
        enabled: widget.enabled,
      ));

  @override
  void initState() {
    super.initState();
    effectiveController.addListener(onValueChanged);
  }

  @override
  void dispose() {
    effectiveController.removeListener(onValueChanged);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ShadRadioGroup<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller != widget.controller) {
      effectiveController.removeListener(onValueChanged);
      if (oldWidget.controller == null && widget.controller != null) {
        _controller?.dispose();
        _controller = null;
      }
      effectiveController.addListener(onValueChanged);
    }

    if (oldWidget.initialValue != widget.initialValue) {
      effectiveController.value = widget.initialValue;
    }

    if (oldWidget.enabled != widget.enabled) {
      effectiveController.enabled = widget.enabled;
    }
  }

  void onValueChanged() {
    widget.onChanged?.call(effectiveController.value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveAxis = widget.axis ?? theme.radioTheme.axis ?? Axis.vertical;
    final effectiveSpacing = widget.spacing ?? theme.radioTheme.spacing ?? 4;
    final effectiveRunSpacing =
        widget.runSpacing ?? theme.radioTheme.runSpacing ?? 0;
    final effectiveAlignment =
        widget.alignment ?? theme.radioTheme.alignment ?? WrapAlignment.start;
    final effectiveRunAlignment =
        widget.runAlignment ??
        theme.radioTheme.runAlignment ??
        WrapAlignment.start;
    final effectiveWrapCrossAlignment =
        widget.crossAxisAlignment ??
        theme.radioTheme.crossAxisAlignment ??
        WrapCrossAlignment.start;

    return ShadProvider(
      data: effectiveController as ShadRadioController<dynamic>,
      child: Wrap(
        direction: effectiveAxis,
        spacing: effectiveSpacing,
        runSpacing: effectiveRunSpacing,
        alignment: effectiveAlignment,
        runAlignment: effectiveRunAlignment,
        crossAxisAlignment: effectiveWrapCrossAlignment,
        children: widget.items.toList(),
      ),
    );
  }
}

/// A customizable radio button widget that represents a single option in a
/// radio group.
///
/// The [ShadRadio] widget can be used to create individual radio buttons
/// with various customization options such as size, color, and labels.
class ShadRadio<T> extends StatefulWidget {
  /// Creates a [ShadRadio] with the specified [value] and optional parameters.
  ///
  /// The [value] parameter is required and represents the value of the radio
  /// button. The [enabled] parameter determines if the radio button is
  /// interactive. Other parameters allow for customization of appearance and
  /// behavior.
  const ShadRadio({
    super.key,
    required this.value,
    this.enabled = true,
    this.focusNode,
    this.decoration,
    this.size,
    this.circleSize,
    this.duration,
    this.color,
    this.label,
    this.sublabel,
    this.padding,
    this.direction,
    this.radioPadding,
  });

  /// {@template ShadRadio.value}
  /// The value of the radio.
  /// {@endtemplate}
  final T value;

  /// {@template ShadRadio.enabled}
  /// Whether the radio is enabled, defaults to true.
  /// {@endtemplate}
  final bool enabled;

  /// {@template ShadRadio.focusNode}
  /// The focus node of the radio.
  /// {@endtemplate}
  final FocusNode? focusNode;

  /// {@template ShadRadio.decoration}
  /// The decoration of the radio.
  /// {@endtemplate}
  final ShadDecoration? decoration;

  /// {@template ShadRadio.size}
  /// The size of the radio, defaults to 16.
  /// {@endtemplate}
  final double? size;

  /// {@template ShadRadio.circleSize}
  /// The circle size of the radio, defaults to 10.
  /// {@endtemplate}
  final double? circleSize;

  /// {@template ShadRadio.duration}
  /// The duration of the radio animation, defaults to 100ms.
  /// {@endtemplate}
  final Duration? duration;

  /// {@template ShadRadio.color}
  /// The color of the radio.
  /// {@endtemplate}
  final Color? color;

  /// {@template ShadRadio.label}
  /// An optional label for the radio, displayed on the right side if
  /// the [direction] is `TextDirection.ltr`.
  /// {@endtemplate}
  final Widget? label;

  /// {@template ShadRadio.sublabel}
  /// An optional sublabel for the radio, displayed below the label.
  /// {@endtemplate}
  final Widget? sublabel;

  /// {@template ShadRadio.padding}
  /// The padding between the radio and the label, defaults to
  /// `EdgeInsetsDirectional.only(start: 8)`.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadRadio.radioPadding}
  /// The padding around the radio field only.
  ///
  /// Defaults to `EdgeInsets.only(top: 1)` if not specified.
  /// {@endtemplate}
  final EdgeInsetsGeometry? radioPadding;

  /// {@template ShadRadio.direction}
  /// The direction of the radio.
  /// {@endtemplate}
  final TextDirection? direction;

  @override
  State<ShadRadio<T>> createState() => _ShadRadioState<T>();
}

class _ShadRadioState<T> extends State<ShadRadio<T>> {
  FocusNode? _focusNode;

  FocusNode get focusNode => widget.focusNode ?? _focusNode!;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode == null) _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    final theme = ShadTheme.of(context);
    final inheritedController =
        context.watch<ShadRadioController<dynamic>>() as ShadRadioController<T>;

    void onTap() {
      inheritedController.value = widget.value;
      if (!focusNode.hasFocus) {
        FocusScope.of(context).unfocus();
      }
    }

    final effectiveDecoration =
        (theme.radioTheme.decoration ?? const ShadDecoration()).merge(
          widget.decoration,
        );

    final effectiveSize = widget.size ?? theme.radioTheme.size ?? 16;
    final effectiveCircleSize =
        widget.circleSize ?? theme.radioTheme.circleSize ?? 10;
    final effectiveColor =
        widget.color ?? theme.radioTheme.color ?? theme.colorScheme.primary;
    final effectiveDuration =
        widget.duration ?? theme.radioTheme.duration ?? 100.milliseconds;
    final effectivePadding =
        widget.padding ??
        theme.radioTheme.padding ??
        const EdgeInsetsDirectional.only(start: 8);

    final effectiveRadioPadding =
        widget.radioPadding ??
        theme.radioTheme.radioPadding ??
        const EdgeInsets.only(top: 1);

    final keyboardTriggers = <ShortcutActivator>[
      const SingleActivator(LogicalKeyboardKey.enter),
      const SingleActivator(LogicalKeyboardKey.space),
    ];

    return ValueListenableBuilder(
      valueListenable: inheritedController,
      builder: (context, value, child) {
        final selected = value == widget.value;
        final enabled = widget.enabled && inheritedController.enabled;

        final radio = Semantics(
          checked: selected,
          child: ShadDisabled(
            showForbiddenCursor: true,
            disabled: !enabled,
            child: CallbackShortcuts(
              bindings: {
                for (final trigger in keyboardTriggers)
                  trigger: () {
                    if (!enabled) return;
                    onTap();
                  },
              },
              child: ShadFocusable(
                focusNode: focusNode,
                builder: (context, focused, child) {
                  return ShadDecorator(
                    focused: focused,
                    decoration: effectiveDecoration,
                    child: child,
                  );
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: SizedBox.square(
                    dimension: effectiveSize,
                    child: AnimatedSwitcher(
                      duration: effectiveDuration,
                      child: selected
                          ? Align(
                              child: SizedBox.square(
                                dimension: effectiveCircleSize,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: effectiveColor,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
        return ShadDisabled(
          showForbiddenCursor: true,
          disabled: !enabled,
          disabledOpacity: 1,
          child: GestureDetector(
            onTap: enabled ? onTap : null,
            child: Row(
              textDirection: widget.direction,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: effectiveRadioPadding,
                  child: radio,
                ),
                if (widget.label != null)
                  Flexible(
                    child: Padding(
                      padding: effectivePadding,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: DefaultTextStyle(
                              style: theme.textTheme.muted.copyWith(
                                fontWeight: FontWeight.w500,
                                color: theme.colorScheme.foreground,
                              ),
                              child: widget.label!,
                            ),
                          ),
                          if (widget.sublabel != null)
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: DefaultTextStyle(
                                style: theme.textTheme.muted,
                                child: widget.sublabel!,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
