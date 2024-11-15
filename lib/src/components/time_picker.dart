import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/input.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/separated_iterable.dart';

class ShadTimePicker extends StatefulWidget {
  const ShadTimePicker({
    super.key,
    this.axis,
    this.gap,
  });

  final Axis? axis;
  final double? gap;

  @override
  State<ShadTimePicker> createState() => _ShadTimePickerState();
}

class _ShadTimePickerState extends State<ShadTimePicker> {
  @override
  Widget build(BuildContext context) {
    final effectiveAxis = widget.axis ?? Axis.horizontal;
    final effectiveGap = widget.gap ?? 0;
    return Flex(
      mainAxisSize: MainAxisSize.min,
      direction: effectiveAxis,
      children: [
        const Flexible(
          child: ShadTimePickerField(
            label: Text('Hours'),
            min: 0,
            max: 23,
            placeholder: Text('00'),
          ),
        ),
        const Flexible(
          child: ShadTimePickerField(
            label: Text('Minutes'),
            min: 0,
            max: 59,
            placeholder: Text('00'),
          ),
        ),
        const Flexible(
          child: ShadTimePickerField(
            label: Text('Seconds'),
            min: 0,
            max: 59,
            placeholder: Text('00'),
          ),
        ),
      ].separatedBy(SizedBox.square(dimension: effectiveGap)),
    );
  }
}

class ShadTimePickerField extends StatefulWidget {
  const ShadTimePickerField({
    super.key,
    this.label,
    this.min,
    this.max,
    this.placeholder,
    this.controller,
    this.gap,
  });

  final Widget? label;
  final int? min;
  final int? max;
  final Widget? placeholder;
  final TextEditingController? controller;
  final double? gap;

  @override
  State<ShadTimePickerField> createState() => _ShadTimePickerFieldState();
}

class _ShadTimePickerFieldState extends State<ShadTimePickerField> {
  TextEditingController? _controller;
  TextEditingController get controller => widget.controller ?? _controller!;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = TextEditingController();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveMin = widget.min ?? 0;
    final effectiveMax = widget.max ?? 59;
    final effectiveGap = widget.gap ?? 2;
    return Column(
      children: [
        if (widget.label != null)
          DefaultTextStyle(
            style: theme.textTheme.small.copyWith(
              fontSize: 12,
            ),
            child: widget.label!,
          ),
        SizedBox(
          width: 58,
          child: ShadInput(
            style: theme.textTheme.muted.copyWith(
              color: theme.colorScheme.foreground,
              fontSize: 16,
              height: 24 / 16,
            ),
            placeholderStyle: theme.textTheme.muted.copyWith(
              fontSize: 16,
              height: 24 / 16,
            ),
            controller: controller,
            placeholder: widget.placeholder,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            maxLength: 2,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              final intValue = int.tryParse(value);
              if (intValue == null) return;
              if (intValue < effectiveMin) {
                controller.text = effectiveMin.toString().padLeft(2, '0');
              }
              if (intValue > effectiveMax) {
                controller.text = effectiveMax.toString().padLeft(2, '0');
              }
            },
          ),
        ),
      ].separatedBy(SizedBox(height: effectiveGap)),
    );
  }
}
