import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final details = [
  (
    title: 'Is it acceptable?',
    content: 'Yes. It adheres to the WAI-ARIA design pattern.',
  ),
  (
    title: 'Is it styled?',
    content:
        "Yes. It comes with default styles that matches the other components' aesthetic.",
  ),
  (
    title: 'Is it animated?',
    content:
        "Yes. It's animated by default, but you can disable it if you prefer.",
  ),
  (
    title: 'Focus ring test (Issue #582)',
    content: 'input_field', // Special marker to render input field
  ),
];

class AccordionPage extends StatefulWidget {
  const AccordionPage({super.key});

  @override
  State<AccordionPage> createState() => _AccordionPageState();
}

class _AccordionPageState extends State<AccordionPage> {
  var type = ShadAccordionVariant.single;
  var underlineTitle = true;
  var clipContent = false; // false = Clip.none (fixed), true = Clip.hardEdge (old bug)

  @override
  Widget build(BuildContext context) {
    final children = details.map(
      (detail) {
        return ShadAccordionItem(
          value: detail,
          title: Text(detail.title),
          underlineTitleOnHover: underlineTitle,
          clipBehavior: clipContent ? Clip.hardEdge : Clip.none,
          child: detail.content == 'input_field'
              ? const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Focus the input below to test that the focus ring '
                        'is not clipped:'),
                    SizedBox(height: 8),
                    ShadInput(placeholder: Text('Focus me')),
                  ],
                )
              : Text(detail.content),
        );
      },
    );
    return BaseScaffold(
      appBarTitle: 'Accordion',
      editable: [
        MyEnumProperty(
          label: 'Type',
          value: type,
          values: ShadAccordionVariant.values,
          onChanged: (value) {
            if (value != null) {
              setState(() => type = value);
            }
          },
        ),
        MyBoolProperty(
          label: 'Underline title',
          value: underlineTitle,
          onChanged: (v) => setState(() => underlineTitle = v),
        ),
        MyBoolProperty(
          label: 'Clip content (old bug)',
          value: clipContent,
          onChanged: (v) => setState(() => clipContent = v),
        ),
      ],
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: type == ShadAccordionVariant.single
              ? ShadAccordion<({String content, String title})>(
                  children: children,
                )
              : ShadAccordion<({String content, String title})>.multiple(
                  children: children,
                ),
        ),
      ],
    );
  }
}
