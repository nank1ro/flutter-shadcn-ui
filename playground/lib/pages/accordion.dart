import 'package:flutter/material.dart';

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
];

class AccordionPage extends StatelessWidget {
  const AccordionPage({
    super.key,
    required this.style,
  });

  final ShadAccordionType style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 600,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: switch (style) {
            ShadAccordionType.single =>
              ShadAccordion<({String content, String title})>(
                children: details.map(
                  (detail) => ShadAccordionItem(
                    value: detail,
                    title: Text(detail.title),
                    child: Text(detail.content),
                  ),
                ),
              ),
            ShadAccordionType.multiple =>
              ShadAccordion<({String content, String title})>.multiple(
                children: details.map(
                  (detail) => ShadAccordionItem(
                    value: detail,
                    title: Text(detail.title),
                    child: Text(detail.content),
                  ),
                ),
              ),
          },
        ),
      ),
    );
  }
}
