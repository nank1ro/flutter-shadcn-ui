import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/disabled.dart';
import 'package:shadcn_ui/src/components/input.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/text_theme/text_styles_default.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/provider.dart';
import 'package:shadcn_ui/src/utils/separated_iterable.dart';

class ShadInputOTP extends StatefulWidget {
  const ShadInputOTP({
    super.key,
    required this.maxLength,
    required this.children,
    this.enabled = true,
    this.gap,
    this.jumpToNextWhenFilled = true,
    this.onChanged,
  });

  final int maxLength;
  final bool enabled;
  final double? gap;
  final List<Widget> children;
  final bool jumpToNextWhenFilled;
  final ValueChanged<String>? onChanged;

  @override
  State<ShadInputOTP> createState() => ShadInputOTPState();
}

class ShadInputOTPState extends State<ShadInputOTP> {
  final registeredOTPs =
      <({FocusNode focusNode, TextEditingController controller})>[];

  late Listenable listenable;

  late final values = List<String>.filled(widget.maxLength, '');

  int get groups => widget.children.length;

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

  void listenToSlot(int index) {
    final slot = registeredOTPs[index];
    slot.controller.addListener(() {
      final text = slot.controller.text;
      values[index] = text;
    });
  }

  void jumpToSlot(int index, {bool clear = false}) {
    if (!widget.jumpToNextWhenFilled) return;
    if (index < registeredOTPs.length) {
      final nextSlot = registeredOTPs[index];
      nextSlot.focusNode.requestFocus();
      if (clear) nextSlot.controller.clear();
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
    );
  }
}

class ShadInputOTPGroup extends StatelessWidget {
  const ShadInputOTPGroup({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}

class ShadInputOTPSlot extends StatefulWidget {
  const ShadInputOTPSlot({
    super.key,
    this.focusNode,
    this.controller,
  });

  final FocusNode? focusNode;
  final TextEditingController? controller;

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
  TextEditingController? _controller;
  TextEditingController get controller => widget.controller ?? _controller!;
  late final int index;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode == null) {
      _focusNode = FocusNode(
        onKeyEvent: (node, event) {
          if (event.logicalKey == LogicalKeyboardKey.backspace &&
              controller.text.isEmpty &&
              // handle both the KeyDownEvent and KeyRepeatEvent
              event is! KeyUpEvent) {
            otpProvider.jumpToPreviousSlot(clear: true);
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
      );
    }
    if (widget.controller == null) _controller = TextEditingController();
    index = otpProvider.registerSlot(
      focusNode: focusNode,
      controller: controller,
    );
    controller.addListener(() {
      if (controller.text.length == 1) {
        otpProvider.jumpToNextSlot();
      }
    });
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

    const middleRadius = BorderRadius.zero;

    final lastIndexForGroup = otpProvider.widget.maxLength / otpProvider.groups;
    final isLastInGroup = (index + 1) % lastIndexForGroup == 0;
    final isFirstInGroup = index % lastIndexForGroup == 0;

    final effectiveRadius = isFirstInGroup
        ? firstRadius
        : isLastInGroup
            ? lastRadius
            : middleRadius;

    return SizedBox.square(
      dimension: 40,
      child: ShadInput(
        focusNode: focusNode,
        controller: controller,
        decoration: ShadDecoration(
          disableSecondaryBorder: true,
          focusedBorder: ShadBorder.all(
            color: theme.colorScheme.ring,
            width: 2,
            radius: effectiveRadius,
          ),
          border: ShadBorder(
            radius: effectiveRadius,
            left: isFirstInGroup
                ? BorderSide(color: theme.colorScheme.border)
                : BorderSide.none,
            top: BorderSide(color: theme.colorScheme.border),
            bottom: BorderSide(color: theme.colorScheme.border),
            right: BorderSide(color: theme.colorScheme.border),
            padding: const EdgeInsets.all(1),
          ),
        ),
        onChanged: (v) {
          // if the max length is entered, set the values
          // to all the slots
          // this callback is fired only for the first slot
          if (v.length == otpProvider.widget.maxLength) {
            otpProvider.setValues(v);
          } else {
            if (v.isEmpty) {
              controller.clear();
            } else {
              controller.text = v[v.length - 1];
            }
          }
        },
        maxLength: otpProvider.widget.maxLength,
        maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        style: defaultStyle,
      ),
    );
  }
}
