import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart' as intl;
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/calendar.dart';
import 'package:shadcn_ui/src/components/popover.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/extensions/date_time.dart';
import 'package:shadcn_ui/src/utils/extensions/text_style.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';
import 'package:shadcn_ui/src/utils/states_controller.dart';

/// Variants available for the [ShadDatePicker] widget.
enum ShadDatePickerVariant { single, range }

/// A customizable date picker widget with a button and popover calendar.
///
/// The [ShadDatePicker] widget combines a button with a popover calendar,
/// allowing users to select a single date or a date range. It supports
/// extensive customization for both the button and calendar, integrating with
/// [ShadTheme] for consistent styling. Use named constructors like
/// [ShadDatePicker.range] for range selection or [ShadDatePicker.raw] for full
/// control.
class ShadDatePicker extends StatefulWidget {
  /// Creates a single-date picker widget with a button and popover calendar.
  const ShadDatePicker({
    super.key,
    this.placeholder,
    this.popoverController,
    this.selected,
    this.closeOnSelection,
    this.formatDate,
    this.allowDeselection,
    this.header,
    this.footer,
    this.groupId,
    this.calendarDecoration,
    this.popoverPadding,
    this.multipleSelected,
    this.onChanged,
    this.onMultipleChanged,
    this.showOutsideDays,
    this.initialMonth,
    this.formatMonthYear,
    this.formatMonth,
    this.formatYear,
    this.formatWeekday,
    this.showWeekNumbers,
    this.weekStartsOn,
    this.fixedWeeks,
    this.hideWeekdayNames,
    this.numberOfMonths = 1,
    this.fromMonth,
    this.toMonth,
    this.onMonthChanged,
    this.reverseMonths = false,
    this.min,
    this.max,
    this.selectableDayPredicate,
    this.onRangeChanged,
    this.captionLayout,
    this.hideNavigation,
    this.yearSelectorMinWidth,
    this.monthSelectorMinWidth,
    this.yearSelectorPadding,
    this.monthSelectorPadding,
    this.navigationButtonSize,
    this.navigationButtonIconSize,
    this.backNavigationButtonIconData,
    this.forwardNavigationButtonIconData,
    this.navigationButtonPadding,
    this.navigationButtonDisabledOpacity,
    this.decoration,
    this.spacingBetweenMonths,
    this.runSpacingBetweenMonths,
    this.monthConstraints,
    this.calendarHeaderHeight,
    this.calendarHeaderPadding,
    this.captionLayoutGap,
    this.calendarHeaderTextStyle,
    this.weekdaysPadding,
    this.weekdaysTextStyle,
    this.weekdaysTextAlign,
    this.weekNumbersHeaderText,
    this.weekNumbersHeaderTextStyle,
    this.weekNumbersTextStyle,
    this.weekNumbersTextAlign,
    this.dayButtonSize,
    this.dayButtonOutsideMonthOpacity,
    this.dayButtonPadding,
    this.dayButtonDecoration,
    this.selectedDayButtonTextStyle,
    this.insideRangeDayButtonTextStyle,
    this.dayButtonTextStyle,
    this.dayButtonVariant,
    this.selectedDayButtonVariant,
    this.insideRangeDayButtonVariant,
    this.todayButtonVariant,
    this.gridMainAxisSpacing,
    this.gridCrossAxisSpacing,
    this.dayButtonOutsideMonthTextStyle,
    this.dayButtonOutsideMonthVariant,
    this.selectedDayButtonOusideMonthVariant,
    this.closeOnTapOutside = true,
    this.focusNode,
    this.anchor,
    this.effects,
    this.shadows,
    this.popoverDecoration,
    this.filter,
    this.areaGroupId,
    this.useSameGroupIdForChild = true,
    this.onPressed,
    this.onLongPress,
    this.icon,
    this.buttonChild,
    this.buttonVariant,
    this.size,
    this.cursor,
    this.width,
    this.height,
    this.buttonPadding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.buttonFocusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.buttonShadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.buttonDecoration,
    this.enabled = true,
    this.statesController,
    this.gap,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.textDirection,
    this.onFocusChange,
    this.iconData,
    this.expands,
    this.popoverReverseDuration,
    this.buttonTextStyle,
  }) : variant = ShadDatePickerVariant.single,
       formatDateRange = null,
       selectedRange = null;

