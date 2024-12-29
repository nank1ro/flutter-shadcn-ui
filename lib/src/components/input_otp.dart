import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/disabled.dart';
import 'package:shadcn_ui/src/components/input.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/text_theme/text_styles_default.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/border.dart';
import 'package:shadcn_ui/src/utils/enhanced_text_editing_controller.dart';
import 'package:shadcn_ui/src/utils/provider.dart';
import 'package:shadcn_ui/src/utils/separated_iterable.dart';

const kInvisibleCharCode = '\u200b';

class ShadInputOTP extends StatefulWidget {
  const ShadInputOTP({
    super.key,
    required this.maxLength,
    required this.children,
    this.enabled = true,
    this.gap,
    this.jumpToNextWhenFilled = true,
    this.onChanged,
    this.inputFormatters,
    this.keyboardType,
  });

  /// {@template ShadInputOTP.maxLength}
  /// The maximum length of the OTP
  /// {@endtemplate}
  final int maxLength;

  /// {@template ShadInputOTP.enabled}
  /// Whether the input is enabled, defaults to true
  /// {@endtemplate}
  final bool enabled;

  /// {@template ShadInputOTP.gap}
  /// The gap between each slot, defaults to 8
  /// {@endtemplate}
  final double? gap;

  /// {@template ShadInputOTP.children}
  /// The children of the input otp
  /// {@endtemplate}
  final List<Widget> children;

  /// {@template ShadInputOTP.jumpToNextWhenFilled}
  /// Whether to jump to the next slot when the current slot is filled,
  /// defaults to true
  /// {@endtemplate}
  final bool jumpToNextWhenFilled;

  /// {@template ShadInputOTP.onChanged}
  /// Called when the value of the OTP changes
  /// {@endtemplate}
  final ValueChanged<String>? onChanged;

  /// {@template ShadInputOTP.inputFormatters}
  /// The input formatters for the input of each slot, unless overridden in the
  /// slot
  /// {@endtemplate}
  final List<TextInputFormatter>? inputFormatters;

  /// {@template ShadInputOTP.keyboardType}
  /// The keyboard type for the input of each slot, unless overridden in the
  /// slot
  /// {@endtemplate}
  final TextInputType? keyboardType;

  @override
  State<ShadInputOTP> createState() => ShadInputOTPState();
}

class ShadInputOTPState extends State<ShadInputOTP> {
  final registeredOTPs =
      <({FocusNode focusNode, TextEditingController controller})>[];

  late Listenable listenable;

  late final values = List<String>.filled(widget.maxLength, '');

  late final result = ValueNotifier<String>('      ');

  int groups = 0;

  @override
  void initState() {
    super.initState();
    result.addListener(() {
      widget.onChanged?.call(result.value);
    });
  }

  @override
  void dispose() {
    result.dispose();
    super.dispose();
  }

  // Call this method to register a slot, returns the index of the slot
  int registerSlot({
    required FocusNode focusNode,
    required TextEditingController controller,
  }) {
    registeredOTPs.add((focusNode: focusNode, controller: controller));
    final index = registeredOTPs.length - 1;
    listenToSlot(index);
    return index;
  }

  // Call this method to register a group, returns the index of the group
  int registerGroup() {
    groups++;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
    return groups - 1;
  }

  void listenToSlot(int index) {
    final slot = registeredOTPs[index];
    slot.controller.addListener(() {
      final text =
          (slot.controller.text.split('').lastOrNull ?? kInvisibleCharCode)
              .replaceAll(kInvisibleCharCode, ' ');
      values[index] = text;

      final wholeValue = values.reduce((value, element) {
        final parsedElement = element.isEmpty ? ' ' : element;
        return value + parsedElement;
      });
      result.value = wholeValue;
    });
  }

  void jumpToSlot(int index, {bool clear = false}) {
    if (!widget.jumpToNextWhenFilled) return;
    if (index < registeredOTPs.length) {
      final nextSlot = registeredOTPs[index];
      nextSlot.focusNode.requestFocus();
      if (clear) nextSlot.controller.text = kInvisibleCharCode;
    }
  }

  void jumpToNextSlot() {
    final focusedSlotIndex = registeredOTPs.indexWhere(
      (slot) => slot.focusNode.hasFocus,
    );
    if (focusedSlotIndex == registeredOTPs.length - 1) return;
    jumpToSlot(focusedSlotIndex + 1);
  }

  void jumpToPreviousSlot({bool clear = false}) {
    final focusedSlotIndex = registeredOTPs.indexWhere(
      (slot) => slot.focusNode.hasFocus,
    );
    if (focusedSlotIndex == 0) return;
    jumpToSlot(focusedSlotIndex - 1, clear: clear);
  }

