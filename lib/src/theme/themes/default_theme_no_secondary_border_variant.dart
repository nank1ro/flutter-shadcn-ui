// ignore_for_file: overridden_fields

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';
import 'package:shadcn_ui/src/theme/components/accordion.dart';
import 'package:shadcn_ui/src/theme/components/alert.dart';
import 'package:shadcn_ui/src/theme/components/avatar.dart';
import 'package:shadcn_ui/src/theme/components/badge.dart';
import 'package:shadcn_ui/src/theme/components/button.dart';
import 'package:shadcn_ui/src/theme/components/calendar.dart';
import 'package:shadcn_ui/src/theme/components/card.dart';
import 'package:shadcn_ui/src/theme/components/checkbox.dart';
import 'package:shadcn_ui/src/theme/components/context_menu.dart';
import 'package:shadcn_ui/src/theme/components/date_picker.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/components/dialog.dart';
import 'package:shadcn_ui/src/theme/components/input.dart';
import 'package:shadcn_ui/src/theme/components/option.dart';
import 'package:shadcn_ui/src/theme/components/popover.dart';
import 'package:shadcn_ui/src/theme/components/progress.dart';
import 'package:shadcn_ui/src/theme/components/radio.dart';
import 'package:shadcn_ui/src/theme/components/resizable.dart';
import 'package:shadcn_ui/src/theme/components/select.dart';
import 'package:shadcn_ui/src/theme/components/sheet.dart';
import 'package:shadcn_ui/src/theme/components/slider.dart';
import 'package:shadcn_ui/src/theme/components/switch.dart';
import 'package:shadcn_ui/src/theme/components/table.dart';
import 'package:shadcn_ui/src/theme/components/tabs.dart';
import 'package:shadcn_ui/src/theme/components/time_picker.dart';
import 'package:shadcn_ui/src/theme/components/toast.dart';
import 'package:shadcn_ui/src/theme/components/tooltip.dart';
import 'package:shadcn_ui/src/theme/text_theme/text_styles_default.dart';
import 'package:shadcn_ui/src/theme/text_theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/base.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';
import 'package:shadcn_ui/src/utils/position.dart';

class ShadDefaultThemeNoSecondaryBorderVariant extends ShadThemeVariant {
  ShadDefaultThemeNoSecondaryBorderVariant({
    required this.colorScheme,
    required this.radius,
    required this.effectiveTextTheme,
  });

  final ShadColorScheme colorScheme;
  final BorderRadius radius;
  final ShadTextTheme effectiveTextTheme;

  @override
  ShadButtonTheme primaryButtonTheme() {
    return ShadButtonTheme(
      backgroundColor: colorScheme.primary,
      hoverBackgroundColor: colorScheme.primary.withOpacity(.9),
      foregroundColor: colorScheme.primaryForeground,
      hoverForegroundColor: colorScheme.primaryForeground,
      decoration: ShadDecoration(
        border: ShadBorder.all(
          radius: radius,
          width: 0,
          padding: const EdgeInsets.all(2),
        ),
      ),
      gap: 8,
    );
  }

  @override
  ShadButtonTheme secondaryButtonTheme() {
    return ShadButtonTheme(
      backgroundColor: colorScheme.secondary,
      hoverBackgroundColor: colorScheme.secondary.withOpacity(.8),
      foregroundColor: colorScheme.secondaryForeground,
      hoverForegroundColor: colorScheme.secondaryForeground,
      decoration: ShadDecoration(
        border: ShadBorder.all(
          radius: radius,
          width: 0,
          padding: const EdgeInsets.all(2),
        ),
      ),
      gap: 8,
    );
  }

