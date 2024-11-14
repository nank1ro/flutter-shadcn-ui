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
    final effectiveGap = widget.gap ?? 8;
    return Flex(
      mainAxisSize: MainAxisSize.min,
      direction: effectiveAxis,
      children: [
        const Flexible(
          child: ShadNumberPicker(
            label: Text('Hours'),
            min: 0,
            max: 23,
            placeholder: Text('00'),
          ),
        ),
        const Flexible(
          child: ShadNumberPicker(
            label: Text('Minutes'),
            min: 0,
            max: 59,
            placeholder: Text('00'),
          ),
        ),
        const Flexible(
          child: ShadNumberPicker(
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

class ShadNumberPicker extends StatelessWidget {
  const ShadNumberPicker({
    super.key,
    this.label,
    this.min,
    this.max,
    this.placeholder,
  });

  final Widget? label;
  final int? min;
  final int? max;
  final Widget? placeholder;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveMin = min ?? 0;
    return Column(
      children: [
        if (label != null)
          DefaultTextStyle(
            style: theme.textTheme.small,
            child: label!,
          ),
        ShadInput(
          placeholder: placeholder,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }
}
