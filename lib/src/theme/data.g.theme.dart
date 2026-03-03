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
    if (identical(a, b)) {
      return a;
    }

    if (a == null) {
      return t == 1.0 ? b : null;
    }

    if (b == null) {
      return t == 0.0 ? a : null;
    }

    return ShadThemeData(
      colorScheme: ShadColorScheme.lerp(a.colorScheme, b.colorScheme, t),
      brightness: t < 0.5 ? a.brightness : b.brightness,
      primaryButtonTheme: ShadButtonTheme.lerp(
        a.primaryButtonTheme,
        b.primaryButtonTheme,
        t,
      )!,
      secondaryButtonTheme: ShadButtonTheme.lerp(
        a.secondaryButtonTheme,
        b.secondaryButtonTheme,
        t,
      )!,
      destructiveButtonTheme: ShadButtonTheme.lerp(
        a.destructiveButtonTheme,
        b.destructiveButtonTheme,
        t,
      )!,
      outlineButtonTheme: ShadButtonTheme.lerp(
        a.outlineButtonTheme,
        b.outlineButtonTheme,
        t,
      )!,
      ghostButtonTheme: ShadButtonTheme.lerp(
        a.ghostButtonTheme,
        b.ghostButtonTheme,
        t,
      )!,
      linkButtonTheme: ShadButtonTheme.lerp(
        a.linkButtonTheme,
        b.linkButtonTheme,
        t,
      )!,
      primaryBadgeTheme: ShadBadgeTheme.lerp(
        a.primaryBadgeTheme,
        b.primaryBadgeTheme,
        t,
      )!,
      secondaryBadgeTheme: ShadBadgeTheme.lerp(
        a.secondaryBadgeTheme,
        b.secondaryBadgeTheme,
        t,
      )!,
      destructiveBadgeTheme: ShadBadgeTheme.lerp(
        a.destructiveBadgeTheme,
        b.destructiveBadgeTheme,
        t,
      )!,
      outlineBadgeTheme: ShadBadgeTheme.lerp(
        a.outlineBadgeTheme,
        b.outlineBadgeTheme,
        t,
      )!,
      breadcrumbTheme: ShadBreadcrumbTheme.lerp(
        a.breadcrumbTheme,
        b.breadcrumbTheme,
        t,
      )!,
      radius: BorderRadius.lerp(a.radius, b.radius, t)!,
      avatarTheme: ShadAvatarTheme.lerp(a.avatarTheme, b.avatarTheme, t)!,
      buttonSizesTheme: ShadButtonSizesTheme.lerp(
        a.buttonSizesTheme,
        b.buttonSizesTheme,
        t,
      )!,
      tooltipTheme: ShadTooltipTheme.lerp(a.tooltipTheme, b.tooltipTheme, t)!,
      popoverTheme: ShadPopoverTheme.lerp(a.popoverTheme, b.popoverTheme, t)!,
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t)!,
      textTheme: ShadTextTheme.lerp(a.textTheme, b.textTheme, t)!,
      disabledOpacity: lerpDouble$(a.disabledOpacity, b.disabledOpacity, t)!,
      selectTheme: ShadSelectTheme.lerp(a.selectTheme, b.selectTheme, t)!,
      optionTheme: ShadOptionTheme.lerp(a.optionTheme, b.optionTheme, t)!,
      cardTheme: ShadCardTheme.lerp(a.cardTheme, b.cardTheme, t)!,
      switchTheme: ShadSwitchTheme.lerp(a.switchTheme, b.switchTheme, t)!,
      checkboxTheme: ShadCheckboxTheme.lerp(
        a.checkboxTheme,
        b.checkboxTheme,
        t,
      )!,
      inputTheme: ShadInputTheme.lerp(a.inputTheme, b.inputTheme, t)!,
      radioTheme: ShadRadioTheme.lerp(a.radioTheme, b.radioTheme, t)!,
      primaryToastTheme: ShadToastTheme.lerp(
        a.primaryToastTheme,
        b.primaryToastTheme,
        t,
      )!,
      destructiveToastTheme: ShadToastTheme.lerp(
        a.destructiveToastTheme,
        b.destructiveToastTheme,
        t,
      )!,
      breakpoints: ShadBreakpoints.lerp(a.breakpoints, b.breakpoints, t)!,
      primaryAlertTheme: ShadAlertTheme.lerp(
        a.primaryAlertTheme,
        b.primaryAlertTheme,
        t,
      )!,
      destructiveAlertTheme: ShadAlertTheme.lerp(
        a.destructiveAlertTheme,
        b.destructiveAlertTheme,
        t,
      )!,
      primaryDialogTheme: ShadDialogTheme.lerp(
        a.primaryDialogTheme,
        b.primaryDialogTheme,
        t,
      )!,
      alertDialogTheme: ShadDialogTheme.lerp(
        a.alertDialogTheme,
        b.alertDialogTheme,
        t,
      )!,
      sliderTheme: ShadSliderTheme.lerp(a.sliderTheme, b.sliderTheme, t)!,
      sheetTheme: ShadSheetTheme.lerp(a.sheetTheme, b.sheetTheme, t)!,
      progressTheme: ShadProgressTheme.lerp(
        a.progressTheme,
        b.progressTheme,
        t,
      )!,
      accordionTheme: ShadAccordionTheme.lerp(
        a.accordionTheme,
        b.accordionTheme,
        t,
      )!,
      tableTheme: ShadTableTheme.lerp(a.tableTheme, b.tableTheme, t)!,
      resizableTheme: ShadResizableTheme.lerp(
        a.resizableTheme,
        b.resizableTheme,
        t,
      )!,
      hoverStrategies: t < 0.5 ? a.hoverStrategies : b.hoverStrategies,
      disableSecondaryBorder: t < 0.5
          ? a.disableSecondaryBorder
          : b.disableSecondaryBorder,
      tabsTheme: ShadTabsTheme.lerp(a.tabsTheme, b.tabsTheme, t)!,
      contextMenuTheme: ShadContextMenuTheme.lerp(
        a.contextMenuTheme,
        b.contextMenuTheme,
        t,
      )!,
      calendarTheme: ShadCalendarTheme.lerp(
        a.calendarTheme,
        b.calendarTheme,
        t,
      )!,
      datePickerTheme: ShadDatePickerTheme.lerp(
        a.datePickerTheme,
        b.datePickerTheme,
        t,
      )!,
      timePickerTheme: ShadTimePickerTheme.lerp(
        a.timePickerTheme,
        b.timePickerTheme,
        t,
      )!,
      inputOTPTheme: ShadInputOTPTheme.lerp(
        a.inputOTPTheme,
        b.inputOTPTheme,
        t,
      )!,
      menubarTheme: ShadMenubarTheme.lerp(a.menubarTheme, b.menubarTheme, t)!,
      separatorTheme: ShadSeparatorTheme.lerp(
        a.separatorTheme,
        b.separatorTheme,
        t,
      )!,
      sonnerTheme: ShadSonnerTheme.lerp(a.sonnerTheme, b.sonnerTheme, t)!,
      textareaTheme: ShadTextareaTheme.lerp(
        a.textareaTheme,
        b.textareaTheme,
        t,
      )!,
      defaultKeyboardToolbarTheme: ShadDefaultKeyboardToolbarTheme.lerp(
        a.defaultKeyboardToolbarTheme,
        b.defaultKeyboardToolbarTheme,
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
    ShadBreadcrumbTheme? breadcrumbTheme,
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
      breadcrumbTheme: breadcrumbTheme ?? _this.breadcrumbTheme,
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

    if (other == null || identical(_this, other)) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      colorScheme: other.colorScheme,
      brightness: other.brightness,
      primaryButtonTheme: _this.primaryButtonTheme.merge(
        other.primaryButtonTheme,
      ),
      secondaryButtonTheme: _this.secondaryButtonTheme.merge(
        other.secondaryButtonTheme,
      ),
      destructiveButtonTheme: _this.destructiveButtonTheme.merge(
        other.destructiveButtonTheme,
      ),
      outlineButtonTheme: _this.outlineButtonTheme.merge(
        other.outlineButtonTheme,
      ),
      ghostButtonTheme: _this.ghostButtonTheme.merge(other.ghostButtonTheme),
      linkButtonTheme: _this.linkButtonTheme.merge(other.linkButtonTheme),
      primaryBadgeTheme: _this.primaryBadgeTheme.merge(other.primaryBadgeTheme),
      secondaryBadgeTheme: _this.secondaryBadgeTheme.merge(
        other.secondaryBadgeTheme,
      ),
      destructiveBadgeTheme: _this.destructiveBadgeTheme.merge(
        other.destructiveBadgeTheme,
      ),
      outlineBadgeTheme: _this.outlineBadgeTheme.merge(other.outlineBadgeTheme),
      breadcrumbTheme: _this.breadcrumbTheme.merge(other.breadcrumbTheme),
      radius: other.radius,
      avatarTheme: _this.avatarTheme.merge(other.avatarTheme),
      buttonSizesTheme: _this.buttonSizesTheme.merge(other.buttonSizesTheme),
      tooltipTheme: _this.tooltipTheme.merge(other.tooltipTheme),
      popoverTheme: _this.popoverTheme.merge(other.popoverTheme),
      decoration: _this.decoration.merge(other.decoration),
      textTheme: _this.textTheme.merge(other.textTheme),
      disabledOpacity: other.disabledOpacity,
      selectTheme: _this.selectTheme.merge(other.selectTheme),
      optionTheme: _this.optionTheme.merge(other.optionTheme),
      cardTheme: _this.cardTheme.merge(other.cardTheme),
      switchTheme: _this.switchTheme.merge(other.switchTheme),
      checkboxTheme: _this.checkboxTheme.merge(other.checkboxTheme),
      inputTheme: _this.inputTheme.merge(other.inputTheme),
      radioTheme: _this.radioTheme.merge(other.radioTheme),
      primaryToastTheme: _this.primaryToastTheme.merge(other.primaryToastTheme),
      destructiveToastTheme: _this.destructiveToastTheme.merge(
        other.destructiveToastTheme,
      ),
      breakpoints: other.breakpoints,
      primaryAlertTheme: _this.primaryAlertTheme.merge(other.primaryAlertTheme),
      destructiveAlertTheme: _this.destructiveAlertTheme.merge(
        other.destructiveAlertTheme,
      ),
      primaryDialogTheme: _this.primaryDialogTheme.merge(
        other.primaryDialogTheme,
      ),
      alertDialogTheme: _this.alertDialogTheme.merge(other.alertDialogTheme),
      sliderTheme: _this.sliderTheme.merge(other.sliderTheme),
      sheetTheme: _this.sheetTheme.merge(other.sheetTheme),
      progressTheme: _this.progressTheme.merge(other.progressTheme),
      accordionTheme: _this.accordionTheme.merge(other.accordionTheme),
      tableTheme: _this.tableTheme.merge(other.tableTheme),
      resizableTheme: _this.resizableTheme.merge(other.resizableTheme),
      hoverStrategies: other.hoverStrategies,
      disableSecondaryBorder: other.disableSecondaryBorder,
      tabsTheme: _this.tabsTheme.merge(other.tabsTheme),
      contextMenuTheme: _this.contextMenuTheme.merge(other.contextMenuTheme),
      calendarTheme: _this.calendarTheme.merge(other.calendarTheme),
      datePickerTheme: _this.datePickerTheme.merge(other.datePickerTheme),
      timePickerTheme: _this.timePickerTheme.merge(other.timePickerTheme),
      inputOTPTheme: _this.inputOTPTheme.merge(other.inputOTPTheme),
      menubarTheme: _this.menubarTheme.merge(other.menubarTheme),
      separatorTheme: _this.separatorTheme.merge(other.separatorTheme),
      sonnerTheme: _this.sonnerTheme.merge(other.sonnerTheme),
      textareaTheme: _this.textareaTheme.merge(other.textareaTheme),
      defaultKeyboardToolbarTheme: _this.defaultKeyboardToolbarTheme.merge(
        other.defaultKeyboardToolbarTheme,
      ),
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
        _other.breadcrumbTheme == _this.breadcrumbTheme &&
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
      _this.breadcrumbTheme,
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