  /// Creates a date range picker widget with a button and popover calendar.
  const ShadDatePicker.range({
    super.key,
    this.popoverController,
    this.placeholder,
    ShadDateTimeRange? selected,
    this.formatDateRange,
    this.closeOnSelection,
    this.allowDeselection,
    this.header,
    this.footer,
    this.groupId,
    this.calendarDecoration,
    this.popoverPadding,
    this.multipleSelected,
    this.onChanged,
    this.onMultipleChanged,
    this.showOutsideDays,
    this.initialMonth,
    this.formatMonthYear,
    this.formatMonth,
    this.formatYear,
    this.formatWeekday,
    this.showWeekNumbers,
    this.weekStartsOn,
    this.fixedWeeks,
    this.hideWeekdayNames,
    this.numberOfMonths = 1,
    this.fromMonth,
    this.toMonth,
    this.onMonthChanged,
    this.reverseMonths = false,
    this.min,
    this.max,
    this.selectableDayPredicate,
    this.onRangeChanged,
    this.captionLayout,
    this.hideNavigation,
    this.yearSelectorMinWidth,
    this.monthSelectorMinWidth,
    this.yearSelectorPadding,
    this.monthSelectorPadding,
    this.navigationButtonSize,
    this.navigationButtonIconSize,
    this.backNavigationButtonIconData,
    this.forwardNavigationButtonIconData,
    this.navigationButtonPadding,
    this.navigationButtonDisabledOpacity,
    this.decoration,
    this.spacingBetweenMonths,
    this.runSpacingBetweenMonths,
    this.monthConstraints,
    this.calendarHeaderHeight,
    this.calendarHeaderPadding,
    this.captionLayoutGap,
    this.calendarHeaderTextStyle,
    this.weekdaysPadding,
    this.weekdaysTextStyle,
    this.weekdaysTextAlign,
    this.weekNumbersHeaderText,
    this.weekNumbersHeaderTextStyle,
    this.weekNumbersTextStyle,
    this.weekNumbersTextAlign,
    this.dayButtonSize,
    this.dayButtonOutsideMonthOpacity,
    this.dayButtonPadding,
    this.dayButtonDecoration,
    this.selectedDayButtonTextStyle,
    this.insideRangeDayButtonTextStyle,
    this.dayButtonTextStyle,
    this.dayButtonVariant,
    this.selectedDayButtonVariant,
    this.insideRangeDayButtonVariant,
    this.todayButtonVariant,
    this.gridMainAxisSpacing,
    this.gridCrossAxisSpacing,
    this.dayButtonOutsideMonthTextStyle,
    this.dayButtonOutsideMonthVariant,
    this.selectedDayButtonOusideMonthVariant,
    this.closeOnTapOutside = true,
    this.focusNode,
    this.anchor,
    this.effects,
    this.shadows,
    this.popoverDecoration,
    this.filter,
    this.areaGroupId,
    this.useSameGroupIdForChild = true,
    this.onPressed,
    this.onLongPress,
    this.icon,
    this.buttonChild,
    this.buttonVariant,
    this.size,
    this.cursor,
    this.width,
    this.height,
    this.buttonPadding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.buttonFocusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.buttonShadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.buttonDecoration,
    this.enabled = true,
    this.statesController,
    this.gap,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.textDirection,
    this.onFocusChange,
    this.iconData,
    this.expands,
    this.popoverReverseDuration,
    this.buttonTextStyle,
  }) : variant = ShadDatePickerVariant.range,
       selected = null,
       formatDate = null,
       selectedRange = selected;

  /// Creates a date picker widget with a specified [variant], offering full
  /// customization.
  const ShadDatePicker.raw({
    super.key,
    required this.variant,
    this.popoverController,
    this.selected,
    this.closeOnSelection,
    this.formatDate,
    this.allowDeselection,
    this.selectedRange,
    this.header,
    this.footer,
    this.groupId,
    this.calendarDecoration,
    this.popoverPadding,
    this.multipleSelected,
    this.onChanged,
    this.onMultipleChanged,
    this.showOutsideDays,
    this.initialMonth,
    this.formatMonthYear,
    this.formatMonth,
    this.formatYear,
    this.formatWeekday,
    this.showWeekNumbers,
    this.weekStartsOn,
    this.fixedWeeks,
    this.hideWeekdayNames,
    this.numberOfMonths = 1,
    this.fromMonth,
    this.toMonth,
    this.onMonthChanged,
    this.reverseMonths = false,
    this.min,
    this.max,
    this.selectableDayPredicate,
    this.onRangeChanged,
    this.captionLayout,
    this.hideNavigation,
    this.yearSelectorMinWidth,
    this.monthSelectorMinWidth,
    this.yearSelectorPadding,
    this.monthSelectorPadding,
    this.navigationButtonSize,
    this.navigationButtonIconSize,
    this.backNavigationButtonIconData,
    this.forwardNavigationButtonIconData,
    this.navigationButtonPadding,
    this.navigationButtonDisabledOpacity,
    this.decoration,
    this.spacingBetweenMonths,
    this.runSpacingBetweenMonths,
    this.monthConstraints,
    this.calendarHeaderHeight,
    this.calendarHeaderPadding,
    this.captionLayoutGap,
    this.calendarHeaderTextStyle,
    this.weekdaysPadding,
    this.weekdaysTextStyle,
    this.weekdaysTextAlign,
    this.weekNumbersHeaderText,
    this.weekNumbersHeaderTextStyle,
    this.weekNumbersTextStyle,
    this.weekNumbersTextAlign,
    this.dayButtonSize,
    this.dayButtonOutsideMonthOpacity,
    this.dayButtonPadding,
    this.dayButtonDecoration,
    this.selectedDayButtonTextStyle,
    this.insideRangeDayButtonTextStyle,
    this.dayButtonTextStyle,
    this.dayButtonVariant,
    this.selectedDayButtonVariant,
    this.insideRangeDayButtonVariant,
    this.todayButtonVariant,
    this.gridMainAxisSpacing,
    this.gridCrossAxisSpacing,
    this.dayButtonOutsideMonthTextStyle,
    this.dayButtonOutsideMonthVariant,
    this.selectedDayButtonOusideMonthVariant,
    this.closeOnTapOutside = true,
    this.focusNode,
    this.anchor,
    this.effects,
    this.shadows,
    this.popoverDecoration,
    this.filter,
    this.areaGroupId,
    this.useSameGroupIdForChild = true,
    this.onPressed,
    this.onLongPress,
    this.icon,
    this.buttonChild,
    this.buttonVariant,
    this.size,
    this.cursor,
    this.width,
    this.height,
    this.buttonPadding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.buttonFocusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.buttonShadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.buttonDecoration,
    this.enabled = true,
    this.statesController,
    this.gap,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.textDirection,
    this.onFocusChange,
    this.iconData,
    this.formatDateRange,
    this.placeholder,
    this.expands,
    this.popoverReverseDuration,
    this.buttonTextStyle,
  });

