import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AccordionPage extends StatefulWidget {
  const AccordionPage({super.key});

  @override
  State<AccordionPage> createState() => _AccordionPageState();
}

class _AccordionPageState extends State<AccordionPage> {
  var type = ShadAccordionType.single;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Accordion',
      editable: [
        MyEnumProperty(
          label: 'Type',
          value: type,
          values: ShadAccordionType.values,
          onChanged: (value) => setState(() => type = value),
        )
      ],
      children: [
        if (type == ShadAccordionType.single)
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: double.infinity),
            child: ShadAccordion<String>(
              children: List.generate(
                3,
                (index) {
                  final n = index + 1;
                  return ShadAccordionItem(
                    value: 'item-$n',
                    title: Text('Title $n'),
                    content: Text('Content $n'),
                  );
                },
              ),
            ),
          )
        else
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: double.infinity),
            child: ShadAccordion<String>.multiple(
              children: List.generate(
                3,
                (index) {
                  final n = index + 1;
                  return ShadAccordionItem(
                    value: 'item-$n',
                    title: Text('Title $n'),
                    content: Text('Content $n'),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
