import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

class TimePickerPage extends StatelessWidget {
  const TimePickerPage({
    super.key,
    required this.style,
  });

  final ShadTimePickerVariant style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
          child: switch (style) {
            ShadTimePickerVariant.primary => const PrimaryTimePicker(),
            ShadTimePickerVariant.period => const PeriodTimePicker(),
          },
        ),
      ),
    );
  }
}

class PrimaryTimePicker extends StatelessWidget {
  const PrimaryTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: const ShadTimePicker(),
    );
  }
}

class PeriodTimePicker extends StatelessWidget {
  const PeriodTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: const ShadTimePicker.period(),
    );
  }
}