  /// {@template ShadDatePicker.placeholder}
  /// The placeholder of the date picker, shown when no date is selected.
  /// {@endtemplate}
  final Widget? placeholder;

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

  /// {@template ShadDatePicker.formatDateRange}
  /// A function that formats the selected date range.
  /// {@endtemplate}
  final String Function(ShadDateTimeRange)? formatDateRange;

  /// {@template ShadDatePicker.allowDeselection}
  /// Whether to allow deselection of the selected date.
  /// {@endtemplate}
  final bool? allowDeselection;

  /// {@template ShadDatePicker.variant}
  /// The variant of the date picker.
  /// {@endtemplate}
  final ShadDatePickerVariant variant;

  /// {@template ShadDatePicker.header}
  /// The header of the date picker.
  /// {@endtemplate}
  final Widget? header;

  /// {@template ShadDatePicker.footer}
  /// The footer of the date picker.
  /// {@endtemplate}
  final Widget? footer;

  /// {@macro ShadPopover.groupId}
  final Object? groupId;

  /// {@template ShadDatePicker.calendarDecoration}
  /// The decoration of the calendar.
  /// Defaults to `ShadDecoration.none`.
  /// {@endtemplate}
  final ShadDecoration? calendarDecoration;

  /// {@macro ShadPopover.padding}
  final EdgeInsetsGeometry? popoverPadding;

  /// {@macro ShadCalendar.multipleSelected}
  final List<DateTime>? multipleSelected;

  /// {@macro ShadCalendar.onChanged}
  final ValueChanged<DateTime?>? onChanged;

  /// {@macro ShadCalendar.onMultipleChanged}
  final ValueChanged<List<DateTime>>? onMultipleChanged;

  /// {@macro ShadCalendar.showOutsideDays}
  final bool? showOutsideDays;

  /// {@macro ShadCalendar.initialMonth}
  final DateTime? initialMonth;

  /// {@macro ShadCalendar.formatMonthYear}
  final String Function(DateTime date)? formatMonthYear;

  /// {@macro ShadCalendar.formatMonth}
  final String Function(DateTime date)? formatMonth;

  /// {@macro ShadCalendar.formatYear}
  final String Function(DateTime date)? formatYear;

  /// {@macro ShadCalendar.formatWeekday}
  final String Function(DateTime date)? formatWeekday;

  /// {@macro ShadCalendar.showWeekNumbers}
  final bool? showWeekNumbers;

  /// {@macro ShadCalendar.weekStartsOn}
  final int? weekStartsOn;

  /// {@macro ShadCalendar.fixedWeeks}
  final bool? fixedWeeks;

  /// {@macro ShadCalendar.hideWeekdayNames}
  final bool? hideWeekdayNames;

  /// {@macro ShadCalendar.numberOfMonths}
  final int numberOfMonths;

  /// {@macro ShadCalendar.fromMonth}
  final DateTime? fromMonth;

  /// {@macro ShadCalendar.toMonth}
  final DateTime? toMonth;

  /// {@macro ShadCalendar.onMonthChanged}
  final ValueChanged<DateTime>? onMonthChanged;

  /// {@macro ShadCalendar.reverseMonths}
  final bool reverseMonths;

  /// {@macro ShadCalendar.min}
  final int? min;

  /// {@macro ShadCalendar.max}
  final int? max;

  /// {@macro ShadCalendar.selectableDayPredicate}
  final bool Function(DateTime day)? selectableDayPredicate;

  /// {@macro ShadCalendar.onRangeChanged}
  final ValueChanged<ShadDateTimeRange?>? onRangeChanged;

  /// {@macro ShadCalendar.captionLayout}
  final ShadCalendarCaptionLayout? captionLayout;

  /// {@macro ShadCalendar.hideNavigation}
  final bool? hideNavigation;

  /// {@macro ShadCalendar.yearSelectorMinWidth}
  final double? yearSelectorMinWidth;

  /// {@macro ShadCalendar.monthSelectorMinWidth}
  final double? monthSelectorMinWidth;

  /// {@macro ShadCalendar.yearSelectorPadding}
  final EdgeInsetsGeometry? yearSelectorPadding;

  /// {@macro ShadCalendar.monthSelectorPadding}
  final EdgeInsetsGeometry? monthSelectorPadding;

  /// {@macro ShadCalendar.navigationButtonSize}
  final double? navigationButtonSize;

  /// {@macro ShadCalendar.navigationButtonIconSize}
  final double? navigationButtonIconSize;

  /// {@macro ShadCalendar.backNavigationButtonIconData}
  final IconData? backNavigationButtonIconData;

