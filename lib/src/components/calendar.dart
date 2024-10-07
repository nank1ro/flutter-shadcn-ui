import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/image.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/extensions/date_time.dart';

@immutable
class ShadCalendarModel {
  const ShadCalendarModel({
    required this.month,
    required this.dates,
    required this.firstDateShown,
  });

  final DateTime month;
  final List<DateTime?> dates;
  final DateTime firstDateShown;

  @override
  int get hashCode => Object.hashAll([month, dates, firstDateShown]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShadCalendarModel &&
        other.month == month &&
        listEquals(other.dates, dates) &&
        other.firstDateShown == firstDateShown;
  }
}

class ShadCalendar extends StatefulWidget {
  const ShadCalendar({
    super.key,
    this.selected,
    this.onChanged,
    this.showOutsideDays = true,
    this.initialMonth,
    this.formatMonth,
    this.formatWeekday,
    this.showWeekNumbers = false,
    this.weekStartsOn = 1,
    this.fixedWeeks = false,
    this.hideWeekdayNames = false,
    this.numberOfMonths = 1,
  });

  final DateTime? selected;
  final ValueChanged<DateTime>? onChanged;

  /// Whether to show days outside the current month, defaults to true.
  final bool showOutsideDays;

  /// The month to show by default, defaults to the current month.
  final DateTime? initialMonth;

  /// The format to use for the month, defaults to 'LLLL y'.
  final String Function(DateTime date)? formatMonth;

  /// The format to use for the weekday, defaults to 'EE'.
  final String Function(DateTime date)? formatWeekday;

  /// Whether to show week numbers, defaults to false.
  final bool showWeekNumbers;

  /// Which day of the week is the first day of the week.
  ///
  /// In accordance with ISO 8601 a week starts with Monday, which
  /// has the value 1, while Sunday has the value 7. Defaults to 1 (Monday).
  final int weekStartsOn;

  /// Display six weeks per months, regardless the month’s number of weeks.
  ///
  /// To use this [showOutsideDays] must be set to true.
  /// Defaults to false.
  final bool fixedWeeks;

  /// Hide the month’s head displaying the weekday names.
  final bool hideWeekdayNames;

  /// The number of displayed months, defaults to 1.
  final int numberOfMonths;

  @override
  State<ShadCalendar> createState() => _ShadCalendarState();
}

class _ShadCalendarState extends State<ShadCalendar> {
  final today = DateTime.now().startOfDay;
  late DateTime currentMonth =
      widget.initialMonth ?? DateTime.now().startOfMonth;
  List<ShadCalendarModel> datesModels = [];
  // The first date shown in the calendar, used to render the week days
  late DateTime firstDateShown;