  @override
  ShadButtonTheme destructiveButtonTheme() {
    return ShadButtonTheme(
      backgroundColor: colorScheme.destructive,
      hoverBackgroundColor: colorScheme.destructive.withOpacity(.9),
      foregroundColor: colorScheme.destructiveForeground,
      hoverForegroundColor: colorScheme.destructiveForeground,
      decoration: ShadDecoration(
        border: ShadBorder.all(
          radius: radius,
          width: 0,
          padding: const EdgeInsets.all(2),
        ),
      ),
      gap: 8,
    );
  }

  @override
  ShadButtonTheme outlineButtonTheme() {
    return ShadButtonTheme(
      hoverBackgroundColor: colorScheme.accent,
      foregroundColor: colorScheme.primary,
      hoverForegroundColor: colorScheme.accentForeground,
      decoration: ShadDecoration(
        border: ShadBorder.all(
          radius: radius,
          color: colorScheme.input,
          padding: const EdgeInsets.all(1),
        ),
      ),
      gap: 8,
    );
  }

  @override
  ShadButtonTheme ghostButtonTheme() {
    return ShadButtonTheme(
      hoverBackgroundColor: colorScheme.accent,
      foregroundColor: colorScheme.primary,
      hoverForegroundColor: colorScheme.accentForeground,
      decoration: ShadDecoration(
        border: ShadBorder.all(
          radius: radius,
          width: 0,
          padding: const EdgeInsets.all(2),
        ),
      ),
      gap: 8,
    );
  }

  @override
  ShadButtonTheme linkButtonTheme() {
    return ShadButtonTheme(
      foregroundColor: colorScheme.primary,
      hoverForegroundColor: colorScheme.primary,
      hoverTextDecoration: TextDecoration.underline,
      gap: 8,
    );
  }