  /// {@macro ShadCalendar.forwardNavigationButtonIconData}
  final IconData? forwardNavigationButtonIconData;

  /// {@macro ShadCalendar.navigationButtonPadding}
  final EdgeInsetsGeometry? navigationButtonPadding;

  /// {@macro ShadCalendar.navigationButtonDisabledOpacity}
  final double? navigationButtonDisabledOpacity;

  /// {@macro ShadCalendar.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadCalendar.spacingBetweenMonths}
  final double? spacingBetweenMonths;

  /// {@macro ShadCalendar.runSpacingBetweenMonths}
  final double? runSpacingBetweenMonths;

  /// {@macro ShadCalendar.monthConstraints}
  final BoxConstraints? monthConstraints;

  /// {@macro ShadCalendar.headerHeight}
  final double? calendarHeaderHeight;

  /// {@macro ShadCalendar.headerPadding}
  final EdgeInsetsGeometry? calendarHeaderPadding;

  /// {@macro ShadCalendar.captionLayoutGap}
  final double? captionLayoutGap;

  /// {@macro ShadCalendar.headerTextStyle}
  final TextStyle? calendarHeaderTextStyle;

  /// {@macro ShadCalendar.weekdaysPadding}
  final EdgeInsetsGeometry? weekdaysPadding;

  /// {@macro ShadCalendar.weekdaysTextStyle}
  final TextStyle? weekdaysTextStyle;

  /// {@macro ShadCalendar.weekdaysTextAlign}
  final TextAlign? weekdaysTextAlign;

  /// {@macro ShadCalendar.weekNumbersHeaderText}
  final String? weekNumbersHeaderText;

  /// {@macro ShadCalendar.weekNumbersHeaderTextStyle}
  final TextStyle? weekNumbersHeaderTextStyle;

  /// {@macro ShadCalendar.weekNumbersTextStyle}
  final TextStyle? weekNumbersTextStyle;

  /// {@macro ShadCalendar.weekNumbersTextAlign}
  final TextAlign? weekNumbersTextAlign;

  /// {@macro ShadCalendar.dayButtonSize}
  final double? dayButtonSize;

  /// {@macro ShadCalendar.dayButtonOutsideMonthOpacity}
  final double? dayButtonOutsideMonthOpacity;

  /// {@macro ShadCalendar.dayButtonPadding}
  final EdgeInsetsGeometry? dayButtonPadding;

  /// {@macro ShadCalendar.dayButtonDecoration}
  final ShadDecoration? dayButtonDecoration;

  /// {@macro ShadCalendar.selectedDayButtonTextStyle}
  final TextStyle? selectedDayButtonTextStyle;

  /// {@macro ShadCalendar.insideRangeDayButtonTextStyle}
  final TextStyle? insideRangeDayButtonTextStyle;

  /// {@macro ShadCalendar.dayButtonTextStyle}
  final TextStyle? dayButtonTextStyle;

  /// {@macro ShadCalendar.dayButtonVariant}
  final ShadButtonVariant? dayButtonVariant;

  /// {@macro ShadCalendar.selectedDayButtonVariant}
  final ShadButtonVariant? selectedDayButtonVariant;

  /// {@macro ShadCalendar.insideRangeDayButtonVariant}
  final ShadButtonVariant? insideRangeDayButtonVariant;

  /// {@macro ShadCalendar.todayButtonVariant}
  final ShadButtonVariant? todayButtonVariant;

  /// {@macro ShadCalendar.gridMainAxisSpacing}
  final double? gridMainAxisSpacing;

  /// {@macro ShadCalendar.gridCrossAxisSpacing}
  final double? gridCrossAxisSpacing;

  /// {@macro ShadCalendar.dayButtonOutsideMonthTextStyle}
  final TextStyle? dayButtonOutsideMonthTextStyle;

  /// {@macro ShadCalendar.dayButtonOutsideMonthVariant}
  final ShadButtonVariant? dayButtonOutsideMonthVariant;

  /// {@macro ShadCalendar.selectedDayButtonOusideMonthVariant}
  final ShadButtonVariant? selectedDayButtonOusideMonthVariant;

  // ---
  // POPOVER
  // ---

  /// {@macro ShadPopover.closeOnTapOutside}
  final bool closeOnTapOutside;

  /// {@macro ShadPopover.focusNode}
  final FocusNode? focusNode;

  ///{@macro ShadPopover.anchor}
  final ShadAnchorBase? anchor;

  /// {@macro ShadPopover.effects}
  final List<Effect<dynamic>>? effects;

  /// {@macro ShadPopover.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro ShadPopover.decoration}
  final ShadDecoration? popoverDecoration;

  /// {@macro ShadPopover.filter}
  final ImageFilter? filter;

  /// {@macro ShadMouseArea.groupId}
  final Object? areaGroupId;

  /// {@macro ShadPopover.useSameGroupIdForChild}
  final bool useSameGroupIdForChild;

  /// {@macro ShadPopover.reverseDuration}
  final Duration? popoverReverseDuration;

  // ---
  // BUTTON
  // ---

  /// {@macro ShadButton.onPressed}
  final VoidCallback? onPressed;

  /// {@macro ShadButton.onLongPress}
  final VoidCallback? onLongPress;

