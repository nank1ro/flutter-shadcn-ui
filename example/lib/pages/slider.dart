import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:example/common/properties/string_property.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  var enabled = true;
  double value = 33;
  ShadSliderInteraction sliderInteraction = ShadSliderInteraction.tapAndSlide;
  int? divisions;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Slider',
      editable: [
        MyBoolProperty(
          label: 'Enabled',
          value: enabled,
          onChanged: (value) => setState(() => enabled = value),
        ),
        MyEnumProperty(
          label: 'Interaction',
          value: sliderInteraction,
          values: ShadSliderInteraction.values,
          onChanged: (value) => setState(() => sliderInteraction = value!),
        ),
        MyStringProperty(
          label: 'Divisions',
          initialValue: divisions?.toString() ?? '',
          onChanged: (v) {
            setState(() {
              final parsed = int.tryParse(v);
              divisions = parsed;
            });
          },
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
      ],
      children: [
        ShadSlider(
          initialValue: 33,
          max: 100,
          enabled: enabled,
          onChanged: print,
          allowedInteraction: sliderInteraction,
          semanticFormatterCallback: (double value) =>
              '${value.round()}% volume level',
          divisions: divisions,
        ),
      ],
    );
  }
}
