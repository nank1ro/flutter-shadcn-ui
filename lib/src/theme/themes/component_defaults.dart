import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';
import 'package:shadcn_ui/src/theme/components/accordion.dart';
import 'package:shadcn_ui/src/theme/components/alert.dart';
import 'package:shadcn_ui/src/theme/components/avatar.dart';
import 'package:shadcn_ui/src/theme/components/badge.dart';
import 'package:shadcn_ui/src/theme/components/button.dart';
import 'package:shadcn_ui/src/theme/components/card.dart';
import 'package:shadcn_ui/src/theme/components/checkbox.dart';
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
import 'package:shadcn_ui/src/theme/components/toast.dart';
import 'package:shadcn_ui/src/theme/components/tooltip.dart';
import 'package:shadcn_ui/src/theme/text_theme/text_styles_default.dart';
import 'package:shadcn_ui/src/theme/text_theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';
import 'package:shadcn_ui/src/utils/position.dart';

abstract class ShadDefaultComponentThemes {
  static ShadButtonTheme primaryButtonTheme({
    required ShadColorScheme colorScheme,
    required BorderRadius radius,
  }) {
    return ShadButtonTheme(
      backgroundColor: colorScheme.primary,
      hoverBackgroundColor: colorScheme.primary.withOpacity(.9),
      foregroundColor: colorScheme.primaryForeground,
      hoverForegroundColor: colorScheme.primaryForeground,
      decoration: ShadDecoration(border: ShadBorder(radius: radius)),
    );
  }

  static ShadButtonTheme secondaryButtonTheme({
    required ShadColorScheme colorScheme,
    required BorderRadius radius,
  }) {
    return ShadButtonTheme(
      backgroundColor: colorScheme.secondary,
      hoverBackgroundColor: colorScheme.secondary.withOpacity(.8),
      foregroundColor: colorScheme.secondaryForeground,
      hoverForegroundColor: colorScheme.secondaryForeground,
      decoration: ShadDecoration(border: ShadBorder(radius: radius)),
    );
  }

  static ShadButtonTheme destructiveButtonTheme({
    required ShadColorScheme colorScheme,
    required BorderRadius radius,
  }) {
    return ShadButtonTheme(
      backgroundColor: colorScheme.destructive,
      hoverBackgroundColor: colorScheme.destructive.withOpacity(.9),
      foregroundColor: colorScheme.destructiveForeground,
      hoverForegroundColor: colorScheme.destructiveForeground,
      decoration: ShadDecoration(border: ShadBorder(radius: radius)),
    );
  }

  static ShadButtonTheme outlineButtonTheme({
    required ShadColorScheme colorScheme,
    required BorderRadius radius,
  }) {
    return ShadButtonTheme(
      hoverBackgroundColor: colorScheme.accent,
      foregroundColor: colorScheme.primary,
      hoverForegroundColor: colorScheme.accentForeground,
      decoration: ShadDecoration(
        border: ShadBorder(radius: radius, color: colorScheme.input),
      ),
    );
  }

  static ShadButtonTheme ghostButtonTheme({
    required ShadColorScheme colorScheme,
    required BorderRadius radius,
  }) {
    return ShadButtonTheme(
      hoverBackgroundColor: colorScheme.accent,
      foregroundColor: colorScheme.primary,
      hoverForegroundColor: colorScheme.accentForeground,
      decoration: ShadDecoration(border: ShadBorder(radius: radius)),
    );
  }