  /// {@macro ShadButton.icon}
  final Widget? icon;

  /// {@template ShadDatePicker.iconData}
  /// The icon of the date picker button, defaults to [LucideIcons.calendar].
  /// {@endtemplate}
  final IconData? iconData;

  /// {@macro ShadButton.child}
  final Widget? buttonChild;

  /// {@macro ShadButton.variant}
  final ShadButtonVariant? buttonVariant;

  /// {@macro ShadButton.size}
  final ShadButtonSize? size;

  /// {@macro ShadButton.cursor}
  final MouseCursor? cursor;

  /// {@macro ShadButton.width}
  final double? width;

  /// {@macro ShadButton.height}
  final double? height;

  /// {@macro ShadButton.padding}
  final EdgeInsetsGeometry? buttonPadding;

  /// {@macro ShadButton.backgroundColor}
  final Color? backgroundColor;

  /// {@macro ShadButton.hoverBackgroundColor}
  final Color? hoverBackgroundColor;

  /// {@macro ShadButton.foregroundColor}
  final Color? foregroundColor;

  /// {@macro ShadButton.hoverForegroundColor}
  final Color? hoverForegroundColor;

  /// {@macro ShadButton.autofocus}
  final bool autofocus;

  /// {@macro ShadButton.focusNode}
  final FocusNode? buttonFocusNode;

  /// {@macro ShadButton.pressedBackgroundColor}
  final Color? pressedBackgroundColor;

  /// {@macro ShadButton.pressedForegroundColor}
  final Color? pressedForegroundColor;

  /// {@macro ShadButton.shadows}
  final List<BoxShadow>? buttonShadows;

  /// {@macro ShadButton.gradient}
  final Gradient? gradient;

  /// {@macro ShadButton.textDecoration}
  final TextDecoration? textDecoration;

  /// {@macro ShadButton.hoverTextDecoration}
  final TextDecoration? hoverTextDecoration;

  /// {@macro ShadButton.decoration}
  final ShadDecoration? buttonDecoration;

  /// {@macro ShadButton.enabled}
  final bool enabled;

  /// {@macro ShadButton.statesController}
  final ShadStatesController? statesController;

  /// {@macro ShadButton.gap}
  final double? gap;

  /// {@macro ShadButton.mainAxisAlignment}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@macro ShadButton.crossAxisAlignment}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@macro ShadButton.hoverStrategies}
  final ShadHoverStrategies? hoverStrategies;

  /// {@macro ShadButton.onHoverChange}
  final ValueChanged<bool>? onHoverChange;

  /// {@macro ShadButton.onTapDown}
  final ValueChanged<TapDownDetails>? onTapDown;

  /// {@macro ShadButton.onTapUp}
  final ValueChanged<TapUpDetails>? onTapUp;

  /// {@macro ShadButton.onTapCancel}
  final VoidCallback? onTapCancel;

  /// {@macro ShadButton.onSecondaryTapDown}
  final ValueChanged<TapDownDetails>? onSecondaryTapDown;

  /// {@macro ShadButton.onSecondaryTapUp}
  final ValueChanged<TapUpDetails>? onSecondaryTapUp;

  /// {@macro ShadButton.onSecondaryTapCancel}
  final VoidCallback? onSecondaryTapCancel;

  /// {@macro ShadButton.onLongPressStart}
  final ValueChanged<LongPressStartDetails>? onLongPressStart;

  /// {@macro ShadButton.onLongPressCancel}
  final VoidCallback? onLongPressCancel;

  /// {@macro ShadButton.onLongPressUp}
  final VoidCallback? onLongPressUp;

  /// {@macro ShadButton.onLongPressDown}
  final ValueChanged<LongPressDownDetails>? onLongPressDown;

  /// {@macro ShadButton.onLongPressEnd}
  final ValueChanged<LongPressEndDetails>? onLongPressEnd;

  /// {@macro ShadButton.onDoubleTap}
  final VoidCallback? onDoubleTap;

  /// {@macro ShadButton.onDoubleTapDown}
  final ValueChanged<TapDownDetails>? onDoubleTapDown;

  /// {@macro ShadButton.onDoubleTapCancel}
  final VoidCallback? onDoubleTapCancel;

  /// {@macro ShadButton.longPressDuration}
  final Duration? longPressDuration;

  /// {@macro ShadButton.textDirection}
  final TextDirection? textDirection;

  /// {@macro ShadButton.onFocusChange}
  final ValueChanged<bool>? onFocusChange;

  /// {@macro ShadButton.expands}
  final bool? expands;

  /// {@macro ShadButton.textStyle}
  final TextStyle? buttonTextStyle;

  @override
  State<ShadDatePicker> createState() => _ShadDatePickerState();
}

