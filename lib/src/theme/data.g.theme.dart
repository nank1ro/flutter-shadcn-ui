// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'data.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadThemeData {
  bool get canMerge => true;

  static ShadThemeData? lerp(ShadThemeData? a, ShadThemeData? b, double t) {
    if (a == null && b == null) {
      return null;
    }

    return ShadThemeData(
      colorScheme: a != null && b != null
          ? ShadColorScheme.lerp(a.colorScheme, b.colorScheme, t)
          : b?.colorScheme ?? a!.colorScheme,
      brightness: t < 0.5 ? a?.brightness : b?.brightness,
      primaryButtonTheme: ShadButtonTheme.lerp(
        a?.primaryButtonTheme,
        b?.primaryButtonTheme,
        t,
      )!,
      secondaryButtonTheme: ShadButtonTheme.lerp(
        a?.secondaryButtonTheme,
        b?.secondaryButtonTheme,
        t,
      )!,
      destructiveButtonTheme: ShadButtonTheme.lerp(
        a?.destructiveButtonTheme,
        b?.destructiveButtonTheme,
        t,
      )!,
      outlineButtonTheme: ShadButtonTheme.lerp(
        a?.outlineButtonTheme,
        b?.outlineButtonTheme,
        t,
      )!,
      ghostButtonTheme: ShadButtonTheme.lerp(
        a?.ghostButtonTheme,
        b?.ghostButtonTheme,
        t,
      )!,
      linkButtonTheme: ShadButtonTheme.lerp(
        a?.linkButtonTheme,
        b?.linkButtonTheme,
        t,
      )!,
      primaryBadgeTheme: ShadBadgeTheme.lerp(
        a?.primaryBadgeTheme,
        b?.primaryBadgeTheme,
        t,
      )!,
      secondaryBadgeTheme: ShadBadgeTheme.lerp(
        a?.secondaryBadgeTheme,
        b?.secondaryBadgeTheme,
        t,
      )!,
      destructiveBadgeTheme: ShadBadgeTheme.lerp(
        a?.destructiveBadgeTheme,
        b?.destructiveBadgeTheme,
        t,
      )!,
      outlineBadgeTheme: ShadBadgeTheme.lerp(
        a?.outlineBadgeTheme,
        b?.outlineBadgeTheme,
        t,
      )!,
      radius: BorderRadius.lerp(a?.radius, b?.radius, t)!,
      avatarTheme: ShadAvatarTheme.lerp(a?.avatarTheme, b?.avatarTheme, t)!,
      buttonSizesTheme: ShadButtonSizesTheme.lerp(
        a?.buttonSizesTheme,
        b?.buttonSizesTheme,
        t,
      )!,
      tooltipTheme: ShadTooltipTheme.lerp(a?.tooltipTheme, b?.tooltipTheme, t)!,
      popoverTheme: ShadPopoverTheme.lerp(a?.popoverTheme, b?.popoverTheme, t)!,
      decoration: ShadDecoration.lerp(a?.decoration, b?.decoration, t)!,
      textTheme: ShadTextTheme.lerp(a?.textTheme, b?.textTheme, t)!,
      disabledOpacity: lerpDouble$(a?.disabledOpacity, b?.disabledOpacity, t)!,
      selectTheme: ShadSelectTheme.lerp(a?.selectTheme, b?.selectTheme, t)!,
      optionTheme: ShadOptionTheme.lerp(a?.optionTheme, b?.optionTheme, t)!,
      cardTheme: ShadCardTheme.lerp(a?.cardTheme, b?.cardTheme, t)!,
      switchTheme: ShadSwitchTheme.lerp(a?.switchTheme, b?.switchTheme, t)!,
      checkboxTheme: ShadCheckboxTheme.lerp(
        a?.checkboxTheme,
        b?.checkboxTheme,
        t,
      )!,
      inputTheme: ShadInputTheme.lerp(a?.inputTheme, b?.inputTheme, t)!,
      radioTheme: ShadRadioTheme.lerp(a?.radioTheme, b?.radioTheme, t)!,
      primaryToastTheme: ShadToastTheme.lerp(
        a?.primaryToastTheme,
        b?.primaryToastTheme,
        t,
      )!,
      destructiveToastTheme: ShadToastTheme.lerp(
        a?.destructiveToastTheme,
        b?.destructiveToastTheme,
        t,
      )!,
      breakpoints: ShadBreakpoints.lerp(a?.breakpoints, b?.breakpoints, t)!,
      primaryAlertTheme: ShadAlertTheme.lerp(
        a?.primaryAlertTheme,
        b?.primaryAlertTheme,
        t,
      )!,
      destructiveAlertTheme: ShadAlertTheme.lerp(
        a?.destructiveAlertTheme,
        b?.destructiveAlertTheme,
        t,
      )!,
      primaryDialogTheme: ShadDialogTheme.lerp(
        a?.primaryDialogTheme,
        b?.primaryDialogTheme,
        t,
      )!,
      alertDialogTheme: ShadDialogTheme.lerp(
        a?.alertDialogTheme,
        b?.alertDialogTheme,
        t,
      )!,
      sliderTheme: ShadSliderTheme.lerp(a?.sliderTheme, b?.sliderTheme, t)!,
      sheetTheme: ShadSheetTheme.lerp(a?.sheetTheme, b?.sheetTheme, t)!,
      progressTheme: ShadProgressTheme.lerp(
        a?.progressTheme,
        b?.progressTheme,
        t,
      )!,
      accordionTheme: ShadAccordionTheme.lerp(
        a?.accordionTheme,
        b?.accordionTheme,
        t,
      )!,
      tableTheme: ShadTableTheme.lerp(a?.tableTheme, b?.tableTheme, t)!,
      resizableTheme: ShadResizableTheme.lerp(
        a?.resizableTheme,
        b?.resizableTheme,
        t,
      )!,
      hoverStrategies: t < 0.5 ? a?.hoverStrategies : b?.hoverStrategies,
      disableSecondaryBorder: t < 0.5
          ? a?.disableSecondaryBorder
          : b?.disableSecondaryBorder,
      tabsTheme: ShadTabsTheme.lerp(a?.tabsTheme, b?.tabsTheme, t)!,
      contextMenuTheme: ShadContextMenuTheme.lerp(
        a?.contextMenuTheme,
        b?.contextMenuTheme,
        t,
      )!,
      calendarTheme: ShadCalendarTheme.lerp(
        a?.calendarTheme,
        b?.calendarTheme,
        t,
      )!,
      datePickerTheme: ShadDatePickerTheme.lerp(
        a?.datePickerTheme,
        b?.datePickerTheme,
        t,
      )!,
      timePickerTheme: ShadTimePickerTheme.lerp(
        a?.timePickerTheme,
        b?.timePickerTheme,
        t,
      )!,
      inputOTPTheme: ShadInputOTPTheme.lerp(
        a?.inputOTPTheme,
        b?.inputOTPTheme,
        t,
      )!,
      menubarTheme: ShadMenubarTheme.lerp(a?.menubarTheme, b?.menubarTheme, t)!,
      separatorTheme: ShadSeparatorTheme.lerp(
        a?.separatorTheme,
        b?.separatorTheme,
        t,
      )!,
      sonnerTheme: ShadSonnerTheme.lerp(a?.sonnerTheme, b?.sonnerTheme, t)!,
      textareaTheme: ShadTextareaTheme.lerp(
        a?.textareaTheme,
        b?.textareaTheme,
        t,
      )!,
      defaultKeyboardToolbarTheme: ShadDefaultKeyboardToolbarTheme.lerp(
        a?.defaultKeyboardToolbarTheme,
        b?.defaultKeyboardToolbarTheme,
        t,
      )!,
    );
  }

  ShadThemeData copyWith({
    ShadColorScheme? colorScheme,
    Brightness? brightness,
    ShadButtonTheme? primaryButtonTheme,
    ShadButtonTheme? secondaryButtonTheme,
    ShadButtonTheme? destructiveButtonTheme,
    ShadButtonTheme? outlineButtonTheme,
    ShadButtonTheme? ghostButtonTheme,
    ShadButtonTheme? linkButtonTheme,
    ShadBadgeTheme? primaryBadgeTheme,
    ShadBadgeTheme? secondaryBadgeTheme,
    ShadBadgeTheme? destructiveBadgeTheme,
    ShadBadgeTheme? outlineBadgeTheme,
    BorderRadius? radius,
    ShadAvatarTheme? avatarTheme,
    ShadButtonSizesTheme? buttonSizesTheme,
    ShadTooltipTheme? tooltipTheme,
    ShadPopoverTheme? popoverTheme,
    ShadDecoration? decoration,
    ShadTextTheme? textTheme,
    double? disabledOpacity,
    ShadSelectTheme? selectTheme,
    ShadOptionTheme? optionTheme,
    ShadCardTheme? cardTheme,
    ShadSwitchTheme? switchTheme,
    ShadCheckboxTheme? checkboxTheme,
    ShadInputTheme? inputTheme,
    ShadRadioTheme? radioTheme,
    ShadToastTheme? primaryToastTheme,
    ShadToastTheme? destructiveToastTheme,
    ShadBreakpoints? breakpoints,
    ShadAlertTheme? primaryAlertTheme,
    ShadAlertTheme? destructiveAlertTheme,
    ShadDialogTheme? primaryDialogTheme,
    ShadDialogTheme? alertDialogTheme,
    ShadSliderTheme? sliderTheme,
    ShadSheetTheme? sheetTheme,
    ShadProgressTheme? progressTheme,
    ShadAccordionTheme? accordionTheme,
    ShadTableTheme? tableTheme,
    ShadResizableTheme? resizableTheme,
    ShadHoverStrategies? hoverStrategies,
    bool? disableSecondaryBorder,
    ShadTabsTheme? tabsTheme,
    ShadContextMenuTheme? contextMenuTheme,
    ShadCalendarTheme? calendarTheme,
    ShadDatePickerTheme? datePickerTheme,
    ShadTimePickerTheme? timePickerTheme,
    ShadInputOTPTheme? inputOTPTheme,
    ShadMenubarTheme? menubarTheme,
    ShadSeparatorTheme? separatorTheme,
    ShadSonnerTheme? sonnerTheme,
    ShadTextareaTheme? textareaTheme,
    ShadDefaultKeyboardToolbarTheme? defaultKeyboardToolbarTheme,
  }) {
    final a = (this as ShadThemeData);

    return ShadThemeData(
      colorScheme: colorScheme ?? a.colorScheme,
      brightness: brightness ?? a.brightness,
      primaryButtonTheme: primaryButtonTheme ?? a.primaryButtonTheme,
      secondaryButtonTheme: secondaryButtonTheme ?? a.secondaryButtonTheme,
      destructiveButtonTheme:
          destructiveButtonTheme ?? a.destructiveButtonTheme,
      outlineButtonTheme: outlineButtonTheme ?? a.outlineButtonTheme,
      ghostButtonTheme: ghostButtonTheme ?? a.ghostButtonTheme,
      linkButtonTheme: linkButtonTheme ?? a.linkButtonTheme,
      primaryBadgeTheme: primaryBadgeTheme ?? a.primaryBadgeTheme,
      secondaryBadgeTheme: secondaryBadgeTheme ?? a.secondaryBadgeTheme,
      destructiveBadgeTheme: destructiveBadgeTheme ?? a.destructiveBadgeTheme,
      outlineBadgeTheme: outlineBadgeTheme ?? a.outlineBadgeTheme,
      radius: radius ?? a.radius,
      avatarTheme: avatarTheme ?? a.avatarTheme,
      buttonSizesTheme: buttonSizesTheme ?? a.buttonSizesTheme,
      tooltipTheme: tooltipTheme ?? a.tooltipTheme,
      popoverTheme: popoverTheme ?? a.popoverTheme,
      decoration: decoration ?? a.decoration,
      textTheme: textTheme ?? a.textTheme,
      disabledOpacity: disabledOpacity ?? a.disabledOpacity,
      selectTheme: selectTheme ?? a.selectTheme,
      optionTheme: optionTheme ?? a.optionTheme,
      cardTheme: cardTheme ?? a.cardTheme,
      switchTheme: switchTheme ?? a.switchTheme,
      checkboxTheme: checkboxTheme ?? a.checkboxTheme,
      inputTheme: inputTheme ?? a.inputTheme,
      radioTheme: radioTheme ?? a.radioTheme,
      primaryToastTheme: primaryToastTheme ?? a.primaryToastTheme,
      destructiveToastTheme: destructiveToastTheme ?? a.destructiveToastTheme,
      breakpoints: breakpoints ?? a.breakpoints,
      primaryAlertTheme: primaryAlertTheme ?? a.primaryAlertTheme,
      destructiveAlertTheme: destructiveAlertTheme ?? a.destructiveAlertTheme,
      primaryDialogTheme: primaryDialogTheme ?? a.primaryDialogTheme,
      alertDialogTheme: alertDialogTheme ?? a.alertDialogTheme,
      sliderTheme: sliderTheme ?? a.sliderTheme,
      sheetTheme: sheetTheme ?? a.sheetTheme,
      progressTheme: progressTheme ?? a.progressTheme,
      accordionTheme: accordionTheme ?? a.accordionTheme,
      tableTheme: tableTheme ?? a.tableTheme,
      resizableTheme: resizableTheme ?? a.resizableTheme,
      hoverStrategies: hoverStrategies ?? a.hoverStrategies,
      disableSecondaryBorder:
          disableSecondaryBorder ?? a.disableSecondaryBorder,
      tabsTheme: tabsTheme ?? a.tabsTheme,
      contextMenuTheme: contextMenuTheme ?? a.contextMenuTheme,
      calendarTheme: calendarTheme ?? a.calendarTheme,
      datePickerTheme: datePickerTheme ?? a.datePickerTheme,
      timePickerTheme: timePickerTheme ?? a.timePickerTheme,
      inputOTPTheme: inputOTPTheme ?? a.inputOTPTheme,
      menubarTheme: menubarTheme ?? a.menubarTheme,
      separatorTheme: separatorTheme ?? a.separatorTheme,
      sonnerTheme: sonnerTheme ?? a.sonnerTheme,
      textareaTheme: textareaTheme ?? a.textareaTheme,
      defaultKeyboardToolbarTheme:
          defaultKeyboardToolbarTheme ?? a.defaultKeyboardToolbarTheme,
    );
  }

  ShadThemeData merge(ShadThemeData? other) {
    final current = (this as ShadThemeData);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      colorScheme: other.colorScheme,
      brightness: other.brightness,
      primaryButtonTheme: current.primaryButtonTheme.merge(
        other.primaryButtonTheme,
      ),
      secondaryButtonTheme: current.secondaryButtonTheme.merge(
        other.secondaryButtonTheme,
      ),
      destructiveButtonTheme: current.destructiveButtonTheme.merge(
        other.destructiveButtonTheme,
      ),
      outlineButtonTheme: current.outlineButtonTheme.merge(
        other.outlineButtonTheme,
      ),
      ghostButtonTheme: current.ghostButtonTheme.merge(other.ghostButtonTheme),
      linkButtonTheme: current.linkButtonTheme.merge(other.linkButtonTheme),
      primaryBadgeTheme: current.primaryBadgeTheme.merge(
        other.primaryBadgeTheme,
      ),
      secondaryBadgeTheme: current.secondaryBadgeTheme.merge(
        other.secondaryBadgeTheme,
      ),
      destructiveBadgeTheme: current.destructiveBadgeTheme.merge(
        other.destructiveBadgeTheme,
      ),
      outlineBadgeTheme: current.outlineBadgeTheme.merge(
        other.outlineBadgeTheme,
      ),
      radius: other.radius,
      avatarTheme: current.avatarTheme.merge(other.avatarTheme),
      buttonSizesTheme: current.buttonSizesTheme.merge(other.buttonSizesTheme),
      tooltipTheme: current.tooltipTheme.merge(other.tooltipTheme),
      popoverTheme: current.popoverTheme.merge(other.popoverTheme),
      decoration: current.decoration.merge(other.decoration),
      textTheme: current.textTheme.merge(other.textTheme),
      disabledOpacity: other.disabledOpacity,
      selectTheme: current.selectTheme.merge(other.selectTheme),
      optionTheme: current.optionTheme.merge(other.optionTheme),
      cardTheme: current.cardTheme.merge(other.cardTheme),
      switchTheme: current.switchTheme.merge(other.switchTheme),
      checkboxTheme: current.checkboxTheme.merge(other.checkboxTheme),
      inputTheme: current.inputTheme.merge(other.inputTheme),
      radioTheme: current.radioTheme.merge(other.radioTheme),
      primaryToastTheme: current.primaryToastTheme.merge(
        other.primaryToastTheme,
      ),
      destructiveToastTheme: current.destructiveToastTheme.merge(
        other.destructiveToastTheme,
      ),
      breakpoints: other.breakpoints,
      primaryAlertTheme: current.primaryAlertTheme.merge(
        other.primaryAlertTheme,
      ),
      destructiveAlertTheme: current.destructiveAlertTheme.merge(
        other.destructiveAlertTheme,
      ),
      primaryDialogTheme: current.primaryDialogTheme.merge(
        other.primaryDialogTheme,
      ),
      alertDialogTheme: current.alertDialogTheme.merge(other.alertDialogTheme),
      sliderTheme: current.sliderTheme.merge(other.sliderTheme),
      sheetTheme: current.sheetTheme.merge(other.sheetTheme),
      progressTheme: current.progressTheme.merge(other.progressTheme),
      accordionTheme: current.accordionTheme.merge(other.accordionTheme),
      tableTheme: current.tableTheme.merge(other.tableTheme),
      resizableTheme: current.resizableTheme.merge(other.resizableTheme),
      hoverStrategies: other.hoverStrategies,
      disableSecondaryBorder: other.disableSecondaryBorder,
      tabsTheme: current.tabsTheme.merge(other.tabsTheme),
      contextMenuTheme: current.contextMenuTheme.merge(other.contextMenuTheme),
      calendarTheme: current.calendarTheme.merge(other.calendarTheme),
      datePickerTheme: current.datePickerTheme.merge(other.datePickerTheme),
      timePickerTheme: current.timePickerTheme.merge(other.timePickerTheme),
      inputOTPTheme: current.inputOTPTheme.merge(other.inputOTPTheme),
      menubarTheme: current.menubarTheme.merge(other.menubarTheme),
      separatorTheme: current.separatorTheme.merge(other.separatorTheme),
      sonnerTheme: current.sonnerTheme.merge(other.sonnerTheme),
      textareaTheme: current.textareaTheme.merge(other.textareaTheme),
      defaultKeyboardToolbarTheme: current.defaultKeyboardToolbarTheme.merge(
        other.defaultKeyboardToolbarTheme,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other is! ShadThemeData) {
      return false;
    }

    final value = (this as ShadThemeData);

    return other.colorScheme == value.colorScheme &&
        other.brightness == value.brightness &&
        other.primaryButtonTheme == value.primaryButtonTheme &&
        other.secondaryButtonTheme == value.secondaryButtonTheme &&
        other.destructiveButtonTheme == value.destructiveButtonTheme &&
        other.outlineButtonTheme == value.outlineButtonTheme &&
        other.ghostButtonTheme == value.ghostButtonTheme &&
        other.linkButtonTheme == value.linkButtonTheme &&
        other.primaryBadgeTheme == value.primaryBadgeTheme &&
        other.secondaryBadgeTheme == value.secondaryBadgeTheme &&
        other.destructiveBadgeTheme == value.destructiveBadgeTheme &&
        other.outlineBadgeTheme == value.outlineBadgeTheme &&
        other.radius == value.radius &&
        other.avatarTheme == value.avatarTheme &&
        other.buttonSizesTheme == value.buttonSizesTheme &&
        other.tooltipTheme == value.tooltipTheme &&
        other.popoverTheme == value.popoverTheme &&
        other.decoration == value.decoration &&
        other.textTheme == value.textTheme &&
        other.disabledOpacity == value.disabledOpacity &&
        other.selectTheme == value.selectTheme &&
        other.optionTheme == value.optionTheme &&
        other.cardTheme == value.cardTheme &&
        other.switchTheme == value.switchTheme &&
        other.checkboxTheme == value.checkboxTheme &&
        other.inputTheme == value.inputTheme &&
        other.radioTheme == value.radioTheme &&
        other.primaryToastTheme == value.primaryToastTheme &&
        other.destructiveToastTheme == value.destructiveToastTheme &&
        other.breakpoints == value.breakpoints &&
        other.primaryAlertTheme == value.primaryAlertTheme &&
        other.destructiveAlertTheme == value.destructiveAlertTheme &&
        other.primaryDialogTheme == value.primaryDialogTheme &&
        other.alertDialogTheme == value.alertDialogTheme &&
        other.sliderTheme == value.sliderTheme &&
        other.sheetTheme == value.sheetTheme &&
        other.progressTheme == value.progressTheme &&
        other.accordionTheme == value.accordionTheme &&
        other.tableTheme == value.tableTheme &&
        other.resizableTheme == value.resizableTheme &&
        other.hoverStrategies == value.hoverStrategies &&
        other.disableSecondaryBorder == value.disableSecondaryBorder &&
        other.tabsTheme == value.tabsTheme &&
        other.contextMenuTheme == value.contextMenuTheme &&
        other.calendarTheme == value.calendarTheme &&
        other.datePickerTheme == value.datePickerTheme &&
        other.timePickerTheme == value.timePickerTheme &&
        other.inputOTPTheme == value.inputOTPTheme &&
        other.menubarTheme == value.menubarTheme &&
        other.separatorTheme == value.separatorTheme &&
        other.sonnerTheme == value.sonnerTheme &&
        other.textareaTheme == value.textareaTheme &&
        other.defaultKeyboardToolbarTheme == value.defaultKeyboardToolbarTheme;
  }

  @override
  int get hashCode {
    final value = (this as ShadThemeData);

    return Object.hashAll([
      runtimeType,
      value.colorScheme,
      value.brightness,
      value.primaryButtonTheme,
      value.secondaryButtonTheme,
      value.destructiveButtonTheme,
      value.outlineButtonTheme,
      value.ghostButtonTheme,
      value.linkButtonTheme,
      value.primaryBadgeTheme,
      value.secondaryBadgeTheme,
      value.destructiveBadgeTheme,
      value.outlineBadgeTheme,
      value.radius,
      value.avatarTheme,
      value.buttonSizesTheme,
      value.tooltipTheme,
      value.popoverTheme,
      value.decoration,
      value.textTheme,
      value.disabledOpacity,
      value.selectTheme,
      value.optionTheme,
      value.cardTheme,
      value.switchTheme,
      value.checkboxTheme,
      value.inputTheme,
      value.radioTheme,
      value.primaryToastTheme,
      value.destructiveToastTheme,
      value.breakpoints,
      value.primaryAlertTheme,
      value.destructiveAlertTheme,
      value.primaryDialogTheme,
      value.alertDialogTheme,
      value.sliderTheme,
      value.sheetTheme,
      value.progressTheme,
      value.accordionTheme,
      value.tableTheme,
      value.resizableTheme,
      value.hoverStrategies,
      value.disableSecondaryBorder,
      value.tabsTheme,
      value.contextMenuTheme,
      value.calendarTheme,
      value.datePickerTheme,
      value.timePickerTheme,
      value.inputOTPTheme,
      value.menubarTheme,
      value.separatorTheme,
      value.sonnerTheme,
      value.textareaTheme,
      value.defaultKeyboardToolbarTheme,
    ]);
  }
}
