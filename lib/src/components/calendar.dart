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
    this.showOutsideDays,
    this.initialMonth,
    this.formatMonth,
  });

  final DateTime? selected;
  final ValueChanged<DateTime>? onChanged;

  /// Whether to show days outside the current month, defaults to true.
  final bool? showOutsideDays;

  /// The month to show by default, defaults to the current month.
  final DateTime? initialMonth;

  /// The format to use for the month, defaults to 'LLLL y'.
  final String Function(DateTime date)? formatMonth;

  @override
  State<ShadCalendar> createState() => _ShadCalendarState();
}

class _ShadCalendarState extends State<ShadCalendar> {
  late DateTime currentMonth =
      widget.initialMonth ?? DateTime.now().startOfMonth;

  String defaultFormatMonth(DateTime date) {
    return DateFormat('LLLL y').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveShowOutsideDays = widget.showOutsideDays ?? true;

    final effectiveFormatMonth = widget.formatMonth ?? defaultFormatMonth;

    print(currentMonth);
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
                  });
                },
                child:
                    const ShadImage.square(LucideIcons.chevronRight, size: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            children: List.generate(currentMonth.daysInMonth, (day) {
              return ShadButton.outline(
                width: 28,
                height: 28,
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    currentMonth =
                        currentMonth.startOfDay.add(Duration(days: day));
                  });
                },
                child: Text(
                  '${day + 1}',
                  style: theme.textTheme.small,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
