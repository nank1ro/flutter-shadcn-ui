import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';
import 'package:shadcn_ui/src/theme/color_scheme/slate.dart';
import 'package:shadcn_ui/src/theme/components/accordion.dart';
import 'package:shadcn_ui/src/theme/components/alert.dart';
import 'package:shadcn_ui/src/theme/components/avatar.dart';
import 'package:shadcn_ui/src/theme/components/badge.dart';
import 'package:shadcn_ui/src/theme/components/breadcrumb.dart';
import 'package:shadcn_ui/src/theme/components/button.dart';
import 'package:shadcn_ui/src/theme/components/button_sizes.dart';
import 'package:shadcn_ui/src/theme/components/calendar.dart';
import 'package:shadcn_ui/src/theme/components/card.dart';
import 'package:shadcn_ui/src/theme/components/checkbox.dart';
import 'package:shadcn_ui/src/theme/components/context_menu.dart';
import 'package:shadcn_ui/src/theme/components/date_picker.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/components/default_keyboard_toolbar.dart';
import 'package:shadcn_ui/src/theme/components/dialog.dart';
import 'package:shadcn_ui/src/theme/components/input.dart';
import 'package:shadcn_ui/src/theme/components/input_otp.dart';
import 'package:shadcn_ui/src/theme/components/menubar.dart';
import 'package:shadcn_ui/src/theme/components/option.dart';
import 'package:shadcn_ui/src/theme/components/pagination.dart';
import 'package:shadcn_ui/src/theme/components/popover.dart';
import 'package:shadcn_ui/src/theme/components/progress.dart';
import 'package:shadcn_ui/src/theme/components/radio.dart';
import 'package:shadcn_ui/src/theme/components/resizable.dart';
import 'package:shadcn_ui/src/theme/components/select.dart';
import 'package:shadcn_ui/src/theme/components/separator.dart';
import 'package:shadcn_ui/src/theme/components/sheet.dart';
import 'package:shadcn_ui/src/theme/components/slider.dart';
import 'package:shadcn_ui/src/theme/components/sonner.dart';
import 'package:shadcn_ui/src/theme/components/switch.dart';
import 'package:shadcn_ui/src/theme/components/table.dart';
import 'package:shadcn_ui/src/theme/components/tabs.dart';
import 'package:shadcn_ui/src/theme/components/textarea.dart';
import 'package:shadcn_ui/src/theme/components/time_picker.dart';
import 'package:shadcn_ui/src/theme/components/toast.dart';
import 'package:shadcn_ui/src/theme/components/tooltip.dart';
import 'package:shadcn_ui/src/theme/text_theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/base.dart';
import 'package:shadcn_ui/src/theme/themes/default_theme_no_secondary_border_variant.dart';
import 'package:shadcn_ui/src/theme/themes/default_theme_variant.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';
import 'package:shadcn_ui/src/utils/responsive.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'data.g.theme.dart';

