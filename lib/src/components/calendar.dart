import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/image.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/extensions/date_time.dart';

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
    this.weekStartsOn = 7,
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

  @override
  State<ShadCalendar> createState() => _ShadCalendarState();
}

class _ShadCalendarState extends State<ShadCalendar> {
  final today = DateTime.now().startOfDay;
  late DateTime currentMonth =
      widget.initialMonth ?? DateTime.now().startOfMonth;
  List<DateTime?> dates = [];
  // The first date shown in the calendar, used to render the week days
  late DateTime firstDateShown;

  @override
  void initState() {
    super.initState();
    generateDates();
  }

  @override
  void didUpdateWidget(covariant ShadCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.showOutsideDays != oldWidget.showOutsideDays) {
      generateDates();
    }
  }

  void generateDates() {
    final lastDate = currentMonth.endOfMonth;
    var firstDate = currentMonth.startOfMonth;
    // find the first day of the week, going back if necessary
    while (firstDate.weekday != widget.weekStartsOn) {
      firstDate = firstDate.previousDay;
    }
    firstDateShown = firstDate;

    var coveredWholeMonth = false;
    dates = [];
    while (!coveredWholeMonth || dates.length % 7 != 0) {
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShadButton.outline(
                width: 28,
                height: 28,
                padding: EdgeInsets.zero,
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
              Text(
                effectiveFormatMonth(currentMonth),
                style: theme.textTheme.small,
              ),
              ShadButton.outline(
                width: 28,
                height: 28,
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    currentMonth = currentMonth.nextMonth;
                    generateDates();
                  });
                },
                child:
                    const ShadImage.square(LucideIcons.chevronRight, size: 16),
              ),
            ],
          ),
          // weed days
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 10),
            child: Row(
              children: List.generate(
                7,
                (index) {
                  final date = firstDateShown.addDays(index);
                  return Expanded(
                    child: Text(
                      effectiveFormatWeekday(date),
                      style: theme.textTheme.muted.copyWith(fontSize: 12.8),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
          ),
          GridView.count(
            crossAxisCount: 7,
            shrinkWrap: true,
            children: dates.map((date) {
              if (date == null) return const SizedBox.shrink();

              final selected = widget.selected?.isSameDay(date) ?? false;
              final isToday = date.isSameDay(today);
              final isInMonth = date.month == currentMonth.month;
              final textStyle = isInMonth
                  ? theme.textTheme.small.copyWith(
                      fontWeight: FontWeight.normal,
                      color: selected
                          ? theme.colorScheme.primaryForeground
                          : theme.colorScheme.foreground,
                    )
                  : theme.textTheme.muted.copyWith(
                      color: theme.colorScheme.mutedForeground.withOpacity(.5),
                    );
              return ShadButton.raw(
                variant: selected
                    ? ShadButtonVariant.primary
                    : isToday
                        ? ShadButtonVariant.secondary
                        : ShadButtonVariant.ghost,
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
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
