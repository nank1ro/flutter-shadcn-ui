import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/calendar.dart';
import 'package:shadcn_ui/src/components/popover.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

import '../../shadcn_ui.dart';

class ShadDatePicker extends StatefulWidget {
  const ShadDatePicker({
    super.key,
    this.popoverController,
    this.selected,
    this.closeOnSelection,
  });

  final ShadPopoverController? popoverController;
  final DateTime? selected;
  final bool? closeOnSelection;

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

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final isSelected = selected != null;

    return ShadPopover(
      controller: popoverController,
      popover: (context) {
        return ShadCalendar(
          selected: selected,
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
        icon: ShadImage.square(LucideIcons.calendar,
            size: 16, color: theme.colorScheme.mutedForeground),
        child: isSelected
            ? Text(selected.toString())
            : Text('Pick a date', style: theme.textTheme.muted),
        onPressed: () {
          popoverController.toggle();
        },
      ),
    );
  }
}