@immutable
@ThemeGen()
class ShadThemeData extends ShadBaseTheme with _$ShadThemeData {
  factory ShadThemeData({
    /// The color scheme to use for the theme.
    /// Defaults to [ShadSlateColorScheme] based on the [brightness].
    ShadColorScheme? colorScheme,

    /// The overall brightness of the theme, defaults to [Brightness.light].
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
    ShadThemeVariant? variant,
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
    ShadPaginationTheme? paginationTheme,
  }) {
    final effectiveRadius =
        radius ?? const BorderRadius.all(Radius.circular(6));

    final effectiveTextTheme = ShadDefaultThemeVariant.defaultTextTheme.merge(
      textTheme,
    );

    final effectiveDisableSecondaryBorder = disableSecondaryBorder ?? false;
    final effectiveBrightness = brightness ?? Brightness.light;
    final effectiveColorScheme =
        colorScheme ??
        switch (effectiveBrightness) {
          Brightness.light => const ShadSlateColorScheme.light(),
          Brightness.dark => const ShadSlateColorScheme.dark(),
        };

    final effectiveVariant =
        variant ??
        switch (effectiveDisableSecondaryBorder) {
          false => ShadDefaultThemeVariant(
            colorScheme: effectiveColorScheme,
            radius: effectiveRadius,
            effectiveTextTheme: effectiveTextTheme,
          ),
          true => ShadDefaultThemeNoSecondaryBorderVariant(
            colorScheme: effectiveColorScheme,
            radius: effectiveRadius,
            effectiveTextTheme: effectiveTextTheme,
          ),
        };

    return ShadThemeData._internal(
      colorScheme: effectiveColorScheme,
      brightness: effectiveBrightness,
      primaryButtonTheme: effectiveVariant.primaryButtonTheme().merge(
        primaryButtonTheme,
      ),
      secondaryButtonTheme: effectiveVariant.secondaryButtonTheme().merge(
        secondaryButtonTheme,
      ),
      destructiveButtonTheme: effectiveVariant.destructiveButtonTheme().merge(
        destructiveButtonTheme,
      ),
      outlineButtonTheme: effectiveVariant.outlineButtonTheme().merge(
        outlineButtonTheme,
      ),
      ghostButtonTheme: effectiveVariant.ghostButtonTheme().merge(
        ghostButtonTheme,
      ),
      linkButtonTheme: effectiveVariant.linkButtonTheme().merge(
        linkButtonTheme,
      ),
      primaryBadgeTheme: effectiveVariant.primaryBadgeTheme().merge(
        primaryBadgeTheme,
      ),
      secondaryBadgeTheme: effectiveVariant.secondaryBadgeTheme().merge(
        secondaryBadgeTheme,
      ),
      destructiveBadgeTheme: effectiveVariant.destructiveBadgeTheme().merge(
        destructiveBadgeTheme,
      ),
      outlineBadgeTheme: effectiveVariant.outlineBadgeTheme().merge(
        outlineBadgeTheme,
      ),
      breadcrumbTheme: effectiveVariant.breadcrumbTheme().merge(
        breadcrumbTheme,
      ),
      buttonSizesTheme: effectiveVariant.buttonSizesTheme().merge(
        buttonSizesTheme,
      ),
      radius: effectiveRadius,
      avatarTheme: effectiveVariant.avatarTheme().merge(avatarTheme),
      tooltipTheme: effectiveVariant.tooltipTheme().merge(tooltipTheme),
      popoverTheme: effectiveVariant.popoverTheme().merge(popoverTheme),
      decoration: effectiveVariant.decorationTheme().merge(decoration),
      textTheme: effectiveTextTheme,
      disabledOpacity: disabledOpacity ?? .5,
      selectTheme: effectiveVariant.selectTheme().merge(selectTheme),
      optionTheme: effectiveVariant.optionTheme().merge(optionTheme),
      cardTheme: effectiveVariant.cardTheme().merge(cardTheme),
      switchTheme: effectiveVariant.switchTheme().merge(switchTheme),
      checkboxTheme: effectiveVariant.checkboxTheme().merge(checkboxTheme),
      inputTheme: effectiveVariant.inputTheme().merge(inputTheme),
      radioTheme: effectiveVariant.radioTheme().merge(radioTheme),
      primaryToastTheme: effectiveVariant.primaryToastTheme().merge(
        primaryToastTheme,
      ),
      destructiveToastTheme: effectiveVariant.destructiveToastTheme().merge(
        destructiveToastTheme,
      ),
      breakpoints: breakpoints ?? ShadBreakpoints(),
      primaryAlertTheme: effectiveVariant.primaryAlertTheme().merge(
        primaryAlertTheme,
      ),
      destructiveAlertTheme: effectiveVariant.destructiveAlertTheme().merge(
        destructiveAlertTheme,
      ),
      primaryDialogTheme: effectiveVariant.primaryDialogTheme().merge(
        primaryDialogTheme,
      ),
      alertDialogTheme: effectiveVariant.alertDialogTheme().merge(
        alertDialogTheme,
      ),
      sliderTheme: effectiveVariant.sliderTheme().merge(sliderTheme),
      sheetTheme: effectiveVariant.sheetTheme().merge(sheetTheme),
      progressTheme: effectiveVariant.progressTheme().merge(progressTheme),
      accordionTheme: effectiveVariant.accordionTheme().merge(accordionTheme),
      tableTheme: effectiveVariant.tableTheme().merge(tableTheme),
      resizableTheme: effectiveVariant.resizableTheme().merge(resizableTheme),
      hoverStrategies: hoverStrategies ?? effectiveVariant.hoverStrategies(),
      disableSecondaryBorder: effectiveDisableSecondaryBorder,
      tabsTheme: effectiveVariant.tabsTheme().merge(tabsTheme),
      contextMenuTheme: effectiveVariant.contextMenuTheme().merge(
        contextMenuTheme,
      ),
      calendarTheme: effectiveVariant.calendarTheme().merge(calendarTheme),
      datePickerTheme: effectiveVariant.datePickerTheme().merge(
        datePickerTheme,
      ),
      timePickerTheme: effectiveVariant.timePickerTheme().merge(
        timePickerTheme,
      ),
      inputOTPTheme: effectiveVariant.inputOTPTheme().merge(inputOTPTheme),
      menubarTheme: effectiveVariant.menubarTheme().merge(menubarTheme),
      separatorTheme: effectiveVariant.separatorTheme().merge(separatorTheme),
      sonnerTheme: effectiveVariant.sonnerTheme().merge(sonnerTheme),
      textareaTheme: effectiveVariant.textareaTheme().merge(textareaTheme),
      defaultKeyboardToolbarTheme: effectiveVariant
          .defaultKeyboardToolbarTheme()
          .merge(defaultKeyboardToolbarTheme),
      shadPaginationTheme: effectiveVariant.paginationTheme().merge(
        paginationTheme,
      ),
    );
  }

