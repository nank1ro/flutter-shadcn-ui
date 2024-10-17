import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shadcn_ui/src/components/popover.dart';

class ShadDatePicker extends StatefulWidget {
  const ShadDatePicker({
    super.key,
    this.popoverController,
  });

  final ShadPopoverController? popoverController;

  @override
  State<ShadDatePicker> createState() => _ShadDatePickerState();
}

class _ShadDatePickerState extends State<ShadDatePicker> {
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
    return ShadPopover(
      controller: popoverController,
      popover: (context) {
        return ShadCalendar();
      },
      child: ShadButton.raw(
        variant: ShadButtonVariant.outline,
        child: Text('press me'),
        onPressed: () {
          popoverController.toggle();
        },
      ),
    );
  }
}
