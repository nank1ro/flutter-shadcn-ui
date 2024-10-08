import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/image.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/extensions/date_time.dart';

/// Encapsulates a start and end [DateTime] that represent the range of dates.
///
/// The range includes the [start] and [end] dates. The [start] and [end] dates
/// may be equal to indicate a date range of a single day. The [start] date must
/// not be after the [end] date.
@immutable
class ShadDateTimeRange {
  /// Creates a date range for the given start and end [DateTime].
  const ShadDateTimeRange({
    this.start,
    this.end,
  });

  /// The start of the range of dates.
  final DateTime? start;

  /// The end of the range of dates.
  final DateTime? end;

  /// Returns a [Duration] of the time between [start] and [end].
  ///
  /// See [DateTime.difference] for more details.
  Duration? get duration =>
      start == null || end == null ? null : end!.difference(start!);

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is DateTimeRange && other.start == start && other.end == end;
  }

  @override
  int get hashCode => Object.hashAll([start, end]);

  @override
  String toString() => 'ShadDateTimeRange(start: $start, end $end)';
}

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

enum ShadCalendarVariant { single, multiple, range }

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
    this.fromMonth,
    this.toMonth,
    this.onMonthChanged,
    this.reverseMonths = false,
    this.selectableDayPredicate,
  })  : variant = ShadCalendarVariant.single,
        multipleSelected = null,
        onMultipleChanged = null,
        min = null,
        max = null,
        onRangeChanged = null,
        selectedRange = null;

  const ShadCalendar.multiple({
    super.key,
    List<DateTime>? selected,
    ValueChanged<List<DateTime>>? onChanged,
    this.showOutsideDays = true,
    this.initialMonth,
    this.formatMonth,
    this.formatWeekday,
    this.showWeekNumbers = false,
    this.weekStartsOn = 1,
    this.fixedWeeks = false,
    this.hideWeekdayNames = false,
    this.numberOfMonths = 1,
    this.fromMonth,
    this.toMonth,
    this.onMonthChanged,
    this.reverseMonths = false,
    this.min,
    this.max,
    this.selectableDayPredicate,
  })  : variant = ShadCalendarVariant.multiple,
        multipleSelected = selected,
        selected = null,
        onMultipleChanged = onChanged,
        onChanged = null,
        onRangeChanged = null,
        selectedRange = null;

  const ShadCalendar.range({
    super.key,
    ShadDateTimeRange? selected,
    ValueChanged<ShadDateTimeRange?>? onChanged,
    this.showOutsideDays = true,
    this.initialMonth,
    this.formatMonth,
    this.formatWeekday,
    this.showWeekNumbers = false,
    this.weekStartsOn = 1,
    this.fixedWeeks = false,
    this.hideWeekdayNames = false,
    this.numberOfMonths = 1,
    this.fromMonth,
    this.toMonth,
    this.onMonthChanged,
    this.reverseMonths = false,
    this.min,
    this.max,
    this.selectableDayPredicate,
  })  : variant = ShadCalendarVariant.range,
        multipleSelected = null,
        selected = null,
        onMultipleChanged = null,
        onChanged = null,
        selectedRange = selected,
        onRangeChanged = onChanged;

  const ShadCalendar.raw({
    super.key,
    required this.variant,
    this.selected,
    this.multipleSelected,
    this.onChanged,
    this.onMultipleChanged,
    this.showOutsideDays = true,
    this.initialMonth,
    this.formatMonth,
    this.formatWeekday,
    this.showWeekNumbers = false,
    this.weekStartsOn = 1,
    this.fixedWeeks = false,
    this.hideWeekdayNames = false,
    this.numberOfMonths = 1,
    this.fromMonth,
    this.toMonth,
    this.onMonthChanged,
    this.reverseMonths = false,
    this.min,
    this.max,
    this.selectableDayPredicate,
    this.onRangeChanged,
    this.selectedRange,
  });

  /// {@template ShadCalendar.variant}
  /// The variant of the calendar to use.
  /// {@endtemplate}
  final ShadCalendarVariant variant;

  /// {@template ShadCalendar.selected}
  /// The date that is currently selected, defaults to null.
  /// {@endtemplate}
  final DateTime? selected;

  /// {@template ShadCalendar.multipleSelected}
  /// The dates that are currently selected, defaults to null.
  /// {@endtemplate}
  final List<DateTime>? multipleSelected;

  /// {@template ShadCalendar.onChanged}
  /// Called when the user selects a date.
  /// {@endtemplate}
  final ValueChanged<DateTime>? onChanged;

  /// {@template ShadCalendar.onMultipleChanged}
  /// Called when the user selects multiple dates.
  /// {@endtemplate}
  final ValueChanged<List<DateTime>>? onMultipleChanged;

  /// {@template ShadCalendar.showOutsideDays}
  /// Whether to show days outside the current month, defaults to true.
  /// {@endtemplate}
  final bool showOutsideDays;

  /// {@template ShadCalendar.initialMonth}
  /// The month to show by default, defaults to the current month.
  /// {@endtemplate}
  final DateTime? initialMonth;

  /// {@template ShadCalendar.formatMonth}
  /// The format to use for the month, defaults to 'LLLL y'.
  /// {@endtemplate}
  final String Function(DateTime date)? formatMonth;

  /// {@template ShadCalendar.formatWeekday}
  /// The format to use for the weekday, defaults to 'EE'.
  /// {@endtemplate}
  final String Function(DateTime date)? formatWeekday;

  /// {@template ShadCalendar.showWeekNumbers}
  /// Whether to show week numbers, defaults to false.
  /// {@endtemplate}
  final bool showWeekNumbers;

  /// {@template ShadCalendar.weekStartsOn}
  /// Which day of the week is the first day of the week.
  ///
  /// In accordance with ISO 8601 a week starts with Monday, which
  /// has the value 1, while Sunday has the value 7. Defaults to 1 (Monday).
  /// {@endtemplate}
  final int weekStartsOn;

  /// {@template ShadCalendar.fixedWeeks}
  /// Display six weeks per months, regardless the month’s number of weeks.
  ///
  /// To use this [showOutsideDays] must be set to true.
  /// Defaults to false.
  /// {@endtemplate}
  final bool fixedWeeks;

  /// {@template ShadCalendar.hideWeekdayNames}
  /// Hide the month’s head displaying the weekday names.
  /// {@endtemplate}
  final bool hideWeekdayNames;

  /// {@template ShadCalendar.numberOfMonths}
  /// The number of displayed months, defaults to 1.
  /// {@endtemplate}
  final int numberOfMonths;

  /// {@template ShadCalendar.fromMonth}
  /// The month to start the calendar from, defaults to null.
  /// {@endtemplate}
  final DateTime? fromMonth;

  /// {@template ShadCalendar.toMonth}
  /// The month to end the calendar with, defaults to null.
  /// {@endtemplate}
  final DateTime? toMonth;

  /// {@template ShadCalendar.onMonthChanged}
  /// A callback that is called when the month changes.
  ///
  /// If the `numberOfMonths` is greater than 1, this callback will be called
  /// with the most old month displayed.
  /// {@endtemplate}
  final ValueChanged<DateTime>? onMonthChanged;

  /// {@template ShadCalendar.reverseMonths}
  /// Whether to reverse the months, defaults to false.
  /// {@endtemplate}
  final bool reverseMonths;

  /// {@template ShadCalendar.min}
  /// The minimum amount of days that can be selected.
  /// {@endtemplate}
  final int? min;

  /// {@template ShadCalendar.max}
  /// The maximum amount of days that can be selected.
  /// {@endtemplate}
  final int? max;

  /// {@template ShadCalendar.selectableDayPredicate}
  /// A function that determines whether a day is selectable.
  /// {@endtemplate}
  final SelectableDayPredicate? selectableDayPredicate;

  /// {@template ShadCalendar.selectedRange}
  /// The range of dates that are currently selected, defaults to null.
  /// {@endtemplate}
  final ShadDateTimeRange? selectedRange;

  /// {@template ShadCalendar.onRangeChanged}
  /// Called when the user selects a range of dates.
  /// {@endtemplate}
  final ValueChanged<ShadDateTimeRange?>? onRangeChanged;

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
  bool isFirstMonthDisplayed = false;
  bool isLastMonthDisplayed = false;
  late final selectedDays = <DateTime>{
    if (widget.selected != null) widget.selected!.startOfDay,
    if (widget.multipleSelected != null)
      for (final date in widget.multipleSelected!) date.startOfDay,
  };
  late DateTime? startRange = widget.selectedRange?.start;
  late DateTime? endRange = widget.selectedRange?.end;

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
        widget.numberOfMonths != oldWidget.numberOfMonths ||
        widget.fromMonth != oldWidget.fromMonth ||
        widget.toMonth != oldWidget.toMonth ||
        widget.reverseMonths != oldWidget.reverseMonths ||
        widget.min != oldWidget.min ||
        widget.max != oldWidget.max) {
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
      final effectiveMonth = month.nextMonth;
      generateDatesForMonth(effectiveMonth);
      month = effectiveMonth;
    }

    isFirstMonthDisplayed = widget.fromMonth != null &&
        datesModels.first.month.isAtSameMomentAs(widget.fromMonth!);
    isLastMonthDisplayed = widget.toMonth != null &&
        datesModels.last.month.isAtSameMomentAs(widget.toMonth!);
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

    final models =
        widget.reverseMonths ? datesModels.reversed.toList() : datesModels;

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
        children: models.mapIndexed((index, dateModel) {
          final isFirstMonth = index == 0;
          final isLastMonth = index == models.length - 1;

          return ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 252),
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
                                enabled: !isFirstMonthDisplayed,
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
                                  widget.onMonthChanged?.call(currentMonth);
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
                                  enabled: !isLastMonthDisplayed,
                                  onHoverChange: (hovered) =>
                                      forwardMonthButtonHovered.value = hovered,
                                  onPressed: () {
                                    setState(() {
                                      currentMonth = currentMonth.nextMonth;
                                      generateDates();
                                    });

                                    widget.onMonthChanged?.call(currentMonth);
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
                const SizedBox(height: 16),
                // week days
                Offstage(
                  offstage: widget.hideWeekdayNames,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        7,
                        (index) {
                          final date = dateModel.firstDateShown.addDays(index);
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
                GridView.count(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 0,
                  crossAxisCount: 7,
                  shrinkWrap: true,
                  children: dateModel.dates.mapIndexed((index, date) {
                    if (date == null) return const SizedBox.shrink();
                    final selected = switch (widget.variant) {
                      ShadCalendarVariant.range => false,
                      ShadCalendarVariant.single ||
                      ShadCalendarVariant.multiple =>
                        selectedDays.any(
                          (selectedDate) => selectedDate.isSameDay(date),
                        ),
                    };

                    final isInRange = switch (widget.variant) {
                      ShadCalendarVariant.range => (startRange != null &&
                              date.isSameDayOrGreatier(startRange!)) &&
                          (endRange != null &&
                              date.isSameDayOrLower(endRange!)),
                      ShadCalendarVariant.single ||
                      ShadCalendarVariant.multiple =>
                        false,
                    };

                    final isFirstDateInRange =
                        startRange != null && date.isSameDay(startRange!);
                    final isLastDateInRange =
                        endRange != null && date.isSameDay(endRange!);

                    final isToday = date.isSameDay(today);
                    final isInMonth = date.month == dateModel.month.month;
                    final textStyle = switch (widget.variant) {
                      ShadCalendarVariant.range => () {
                          if (isFirstDateInRange || isLastDateInRange) {
                            return theme.textTheme.small.copyWith(
                              color: theme.colorScheme.primaryForeground,
                            );
                          }

                          if (isInRange) {
                            return theme.textTheme.small
                                .copyWith(color: theme.colorScheme.foreground);
                          }

                          return theme.textTheme.muted;
                        }(),
                      ShadCalendarVariant.single ||
                      ShadCalendarVariant.multiple =>
                        isInMonth
                            ? theme.textTheme.small.copyWith(
                                fontWeight: FontWeight.normal,
                                color: selected
                                    ? theme.colorScheme.primaryForeground
                                    : theme.colorScheme.foreground,
                              )
                            : theme.textTheme.muted,
                    };

                    final variant = switch (widget.variant) {
                      ShadCalendarVariant.range => () {
                          if (isFirstDateInRange || isLastDateInRange) {
                            return ShadButtonVariant.primary;
                          }
                          if (isInRange) return ShadButtonVariant.secondary;
                          if (isToday) return ShadButtonVariant.secondary;
                          return ShadButtonVariant.ghost;
                        }(),
                      ShadCalendarVariant.single ||
                      ShadCalendarVariant.multiple =>
                        switch (isInMonth) {
                          true => selected
                              ? ShadButtonVariant.primary
                              : isToday
                                  ? ShadButtonVariant.secondary
                                  : ShadButtonVariant.ghost,
                          false => selected
                              ? ShadButtonVariant.secondary
                              : ShadButtonVariant.ghost,
                        },
                    };
                    final isFirstOfRow = index % 7 == 0;
                    final isLastOfRow = index % 7 == 6;

                    return Center(
                      child: Opacity(
                        opacity: isInMonth ? 1 : .5,
                        child: ShadButton.raw(
                          variant: variant,
                          width: 36,
                          height: 36,
                          decoration: ShadDecoration(
                            secondaryBorder:
                                const ShadBorder(padding: EdgeInsets.zero),
                            border: isInRange &&
                                    !isFirstDateInRange &&
                                    !isLastDateInRange
                                ? isFirstOfRow
                                    ? ShadBorder(
                                        radius: BorderRadius.only(
                                          topLeft: theme.radius.topLeft,
                                          bottomLeft: theme.radius.bottomLeft,
                                        ),
                                      )
                                    : isLastOfRow
                                        ? ShadBorder(
                                            radius: BorderRadius.only(
                                              topRight: theme.radius.topRight,
                                              bottomRight:
                                                  theme.radius.bottomRight,
                                            ),
                                          )
                                        : const ShadBorder(
                                            radius: BorderRadius.zero,
                                          )
                                : null,
                          ),
                          enabled: (widget.max == null ||
                                  selectedDays.length < widget.max! ||
                                  selectedDays.any(
                                    (selectedDate) =>
                                        selectedDate.isSameDay(date),
                                  )) &&
                              (widget.selectableDayPredicate == null ||
                                  !widget.selectableDayPredicate!(date)),
                          padding: EdgeInsets.zero,
                          child: Text(
                            date.day.toString(),
                            style: textStyle,
                          ),
                          onPressed: () {
                            // ignore the operation if the min is reached
                            if (selectedDays.contains(date) &&
                                widget.min != null &&
                                selectedDays.length == widget.min) {
                              return;
                            }

                            if (widget.variant == ShadCalendarVariant.single) {
                              selectedDays.clear();
                            }

                            setState(() {
                              if (widget.variant == ShadCalendarVariant.range) {
                                // deselect the range
                                if ((startRange == date && endRange == null) ||
                                    (endRange == date && startRange == null)) {
                                  startRange = null;
                                } else {
                                  // select the start range
                                  if (startRange == null) {
                                    startRange = date;
                                  } else {
                                    // update the start range
                                    if (isFirstDateInRange ||
                                        isLastDateInRange) {
                                      startRange = date;
                                      endRange = null;
                                    } else {
                                      // update the start/end range based on the date position
                                      if (date.isBefore(startRange!)) {
                                        startRange = date;
                                      } else {
                                        endRange = date;
                                      }
                                    }
                                  }
                                }
                              } else {
                                if (selectedDays.contains(date)) {
                                  selectedDays.remove(date);
                                } else {
                                  selectedDays.add(date);
                                }
                              }
                            });

                            switch (widget.variant) {
                              case ShadCalendarVariant.single:
                                widget.onChanged?.call(date);
                              case ShadCalendarVariant.multiple:
                                widget.onMultipleChanged
                                    ?.call(selectedDays.toList());
                              case ShadCalendarVariant.range:
                                widget.onRangeChanged?.call(
                                  ShadDateTimeRange(
                                    start: startRange,
                                    end: endRange,
                                  ),
                                );
                            }
                          },
                        ),
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