  void setValues(String values) {
    for (var i = 0; i < values.length; i++) {
      final slot = registeredOTPs[i];
      slot.controller.text = values[i];
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectiveGap = widget.gap ?? 8;
    return ShadProvider(
      data: this,
      child: ShadDisabled(
        disabled: !widget.enabled,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: widget.children.separatedBy(SizedBox(width: effectiveGap)),
        ),
      ),
      notifyUpdate: (_) => true,
    );
  }
}

class ShadInputOTPGroup extends StatefulWidget {
  const ShadInputOTPGroup({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  State<ShadInputOTPGroup> createState() => _ShadInputOTPGroupState();
}

class _ShadInputOTPGroupState extends State<ShadInputOTPGroup> {
  late final otpProvider = ShadProvider.of<ShadInputOTPState>(
    context,
    listen: false,
  );

  @override
  void initState() {
    super.initState();
    otpProvider.registerGroup();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: widget.children,
    );
  }
}

class ShadInputOTPSlot extends StatefulWidget {
  const ShadInputOTPSlot({
    super.key,
    this.focusNode,
    this.controller,
    this.inputFormatters,
    this.keyboardType,
    this.style,
    this.width,
    this.height,
    this.padding,
    this.decoration,
    this.firstRadius,
    this.lastRadius,
    this.singleRadius,
    this.middleRadius,
  });

  /// {@template ShadInputOTPSlot.focusNode}
  /// The focus node for the input of the slot
  /// {@endtemplate}
  final FocusNode? focusNode;

  /// {@template ShadInputOTPSlot.controller}
  /// The controller for the input of the slot
  /// {@endtemplate}
  final EnhancedTextEditingController? controller;

  /// {@template ShadInputOTPSlot.inputFormatters}
  /// The input formatters for the input of the slot
  /// {@endtemplate}
  final List<TextInputFormatter>? inputFormatters;

  /// {@template ShadInputOTPSlot.keyboardType}
  /// The keyboard type for the input of the slot
  /// {@endtemplate}
  final TextInputType? keyboardType;

  /// {@template ShadInputOTPSlot.style}
  /// The style for the input of the slot, defaults to
  /// ```dart
  /// textTheme.muted.copyWith(
  ///    color: theme.colorScheme.foreground,
  ///    fontFamily: kDefaultFontFamilyMono,
  ///  )
  /// ```
  /// {@endtemplate}
  final TextStyle? style;

  /// {@template ShadInputOTPSlot.width}
  /// The width of the slot, defaults to 40
  /// {@endtemplate}
  final double? width;

  /// {@template ShadInputOTPSlot.height}
  /// The height of the slot, defaults to 40
  /// {@endtemplate}
  final double? height;

  /// {@template ShadInputOTPSlot.padding}
  /// The padding of the slot, defaults to
  /// `EdgeInsets.symmetric(horizontal: 12, vertical: 4)`
  /// {@endtemplate}
  final EdgeInsets? padding;

  /// {@template ShadInputOTPSlot.decoration}
  /// The decoration of the slot
  /// {@endtemplate}
  final ShadDecoration? decoration;

  /// {@template ShadInputOTPSlot.firstRadius}
  /// The radius applied to the first slot of each group
  /// {@endtemplate}
  final BorderRadius? firstRadius;

  /// {@template ShadInputOTPSlot.lastRadius}
  /// The radius applied to the last slot of each group
  /// {@endtemplate}
  final BorderRadius? lastRadius;

  /// {@template ShadInputOTPSlot.singleRadius}
  /// The radius applied to the single slot of each group.
  /// Used only if the group has only one slot
  /// {@endtemplate}
  final BorderRadius? singleRadius;

  /// {@template ShadInputOTPSlot.middleRadius}
  /// The radius applied to the middle slots of each group.
  /// If there are 4 slots in a group, the middle slots are the 2nd and 3rd
  /// {@endtemplate}
  final BorderRadius? middleRadius;

  @override
  State<ShadInputOTPSlot> createState() => _ShadInputOTPSlotState();
}

class _ShadInputOTPSlotState extends State<ShadInputOTPSlot> {
  late final otpProvider = ShadProvider.of<ShadInputOTPState>(
    context,
    listen: false,
  );

  // ignore: use_late_for_private_fields_and_variables
  FocusNode? _focusNode;
  FocusNode get focusNode => widget.focusNode ?? _focusNode!;
  EnhancedTextEditingController? _controller;
  EnhancedTextEditingController get controller =>
      widget.controller ?? _controller!;
  late final int index;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode == null) {
      _focusNode = FocusNode(
        onKeyEvent: (node, event) {
          // Handle the arrow keys
          if (event is KeyUpEvent) return KeyEventResult.ignored;
          if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
            otpProvider.jumpToPreviousSlot();
            return KeyEventResult.handled;
          }
          if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
            otpProvider.jumpToNextSlot();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
      );
    }
    if (widget.controller == null) {
      _controller = EnhancedTextEditingController();
    }