  final backMonthButtonHovered = ValueNotifier<bool>(false);
  final forwardMonthButtonHovered = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    generateDates();
  }

  @override
  void didUpdateWidget(covariant ShadCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.showOutsideDays != oldWidget.showOutsideDays ||
        widget.fixedWeeks != oldWidget.fixedWeeks ||
        widget.weekStartsOn != oldWidget.weekStartsOn ||
        widget.numberOfMonths != oldWidget.numberOfMonths) {
      generateDates();
    }
  }

  @override
  void dispose() {
    backMonthButtonHovered.dispose();
    forwardMonthButtonHovered.dispose();
    super.dispose();
  }

  void generateDates() {
    datesModels = [];
    var month = currentMonth.previousMonth;
    for (var i = 0; i < widget.numberOfMonths; i++) {
      generateDatesForMonth(month.nextMonth);
      month = month.nextMonth;
    }
  }

  void generateDatesForMonth(DateTime month) {
    var firstDate = month.startOfMonth;
    final lastDate = month.endOfMonth;
    // find the first day of the week, going back if necessary
    while (firstDate.weekday != widget.weekStartsOn) {
      firstDate = firstDate.previousDay;
    }
    firstDateShown = firstDate;

    final dates = <DateTime?>[];
    var coveredWholeMonth = false;
    while (!coveredWholeMonth ||
        (!widget.fixedWeeks && dates.length % 7 != 0) ||
        (widget.fixedWeeks && dates.length != 42)) {
      final isDayOutsideMonth = firstDate.month != currentMonth.month;
      if (isDayOutsideMonth && !widget.showOutsideDays) {
        dates.add(null);
      } else {
        dates.add(firstDate);
      }

      // Check if we've covered the whole month
      if (firstDate.isSameDay(lastDate) && !coveredWholeMonth) {
        coveredWholeMonth = true;
      }

      firstDate = firstDate.nextDay;
    }

    datesModels.add(
      ShadCalendarModel(
        month: month,
        dates: dates,
        firstDateShown: firstDateShown,
      ),
    );
  }

  String defaultFormatMonth(DateTime date) {
    return DateFormat('LLLL y').format(date);
  }

  String defaultFormatWeekday(DateTime date) {
    final s = DateFormat('E').format(date);
    if (s.length < 2) return s;
    return s.substring(0, 2);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveFormatMonth = widget.formatMonth ?? defaultFormatMonth;

    final effectiveFormatWeekday = widget.formatWeekday ?? defaultFormatWeekday;

    return ShadDecorator(
      decoration: ShadDecoration(
        border: ShadBorder.all(
          radius: theme.radius,
          padding: const EdgeInsets.all(12),
          color: theme.colorScheme.border,
        ),
      ),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: datesModels.mapIndexed((index, dateModel) {
          final isFirstMonth = index == 0;
          final isLastMonth = index == datesModels.length - 1;

          return ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 280),
            child: Column(
              children: [
                // month header and back/forward buttons
                SizedBox(
                  height: 40,
                  child: Stack(
                    children: [
                      if (isFirstMonth)
                        ValueListenableBuilder<bool>(
                          valueListenable: backMonthButtonHovered,
                          builder: (context, isHovered, _) {
                            return Opacity(
                              opacity: isHovered ? 1 : .5,
                              child: ShadButton.outline(
                                width: 28,
                                height: 28,
                                padding: EdgeInsets.zero,
                                applyIconColorFilter: false,
                                onHoverChange: (hovered) =>
                                    backMonthButtonHovered.value = hovered,
                                icon: const ShadImage.square(
                                  LucideIcons.chevronLeft,
                                  size: 16,
                                ),
                                onPressed: () {
                                  setState(() {
                                    currentMonth = currentMonth.previousMonth;
                                    generateDates();
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      Center(
                        child: Text(
                          effectiveFormatMonth(dateModel.month),
                          style: theme.textTheme.small,
                        ),
                      ),
                      if (isLastMonth)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: ValueListenableBuilder<bool>(
                            valueListenable: forwardMonthButtonHovered,
                            builder: (context, isHovered, _) {
                              return Opacity(
                                opacity: isHovered ? 1 : .5,
                                child: ShadButton.outline(
                                  width: 28,
                                  height: 28,
                                  padding: EdgeInsets.zero,
                                  onHoverChange: (hovered) =>
                                      forwardMonthButtonHovered.value = hovered,
                                  onPressed: () {
                                    setState(() {
                                      currentMonth = currentMonth.nextMonth;
                                      generateDates();
                                    });
                                  },
                                  child: const ShadImage.square(
                                    LucideIcons.chevronRight,
                                    size: 16,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),
                // weed days
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Offstage(
                    offstage: widget.hideWeekdayNames,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          7,
                          (index) {
                            final date =
                                dateModel.firstDateShown.addDays(index);
                            return Expanded(
                              child: Text(
                                effectiveFormatWeekday(date),
                                style: theme.textTheme.muted
                                    .copyWith(fontSize: 12.8),
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                GridView.count(
                  crossAxisCount: 7,
                  shrinkWrap: true,
                  children: dateModel.dates.map((date) {
                    if (date == null) return const SizedBox.shrink();
                    final selected = widget.selected?.isSameDay(date) ?? false;
                    final isToday = date.isSameDay(today);
                    final isInMonth = date.month == dateModel.month.month;
                    final textStyle = isInMonth
                        ? theme.textTheme.small.copyWith(
                            fontWeight: FontWeight.normal,
                            color: selected
                                ? theme.colorScheme.primaryForeground
                                : theme.colorScheme.foreground,
                          )
                        : theme.textTheme.muted;

                    final variant = switch (isInMonth) {
                      true => selected
                          ? ShadButtonVariant.primary
                          : isToday
                              ? ShadButtonVariant.secondary
                              : ShadButtonVariant.ghost,
                      false => selected
                          ? ShadButtonVariant.secondary
                          : ShadButtonVariant.ghost,
                    };

                    return Opacity(
                      opacity: isInMonth ? 1 : .5,
                      child: ShadButton.raw(
                        variant: variant,
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const ShadDecoration(
                          secondaryBorder: ShadBorder(
                            padding: EdgeInsets.zero,
                          ),
                        ),
                        padding: EdgeInsets.zero,
                        child: Text(
                          date.day.toString(),
                          style: textStyle,
                        ),
                        onPressed: () {
                          widget.onChanged?.call(date);
                        },
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
