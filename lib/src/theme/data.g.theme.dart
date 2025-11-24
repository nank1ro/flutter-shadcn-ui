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
    final _this = (this as ShadThemeData);

    return ShadThemeData(
      colorScheme: colorScheme ?? _this.colorScheme,
      brightness: brightness ?? _this.brightness,
      primaryButtonTheme: primaryButtonTheme ?? _this.primaryButtonTheme,
      secondaryButtonTheme: secondaryButtonTheme ?? _this.secondaryButtonTheme,
      destructiveButtonTheme:
          destructiveButtonTheme ?? _this.destructiveButtonTheme,
      outlineButtonTheme: outlineButtonTheme ?? _this.outlineButtonTheme,
      ghostButtonTheme: ghostButtonTheme ?? _this.ghostButtonTheme,
      linkButtonTheme: linkButtonTheme ?? _this.linkButtonTheme,
      primaryBadgeTheme: primaryBadgeTheme ?? _this.primaryBadgeTheme,
      secondaryBadgeTheme: secondaryBadgeTheme ?? _this.secondaryBadgeTheme,
      destructiveBadgeTheme:
          destructiveBadgeTheme ?? _this.destructiveBadgeTheme,
      outlineBadgeTheme: outlineBadgeTheme ?? _this.outlineBadgeTheme,
      radius: radius ?? _this.radius,
      avatarTheme: avatarTheme ?? _this.avatarTheme,
      buttonSizesTheme: buttonSizesTheme ?? _this.buttonSizesTheme,
      tooltipTheme: tooltipTheme ?? _this.tooltipTheme,
      popoverTheme: popoverTheme ?? _this.popoverTheme,
      decoration: decoration ?? _this.decoration,
      textTheme: textTheme ?? _this.textTheme,
      disabledOpacity: disabledOpacity ?? _this.disabledOpacity,
      selectTheme: selectTheme ?? _this.selectTheme,
      optionTheme: optionTheme ?? _this.optionTheme,
      cardTheme: cardTheme ?? _this.cardTheme,
      switchTheme: switchTheme ?? _this.switchTheme,
      checkboxTheme: checkboxTheme ?? _this.checkboxTheme,
      inputTheme: inputTheme ?? _this.inputTheme,
      radioTheme: radioTheme ?? _this.radioTheme,
      primaryToastTheme: primaryToastTheme ?? _this.primaryToastTheme,
      destructiveToastTheme:
          destructiveToastTheme ?? _this.destructiveToastTheme,
      breakpoints: breakpoints ?? _this.breakpoints,
      primaryAlertTheme: primaryAlertTheme ?? _this.primaryAlertTheme,
      destructiveAlertTheme:
          destructiveAlertTheme ?? _this.destructiveAlertTheme,
      primaryDialogTheme: primaryDialogTheme ?? _this.primaryDialogTheme,
      alertDialogTheme: alertDialogTheme ?? _this.alertDialogTheme,
      sliderTheme: sliderTheme ?? _this.sliderTheme,
      sheetTheme: sheetTheme ?? _this.sheetTheme,
      progressTheme: progressTheme ?? _this.progressTheme,
      accordionTheme: accordionTheme ?? _this.accordionTheme,
      tableTheme: tableTheme ?? _this.tableTheme,
      resizableTheme: resizableTheme ?? _this.resizableTheme,
      hoverStrategies: hoverStrategies ?? _this.hoverStrategies,
      disableSecondaryBorder:
          disableSecondaryBorder ?? _this.disableSecondaryBorder,
      tabsTheme: tabsTheme ?? _this.tabsTheme,
      contextMenuTheme: contextMenuTheme ?? _this.contextMenuTheme,
      calendarTheme: calendarTheme ?? _this.calendarTheme,
      datePickerTheme: datePickerTheme ?? _this.datePickerTheme,
      timePickerTheme: timePickerTheme ?? _this.timePickerTheme,
      inputOTPTheme: inputOTPTheme ?? _this.inputOTPTheme,
      menubarTheme: menubarTheme ?? _this.menubarTheme,
      separatorTheme: separatorTheme ?? _this.separatorTheme,
      sonnerTheme: sonnerTheme ?? _this.sonnerTheme,
      textareaTheme: textareaTheme ?? _this.textareaTheme,
      defaultKeyboardToolbarTheme:
          defaultKeyboardToolbarTheme ?? _this.defaultKeyboardToolbarTheme,
    );
  }

  ShadThemeData merge(ShadThemeData? other) {
    final _this = (this as ShadThemeData);

    if (other == null) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      colorScheme: other.colorScheme,
      brightness: other.brightness,
      primaryButtonTheme: other.primaryButtonTheme,
      secondaryButtonTheme: other.secondaryButtonTheme,
      destructiveButtonTheme: other.destructiveButtonTheme,
      outlineButtonTheme: other.outlineButtonTheme,
      ghostButtonTheme: other.ghostButtonTheme,
      linkButtonTheme: other.linkButtonTheme,
      primaryBadgeTheme: other.primaryBadgeTheme,
      secondaryBadgeTheme: other.secondaryBadgeTheme,
      destructiveBadgeTheme: other.destructiveBadgeTheme,
      outlineBadgeTheme: other.outlineBadgeTheme,
      radius: other.radius,
      avatarTheme: other.avatarTheme,
      buttonSizesTheme: other.buttonSizesTheme,
      tooltipTheme: other.tooltipTheme,
      popoverTheme: other.popoverTheme,
      decoration: other.decoration,
      textTheme: _this.textTheme.merge(other.textTheme),
      disabledOpacity: other.disabledOpacity,
      selectTheme: other.selectTheme,
      optionTheme: other.optionTheme,
      cardTheme: other.cardTheme,
      switchTheme: other.switchTheme,
      checkboxTheme: other.checkboxTheme,
      inputTheme: other.inputTheme,
      radioTheme: other.radioTheme,
      primaryToastTheme: other.primaryToastTheme,
      destructiveToastTheme: other.destructiveToastTheme,
      breakpoints: other.breakpoints,
      primaryAlertTheme: other.primaryAlertTheme,
      destructiveAlertTheme: other.destructiveAlertTheme,
      primaryDialogTheme: other.primaryDialogTheme,
      alertDialogTheme: other.alertDialogTheme,
      sliderTheme: other.sliderTheme,
      sheetTheme: other.sheetTheme,
      progressTheme: other.progressTheme,
      accordionTheme: other.accordionTheme,
      tableTheme: other.tableTheme,
      resizableTheme: other.resizableTheme,
      hoverStrategies: other.hoverStrategies,
      disableSecondaryBorder: other.disableSecondaryBorder,
      tabsTheme: other.tabsTheme,
      contextMenuTheme: other.contextMenuTheme,
      calendarTheme: other.calendarTheme,
      datePickerTheme: other.datePickerTheme,
      timePickerTheme: other.timePickerTheme,
      inputOTPTheme: other.inputOTPTheme,
      menubarTheme: other.menubarTheme,
      separatorTheme: other.separatorTheme,
      sonnerTheme: other.sonnerTheme,
      textareaTheme: other.textareaTheme,
      defaultKeyboardToolbarTheme: other.defaultKeyboardToolbarTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final _this = (this as ShadThemeData);
    final _other = (other as ShadThemeData);

    return _other.colorScheme == _this.colorScheme &&
        _other.brightness == _this.brightness &&
        _other.primaryButtonTheme == _this.primaryButtonTheme &&
        _other.secondaryButtonTheme == _this.secondaryButtonTheme &&
        _other.destructiveButtonTheme == _this.destructiveButtonTheme &&
        _other.outlineButtonTheme == _this.outlineButtonTheme &&
        _other.ghostButtonTheme == _this.ghostButtonTheme &&
        _other.linkButtonTheme == _this.linkButtonTheme &&
        _other.primaryBadgeTheme == _this.primaryBadgeTheme &&
        _other.secondaryBadgeTheme == _this.secondaryBadgeTheme &&
        _other.destructiveBadgeTheme == _this.destructiveBadgeTheme &&
        _other.outlineBadgeTheme == _this.outlineBadgeTheme &&
        _other.radius == _this.radius &&
        _other.avatarTheme == _this.avatarTheme &&
        _other.buttonSizesTheme == _this.buttonSizesTheme &&
        _other.tooltipTheme == _this.tooltipTheme &&
        _other.popoverTheme == _this.popoverTheme &&
        _other.decoration == _this.decoration &&
        _other.textTheme == _this.textTheme &&
        _other.disabledOpacity == _this.disabledOpacity &&
        _other.selectTheme == _this.selectTheme &&
        _other.optionTheme == _this.optionTheme &&
        _other.cardTheme == _this.cardTheme &&
        _other.switchTheme == _this.switchTheme &&
        _other.checkboxTheme == _this.checkboxTheme &&
        _other.inputTheme == _this.inputTheme &&
        _other.radioTheme == _this.radioTheme &&
        _other.primaryToastTheme == _this.primaryToastTheme &&
        _other.destructiveToastTheme == _this.destructiveToastTheme &&
        _other.breakpoints == _this.breakpoints &&
        _other.primaryAlertTheme == _this.primaryAlertTheme &&
        _other.destructiveAlertTheme == _this.destructiveAlertTheme &&
        _other.primaryDialogTheme == _this.primaryDialogTheme &&
        _other.alertDialogTheme == _this.alertDialogTheme &&
        _other.sliderTheme == _this.sliderTheme &&
        _other.sheetTheme == _this.sheetTheme &&
        _other.progressTheme == _this.progressTheme &&
        _other.accordionTheme == _this.accordionTheme &&
        _other.tableTheme == _this.tableTheme &&
        _other.resizableTheme == _this.resizableTheme &&
        _other.hoverStrategies == _this.hoverStrategies &&
        _other.disableSecondaryBorder == _this.disableSecondaryBorder &&
        _other.tabsTheme == _this.tabsTheme &&
        _other.contextMenuTheme == _this.contextMenuTheme &&
        _other.calendarTheme == _this.calendarTheme &&
        _other.datePickerTheme == _this.datePickerTheme &&
        _other.timePickerTheme == _this.timePickerTheme &&
        _other.inputOTPTheme == _this.inputOTPTheme &&
        _other.menubarTheme == _this.menubarTheme &&
        _other.separatorTheme == _this.separatorTheme &&
        _other.sonnerTheme == _this.sonnerTheme &&
        _other.textareaTheme == _this.textareaTheme &&
        _other.defaultKeyboardToolbarTheme == _this.defaultKeyboardToolbarTheme;
  }

  @override
  int get hashCode {
    final _this = (this as ShadThemeData);

    return Object.hashAll([
      runtimeType,
      _this.colorScheme,
      _this.brightness,
      _this.primaryButtonTheme,
      _this.secondaryButtonTheme,
      _this.destructiveButtonTheme,
      _this.outlineButtonTheme,
      _this.ghostButtonTheme,
      _this.linkButtonTheme,
      _this.primaryBadgeTheme,
      _this.secondaryBadgeTheme,
      _this.destructiveBadgeTheme,
      _this.outlineBadgeTheme,
      _this.radius,
      _this.avatarTheme,
      _this.buttonSizesTheme,
      _this.tooltipTheme,
      _this.popoverTheme,
      _this.decoration,
      _this.textTheme,
      _this.disabledOpacity,
      _this.selectTheme,
      _this.optionTheme,
      _this.cardTheme,
      _this.switchTheme,
      _this.checkboxTheme,
      _this.inputTheme,
      _this.radioTheme,
      _this.primaryToastTheme,
      _this.destructiveToastTheme,
      _this.breakpoints,
      _this.primaryAlertTheme,
      _this.destructiveAlertTheme,
      _this.primaryDialogTheme,
      _this.alertDialogTheme,
      _this.sliderTheme,
      _this.sheetTheme,
      _this.progressTheme,
      _this.accordionTheme,
      _this.tableTheme,
      _this.resizableTheme,
      _this.hoverStrategies,
      _this.disableSecondaryBorder,
      _this.tabsTheme,
      _this.contextMenuTheme,
      _this.calendarTheme,
      _this.datePickerTheme,
      _this.timePickerTheme,
      _this.inputOTPTheme,
      _this.menubarTheme,
      _this.separatorTheme,
      _this.sonnerTheme,
      _this.textareaTheme,
      _this.defaultKeyboardToolbarTheme,
    ]);
  }
}
