import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/calendar.dart';
import 'package:shadcn_ui/src/components/date_picker.dart';
import 'package:shadcn_ui/src/components/form/field.dart';
import 'package:shadcn_ui/src/components/popover.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';
import 'package:shadcn_ui/src/utils/states_controller.dart';

class ShadDateRangePickerFormField
    extends ShadFormBuilderField<ShadDateTimeRange> {
  ShadDateRangePickerFormField({
    super.id,
    super.key,
    super.onSaved,
    super.forceErrorText,
    super.label,
    super.error,
    super.description,

    /// {@macro ShadCalendar.onChanged}
    super.onChanged,
    super.valueTransformer,
    super.onReset,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,

    /// {@macro ShadPopover.focusNode}
    super.focusNode,
    super.validator,
    super.initialValue,

    /// {@macro ShadDatePicker.placeholder}
    Widget? placeholder,

    /// {@macro ShadDatePicker.popoverController}
    ShadPopoverController? popoverController,

    /// {@macro ShadDatePicker.closeOnSelection}
    bool? closeOnSelection,

    /// {@macro ShadDatePicker.formatDateRange}
    String Function(ShadDateTimeRange)? formatDateRange,

    /// {@macro ShadDatePicker.allowDeselection}
    bool? allowDeselection,

    /// {@macro ShadDatePicker.header}
    Widget? header,

    /// {@macro ShadDatePicker.footer}
    Widget? footer,

    /// {@macro ShadPopover.groupId}
    Object? groupId,

    /// {@macro ShadDatePicker.calendarDecoration}
    ShadDecoration? calendarDecoration,

    /// {@macro ShadPopover.padding}
    EdgeInsetsGeometry? popoverPadding,

    /// {@macro ShadCalendar.multipleSelected}
    List<DateTime>? multipleSelected,

    /// {@macro ShadCalendar.onMultipleChanged}
    ValueChanged<List<DateTime>>? onMultipleChanged,

    /// {@macro ShadCalendar.showOutsideDays}
    bool? showOutsideDays,

    /// {@macro ShadCalendar.initialMonth}
    DateTime? initialMonth,

    /// {@macro ShadCalendar.formatMonthYear}
    String Function(DateTime date)? formatMonthYear,

    /// {@macro ShadCalendar.formatMonth}
    String Function(DateTime date)? formatMonth,

    /// {@macro ShadCalendar.formatYear}
    String Function(DateTime date)? formatYear,

    /// {@macro ShadCalendar.formatWeekday}
    String Function(DateTime date)? formatWeekday,

    /// {@macro ShadCalendar.showWeekNumbers}
    bool? showWeekNumbers,

    /// {@macro ShadCalendar.weekStartsOn}
    int? weekStartsOn,

    /// {@macro ShadCalendar.fixedWeeks}
    bool? fixedWeeks,

    /// {@macro ShadCalendar.hideWeekdayNames}
    bool? hideWeekdayNames,

    /// {@macro ShadCalendar.numberOfMonths}
    int numberOfMonths = 1,

    /// {@macro ShadCalendar.fromMonth}
    DateTime? fromMonth,

    /// {@macro ShadCalendar.toMonth}
    DateTime? toMonth,

    /// {@macro ShadCalendar.onMonthChanged}
    ValueChanged<DateTime>? onMonthChanged,

    /// {@macro ShadCalendar.reverseMonths}
    bool reverseMonths = false,

    /// {@macro ShadCalendar.min}
    int? min,

    /// {@macro ShadCalendar.max}
    int? max,

    /// {@macro ShadCalendar.selectableDayPredicate}
    bool Function(DateTime day)? selectableDayPredicate,

    /// {@macro ShadCalendar.captionLayout}
    ShadCalendarCaptionLayout? captionLayout,

    /// {@macro ShadCalendar.hideNavigation}
    bool? hideNavigation,

    /// {@macro ShadCalendar.yearSelectorMinWidth}
    double? yearSelectorMinWidth,

    /// {@macro ShadCalendar.monthSelectorMinWidth}
    double? monthSelectorMinWidth,

    /// {@macro ShadCalendar.yearSelectorPadding}
    EdgeInsetsGeometry? yearSelectorPadding,

    /// {@macro ShadCalendar.monthSelectorPadding}
    EdgeInsetsGeometry? monthSelectorPadding,

    /// {@macro ShadCalendar.navigationButtonSize}
    double? navigationButtonSize,

    /// {@macro ShadCalendar.navigationButtonIconSize}
    double? navigationButtonIconSize,

    /// {@macro ShadCalendar.backNavigationButtonIconData}
    IconData? backNavigationButtonIconData,

    /// {@macro ShadCalendar.forwardNavigationButtonIconData}
    IconData? forwardNavigationButtonIconData,

    /// {@macro ShadCalendar.navigationButtonPadding}
    EdgeInsetsGeometry? navigationButtonPadding,

    /// {@macro ShadCalendar.navigationButtonDisabledOpacity}
    double? navigationButtonDisabledOpacity,

    /// {@macro ShadCalendar.spacingBetweenMonths}
    double? spacingBetweenMonths,

    /// {@macro ShadCalendar.runSpacingBetweenMonths}
    double? runSpacingBetweenMonths,

    /// {@macro ShadCalendar.monthConstraints}
    BoxConstraints? monthConstraints,

    /// {@macro ShadCalendar.headerHeight}
    double? calendarHeaderHeight,

    /// {@macro ShadCalendar.headerPadding}
    EdgeInsetsGeometry? calendarHeaderPadding,

    /// {@macro ShadCalendar.captionLayoutGap}
    double? captionLayoutGap,

    /// {@macro ShadCalendar.headerTextStyle}
    TextStyle? calendarHeaderTextStyle,

    /// {@macro ShadCalendar.weekdaysPadding}
    EdgeInsetsGeometry? weekdaysPadding,

    /// {@macro ShadCalendar.weekdaysTextStyle}
    TextStyle? weekdaysTextStyle,

    /// {@macro ShadCalendar.weekdaysTextAlign}
    TextAlign? weekdaysTextAlign,

    /// {@macro ShadCalendar.weekNumbersHeaderText}
    String? weekNumbersHeaderText,

    /// {@macro ShadCalendar.weekNumbersHeaderTextStyle}
    TextStyle? weekNumbersHeaderTextStyle,

    /// {@macro ShadCalendar.weekNumbersTextStyle}
    TextStyle? weekNumbersTextStyle,

    /// {@macro ShadCalendar.weekNumbersTextAlign}
    TextAlign? weekNumbersTextAlign,

    /// {@macro ShadCalendar.dayButtonSize}
    double? dayButtonSize,

    /// {@macro ShadCalendar.dayButtonOutsideMonthOpacity}
    double? dayButtonOutsideMonthOpacity,

    /// {@macro ShadCalendar.dayButtonPadding}
    EdgeInsetsGeometry? dayButtonPadding,

    /// {@macro ShadCalendar.dayButtonDecoration}
    ShadDecoration? dayButtonDecoration,

    /// {@macro ShadCalendar.selectedDayButtonTextStyle}
    TextStyle? selectedDayButtonTextStyle,

    /// {@macro ShadCalendar.insideRangeDayButtonTextStyle}
    TextStyle? insideRangeDayButtonTextStyle,

    /// {@macro ShadCalendar.dayButtonTextStyle}
    TextStyle? dayButtonTextStyle,

    /// {@macro ShadCalendar.dayButtonVariant}
    ShadButtonVariant? dayButtonVariant,

    /// {@macro ShadCalendar.selectedDayButtonVariant}
    ShadButtonVariant? selectedDayButtonVariant,

    /// {@macro ShadCalendar.insideRangeDayButtonVariant}
    ShadButtonVariant? insideRangeDayButtonVariant,

    /// {@macro ShadCalendar.todayButtonVariant}
    ShadButtonVariant? todayButtonVariant,

    /// {@macro ShadCalendar.gridMainAxisSpacing}
    double? gridMainAxisSpacing,

    /// {@macro ShadCalendar.gridCrossAxisSpacing}
    double? gridCrossAxisSpacing,

    /// {@macro ShadCalendar.dayButtonOutsideMonthTextStyle}
    TextStyle? dayButtonOutsideMonthTextStyle,

    /// {@macro ShadCalendar.dayButtonOutsideMonthVariant}
    ShadButtonVariant? dayButtonOutsideMonthVariant,

    /// {@macro ShadCalendar.selectedDayButtonOusideMonthVariant}
    ShadButtonVariant? selectedDayButtonOusideMonthVariant,

    // ---
    // POPOVER
    // ---

    /// {@macro ShadPopover.closeOnTapOutside}
    bool closeOnTapOutside = true,

    ///{@macro ShadPopover.anchor}
    ShadAnchorBase? anchor,

    /// {@macro ShadPopover.effects}
    List<Effect<dynamic>>? effects,

    /// {@macro ShadPopover.shadows}
    List<BoxShadow>? shadows,

    /// {@macro ShadPopover.decoration}
    ShadDecoration? popoverDecoration,

    /// {@macro ShadPopover.filter}
    ImageFilter? filter,

    /// {@macro ShadMouseArea.groupId}
    Object? areaGroupId,

    /// {@macro ShadPopover.useSameGroupIdForChild}
    bool useSameGroupIdForChild = true,

    // ---
    // BUTTON
    // ---

    /// {@macro ShadButton.onPressed}
    VoidCallback? onPressed,

    /// {@macro ShadButton.onLongPress}
    VoidCallback? onLongPress,

    /// {@macro ShadButton.icon}
    Widget? icon,

    /// {@macro ShadDatePicker.iconData}
    IconData? iconData,

    /// {@macro ShadButton.child}
    Widget? buttonChild,

    /// {@macro ShadButton.variant}
    ShadButtonVariant? buttonVariant,

    /// {@macro ShadButton.size}
    ShadButtonSize? size,

    /// {@macro ShadButton.cursor}
    MouseCursor? cursor,

    /// {@macro ShadButton.width}
    double? width,

    /// {@macro ShadButton.height}
    double? height,

    /// {@macro ShadButton.padding}
    EdgeInsetsGeometry? buttonPadding,

    /// {@macro ShadButton.backgroundColor}
    Color? backgroundColor,

    /// {@macro ShadButton.hoverBackgroundColor}
    Color? hoverBackgroundColor,

    /// {@macro ShadButton.foregroundColor}
    Color? foregroundColor,

    /// {@macro ShadButton.hoverForegroundColor}
    Color? hoverForegroundColor,

    /// {@macro ShadButton.autofocus}
    bool autofocus = false,

    /// {@macro ShadButton.focusNode}
    FocusNode? buttonFocusNode,

    /// {@macro ShadButton.pressedBackgroundColor}
    Color? pressedBackgroundColor,

    /// {@macro ShadButton.pressedForegroundColor}
    Color? pressedForegroundColor,

    /// {@macro ShadButton.shadows}
    List<BoxShadow>? buttonShadows,

    /// {@macro ShadButton.gradient}
    Gradient? gradient,

    /// {@macro ShadButton.textDecoration}
    TextDecoration? textDecoration,

    /// {@macro ShadButton.hoverTextDecoration}
    TextDecoration? hoverTextDecoration,

    /// {@macro ShadButton.decoration}
    ShadDecoration? buttonDecoration,

    /// {@macro ShadButton.statesController}
    ShadStatesController? statesController,

    /// {@macro ShadButton.gap}
    double? gap,

    /// {@macro ShadButton.mainAxisAlignment}
    MainAxisAlignment? mainAxisAlignment,

    /// {@macro ShadButton.crossAxisAlignment}
    CrossAxisAlignment? crossAxisAlignment,

    /// {@macro ShadButton.hoverStrategies}
    ShadHoverStrategies? hoverStrategies,

    /// {@macro ShadButton.onHoverChange}
    ValueChanged<bool>? onHoverChange,

    /// {@macro ShadButton.onTapDown}
    ValueChanged<TapDownDetails>? onTapDown,

    /// {@macro ShadButton.onTapUp}
    ValueChanged<TapUpDetails>? onTapUp,

    /// {@macro ShadButton.onTapCancel}
    VoidCallback? onTapCancel,

    /// {@macro ShadButton.onSecondaryTapDown}
    ValueChanged<TapDownDetails>? onSecondaryTapDown,

    /// {@macro ShadButton.onSecondaryTapUp}
    ValueChanged<TapUpDetails>? onSecondaryTapUp,

    /// {@macro ShadButton.onSecondaryTapCancel}
    VoidCallback? onSecondaryTapCancel,

    /// {@macro ShadButton.onLongPressStart}
    ValueChanged<LongPressStartDetails>? onLongPressStart,

    /// {@macro ShadButton.onLongPressCancel}
    VoidCallback? onLongPressCancel,

    /// {@macro ShadButton.onLongPressUp}
    VoidCallback? onLongPressUp,

    /// {@macro ShadButton.onLongPressDown}
    ValueChanged<LongPressDownDetails>? onLongPressDown,

    /// {@macro ShadButton.onLongPressEnd}
    ValueChanged<LongPressEndDetails>? onLongPressEnd,

    /// {@macro ShadButton.onDoubleTap}
    VoidCallback? onDoubleTap,

    /// {@macro ShadButton.onDoubleTapDown}
    ValueChanged<TapDownDetails>? onDoubleTapDown,

    /// {@macro ShadButton.onDoubleTapCancel}
    VoidCallback? onDoubleTapCancel,

    /// {@macro ShadButton.longPressDuration}
    Duration? longPressDuration,

    /// {@macro ShadButton.textDirection}
    TextDirection? textDirection,

    /// {@macro ShadButton.onFocusChange}
    ValueChanged<bool>? onFocusChange,

    /// {@macro ShadButton.expands}
    bool? expands,

    /// {@macro ShadButton.textStyle}
    TextStyle? buttonTextStyle,
  }) : super(
         builder: (field) {
           final state = field as _ShadFormBuilderDateRangePickerState;
           return ShadDatePicker.range(
             onRangeChanged: state.didChange,
             enabled: state.enabled,
             focusNode: state.focusNode,
             icon: icon,
             decoration: state.decoration,
             selected: state.value,
             popoverController: popoverController,
             closeOnSelection: closeOnSelection,
             formatDateRange: formatDateRange,
             allowDeselection: allowDeselection,
             header: header,
             footer: footer,
             groupId: groupId,
             calendarDecoration: calendarDecoration,
             popoverPadding: popoverPadding,
             multipleSelected: multipleSelected,
             onMultipleChanged: onMultipleChanged,
             showOutsideDays: showOutsideDays,
             initialMonth: initialMonth,
             formatMonthYear: formatMonthYear,
             formatMonth: formatMonth,
             formatYear: formatYear,
             formatWeekday: formatWeekday,
             showWeekNumbers: showWeekNumbers,
             weekStartsOn: weekStartsOn,
             fixedWeeks: fixedWeeks,
             hideWeekdayNames: hideWeekdayNames,
             numberOfMonths: numberOfMonths,
             fromMonth: fromMonth,
             toMonth: toMonth,
             onMonthChanged: onMonthChanged,
             reverseMonths: reverseMonths,
             min: min,
             max: max,
             selectableDayPredicate: selectableDayPredicate,
             captionLayout: captionLayout,
             hideNavigation: hideNavigation,
             yearSelectorMinWidth: yearSelectorMinWidth,
             monthSelectorMinWidth: monthSelectorMinWidth,
             yearSelectorPadding: yearSelectorPadding,
             monthSelectorPadding: monthSelectorPadding,
             navigationButtonSize: navigationButtonSize,
             navigationButtonIconSize: navigationButtonIconSize,
             backNavigationButtonIconData: backNavigationButtonIconData,
             forwardNavigationButtonIconData: forwardNavigationButtonIconData,
             navigationButtonPadding: navigationButtonPadding,
             navigationButtonDisabledOpacity: navigationButtonDisabledOpacity,
             spacingBetweenMonths: spacingBetweenMonths,
             runSpacingBetweenMonths: runSpacingBetweenMonths,
             monthConstraints: monthConstraints,
             calendarHeaderHeight: calendarHeaderHeight,
             calendarHeaderPadding: calendarHeaderPadding,
             captionLayoutGap: captionLayoutGap,
             calendarHeaderTextStyle: calendarHeaderTextStyle,
             weekdaysPadding: weekdaysPadding,
             weekdaysTextStyle: weekdaysTextStyle,
             weekdaysTextAlign: weekdaysTextAlign,
             weekNumbersHeaderText: weekNumbersHeaderText,
             weekNumbersHeaderTextStyle: weekNumbersHeaderTextStyle,
             weekNumbersTextStyle: weekNumbersTextStyle,
             weekNumbersTextAlign: weekNumbersTextAlign,
             dayButtonSize: dayButtonSize,
             dayButtonOutsideMonthOpacity: dayButtonOutsideMonthOpacity,
             dayButtonPadding: dayButtonPadding,
             dayButtonDecoration: dayButtonDecoration,
             selectedDayButtonTextStyle: selectedDayButtonTextStyle,
             insideRangeDayButtonTextStyle: insideRangeDayButtonTextStyle,
             dayButtonTextStyle: dayButtonTextStyle,
             dayButtonVariant: dayButtonVariant,
             selectedDayButtonVariant: selectedDayButtonVariant,
             insideRangeDayButtonVariant: insideRangeDayButtonVariant,
             todayButtonVariant: todayButtonVariant,
             gridMainAxisSpacing: gridMainAxisSpacing,
             gridCrossAxisSpacing: gridCrossAxisSpacing,
             dayButtonOutsideMonthTextStyle: dayButtonOutsideMonthTextStyle,
             dayButtonOutsideMonthVariant: dayButtonOutsideMonthVariant,
             selectedDayButtonOusideMonthVariant:
                 selectedDayButtonOusideMonthVariant,
             closeOnTapOutside: closeOnTapOutside,
             anchor: anchor,
             effects: effects,
             shadows: shadows,
             popoverDecoration: popoverDecoration,
             filter: filter,
             areaGroupId: areaGroupId,
             useSameGroupIdForChild: useSameGroupIdForChild,
             onPressed: onPressed,
             onLongPress: onLongPress,
             iconData: iconData,
             buttonChild: buttonChild,
             buttonVariant: buttonVariant,
             size: size,
             cursor: cursor,
             width: width,
             height: height,
             buttonPadding: buttonPadding,
             backgroundColor: backgroundColor,
             hoverBackgroundColor: hoverBackgroundColor,
             foregroundColor: foregroundColor,
             hoverForegroundColor: hoverForegroundColor,
             autofocus: autofocus,
             buttonFocusNode: buttonFocusNode,
             pressedBackgroundColor: pressedBackgroundColor,
             pressedForegroundColor: pressedForegroundColor,
             buttonShadows: buttonShadows,
             gradient: gradient,
             textDecoration: textDecoration,
             hoverTextDecoration: hoverTextDecoration,
             buttonDecoration: buttonDecoration,
             statesController: statesController,
             gap: gap,
             mainAxisAlignment: mainAxisAlignment,
             crossAxisAlignment: crossAxisAlignment,
             hoverStrategies: hoverStrategies,
             onHoverChange: onHoverChange,
             onTapDown: onTapDown,
             onTapUp: onTapUp,
             onTapCancel: onTapCancel,
             onSecondaryTapDown: onSecondaryTapDown,
             onSecondaryTapUp: onSecondaryTapUp,
             onSecondaryTapCancel: onSecondaryTapCancel,
             onLongPressStart: onLongPressStart,
             onLongPressCancel: onLongPressCancel,
             onLongPressUp: onLongPressUp,
             onLongPressDown: onLongPressDown,
             onLongPressEnd: onLongPressEnd,
             onDoubleTap: onDoubleTap,
             onDoubleTapDown: onDoubleTapDown,
             onDoubleTapCancel: onDoubleTapCancel,
             longPressDuration: longPressDuration,
             textDirection: textDirection,
             onFocusChange: onFocusChange,
             placeholder: placeholder,
             expands: expands,
             buttonTextStyle: buttonTextStyle,
           );
         },
       );

  @override
  ShadFormBuilderFieldState<ShadDateRangePickerFormField, ShadDateTimeRange>
  createState() => _ShadFormBuilderDateRangePickerState();
}

class _ShadFormBuilderDateRangePickerState
    extends
        ShadFormBuilderFieldState<
          ShadDateRangePickerFormField,
          ShadDateTimeRange
        > {}
