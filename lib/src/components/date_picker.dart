import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/calendar.dart';
import 'package:shadcn_ui/src/components/image.dart';
import 'package:shadcn_ui/src/components/popover.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/extensions/date_time.dart';

enum ShadDatePickerVariant { single, range }

class ShadDatePicker extends StatefulWidget {
  const ShadDatePicker({
    super.key,
    this.popoverController,
    this.selected,
    this.closeOnSelection,
    this.formatDate,
    this.allowDeselection,
  })  : variant = ShadDatePickerVariant.single,
        selectedRange = null;

  const ShadDatePicker.range({
    super.key,
    this.popoverController,
    ShadDateTimeRange? selected,
    this.closeOnSelection,
    this.formatDate,
    this.allowDeselection,
  })  : variant = ShadDatePickerVariant.range,
        selected = null,
        selectedRange = selected;

  const ShadDatePicker.raw({
    super.key,
    required this.variant,
    this.popoverController,
    this.selected,
    this.closeOnSelection,
    this.formatDate,
    this.allowDeselection,
    this.selectedRange,
  });

  /// {@template ShadDatePicker.popoverController}
  /// The [ShadPopoverController] to use.
  /// {@endtemplate}
  final ShadPopoverController? popoverController;

  /// {@template ShadDatePicker.selected}
  /// The selected date, defaults to `null`.
  /// {@endtemplate}
  final DateTime? selected;

  /// {@template ShadDatePicker.selectedRange}
  /// The selected range, defaults to `null`.
  /// {@endtemplate}
  final ShadDateTimeRange? selectedRange;

  /// {@template ShadDatePicker.closeOnSelection}
  /// Whether to close the popover when a date is selected.
  /// Defaults to `true`.
  /// {@endtemplate}
  final bool? closeOnSelection;

  /// {@template ShadDatePicker.formatDate}
  /// A function that formats the selected date.
  /// {@endtemplate}
  final String Function(DateTime)? formatDate;

  /// {@template ShadDatePicker.allowDeselection}
  /// Whether to allow deselection of the selected date.
  /// {@endtemplate}
  final bool? allowDeselection;

  /// {@template ShadDatePicker.variant}
  /// The variant of the date picker.
  /// {@endtemplate}
  final ShadDatePickerVariant variant;

  @override
  State<ShadDatePicker> createState() => _ShadDatePickerState();
}

class _ShadDatePickerState extends State<ShadDatePicker> {
  late DateTime? selected = widget.selected;
  late ShadDateTimeRange? selectedRange = widget.selectedRange;

  ShadPopoverController? _popoverController;

  ShadPopoverController get popoverController =>
      widget.popoverController ?? _popoverController!;

  @override
  void initState() {
    super.initState();
    if (widget.popoverController == null) {
      _popoverController = ShadPopoverController();
    }
  }

  @override
  void dispose() {
    _popoverController?.dispose();
    super.dispose();
  }

  String defaultDateFormat(DateTime date) {
    final dayWithSuffix = date.getDayWithSuffix();
    final month = DateFormat('MMMM').format(date); // October
    final year = DateFormat('y').format(date); // 2024
    return '$month $dayWithSuffix, $year'; // October 1st, 2024
  }

  String defaultDateRangeFormat(ShadDateTimeRange range) {
    if (range.start == null || range.end == null) return '';
    final start = DateFormat.yMMMd().format(range.start!);
    final end = DateFormat.yMMMd().format(range.end!);
    return '$start - $end';
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final isSelected = switch (widget.variant) {
      ShadDatePickerVariant.single => selected != null,
      ShadDatePickerVariant.range => selectedRange != null &&
          selectedRange!.start != null &&
          selectedRange!.end != null,
    };

    final effectiveFormatDate = widget.formatDate ?? defaultDateFormat;
    final effectiveAllowDeselection = widget.allowDeselection ?? true;

    return ShadPopover(
      controller: popoverController,
      popover: (context) {
        return ShadCalendar.raw(
          variant: switch (widget.variant) {
            ShadDatePickerVariant.single => ShadCalendarVariant.single,
            ShadDatePickerVariant.range => ShadCalendarVariant.range,
          },
          selected: selected,
          selectedRange: selectedRange,
          allowDeselection: effectiveAllowDeselection,
          decoration: ShadDecoration.none,
          onChanged: (selected) {
            setState(() => this.selected = selected);
            if (true == widget.closeOnSelection) {
              popoverController.hide();
            }
          },
          onRangeChanged: (range) {
            setState(() => selectedRange = range);
            if (true == widget.closeOnSelection &&
                range?.start != null &&
                range?.end != null) {
              popoverController.hide();
            }
          },
        );
      },
      child: ShadButton.raw(
        variant: ShadButtonVariant.outline,
        width: 276,
        mainAxisAlignment: MainAxisAlignment.start,
        applyIconColorFilter: false,
        icon: ShadImage.square(
          LucideIcons.calendar,
          size: 16,
          color: isSelected
              ? theme.colorScheme.foreground
              : theme.colorScheme.mutedForeground,
        ),
        child: isSelected
            ? Text(
                switch (widget.variant) {
                  ShadDatePickerVariant.single =>
                    effectiveFormatDate(selected!),
                  ShadDatePickerVariant.range =>
                    defaultDateRangeFormat(selectedRange!),
                },
              )
            : Text('Pick a date', style: theme.textTheme.muted),
        onPressed: () {
          popoverController.toggle();
        },
      ),
    );
  }
}
