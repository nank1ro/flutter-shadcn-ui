import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart' as intl;
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/calendar.dart';
import 'package:shadcn_ui/src/components/image.dart';
import 'package:shadcn_ui/src/components/popover.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/extensions/date_time.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';
import 'package:shadcn_ui/src/utils/states_controller.dart';

enum ShadDatePickerVariant { single, range }

class ShadDatePicker extends StatefulWidget {
  const ShadDatePicker({
    super.key,
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
    this.backNavigationButtonSrc,
    this.forwardNavigationButtonSrc,
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
    this.applyIconColorFilter,
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
    this.iconSrc,
  })  : variant = ShadDatePickerVariant.single,
        selectedRange = null;

  const ShadDatePicker.range({
    super.key,
    this.popoverController,
    ShadDateTimeRange? selected,
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
    this.backNavigationButtonSrc,
    this.forwardNavigationButtonSrc,
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
    this.applyIconColorFilter,
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
    this.iconSrc,
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
    this.backNavigationButtonSrc,
    this.forwardNavigationButtonSrc,
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
    this.applyIconColorFilter,
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
    this.iconSrc,
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
  final EdgeInsets? popoverPadding;

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
  final SelectableDayPredicate? selectableDayPredicate;

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
  final EdgeInsets? yearSelectorPadding;

  /// {@macro ShadCalendar.monthSelectorPadding}
  final EdgeInsets? monthSelectorPadding;

  /// {@macro ShadCalendar.navigationButtonSize}
  final double? navigationButtonSize;

  /// {@macro ShadCalendar.navigationButtonIconSize}
  final double? navigationButtonIconSize;

  /// {@macro ShadCalendar.backNavigationButtonSrc}
  final ShadImageSrc? backNavigationButtonSrc;

  /// {@macro ShadCalendar.forwardNavigationButtonSrc}
  final ShadImageSrc? forwardNavigationButtonSrc;

  /// {@macro ShadCalendar.navigationButtonPadding}
  final EdgeInsets? navigationButtonPadding;

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
  final EdgeInsets? calendarHeaderPadding;

  /// {@macro ShadCalendar.captionLayoutGap}
  final double? captionLayoutGap;

  /// {@macro ShadCalendar.headerTextStyle}
  final TextStyle? calendarHeaderTextStyle;

  /// {@macro ShadCalendar.weekdaysPadding}
  final EdgeInsets? weekdaysPadding;

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
  final EdgeInsets? dayButtonPadding;

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

  // ---
  // BUTTON
  // ---

  /// {@macro ShadButton.onPressed}
  final VoidCallback? onPressed;

  /// {@macro ShadButton.onLongPress}
  final VoidCallback? onLongPress;

  /// {@macro ShadButton.icon}
  final Widget? icon;

  /// {@template ShadDatePicker.iconSrc}
  /// The icon of the date picker button, defaults to [LucideIcons.calendar].
  /// {@endtemplate}
  final ShadImageSrc? iconSrc;

  /// {@macro ShadButton.child}
  final Widget? buttonChild;

  /// {@macro ShadButton.variant}
  final ShadButtonVariant? buttonVariant;

  /// {@macro ShadButton.size}
  final ShadButtonSize? size;

  /// {@macro ShadButton.applyIconColorFilter}
  final bool? applyIconColorFilter;

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
  void didUpdateWidget(covariant ShadDatePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selected != null) {
      selected = widget.selected;
    }
  }

  @override
  void dispose() {
    _popoverController?.dispose();
    super.dispose();
  }

  String defaultDateFormat(DateTime date) {
    final dayWithSuffix = date.getDayWithSuffix();
    final month = intl.DateFormat('MMMM').format(date); // October
    final year = intl.DateFormat('y').format(date); // 2024
    return '$month $dayWithSuffix, $year'; // October 1st, 2024
  }

  String defaultDateRangeFormat(ShadDateTimeRange range) {
    if (range.start == null) return '';
    final buffer = StringBuffer();

    final start = intl.DateFormat.yMMMd().format(range.start!);
    buffer.write(start);

    if (range.end != null) {
      final end = intl.DateFormat.yMMMd().format(range.end!);
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

    final effectiveFormatDate = widget.formatDate ?? defaultDateFormat;
    final effectiveAllowDeselection = widget.allowDeselection ?? true;
    final effectiveCalendarDecoration =
        widget.calendarDecoration ?? ShadDecoration.none;

    return ShadPopover(
      controller: popoverController,
      groupId: widget.groupId,
      padding: widget.popoverPadding,
      focusNode: widget.focusNode,
      anchor: widget.anchor,
      effects: widget.effects,
      shadows: widget.shadows,
      decoration: widget.popoverDecoration,
      filter: widget.filter,
      areaGroupId: widget.areaGroupId,
      useSameGroupIdForChild: widget.useSameGroupIdForChild,
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
              selectedRange: selectedRange,
              allowDeselection: effectiveAllowDeselection,
              showOutsideDays: widget.showOutsideDays,
              decoration: effectiveCalendarDecoration,
              initialMonth: widget.initialMonth,
              formatMonthYear: widget.formatMonthYear,
              formatMonth: widget.formatMonth,
              formatYear: widget.formatYear,
              formatWeekday: widget.formatWeekday,
              showWeekNumbers: widget.showWeekNumbers,
              weekStartsOn: widget.weekStartsOn,
              fixedWeeks: widget.fixedWeeks,
              hideWeekdayNames: widget.hideWeekdayNames,
              numberOfMonths: widget.numberOfMonths,
              fromMonth: widget.fromMonth,
              toMonth: widget.toMonth,
              onMonthChanged: widget.onMonthChanged,
              reverseMonths: widget.reverseMonths,
              min: widget.min,
              max: widget.max,
              selectableDayPredicate: widget.selectableDayPredicate,
              captionLayout: widget.captionLayout,
              hideNavigation: widget.hideNavigation,
              yearSelectorMinWidth: widget.yearSelectorMinWidth,
              monthSelectorMinWidth: widget.monthSelectorMinWidth,
              yearSelectorPadding: widget.yearSelectorPadding,
              monthSelectorPadding: widget.monthSelectorPadding,
              navigationButtonSize: widget.navigationButtonSize,
              navigationButtonIconSize: widget.navigationButtonIconSize,
              backNavigationButtonSrc: widget.backNavigationButtonSrc,
              forwardNavigationButtonSrc: widget.forwardNavigationButtonSrc,
              navigationButtonPadding: widget.navigationButtonPadding,
              navigationButtonDisabledOpacity:
                  widget.navigationButtonDisabledOpacity,
              spacingBetweenMonths: widget.spacingBetweenMonths,
              runSpacingBetweenMonths: widget.runSpacingBetweenMonths,
              monthConstraints: widget.monthConstraints,
              headerHeight: widget.calendarHeaderHeight,
              headerPadding: widget.calendarHeaderPadding,
              captionLayoutGap: widget.captionLayoutGap,
              headerTextStyle: widget.calendarHeaderTextStyle,
              weekdaysPadding: widget.weekdaysPadding,
              weekdaysTextStyle: widget.weekdaysTextStyle,
              weekdaysTextAlign: widget.weekdaysTextAlign,
              weekNumbersHeaderText: widget.weekNumbersHeaderText,
              weekNumbersTextStyle: widget.weekNumbersTextStyle,
              weekNumbersTextAlign: widget.weekNumbersTextAlign,
              weekNumbersHeaderTextStyle: widget.weekNumbersHeaderTextStyle,
              dayButtonSize: widget.dayButtonSize,
              dayButtonOutsideMonthOpacity: widget.dayButtonOutsideMonthOpacity,
              dayButtonPadding: widget.dayButtonPadding,
              dayButtonDecoration: widget.dayButtonDecoration,
              dayButtonTextStyle: widget.dayButtonTextStyle,
              dayButtonVariant: widget.dayButtonVariant,
              dayButtonOutsideMonthVariant: widget.dayButtonOutsideMonthVariant,
              dayButtonOutsideMonthTextStyle:
                  widget.dayButtonOutsideMonthTextStyle,
              selectedDayButtonVariant: widget.selectedDayButtonVariant,
              selectedDayButtonTextStyle: widget.selectedDayButtonTextStyle,
              selectedDayButtonOusideMonthVariant:
                  widget.selectedDayButtonOusideMonthVariant,
              insideRangeDayButtonVariant: widget.insideRangeDayButtonVariant,
              insideRangeDayButtonTextStyle:
                  widget.insideRangeDayButtonTextStyle,
              todayButtonVariant: widget.todayButtonVariant,
              gridMainAxisSpacing: widget.gridMainAxisSpacing,
              gridCrossAxisSpacing: widget.gridCrossAxisSpacing,
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
        variant: widget.buttonVariant ?? ShadButtonVariant.outline,
        width: widget.width ?? 276,
        mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.start,
        applyIconColorFilter: widget.applyIconColorFilter ?? false,
        icon: widget.icon ??
            ShadImage.square(
              widget.iconSrc ?? LucideIcons.calendar,
              size: 16,
              color: isSelected
                  ? theme.colorScheme.foreground
                  : theme.colorScheme.mutedForeground,
            ),
        onPressed: widget.onPressed ??
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
        cursor: widget.cursor,
        height: widget.height,
        padding: widget.buttonPadding,
        backgroundColor: widget.backgroundColor,
        hoverBackgroundColor: widget.hoverBackgroundColor,
        foregroundColor: widget.foregroundColor,
        hoverForegroundColor: widget.hoverForegroundColor,
        autofocus: widget.autofocus,
        focusNode: widget.buttonFocusNode,
        pressedBackgroundColor: widget.pressedBackgroundColor,
        pressedForegroundColor: widget.pressedForegroundColor,
        shadows: widget.buttonShadows,
        gradient: widget.gradient,
        textDecoration: widget.textDecoration,
        hoverTextDecoration: widget.hoverTextDecoration,
        enabled: widget.enabled,
        gap: widget.gap,
        crossAxisAlignment: widget.crossAxisAlignment,
        longPressDuration: widget.longPressDuration,
        statesController: widget.statesController,
        hoverStrategies: widget.hoverStrategies,
        textDirection: widget.textDirection,
        child: widget.buttonChild ??
            (isSelected
                ? Text(
                    switch (widget.variant) {
                      ShadDatePickerVariant.single =>
                        effectiveFormatDate(selected!),
                      ShadDatePickerVariant.range =>
                        defaultDateRangeFormat(selectedRange!),
                    },
                  )
                : Text('Pick a date', style: theme.textTheme.muted)),
      ),
    );
  }
}