  @override
  ShadButtonSizesTheme buttonSizesTheme() {
    return const ShadButtonSizesTheme(
      regular: ShadButtonSizeTheme(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      sm: ShadButtonSizeTheme(
        height: 36,
        padding: EdgeInsets.symmetric(horizontal: 12),
      ),
      lg: ShadButtonSizeTheme(
        height: 44,
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      ),
      icon: ShadButtonSizeTheme(
        height: 40,
        width: 40,
        padding: EdgeInsets.zero,
      ),
    );
  }

  @override
  ShadBadgeTheme primaryBadgeTheme() {
    return ShadBadgeTheme(
      backgroundColor: colorScheme.primary,
      hoverBackgroundColor: colorScheme.primary.withOpacity(.8),
      foregroundColor: colorScheme.primaryForeground,
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    );
  }

  @override
  ShadBadgeTheme secondaryBadgeTheme() {
    return ShadBadgeTheme(
      backgroundColor: colorScheme.secondary,
      hoverBackgroundColor: colorScheme.secondary.withOpacity(.8),
      foregroundColor: colorScheme.secondaryForeground,
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    );
  }

  @override
  ShadBadgeTheme destructiveBadgeTheme() {
    return ShadBadgeTheme(
      backgroundColor: colorScheme.destructive,
      hoverBackgroundColor: colorScheme.destructive.withOpacity(.8),
      foregroundColor: colorScheme.destructiveForeground,
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    );
  }

  @override
  ShadBadgeTheme outlineBadgeTheme() {
    return ShadBadgeTheme(
      foregroundColor: colorScheme.foreground,
      shape: StadiumBorder(side: BorderSide(color: colorScheme.border)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    );
  }

  @override
  ShadAvatarTheme avatarTheme() {
    return ShadAvatarTheme(
      size: const Size.square(40),
      shape: const CircleBorder(),
      backgroundColor: colorScheme.muted,
    );
  }

  @override
  ShadTooltipTheme tooltipTheme() {
    return ShadTooltipTheme(
      effects: const [
        FadeEffect(),
        ScaleEffect(begin: Offset(.95, .95), end: Offset(1, 1)),
        MoveEffect(begin: Offset(0, 2), end: Offset.zero),
      ],
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: ShadDecoration(
        border:
            ShadBorder.all(radius: radius, color: colorScheme.border, width: 0),
        color: colorScheme.popover,
        shadows: ShadShadows.md,
      ),
      anchor: const ShadAnchorAuto(
        preferBelow: false,
        verticalOffset: 24,
      ),
    );
  }

  @override
  ShadPopoverTheme popoverTheme() {
    return ShadPopoverTheme(
      effects: const [
        FadeEffect(duration: Duration(milliseconds: 100)),
        ScaleEffect(
          begin: Offset(.95, .95),
          end: Offset(1, 1),
          duration: Duration(milliseconds: 100),
        ),
        MoveEffect(
          begin: Offset(0, 2),
          end: Offset.zero,
          duration: Duration(milliseconds: 100),
        ),
      ],
      shadows: ShadShadows.md,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: ShadDecoration(
        color: colorScheme.popover,
        shadows: ShadShadows.md,
        border: ShadBorder.all(
          radius: radius,
          color: colorScheme.border,
        ),
      ),
      anchor: const ShadAnchorAuto(verticalOffset: 24),
    );
  }

  @override
  ShadDecoration decorationTheme() {
    return ShadDecoration(
      border: ShadBorder.all(width: 2, color: Colors.transparent),
      focusedBorder: ShadBorder.all(
        color: colorScheme.ring,
        radius: BorderRadius.circular(6),
        width: 2,
      ),
      labelStyle: effectiveTextTheme.muted.copyWith(
        fontWeight: FontWeight.w500,
        color: colorScheme.foreground,
      ),
      errorStyle: effectiveTextTheme.muted.copyWith(
        fontWeight: FontWeight.w500,
        color: colorScheme.destructive,
      ),
      labelPadding: const EdgeInsets.only(bottom: 8),
      descriptionStyle: effectiveTextTheme.muted,
      descriptionPadding: const EdgeInsets.only(top: 8),
      errorPadding: const EdgeInsets.only(top: 8),
      errorLabelStyle: effectiveTextTheme.muted.copyWith(
        fontWeight: FontWeight.w500,
        color: colorScheme.destructive,
      ),
    );
  }

  static ShadTextTheme get defaultTextTheme {
    const defaultFontFamily = 'packages/shadcn_ui/$kDefaultFontFamily';
    return ShadTextTheme.custom(
      h1Large: ShadTextDefaultTheme.h1Large(family: defaultFontFamily),
      h1: ShadTextDefaultTheme.h1(family: defaultFontFamily),
      h2: ShadTextDefaultTheme.h2(family: defaultFontFamily),
      h3: ShadTextDefaultTheme.h3(family: defaultFontFamily),
      h4: ShadTextDefaultTheme.h4(family: defaultFontFamily),
      p: ShadTextDefaultTheme.p(family: defaultFontFamily),
      blockquote: ShadTextDefaultTheme.blockquote(family: defaultFontFamily),
      table: ShadTextDefaultTheme.table(family: defaultFontFamily),
      list: ShadTextDefaultTheme.list(family: defaultFontFamily),
      lead: ShadTextDefaultTheme.lead(family: defaultFontFamily),
      large: ShadTextDefaultTheme.large(family: defaultFontFamily),
      small: ShadTextDefaultTheme.small(family: defaultFontFamily),
      muted: ShadTextDefaultTheme.muted(family: defaultFontFamily),
      family: defaultFontFamily,
    );
  }

  @override
  ShadSelectTheme selectTheme() {
    return ShadSelectTheme(
      minWidth: kDefaultSelectMinWidth,
      maxHeight: kDefaultSelectMaxHeight,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: ShadDecoration(
        border: ShadBorder.all(
          radius: radius,
          color: colorScheme.input,
          padding: const EdgeInsets.all(1),
        ),
      ),
      optionsPadding: const EdgeInsets.all(4),
      showScrollToTopChevron: true,
      showScrollToBottomChevron: true,
      anchor: const ShadAnchor(offset: Offset(1, 4)),
      searchPadding: const EdgeInsets.all(12),
    );
  }

  @override
  ShadOptionTheme optionTheme() {
    return ShadOptionTheme(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      hoveredBackgroundColor: colorScheme.accent,
    );
  }

  @override
  ShadCardTheme cardTheme() {
    return ShadCardTheme(
      backgroundColor: colorScheme.card,
      padding: const EdgeInsets.all(24),
      border: Border.all(color: colorScheme.border),
      radius: const BorderRadius.all(Radius.circular(8)),
      shadows: ShadShadows.sm,
      rowMainAxisSize: MainAxisSize.min,
      rowCrossAxisAlignment: CrossAxisAlignment.start,
      rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
      columnMainAxisSize: MainAxisSize.min,
      columnCrossAxisAlignment: CrossAxisAlignment.start,
      columnMainAxisAlignment: MainAxisAlignment.start,
    );
  }

  @override
  ShadSwitchTheme switchTheme() {
    const width = 44.0;
    const height = 24.0;
    const radius = BorderRadius.all(Radius.circular(height));
    return ShadSwitchTheme(
      width: width,
      height: height,
      margin: 2,
      duration: 100.milliseconds,
      thumbColor: colorScheme.background,
      uncheckedTrackColor: colorScheme.input,
      checkedTrackColor: colorScheme.primary,
      padding: const EdgeInsets.only(left: 8),
      decoration: ShadDecoration(
        border: ShadBorder.all(
          radius: radius,
          width: 0,
          padding: const EdgeInsets.all(2),
        ),
        focusedBorder: ShadBorder.all(
          radius: radius,
          width: 2,
        ),
      ),
    );
  }

  @override
  ShadCheckboxTheme checkboxTheme() {
    return ShadCheckboxTheme(
      size: 16,
      duration: 100.milliseconds,
      color: colorScheme.primary,
      padding: const EdgeInsets.only(left: 8),
      decoration: ShadDecoration(
        border: ShadBorder.all(
          color: colorScheme.primary,
          radius: radius,
          padding: const EdgeInsets.all(1),
        ),
        focusedBorder: ShadBorder.all(width: 2),
      ),
    );
  }

  @override
  ShadInputTheme inputTheme() {
    return ShadInputTheme(
      style: effectiveTextTheme.muted.copyWith(color: colorScheme.foreground),
      placeholderStyle: effectiveTextTheme.muted,
      placeholderAlignment: Alignment.topLeft,
      inputPadding: EdgeInsets.zero,
      decoration: ShadDecoration(
        border: ShadBorder.all(
          width: 2,
          color: colorScheme.border,
          radius: radius,
        ),
      ),
      gap: 8,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }

  @override
  ShadRadioTheme radioTheme() {
    const circleSize = 10.0;
    const radius = BorderRadius.all(Radius.circular(circleSize));
    return ShadRadioTheme(
      size: 16,
      circleSize: circleSize,
      duration: 100.milliseconds,
      color: colorScheme.primary,
      padding: const EdgeInsets.only(left: 8),
      decoration: ShadDecoration(
        shape: BoxShape.circle,
        border: ShadBorder.all(
          color: colorScheme.primary,
          padding: const EdgeInsets.all(1),
        ),
        focusedBorder: ShadBorder.all(radius: radius.add(radius / 2), width: 2),
      ),
      spacing: 4,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      axis: Axis.vertical,
    );
  }

  @override
  ShadToastTheme primaryToastTheme() {
    return ShadToastTheme(
      alignment: Alignment.bottomRight,
      closeIconSrc: LucideIcons.x,
      titleStyle: effectiveTextTheme.muted.copyWith(
        fontWeight: FontWeight.w500,
        color: colorScheme.foreground,
      ),
      descriptionStyle: effectiveTextTheme.muted.copyWith(
        color: colorScheme.foreground.withOpacity(.9),
      ),
      actionPadding: const EdgeInsets.only(left: 16),
      border: Border.all(color: colorScheme.border),
      shadows: ShadShadows.lg,
      backgroundColor: colorScheme.background,
      crossAxisAlignment: CrossAxisAlignment.center,
      closeIconPosition: const ShadPosition(top: 8, right: 8),
      showCloseIconOnlyWhenHovered: true,
      padding: const EdgeInsets.fromLTRB(24, 24, 32, 24),
    );
  }

  @override
  ShadToastTheme destructiveToastTheme() {
    return ShadToastTheme(
      alignment: Alignment.bottomRight,
      closeIconSrc: LucideIcons.x,
      titleStyle: effectiveTextTheme.muted.copyWith(
        fontWeight: FontWeight.w500,
        color: colorScheme.destructiveForeground,
      ),
      descriptionStyle: effectiveTextTheme.muted.copyWith(
        color: colorScheme.destructiveForeground.withOpacity(.9),
      ),
      actionPadding: const EdgeInsets.only(left: 16),
      border: Border.all(color: colorScheme.border),
      shadows: ShadShadows.lg,
      backgroundColor: colorScheme.destructive,
      crossAxisAlignment: CrossAxisAlignment.center,
      closeIconPosition: const ShadPosition(top: 8, right: 8),
      showCloseIconOnlyWhenHovered: true,
      padding: const EdgeInsets.fromLTRB(24, 24, 32, 24),
    );
  }

  @override
  ShadAlertTheme primaryAlertTheme() {
    return ShadAlertTheme(
      iconPadding: const EdgeInsets.only(right: 12),
      decoration: ShadDecoration(
        border: ShadBorder.all(
          color: colorScheme.border,
          radius: radius,
          padding: const EdgeInsets.all(16),
        ),
      ),
      iconSize: const Size.square(16),
      iconColor: colorScheme.foreground,
      titleStyle: effectiveTextTheme.p.copyWith(
        color: colorScheme.foreground,
        fontWeight: FontWeight.w500,
        height: 1,
      ),
      descriptionStyle: effectiveTextTheme.muted.copyWith(
        color: colorScheme.foreground,
      ),
    );
  }

  @override
  ShadAlertTheme destructiveAlertTheme() {
    return ShadAlertTheme(
      iconPadding: const EdgeInsets.only(right: 12),
      decoration: ShadDecoration(
        border: ShadBorder.all(
          color: colorScheme.destructive,
          radius: radius,
          padding: const EdgeInsets.all(16),
        ),
      ),
      iconSize: const Size.square(16),
      iconColor: colorScheme.destructive,
      titleStyle: effectiveTextTheme.p.copyWith(
        color: colorScheme.destructive,
        fontWeight: FontWeight.w500,
        height: 1,
      ),
      descriptionStyle: effectiveTextTheme.muted.copyWith(
        color: colorScheme.destructive,
      ),
    );
  }

  @override
  ShadDialogTheme primaryDialogTheme() {
    return ShadDialogTheme(
      closeIconSrc: LucideIcons.x,
      radius: const BorderRadius.all(Radius.circular(8)),
      backgroundColor: colorScheme.background,
      removeBorderRadiusWhenTiny: true,
      expandActionsWhenTiny: true,
      closeIconPosition: const ShadPosition(top: 8, right: 8),
      animateIn: const [
        FadeEffect(),
        ScaleEffect(begin: Offset(.95, .95), end: Offset(1, 1)),
      ],
      animateOut: const [
        FadeEffect(begin: 1, end: 0),
        ScaleEffect(begin: Offset(1, 1), end: Offset(.95, .95)),
      ],
      constraints: const BoxConstraints(maxWidth: 512),
      shadows: ShadShadows.lg,
      padding: const EdgeInsets.all(24),
      gap: 8,
      titleStyle: effectiveTextTheme.large,
      descriptionStyle: effectiveTextTheme.muted,
      alignment: Alignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }

  @override
  ShadDialogTheme alertDialogTheme() {
    return ShadDialogTheme(
      backgroundColor: colorScheme.background,
      radius: const BorderRadius.all(Radius.circular(8)),
      removeBorderRadiusWhenTiny: true,
      expandActionsWhenTiny: true,
      closeIconPosition: const ShadPosition(top: 8, right: 8),
      animateIn: const [
        FadeEffect(),
        ScaleEffect(begin: Offset(.95, .95), end: Offset(1, 1)),
      ],
      animateOut: const [
        FadeEffect(begin: 1, end: 0),
        ScaleEffect(begin: Offset(1, 1), end: Offset(.95, .95)),
      ],
      constraints: const BoxConstraints(maxWidth: 512),
      shadows: ShadShadows.lg,
      padding: const EdgeInsets.all(24),
      gap: 8,
      titleStyle: effectiveTextTheme.large,
      descriptionStyle: effectiveTextTheme.muted,
      alignment: Alignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }

  @override
  ShadSliderTheme sliderTheme() {
    return ShadSliderTheme(
      mouseCursor: SystemMouseCursors.click,
      disabledMouseCursor: SystemMouseCursors.forbidden,
      min: 0,
      max: 1,
      thumbColor: colorScheme.background,
      thumbBorderColor: colorScheme.primary,
      disabledThumbColor: colorScheme.background,
      disabledThumbBorderColor: colorScheme.primary.withOpacity(.5),
      activeTrackColor: colorScheme.primary,
      inactiveTrackColor: colorScheme.secondary,
      disabledActiveTrackColor: colorScheme.primary.withOpacity(.5),
      disabledInactiveTrackColor: colorScheme.secondary.withOpacity(.5),
      trackHeight: 8,
      thumbRadius: 10,
    );
  }

  @override
  ShadSheetTheme sheetTheme() {
    return const ShadSheetTheme(
      radius: BorderRadius.zero,
      expandCrossSide: true,
    );
  }

  @override
  ShadProgressTheme progressTheme() {
    return ShadProgressTheme(
      minHeight: 16,
      color: colorScheme.primary,
      backgroundColor: colorScheme.secondary,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
    );
  }

  @override
  ShadAccordionTheme accordionTheme() {
    const bezierCurve = Cubic(0.87, 0, 0.13, 1);
    const duration = Duration(milliseconds: 300);
    return ShadAccordionTheme(
      iconSrc: LucideIcons.chevronDown,
      padding: const EdgeInsets.symmetric(vertical: 16),
      underlineTitleOnHover: true,
      duration: duration,
      maintainState: false,
      iconEffects: const [
        RotateEffect(
          begin: 0,
          end: .5,
          duration: duration,
          curve: bezierCurve,
        ),
      ],
      curve: bezierCurve,
      titleStyle: effectiveTextTheme.list.copyWith(
        fontWeight: FontWeight.w500,
      ),
    );
  }

  @override
  ShadTableTheme tableTheme() {
    return ShadTableTheme(
      diagonalDragBehavior: DiagonalDragBehavior.none,
      dragStartBehavior: DragStartBehavior.start,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
      cellAlignment: Alignment.centerLeft,
      cellHeight: 48,
      cellPadding: const EdgeInsets.symmetric(horizontal: 16),
      cellStyle:
          effectiveTextTheme.muted.copyWith(color: colorScheme.foreground),
      cellHeaderStyle:
          effectiveTextTheme.muted.copyWith(fontWeight: FontWeight.w500),
      cellFooterStyle: effectiveTextTheme.muted
          .copyWith(color: colorScheme.foreground, fontWeight: FontWeight.w500),
    );
  }

  @override
  ShadResizableTheme resizableTheme() {
    return ShadResizableTheme(
      showHandle: false,
      dividerThickness: 1,
      dividerSize: 8,
      dividerColor: colorScheme.border,
      resetOnDoubleTap: true,
      handleDecoration: ShadDecoration(
        merge: false,
        color: colorScheme.border,
        border: ShadBorder.all(
          radius: const BorderRadius.all(Radius.circular(4)),
          width: 0,
        ),
      ),
      handleSize: const Size.square(10),
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      verticalDirection: VerticalDirection.down,
    );
  }

  @override
  ShadHoverStrategies hoverStrategies() {
    return const ShadHoverStrategies(
      hover: {
        ShadHoverStrategy.onTapDown,
        ShadHoverStrategy.onLongPressDown,
        ShadHoverStrategy.onLongPressStart,
      },
      unhover: {
        ShadHoverStrategy.onTapUp,
        ShadHoverStrategy.onTapCancel,
        ShadHoverStrategy.onLongPressUp,
        ShadHoverStrategy.onLongPressEnd,
        ShadHoverStrategy.onLongPressCancel,
      },
    );
  }

  @override
  ShadTabsTheme tabsTheme() {
    return ShadTabsTheme(
      dragStartBehavior: DragStartBehavior.start,
      padding: const EdgeInsets.all(4),
      decoration: ShadDecoration(
        merge: false,
        color: colorScheme.muted,
        border: ShadBorder.all(radius: radius, width: 0),
      ),
      gap: 8,
      expandContent: false,
      tabBackgroundColor: Colors.transparent,
      tabSelectedBackgroundColor: colorScheme.background,
      tabHoverBackgroundColor: Colors.transparent,
      tabSelectedHoverBackgroundColor: colorScheme.background,
      tabPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      tabForegroundColor: colorScheme.foreground,
      tabSelectedForegroundColor: colorScheme.foreground,
      tabSelectedShadows: ShadShadows.sm,
    );
  }

  @override
  ShadTextTheme textTheme() {
    return effectiveTextTheme;
  }

  @override
  ShadContextMenuTheme contextMenuTheme() => ShadContextMenuTheme(
        constraints: const BoxConstraints(minWidth: 128),
        padding: const EdgeInsets.symmetric(vertical: 4),
        itemPadding: const EdgeInsets.symmetric(horizontal: 4),
        leadingPadding: const EdgeInsets.only(right: 8),
        trailingPadding: const EdgeInsets.only(left: 8),
        showDelay: const Duration(milliseconds: 100),
        height: 32,
        buttonVariant: ShadButtonVariant.ghost,
        itemDecoration: ShadDecoration(
          focusedBorder: decorationTheme().border,
        ),
        textStyle:
            effectiveTextTheme.small.copyWith(fontWeight: FontWeight.normal),
        trailingTextStyle:
            effectiveTextTheme.muted.copyWith(fontSize: 12, height: 1),
        selectedBackgroundColor: colorScheme.accent,
      );

  @override
  ShadCalendarTheme calendarTheme() => ShadCalendarTheme(
        hideNavigation: false,
        yearSelectorMinWidth: 100,
        monthSelectorMinWidth: 130,
        yearSelectorPadding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        monthSelectorPadding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        navigationButtonSize: 28,
        navigationButtonIconSize: 16,
        backNavigationButtonSrc: LucideIcons.chevronLeft,
        forwardNavigationButtonSrc: LucideIcons.chevronRight,
        navigationButtonPadding: EdgeInsets.zero,
        navigationButtonDisabledOpacity: .5,
        decoration: ShadDecoration(
          border: ShadBorder.all(
            radius: radius,
            padding: const EdgeInsets.all(12),
            color: colorScheme.border,
          ),
        ),
        spacingBetweenMonths: 16,
        runSpacingBetweenMonths: 16,
        headerHeight: 38,
        headerPadding: const EdgeInsets.only(bottom: 16),
        captionLayoutGap: 8,
        headerTextStyle: effectiveTextTheme.small,
        weekdaysPadding: const EdgeInsets.only(bottom: 8),
        weekNumbersHeaderText: '#',
        weekNumbersHeaderTextStyle: textTheme().muted.copyWith(fontSize: 12.8),
        weekNumbersTextStyle: textTheme().muted.copyWith(fontSize: 12.8),
        dayButtonSize: 36,
        dayButtonOutsideMonthOpacity: .5,
        dayButtonPadding: EdgeInsets.zero,
        selectedDayButtonTextStyle: textTheme().small.copyWith(
              fontWeight: FontWeight.normal,
              color: colorScheme.primaryForeground,
            ),
        insideRangeDayButtonTextStyle: textTheme().small.copyWith(
              color: colorScheme.foreground,
            ),
        dayButtonTextStyle: textTheme().small.copyWith(
              fontWeight: FontWeight.normal,
              color: colorScheme.foreground,
            ),
        dayButtonOutsideMonthVariant: ShadButtonVariant.ghost,
        dayButtonOutsideMonthTextStyle: textTheme().muted,
        dayButtonVariant: ShadButtonVariant.ghost,
        todayButtonVariant: ShadButtonVariant.secondary,
        selectedDayButtonVariant: ShadButtonVariant.primary,
        selectedDayButtonOusideMonthVariant: ShadButtonVariant.secondary,
        insideRangeDayButtonVariant: ShadButtonVariant.secondary,
        weekdaysTextStyle: textTheme().muted.copyWith(fontSize: 12.8),
        weekdaysTextAlign: TextAlign.center,
        gridMainAxisSpacing: 8,
        gridCrossAxisSpacing: 0,
        hideWeekdayNames: false,
        showOutsideDays: true,
        formatMonthYear: (date) => DateFormat('LLLL y').format(date),
        formatMonth: (date) => DateFormat('LLLL').format(date),
        formatYear: (date) => DateFormat('y').format(date),
        formatWeekday: (DateTime date) {
          final s = DateFormat('EE').format(date);
          if (s.length < 2) return s;
          return s.substring(0, 2);
        },
        showWeekNumbers: false,
        weekStartsOn: 1,
        fixedWeeks: false,
        allowDeselection: false,
      );

  @override
  ShadDatePickerTheme datePickerTheme() {
    return const ShadDatePickerTheme(
      calendarDecoration: ShadDecoration.none,
      allowDeselection: true,
      buttonVariant: ShadButtonVariant.outline,
      width: 276,
      mainAxisAlignment: MainAxisAlignment.start,
      iconSrc: LucideIcons.calendar,
    );
  }

  @override
  ShadTimePickerTheme timePickerTheme() {
    return ShadTimePickerTheme(
      axis: Axis.horizontal,
      spacing: 4,
      runSpacing: 4,
      jumpToNextFieldWhenFilled: true,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      gap: 2,
      style: effectiveTextTheme.muted.copyWith(
        color: colorScheme.foreground,
        fontSize: 16,
        height: 24 / 16,
      ),
      placeholderStyle: effectiveTextTheme.muted.copyWith(
        fontSize: 16,
        height: 24 / 16,
      ),
      labelStyle: effectiveTextTheme.small.copyWith(fontSize: 12),
      fieldWidth: 50,
      fieldPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      periodHeight: 44,
      periodMinWidth: 65,
      fieldDecoration: ShadDecoration(
        border: ShadBorder.all(
          width: 2,
          color: colorScheme.border,
          radius: radius,
        ),
      ),
      periodDecoration: ShadDecoration(
        border: ShadBorder.all(
          width: 2,
          color: colorScheme.border,
          radius: radius,
        ),
        focusedBorder: ShadBorder.all(
          width: 2,
          color: colorScheme.ring,
          radius: radius,
          padding: const EdgeInsets.symmetric(horizontal: 1),
        ),
      ),
    );
  }
}
