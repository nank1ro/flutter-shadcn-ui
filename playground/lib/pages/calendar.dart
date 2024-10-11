// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({
    super.key,
    required this.style,
    required this.captionLayout,
    required this.hideNavigation,
    required this.showWeekNumbers,
    required this.showOutsideDays,
    required this.fixedWeeks,
    required this.hideWeekdayNames,
    required this.reverseMonths,
  });

  final ShadCalendarVariant style;
  final ShadCalendarCaptionLayout captionLayout;
  final bool? hideNavigation;
  final bool? showWeekNumbers;
  final bool? showOutsideDays;
  final bool? fixedWeeks;
  final bool? hideWeekdayNames;
  final bool? reverseMonths;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
          child: switch (style) {
            ShadCalendarVariant.single => SingleCalendar(
                captionLayout: captionLayout,
                hideNavigation: hideNavigation,
                showWeekNumbers: showWeekNumbers,
                showOutsideDays: showOutsideDays,
                fixedWeeks: fixedWeeks,
                hideWeekdayNames: hideWeekdayNames,
              ),
            ShadCalendarVariant.multiple => MultipleCalendar(
                captionLayout: captionLayout,
                hideNavigation: hideNavigation,
                showWeekNumbers: showWeekNumbers,
                showOutsideDays: showOutsideDays,
                fixedWeeks: fixedWeeks,
                hideWeekdayNames: hideWeekdayNames,
                reverseMonths: reverseMonths ?? false,
              ),
            ShadCalendarVariant.range => const RangeCalendar(),
          },
        ),
      ),
    );
  }
}

class SingleCalendar extends StatefulWidget {
  const SingleCalendar({
    super.key,
    required this.captionLayout,
    this.hideNavigation,
    this.showWeekNumbers,
    this.showOutsideDays,
    this.fixedWeeks,
    this.hideWeekdayNames,
  });

  final ShadCalendarCaptionLayout captionLayout;
  final bool? hideNavigation;
  final bool? showWeekNumbers;
  final bool? showOutsideDays;
  final bool? fixedWeeks;
  final bool? hideWeekdayNames;

  @override
  State<SingleCalendar> createState() => _SingleCalendarState();
}

class _SingleCalendarState extends State<SingleCalendar> {
  final today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ShadCalendar(
      selected: today,
      fromMonth: DateTime(today.year - 1),
      toMonth: DateTime(today.year, 12),
      hideNavigation: widget.hideNavigation,
      captionLayout: widget.captionLayout,
      showWeekNumbers: widget.showWeekNumbers,
      showOutsideDays: widget.showOutsideDays,
      fixedWeeks: widget.fixedWeeks,
      hideWeekdayNames: widget.hideWeekdayNames,
    );
  }
}

class MultipleCalendar extends StatefulWidget {
  const MultipleCalendar({
    super.key,
    required this.captionLayout,
    this.hideNavigation,
    this.showWeekNumbers,
    this.showOutsideDays,
    this.fixedWeeks,
    this.hideWeekdayNames,
    this.reverseMonths = false,
  });

  final bool? hideNavigation;
  final bool? showWeekNumbers;
  final bool? showOutsideDays;
  final bool? fixedWeeks;
  final bool? hideWeekdayNames;
  final bool reverseMonths;
  final ShadCalendarCaptionLayout captionLayout;

  @override
  State<MultipleCalendar> createState() => _MultipleCalendarState();
}

class _MultipleCalendarState extends State<MultipleCalendar> {
  final today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ShadCalendar.multiple(
      numberOfMonths: 2,
      fromMonth: DateTime(today.year),
      toMonth: DateTime(today.year + 1, 12),
      min: 5,
      max: 10,
      reverseMonths: widget.reverseMonths,
      hideNavigation: widget.hideNavigation,
      captionLayout: widget.captionLayout,
      showWeekNumbers: widget.showWeekNumbers,
      showOutsideDays: widget.showOutsideDays,
      fixedWeeks: widget.fixedWeeks,
      hideWeekdayNames: widget.hideWeekdayNames,
    );
  }
}

class RangeCalendar extends StatelessWidget {
  const RangeCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShadCalendar.range(
      min: 2,
      max: 5,
    );
  }
}
