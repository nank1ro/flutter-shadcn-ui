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

class ShadDatePicker extends StatefulWidget {
  const ShadDatePicker({
    super.key,
    this.popoverController,
    this.selected,
    this.closeOnSelection,
    this.formatDate,
    this.allowDeselection,
  });

  final ShadPopoverController? popoverController;
  final DateTime? selected;
  final bool? closeOnSelection;
  final String Function(DateTime)? formatDate;
  final bool? allowDeselection;

  @override
  State<ShadDatePicker> createState() => _ShadDatePickerState();
}

class _ShadDatePickerState extends State<ShadDatePicker> {
  late DateTime? selected = widget.selected;
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

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final isSelected = selected != null;

    final effectiveFormatDate = widget.formatDate ?? defaultDateFormat;
    final effectiveAllowDeselection = widget.allowDeselection ?? true;

    return ShadPopover(
      controller: popoverController,
      popover: (context) {
        return ShadCalendar(
          selected: selected,
          allowDeselection: effectiveAllowDeselection,
          decoration: ShadDecoration.none,
          onChanged: (selected) {
            setState(() => this.selected = selected);
            if (true == widget.closeOnSelection) {
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
            ? Text(effectiveFormatDate(selected!))
            : Text('Pick a date', style: theme.textTheme.muted),
        onPressed: () {
          popoverController.toggle();
        },
      ),
    );
  }
}