    index = otpProvider.registerSlot(
      focusNode: focusNode,
      controller: controller,
    );
    controller.text = kInvisibleCharCode;
  }

  @override
  void dispose() {
    _focusNode?.dispose();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    // Watching the OTP provider for changes
    final otpProvider = ShadProvider.of<ShadInputOTPState>(context);

    final defaultStyle = theme.textTheme.muted.copyWith(
      color: theme.colorScheme.foreground,
      fontFamily: kDefaultFontFamilyMono,
    );

    final firstRadius = BorderRadius.only(
      topLeft: theme.radius.topLeft,
      bottomLeft: theme.radius.bottomLeft,
    );

    final lastRadius = BorderRadius.only(
      topRight: theme.radius.topRight,
      bottomRight: theme.radius.bottomRight,
    );

    final singleRadius = theme.radius;

    const middleRadius = BorderRadius.zero;

    final lastIndexForGroup = otpProvider.widget.maxLength / otpProvider.groups;
    final isLastInGroup = (index + 1) % lastIndexForGroup == 0;
    final isFirstInGroup = index % lastIndexForGroup == 0;

    final BorderRadius effectiveRadius;

    if (isFirstInGroup && isLastInGroup) {
      // Radius on all the sides
      effectiveRadius = singleRadius;
    } else {
      if (isFirstInGroup) {
        // only first side radius
        effectiveRadius = firstRadius;
      } else if (isLastInGroup) {
        // only last side radius
        effectiveRadius = lastRadius;
      } else {
        // middle radius
        effectiveRadius = middleRadius;
      }
    }
    final effectiveInputFormatters =
        widget.inputFormatters ?? otpProvider.widget.inputFormatters ?? [];

    final effectiveKeyboardType =
        widget.keyboardType ?? otpProvider.widget.keyboardType;

    final effectivePadding = widget.padding ??
        const EdgeInsets.symmetric(horizontal: 12, vertical: 4);

    final effectiveWidth = widget.width ?? 40.0;
    final effectiveHeight = widget.height ?? 40.0;

    final defaultDecoration = ShadDecoration(
      disableSecondaryBorder: true,
      focusedBorder: ShadBorder.all(
        color: theme.colorScheme.ring,
        width: 2,
      ),
      border: ShadBorder(
        top: ShadBorderSide(color: theme.colorScheme.border, width: 1),
        bottom: ShadBorderSide(color: theme.colorScheme.border, width: 1),
        right: ShadBorderSide(color: theme.colorScheme.border, width: 1),
        padding: const EdgeInsets.all(1),
      ),
    );
    final effectiveDecoration = defaultDecoration
        .mergeWith(widget.decoration)
        .mergeWith(
          ShadDecoration(
            border: ShadBorder(
              radius: effectiveRadius,
              left: isFirstInGroup
                  ? ShadBorderSide(color: theme.colorScheme.border, width: 1)
                  : ShadBorderSide.none,
            ),
            focusedBorder: ShadBorder(radius: effectiveRadius),
          ),
        );

    return SizedBox(
      width: effectiveWidth,
      height: effectiveHeight,
      child: ShadInput(
        focusNode: focusNode,
        controller: controller,
        decoration: effectiveDecoration,
        onChanged: (v) {
          var sanitizedV = v.replaceAll(kInvisibleCharCode, '');

          // if the value is more than 1 and the slot is not the first
          // get the last character from the value
          if (index != 0 && sanitizedV.length > 1) {
            sanitizedV = sanitizedV[sanitizedV.length - 1];
          }
          // if the max length is entered, set the values
          // to all the slots
          // this condition happens only for the first slot
          if (sanitizedV.length > 1) {
            otpProvider
              ..setValues(sanitizedV)
              ..jumpToSlot(sanitizedV.length - 1);
          } else {
            if (sanitizedV.isEmpty) {
              final previousText = controller.previousValue?.text ?? '';
              controller.text = kInvisibleCharCode;
              otpProvider.jumpToPreviousSlot(
                clear: previousText == kInvisibleCharCode,
              );
            } else {
              final newText = sanitizedV[sanitizedV.length - 1];
              controller.value = controller.value.copyWith(
                text: newText,
                selection: TextSelection.collapsed(offset: newText.length),
                composing: TextRange.empty,
              );
              otpProvider.jumpToNextSlot();
            }
          }
        },
        maxLength: otpProvider.widget.maxLength + 1,
        maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
        padding: effectivePadding,
        style: defaultStyle,
        inputFormatters: effectiveInputFormatters,
        keyboardType: effectiveKeyboardType,
      ),
    );
  }
}
