import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/components/calendar.dart';

/// Whether the framework is building, when listeners outside the building
/// subtree must not be notified.
bool get isBuilding =>
    SchedulerBinding.instance.schedulerPhase ==
    SchedulerPhase.persistentCallbacks;

/// Runs [callback] now, or after the current frame when the framework is
/// building.
void runAfterBuild(VoidCallback callback) {
  if (isBuilding) {
    WidgetsBinding.instance.addPostFrameCallback((_) => callback());
    return;
  }
  callback();
}

final _writtenByParent = Expando<bool>();

/// Whether the selection of [controller] was last written because a parent
/// widget passed a new `selected` value, as opposed to the user or the app
/// assigning it on the controller.
bool isWrittenByParent(ShadCalendarController controller) =>
    _writtenByParent[controller] ?? false;

/// Runs [write], marking [controller] so a [ShadCalendar] listening to it
/// updates the selection without moving the displayed month. An uncontrolled
/// [ShadCalendar] already behaves this way, and a date picker must match it.
void writeFromParent(ShadCalendarController controller, VoidCallback write) {
  _writtenByParent[controller] = true;
  try {
    write();
  } finally {
    // A listener that was notified during build reacts after the frame, so
    // the mark is cleared after it.
    runAfterBuild(() => _writtenByParent[controller] = null);
  }
}