  const ShadThemeData._internal({
    required super.colorScheme,
    required super.brightness,
    required super.primaryButtonTheme,
    required super.secondaryButtonTheme,
    required super.destructiveButtonTheme,
    required super.outlineButtonTheme,
    required super.ghostButtonTheme,
    required super.linkButtonTheme,
    required super.primaryBadgeTheme,
    required super.secondaryBadgeTheme,
    required super.destructiveBadgeTheme,
    required super.outlineBadgeTheme,
    required super.breadcrumbTheme,
    required super.radius,
    required super.avatarTheme,
    required super.buttonSizesTheme,
    required super.tooltipTheme,
    required super.popoverTheme,
    required super.decoration,
    required super.textTheme,
    required super.disabledOpacity,
    required super.selectTheme,
    required super.optionTheme,
    required super.cardTheme,
    required super.switchTheme,
    required super.checkboxTheme,
    required super.inputTheme,
    required super.radioTheme,
    required super.primaryToastTheme,
    required super.destructiveToastTheme,
    required super.breakpoints,
    required super.primaryAlertTheme,
    required super.destructiveAlertTheme,
    required super.primaryDialogTheme,
    required super.alertDialogTheme,
    required super.sliderTheme,
    required super.sheetTheme,
    required super.progressTheme,
    required super.accordionTheme,
    required super.tableTheme,
    required super.resizableTheme,
    required super.hoverStrategies,
    required super.disableSecondaryBorder,
    required super.tabsTheme,
    required super.contextMenuTheme,
    required super.calendarTheme,
    required super.datePickerTheme,
    required super.timePickerTheme,
    required super.inputOTPTheme,
    required super.menubarTheme,
    required super.separatorTheme,
    required super.sonnerTheme,
    required super.textareaTheme,
    required super.defaultKeyboardToolbarTheme,
    required super.shadPaginationTheme,
  });

  static ShadThemeData? lerp(
    ShadThemeData? a,
    ShadThemeData? b,
    double t,
  ) => _$ShadThemeData.lerp(a, b, t);
}
