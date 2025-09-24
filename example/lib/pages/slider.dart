import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
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
  SliderInteraction materialSliderInteraction = SliderInteraction.tapAndSlide;

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
          onChanged: (value) => setState(() {
            sliderInteraction = value!;
            materialSliderInteraction = SliderInteraction.values
                .firstWhere((e) => e.name == value.name);
          }),
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
        ),
        Slider(
          value: value,
          min: 0,
          max: 100,
          allowedInteraction: materialSliderInteraction,
          onChanged: (double value) {
            print('value: $value');
            setState(() {
              this.value = value;
            });
          },
        )
      ],
    );
  }
}