class _ShadDatePickerState extends State<ShadDatePicker> {
  late DateTime? selected = widget.selected;
  late ShadDateTimeRange? selectedRange = widget.selectedRange;
  final _groupId = UniqueKey();

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
  void didUpdateWidget(covariant ShadDatePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selected != null) {
      selected = widget.selected;
    }
    if (widget.selectedRange != null) {
      selectedRange = widget.selectedRange;
    }
  }

  @override
  void dispose() {
    _popoverController?.dispose();
    super.dispose();
  }

  String defaultDateFormat(DateTime date, Locale locale) {
    final ordinalDay = date.getOrdinalDay();
    final month = intl.DateFormat(
      'MMMM',
      locale.toLanguageTag(),
    ).format(date); // October
    final year = intl.DateFormat(
      'y',
      locale.toLanguageTag(),
    ).format(date); // 2024
    return '$month $ordinalDay, $year'; // October 1st, 2024
  }

  String defaultDateRangeFormat(ShadDateTimeRange range, Locale locale) {
    if (range.start == null) return '';
    final buffer = StringBuffer();

    final start = intl.DateFormat.yMMMd(
      locale.toLanguageTag(),
    ).format(range.start!);
    buffer.write(start);

    if (range.end != null) {
      final end = intl.DateFormat.yMMMd(
        locale.toLanguageTag(),
      ).format(range.end!);
      buffer.write(' - $end');
    }

    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final isSelected = switch (widget.variant) {
      ShadDatePickerVariant.single => selected != null,
      ShadDatePickerVariant.range =>
        selectedRange != null && selectedRange!.start != null,
    };

    final locale = Localizations.localeOf(context);

    final effectiveFormatDate =
        widget.formatDate ??
        theme.datePickerTheme.formatDate ??
        (date) => defaultDateFormat(date, locale);

    final effectiveFormatDateRange =
        widget.formatDateRange ??
        theme.datePickerTheme.formatDateRange ??
        (range) => defaultDateRangeFormat(range, locale);

    final effectiveAllowDeselection =
        widget.allowDeselection ??
        theme.datePickerTheme.allowDeselection ??
        true;
    final effectiveCalendarDecoration =
        widget.calendarDecoration ??
        theme.datePickerTheme.calendarDecoration ??
        ShadDecoration.none;

    final effectiveExpands =
        widget.expands ?? theme.datePickerTheme.expands ?? false;

    final effectiveGroupId = widget.groupId ?? _groupId;

    final effectiveButtonTextStyle =
        widget.buttonTextStyle ?? theme.datePickerTheme.buttonTextStyle;

    return ShadPopover(
      controller: popoverController,
      groupId: effectiveGroupId,
      padding: widget.popoverPadding ?? theme.datePickerTheme.popoverPadding,
      focusNode: widget.focusNode,
      closeOnTapOutside: widget.closeOnTapOutside,
      anchor: widget.anchor ?? theme.datePickerTheme.anchor,
      effects: widget.effects ?? theme.datePickerTheme.effects,
      shadows: widget.shadows ?? theme.datePickerTheme.shadows,
      decoration:
          widget.popoverDecoration ?? theme.datePickerTheme.popoverDecoration,
      filter: widget.filter ?? theme.datePickerTheme.filter,
      areaGroupId: widget.areaGroupId,
      useSameGroupIdForChild: widget.useSameGroupIdForChild,
      reverseDuration:
          widget.popoverReverseDuration ??
          theme.datePickerTheme.popoverReverseDuration,
      popover: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.header != null) widget.header!,
            ShadCalendar.raw(
              variant: switch (widget.variant) {
                ShadDatePickerVariant.single => ShadCalendarVariant.single,
                ShadDatePickerVariant.range => ShadCalendarVariant.range,
              },
              selected: selected,
              groupId: effectiveGroupId,
              selectedRange: selectedRange,
              allowDeselection: effectiveAllowDeselection,
              showOutsideDays:
                  widget.showOutsideDays ??
                  theme.datePickerTheme.showOutsideDays,
              decoration: effectiveCalendarDecoration,
              initialMonth: widget.initialMonth,
              formatMonthYear:
                  widget.formatMonthYear ??
                  theme.datePickerTheme.formatMonthYear,
              formatMonth:
                  widget.formatMonth ?? theme.datePickerTheme.formatMonth,
              formatYear: widget.formatYear ?? theme.datePickerTheme.formatYear,
              formatWeekday:
                  widget.formatWeekday ?? theme.datePickerTheme.formatWeekday,
              showWeekNumbers:
                  widget.showWeekNumbers ??
                  theme.datePickerTheme.showWeekNumbers,
              weekStartsOn:
                  widget.weekStartsOn ?? theme.datePickerTheme.weekStartsOn,
              fixedWeeks: widget.fixedWeeks ?? theme.datePickerTheme.fixedWeeks,
              hideWeekdayNames:
                  widget.hideWeekdayNames ??
                  theme.datePickerTheme.hideWeekdayNames,
              numberOfMonths: widget.numberOfMonths,
              fromMonth: widget.fromMonth,
              toMonth: widget.toMonth,
              onMonthChanged: widget.onMonthChanged,
              reverseMonths: widget.reverseMonths,
              min: widget.min,
              max: widget.max,
              selectableDayPredicate: widget.selectableDayPredicate,
              captionLayout:
                  widget.captionLayout ?? theme.datePickerTheme.captionLayout,
              hideNavigation:
                  widget.hideNavigation ?? theme.datePickerTheme.hideNavigation,
              yearSelectorMinWidth:
                  widget.yearSelectorMinWidth ??
                  theme.datePickerTheme.yearSelectorMinWidth,
              monthSelectorMinWidth:
                  widget.monthSelectorMinWidth ??
                  theme.datePickerTheme.monthSelectorMinWidth,
              yearSelectorPadding:
                  widget.yearSelectorPadding ??
                  theme.datePickerTheme.yearSelectorPadding,
              monthSelectorPadding:
                  widget.monthSelectorPadding ??
                  theme.datePickerTheme.monthSelectorPadding,
              navigationButtonSize:
                  widget.navigationButtonSize ??
                  theme.datePickerTheme.navigationButtonSize,
              navigationButtonIconSize:
                  widget.navigationButtonIconSize ??
                  theme.datePickerTheme.navigationButtonIconSize,
              backNavigationButtonIconData:
                  widget.backNavigationButtonIconData ??
                  theme.datePickerTheme.backNavigationButtonIconData,
              forwardNavigationButtonIconData:
                  widget.forwardNavigationButtonIconData ??
                  theme.datePickerTheme.forwardNavigationButtonIconData,
              navigationButtonPadding:
                  widget.navigationButtonPadding ??
                  theme.datePickerTheme.navigationButtonPadding,
              navigationButtonDisabledOpacity:
                  widget.navigationButtonDisabledOpacity ??
                  theme.datePickerTheme.navigationButtonDisabledOpacity,
              spacingBetweenMonths:
                  widget.spacingBetweenMonths ??
                  theme.datePickerTheme.spacingBetweenMonths,
              runSpacingBetweenMonths:
                  widget.runSpacingBetweenMonths ??
                  theme.datePickerTheme.runSpacingBetweenMonths,
              monthConstraints:
                  widget.monthConstraints ??
                  theme.datePickerTheme.monthConstraints,
              headerHeight:
                  widget.calendarHeaderHeight ??
                  theme.datePickerTheme.calendarHeaderHeight,
              headerPadding:
                  widget.calendarHeaderPadding ??
                  theme.datePickerTheme.calendarHeaderPadding,
              captionLayoutGap:
                  widget.captionLayoutGap ??
                  theme.datePickerTheme.captionLayoutGap,
              headerTextStyle:
                  widget.calendarHeaderTextStyle ??
                  theme.datePickerTheme.calendarHeaderTextStyle,
              weekdaysPadding:
                  widget.weekdaysPadding ??
                  theme.datePickerTheme.weekdaysPadding,
              weekdaysTextStyle:
                  widget.weekdaysTextStyle ??
                  theme.datePickerTheme.weekdaysTextStyle,
              weekdaysTextAlign:
                  widget.weekdaysTextAlign ??
                  theme.datePickerTheme.weekdaysTextAlign,
              weekNumbersHeaderText:
                  widget.weekNumbersHeaderText ??
                  theme.datePickerTheme.weekNumbersHeaderText,
              weekNumbersTextStyle:
                  widget.weekNumbersTextStyle ??
                  theme.datePickerTheme.weekNumbersTextStyle,
              weekNumbersTextAlign:
                  widget.weekNumbersTextAlign ??
                  theme.datePickerTheme.weekNumbersTextAlign,
              weekNumbersHeaderTextStyle:
                  widget.weekNumbersHeaderTextStyle ??
                  theme.datePickerTheme.weekNumbersHeaderTextStyle,
              dayButtonSize:
                  widget.dayButtonSize ?? theme.datePickerTheme.dayButtonSize,
              dayButtonOutsideMonthOpacity:
                  widget.dayButtonOutsideMonthOpacity ??
                  theme.datePickerTheme.dayButtonOutsideMonthOpacity,
              dayButtonPadding:
                  widget.dayButtonPadding ??
                  theme.datePickerTheme.dayButtonPadding,
              dayButtonDecoration:
                  widget.dayButtonDecoration ??
                  theme.datePickerTheme.dayButtonDecoration,
              dayButtonTextStyle:
                  widget.dayButtonTextStyle ??
                  theme.datePickerTheme.dayButtonTextStyle,
              dayButtonVariant:
                  widget.dayButtonVariant ??
                  theme.datePickerTheme.dayButtonVariant,
              dayButtonOutsideMonthVariant:
                  widget.dayButtonOutsideMonthVariant ??
                  theme.datePickerTheme.dayButtonOutsideMonthVariant,
              dayButtonOutsideMonthTextStyle:
                  widget.dayButtonOutsideMonthTextStyle ??
                  theme.datePickerTheme.dayButtonOutsideMonthTextStyle,
              selectedDayButtonVariant:
                  widget.selectedDayButtonVariant ??
                  theme.datePickerTheme.selectedDayButtonVariant,
              selectedDayButtonTextStyle:
                  widget.selectedDayButtonTextStyle ??
                  theme.datePickerTheme.selectedDayButtonTextStyle,
              selectedDayButtonOusideMonthVariant:
                  widget.selectedDayButtonOusideMonthVariant ??
                  theme.datePickerTheme.selectedDayButtonOusideMonthVariant,
              insideRangeDayButtonVariant:
                  widget.insideRangeDayButtonVariant ??
                  theme.datePickerTheme.insideRangeDayButtonVariant,
              insideRangeDayButtonTextStyle:
                  widget.insideRangeDayButtonTextStyle ??
                  theme.datePickerTheme.insideRangeDayButtonTextStyle,
              todayButtonVariant:
                  widget.todayButtonVariant ??
                  theme.datePickerTheme.todayButtonVariant,
              gridMainAxisSpacing:
                  widget.gridMainAxisSpacing ??
                  theme.datePickerTheme.gridMainAxisSpacing,
              gridCrossAxisSpacing:
                  widget.gridCrossAxisSpacing ??
                  theme.datePickerTheme.gridCrossAxisSpacing,
              onChanged: (selected) {
                setState(() => this.selected = selected);
                if (true == widget.closeOnSelection) {
                  popoverController.hide();
                }
                widget.onChanged?.call(selected);
              },
              onRangeChanged: (range) {
                setState(() => selectedRange = range);
                if (true == widget.closeOnSelection &&
                    range?.start != null &&
                    range?.end != null) {
                  popoverController.hide();
                }
                widget.onRangeChanged?.call(range);
              },
              multipleSelected: widget.multipleSelected,
            ),
            if (widget.footer != null) widget.footer!,
          ],
        );
      },
      child: ShadButton.raw(
        decoration: widget.buttonDecoration,
        variant:
            widget.buttonVariant ??
            theme.datePickerTheme.buttonVariant ??
            ShadButtonVariant.outline,
        width: widget.width ?? theme.datePickerTheme.width ?? 276,
        mainAxisAlignment:
            widget.mainAxisAlignment ??
            theme.datePickerTheme.mainAxisAlignment ??
            MainAxisAlignment.start,
        leading:
            widget.icon ??
            Icon(
              widget.iconData ??
                  theme.datePickerTheme.iconData ??
                  LucideIcons.calendar,
              size: 16,
              color: isSelected
                  ? theme.colorScheme.foreground
                  : theme.colorScheme.mutedForeground,
            ),
        onPressed:
            widget.onPressed ??
            () {
              popoverController.toggle();
            },
        onLongPress: widget.onLongPress,
        onTapUp: widget.onTapUp,
        onTapDown: widget.onTapDown,
        onTapCancel: widget.onTapCancel,
        onDoubleTap: widget.onDoubleTap,
        onHoverChange: widget.onHoverChange,
        onSecondaryTapDown: widget.onSecondaryTapDown,
        onLongPressUp: widget.onLongPressUp,
        onLongPressDown: widget.onLongPressDown,
        onLongPressEnd: widget.onLongPressEnd,
        onLongPressStart: widget.onLongPressStart,
        onLongPressCancel: widget.onLongPressCancel,
        onDoubleTapDown: widget.onDoubleTapDown,
        onFocusChange: widget.onFocusChange,
        onSecondaryTapUp: widget.onSecondaryTapUp,
        onSecondaryTapCancel: widget.onSecondaryTapCancel,
        onDoubleTapCancel: widget.onDoubleTapCancel,
        cursor: widget.cursor ?? theme.datePickerTheme.cursor,
        height: widget.height ?? theme.datePickerTheme.height,
        padding: widget.buttonPadding ?? theme.datePickerTheme.buttonPadding,
        backgroundColor:
            widget.backgroundColor ?? theme.datePickerTheme.backgroundColor,
        hoverBackgroundColor:
            widget.hoverBackgroundColor ??
            theme.datePickerTheme.hoverBackgroundColor,
        foregroundColor:
            widget.foregroundColor ?? theme.datePickerTheme.foregroundColor,
        hoverForegroundColor:
            widget.hoverForegroundColor ??
            theme.datePickerTheme.hoverForegroundColor,
        autofocus: widget.autofocus,
        focusNode: widget.buttonFocusNode,
        pressedBackgroundColor:
            widget.pressedBackgroundColor ??
            theme.datePickerTheme.pressedBackgroundColor,
        pressedForegroundColor:
            widget.pressedForegroundColor ??
            theme.datePickerTheme.pressedForegroundColor,
        shadows: widget.buttonShadows ?? theme.datePickerTheme.buttonShadows,
        gradient: widget.gradient ?? theme.datePickerTheme.gradient,
        textDecoration:
            widget.textDecoration ?? theme.datePickerTheme.textDecoration,
        hoverTextDecoration:
            widget.hoverTextDecoration ??
            theme.datePickerTheme.hoverTextDecoration,
        enabled: widget.enabled,
        gap: widget.gap ?? theme.datePickerTheme.gap,
        crossAxisAlignment:
            widget.crossAxisAlignment ??
            theme.datePickerTheme.crossAxisAlignment,
        longPressDuration:
            widget.longPressDuration ?? theme.datePickerTheme.longPressDuration,
        statesController: widget.statesController,
        hoverStrategies:
            widget.hoverStrategies ?? theme.datePickerTheme.hoverStrategies,
        textDirection: widget.textDirection,
        expands: effectiveExpands,
        textStyle: effectiveButtonTextStyle,
        child:
            widget.buttonChild ??
            (isSelected
                ? Text(
                    switch (widget.variant) {
                      ShadDatePickerVariant.single => effectiveFormatDate(
                        selected!,
                      ),
                      ShadDatePickerVariant.range => effectiveFormatDateRange(
                        selectedRange!,
                      ),
                    },
                    style: effectiveButtonTextStyle,
                  )
                : DefaultTextStyle(
                    style: theme.textTheme.muted.fallback(
                      color: theme.colorScheme.mutedForeground,
                    ),
                    child: widget.placeholder ?? const Text('Select date'),
                  )),
      ),
    );
  }
}