  static ShadButtonTheme linkButtonTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadButtonTheme(
      foregroundColor: colorScheme.primary,
      hoverForegroundColor: colorScheme.primary,
      hoverTextDecoration: TextDecoration.underline,
    );
  }

  static ShadButtonSizesTheme buttonSizesTheme() {
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

  static ShadBadgeTheme primaryBadgeTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadBadgeTheme(
      backgroundColor: colorScheme.primary,
      hoverBackgroundColor: colorScheme.primary.withOpacity(.8),
      foregroundColor: colorScheme.primaryForeground,
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    );
  }

  static ShadBadgeTheme secondaryBadgeTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadBadgeTheme(
      backgroundColor: colorScheme.secondary,
      hoverBackgroundColor: colorScheme.secondary.withOpacity(.8),
      foregroundColor: colorScheme.secondaryForeground,
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    );
  }

  static ShadBadgeTheme destructiveBadgeTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadBadgeTheme(
      backgroundColor: colorScheme.destructive,
      hoverBackgroundColor: colorScheme.destructive.withOpacity(.8),
      foregroundColor: colorScheme.destructiveForeground,
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    );
  }

  static ShadBadgeTheme outlineBadgeTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadBadgeTheme(
      foregroundColor: colorScheme.foreground,
      shape: StadiumBorder(side: BorderSide(color: colorScheme.border)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    );
  }

  static ShadAvatarTheme avatarTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadAvatarTheme(
      size: const Size.square(40),
      shape: const CircleBorder(),
      backgroundColor: colorScheme.muted,
    );
  }

  static ShadTooltipTheme tooltipTheme({
    required ShadColorScheme colorScheme,
    required BorderRadius radius,
  }) {
    return ShadTooltipTheme(
      effects: const [
        FadeEffect(),
        ScaleEffect(begin: Offset(.95, .95), end: Offset(1, 1)),
        MoveEffect(begin: Offset(0, 2), end: Offset.zero),
      ],
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: ShadDecoration(
        border: ShadBorder(radius: radius, color: colorScheme.border),
        color: colorScheme.popover,
        shadows: ShadShadows.md,
      ),
      anchor: const ShadAnchorAuto(
        preferBelow: false,
        verticalOffset: 24,
      ),
    );
  }

  static ShadPopoverTheme popoverTheme({
    required ShadColorScheme colorScheme,
    required BorderRadius radius,
  }) {
    return ShadPopoverTheme(
      effects: const [
        FadeEffect(),
        ScaleEffect(begin: Offset(.95, .95), end: Offset(1, 1)),
        MoveEffect(begin: Offset(0, 2), end: Offset.zero),
      ],
      shadows: ShadShadows.md,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: ShadDecoration(
        color: colorScheme.popover,
        shadows: ShadShadows.md,
        border: ShadBorder(
          radius: radius,
          color: colorScheme.border,
        ),
      ),
      anchor: const ShadAnchorAuto(preferBelow: true, verticalOffset: 24),
    );
  }

  static ShadDecoration decorationTheme({
    required ShadColorScheme colorScheme,
    required BorderRadius radius,
    required ShadTextTheme textTheme,
  }) {
    return ShadDecoration(
      secondaryBorder: const ShadBorder(padding: EdgeInsets.all(4)),
      secondaryFocusedBorder: ShadBorder(
        width: 2,
        color: colorScheme.ring,
        radius: radius.add(radius / 2),
        padding: const EdgeInsets.all(2),
      ),
      labelStyle: textTheme.muted.copyWith(
        fontWeight: FontWeight.w500,
        color: colorScheme.foreground,
      ),
      errorStyle: textTheme.muted.copyWith(
        fontWeight: FontWeight.w500,
        color: colorScheme.destructive,
      ),
      labelPadding: const EdgeInsets.only(bottom: 8),
      descriptionStyle: textTheme.muted,
      descriptionPadding: const EdgeInsets.only(top: 8),
      errorPadding: const EdgeInsets.only(top: 8),
      errorLabelStyle: textTheme.muted.copyWith(
        fontWeight: FontWeight.w500,
        color: colorScheme.destructive,
      ),
    );
  }

  static ShadTextTheme textTheme() {
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

  static ShadSelectTheme selectTheme({
    required ShadColorScheme colorScheme,
    required BorderRadius radius,
  }) {
    return ShadSelectTheme(
      minWidth: kDefaultSelectMinWidth,
      maxHeight: kDefaultSelectMaxHeight,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: ShadDecoration(
        border: ShadBorder(radius: radius, color: colorScheme.input),
      ),
      optionsPadding: const EdgeInsets.all(4),
      showScrollToTopChevron: true,
      showScrollToBottomChevron: true,
      anchor: const ShadAnchor(
        overlayAlignment: Alignment.bottomLeft,
        childAlignment: Alignment.topLeft,
        offset: Offset.zero,
      ),
      searchPadding: const EdgeInsets.all(12),
    );
  }

  static ShadOptionTheme optionTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadOptionTheme(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      hoveredBackgroundColor: colorScheme.accent,
    );
  }

  static ShadCardTheme cardTheme({
    required ShadColorScheme colorScheme,
  }) {
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

  static ShadSwitchTheme switchTheme({
    required ShadColorScheme colorScheme,
  }) {
    const width = 44.0;
    const height = 24.0;
    const radius = BorderRadius.all(Radius.circular(height / 2));
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
        border: ShadBorder(radius: radius.add(radius / 2)),
        secondaryFocusedBorder: ShadBorder(radius: radius.add(radius / 2)),
      ),
    );
  }

  static ShadCheckboxTheme checkboxTheme({
    required ShadColorScheme colorScheme,
    required BorderRadius radius,
  }) {
    return ShadCheckboxTheme(
      size: 16,
      duration: 100.milliseconds,
      color: colorScheme.primary,
      padding: const EdgeInsets.only(left: 8),
      decoration: ShadDecoration(
        border: ShadBorder(
          width: 1,
          color: colorScheme.primary,
          radius: radius,
        ),
      ),
    );
  }

  static ShadInputTheme inputTheme({
    required ShadColorScheme colorScheme,
    required BorderRadius radius,
    required ShadTextTheme textTheme,
  }) {
    return ShadInputTheme(
      style: textTheme.muted.copyWith(color: colorScheme.foreground),
      placeholderStyle: textTheme.muted,
      placeholderAlignment: Alignment.topLeft,
      inputPadding: EdgeInsets.zero,
      decoration: ShadDecoration(
        border: ShadBorder(
          width: 2,
          color: colorScheme.border,
          radius: radius,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }

  static ShadRadioTheme radioTheme({
    required ShadColorScheme colorScheme,
  }) {
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
        border: ShadBorder(
          width: 1,
          color: colorScheme.primary,
        ),
        secondaryFocusedBorder: ShadBorder(radius: radius.add(radius / 2)),
      ),
    );
  }

  static ShadToastTheme primaryToastTheme({
    required ShadColorScheme colorScheme,
    required BorderRadius radius,
    required ShadTextTheme textTheme,
  }) {
    return ShadToastTheme(
      alignment: Alignment.bottomRight,
      closeIconSrc: LucideIcons.x,
      titleStyle: textTheme.muted.copyWith(
        fontWeight: FontWeight.w500,
        color: colorScheme.foreground,
      ),
      descriptionStyle: textTheme.muted.copyWith(
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

  static ShadToastTheme destructiveToastTheme({
    required ShadColorScheme colorScheme,
    required BorderRadius radius,
    required ShadTextTheme textTheme,
  }) {
    return ShadToastTheme(
      alignment: Alignment.bottomRight,
      closeIconSrc: LucideIcons.x,
      titleStyle: textTheme.muted.copyWith(
        fontWeight: FontWeight.w500,
        color: colorScheme.destructiveForeground,
      ),
      descriptionStyle: textTheme.muted.copyWith(
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

  static ShadAlertTheme primaryAlertTheme({
    required ShadColorScheme colorScheme,
    required BorderRadius radius,
    required ShadTextTheme textTheme,
  }) {
    return ShadAlertTheme(
      iconPadding: const EdgeInsets.only(right: 12),
      decoration: ShadDecoration(
        border: ShadBorder(
          color: colorScheme.border,
          radius: radius,
          padding: const EdgeInsets.all(16),
        ),
      ),
      iconSize: const Size.square(16),
      iconColor: colorScheme.foreground,
      titleStyle: textTheme.p.copyWith(
        color: colorScheme.foreground,
        fontWeight: FontWeight.w500,
        height: 1,
      ),
      descriptionStyle: textTheme.muted.copyWith(
        color: colorScheme.foreground,
      ),
    );
  }

  static ShadAlertTheme destructiveAlertTheme({
    required ShadColorScheme colorScheme,
    required BorderRadius radius,
    required ShadTextTheme textTheme,
  }) {
    return ShadAlertTheme(
      iconPadding: const EdgeInsets.only(right: 12),
      decoration: ShadDecoration(
        border: ShadBorder(
          color: colorScheme.destructive,
          radius: radius,
          padding: const EdgeInsets.all(16),
        ),
      ),
      iconSize: const Size.square(16),
      iconColor: colorScheme.destructive,
      titleStyle: textTheme.p.copyWith(
        color: colorScheme.destructive,
        fontWeight: FontWeight.w500,
        height: 1,
      ),
      descriptionStyle: textTheme.muted.copyWith(
        color: colorScheme.destructive,
      ),
    );
  }

  static ShadDialogTheme primaryDialogTheme({
    required ShadColorScheme colorScheme,
    required BorderRadius radius,
    required ShadTextTheme textTheme,
  }) {
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
      titleStyle: textTheme.large,
      descriptionStyle: textTheme.muted,
      alignment: Alignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }

  static ShadDialogTheme alertDialogTheme({
    required ShadColorScheme colorScheme,
    required BorderRadius radius,
    required ShadTextTheme textTheme,
  }) {
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
      titleStyle: textTheme.large,
      descriptionStyle: textTheme.muted,
      alignment: Alignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }

  static ShadSliderTheme sliderTheme({
    required ShadColorScheme colorScheme,
  }) {
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

  static ShadSheetTheme sheetTheme({
    required ShadColorScheme colorScheme,
    required ShadTextTheme textTheme,
  }) {
    return const ShadSheetTheme(
      radius: BorderRadius.zero,
      expandCrossSide: true,
    );
  }

  static ShadProgressTheme progressTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadProgressTheme(
      minHeight: 16,
      color: colorScheme.primary,
      backgroundColor: colorScheme.secondary,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
    );
  }

  static ShadAccordionTheme accordionTheme({
    required ShadColorScheme colorScheme,
    required ShadTextTheme textTheme,
  }) {
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
      titleStyle: textTheme.list.copyWith(
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static ShadTableTheme tableTheme({
    required ShadTextTheme textTheme,
    required ShadColorScheme colorScheme,
  }) {
    return ShadTableTheme(
      diagonalDragBehavior: DiagonalDragBehavior.none,
      dragStartBehavior: DragStartBehavior.start,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
      cellAlignment: Alignment.centerLeft,
      cellHeight: 48,
      cellPadding: const EdgeInsets.symmetric(horizontal: 16),
      cellStyle: textTheme.muted.copyWith(color: colorScheme.foreground),
      cellHeaderStyle: textTheme.muted.copyWith(fontWeight: FontWeight.w500),
      cellFooterStyle: textTheme.muted
          .copyWith(color: colorScheme.foreground, fontWeight: FontWeight.w500),
    );
  }

  static ShadResizableTheme resizableTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadResizableTheme(
      showHandle: false,
      dividerThickness: 1,
      dividerSize: 8,
      dividerColor: colorScheme.border,
      resetOnDoubleTap: true,
      handleDecoration: ShadDecoration(
        merge: false,
        color: colorScheme.border,
        border: const ShadBorder(radius: BorderRadius.all(Radius.circular(4))),
      ),
      handleSize: const Size.square(10),
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      verticalDirection: VerticalDirection.down,
    );
  }

  static ShadHoverStrategies hoverStrategies() {
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
}
