## 0.44.0

- **FEAT**: Add new `ShadCarousel` component with smooth scrolling, item snapping and customizable navigation buttons (thanks to @koukibadr).

## 0.43.1

- **FIX**: Improve `ShadPortal` scroll and resize handling.

## 0.43.0

- **BREAKING CHANGE**: Rename `icon` into `leading` in `ShadDatePicker` and `ShadDatePickerFormField` and add `trailing`.

## 0.42.1

- **CHORE**: Add `selectedIconColor` to `ShadOptionTheme` to allow customizing the color of the selected icon.

## 0.42.0

- **BREAKING CHANGE**: The old `setValue` has been renamed into `setFieldValue` to better reflect its purpose, and now accepts a `notifyField` boolean parameter (defaults to `true`) to control whether to notify the form field of the value change.
- **BREAKING CHANGE**: `ShadFormBuilderFieldState.setInternalError` has been renamed into `setError` for consistency.
- **BREAKING CHANGE**: `ShadFormState.removeInternalFieldValue` has been renamed into `removeFieldValue` for consistency.
- **BREAKING CHANGE**: Now `setValue` takes a `Map<String, dynamic>` as value and updates the entire form value. It also accepts a `notifyFields` boolean parameter (defaults to `true`) to control whether to notify the changed form fields of the value changes.

## 0.41.0

- **FEAT**: Add `setValue` to `ShadForm` to manipulate the value of a form field programmatically.
- **BREAKING CHANGE**: The map stored by `ShadForm` now uses `String` as a key instead of `Object`. Every form field `id` must be a `String` now. This change was made for convenience with JSON serialization.

## 0.40.6

- **FIX**: Add `maxLength` parameter to `ShadTextarea` (thanks to @mickey35vn).

## 0.40.5

- **FIX**: `ShadSonner` height normalization for stacked toasts with different heights.

## 0.40.4

- **FIX**: `ShadPopover` dismissal animation when multiple popovers were opened quickly one after another. This affected components like `ShadContextMenu` and `ShadMenubar`.
- **FIX**: `ShadMenubar` onPressed behavior, so mobile taps now open/close the menubar items correctly.

## 0.40.3

- **FIX**: `ShadButton` constraints regression when using a `LayoutBuilder` as child.

## 0.40.2

- **FIX**: `ShadSelectFormField` `onChanged` callback being fired twice when changing the value.

## 0.40.1

- **FIX**: `ShadInput` constraints are applied at the top of the widget and not to the inner editable text.
- **CHORE**: Run the Dart formatter.

## 0.40.0

- **FEAT**: Add new component `ShadBreadcrumb` and all of its related components (thanks to @MoazSalem).
- **FIX**: Update `ShadButton` to allow for more flexibility with height and width properties (thanks to @MoazSalem).
- **FIX**: Get `closeIcon` from theme in `ShadTheme` (thanks to @DMouayad).
- **FIX**: Merge of `ShadDecoration` in the component themes.

## 0.39.14

- **CHORE**: Downgrade Dart SDK constraint to `3.6.0` to temporarely fix the pub dev score issue about the Dart formatter (see [#9091](https://github.com/dart-lang/pub-dev/issues/9091))

## 0.39.13

- **FIX**: Provide more fallback colors to `ShadCalendar`.

## 0.39.12

- **FIX**: `weekNumbersHeaderTextStyle` in `ShadCalendar` not having a default color.

## 0.39.11

- **FIX**: `ShadAvatar` with null source.

## 0.39.10

- **FIX**: Update `theme_extensions_builder` and fix merge issues in themes.

## 0.39.9

- **FIX**: Regression in `ShadSelect` where the dropdown no longer expanded to the intrinsic width of its options.
- **FIX**: Select popover not respecting anchoring point when scrolling.
- **CHORE**: Bump min Dart SDK version to `3.10.0`.

## 0.39.8

- **FIX**: Autofocus search input in select dropdown (thanks @Isakdl).

## 0.39.7

- **FIX**: `ShadOption` selectedIcon position doesn't match original shadcn/ui (thanks to @DMouayad).

## 0.39.6

- **FIX**: Assertion error when using `ShadSelect.withSearch`.

## 0.39.5

- **FEAT**: Add `onPressed` to `ShadSelect` and its form fields to provide a custom callback when the select input is pressed, instead of toggling the popover.

## 0.39.4

- **FIX**: `ShadDatePicker` selected range not updated inside `didUpdateWidget`.

## 0.39.3

- **FIX**: Remove extra gap when `actions` is empty in `ShadDialog`.
- **FEAT**: Add `titlePinned`, `descriptionPinned` and `actionsPinned` to `ShadDialog` and `ShadSheet` to control whether to pin the title, description and actions when scrolling the content.

## 0.39.2

- **FEAT**: Add `buttonTextStyle` to `ShadDateRangePickerFormField`.

## 0.39.1

- **FEAT**: Add `buttonTextStyle` to `ShadDatePicker`, `ShadDatePickerTheme` and `ShadDatePickerFormField` to customize the text style of the button that triggers the date picker popover.

## 0.39.0

- **FEAT**: Add `top`, `bottom`, `verticalGap` and `onLineCountChange` to `ShadInput`, `ShadInputFormField`, `ShadTextArea` and `ShadTextAreaFormField` to add widgets above or below the input field, and to get notified when the number of lines in the input changes.
- **CHORE**: Export `boxy` package.
- **FIX**: `ShadTextarea` double scrollbar.
- **FEAT**: Add `editableTextSize` to `ShadInput` and `ShadInputFormField` to set a fixed size for the editable text area.
- **FIX**: Disable text selection inside buttons (thanks to @Isakdl).
- **FIX**: ShadDialog always expands to constraints.maxWidth (thanks to @DMouayad).

## 0.38.5

- **FIX**: `ShadTabs` consuming extra space when `expandContent` is true for unselected tabs.

## 0.38.4

- **REFACTOR**: Remove required parameters from `ShadThemeData`, use default values instead.
- **FEAT**: Add `setInternalFieldError` to `ShadForm` to set a forced error text for a form field.

## 0.38.3

- **FEAT**: Add `maintainState` to `ShadTabs` to control whether to maintain the state of the tabs when switching between them. Defaults to `true`.
- **FEAT**: Add `canRequestFocus` to `ShadButton`.
- **FIX**: Unselected `ShadTab` which was focusable.

## 0.38.2

- **FEAT**: Add `searchFocusNode` to `ShadSelect` and `ShadSelectFormField` to provide a custom focus node for the search input.
- **FEAT**: Add `onSearchSubmitted` to `ShadSelect` and `ShadSelectFormField` to handle the submission of the search input (e.g., when the user presses the Enter key).
- **FIX**: `ShadInput` crash when removing the external `focusNode`.

## 0.38.1

- **FIX**: Fix ShadTable doesn't support RTL (thanks to @DMouayad).
- **FIX**: ShadToast & ShadSonner doesn't react to text direction change (thanks to @DMouayad).
- **FIX**: ShadSheet crash when tap outside the sheet (thanks to @pro100andrey).
- **FIX**: Feat: direction-aware dialog and toast close buttons (thanks to @DMouayad).
- **FIX**: ShadDialog - scrolling doesn’t work when constraints are set (thanks to @pro100andrey).

## 0.38.0

- **BREAKING CHANGE**: `ShadTabs.expandContent` has been removed and added to `ShadTab.expandContent` to allow expanding only specific tabs.

## 0.37.4

- **FIX**: Export `Effect` from `flutter_animate` as `AnimateEffect` to avoid name conflicts.
- **FIX**: Export `TextDirection` from `intl` as `IntlTextDirection` to avoid name conflicts.

## 0.37.3

- **FIX**: `ShadSelect` not updating the controller when the form field value changes.
- **FIX**: Remove `initialValues` from `ShadSelectMultipleFormField`, use `controller` instead.
- **FIX**: `ShadSelect.withSearch` keyboard shortcuts closing the popover when the search input is focused.

## 0.37.2

- **FEAT**: Add `backgroundColor`, `selectedBackgroundColor`, `textStyle` and `selectedTextStyle` to `ShadOptionTheme` and `ShadOption`, to customize the background color and text style of `ShadOption` (thanks to @9dan).

## 0.37.1

- **FIX**: Test fails due to pending Timer when using `Animate` and `Duration.zero`, which has been replaced with `ShadAnimate`.
- **FEAT**: Add `ShadThemeData.merge` and `ShadTheme.merge` methods to easily merge two themes together. This is useful when you want to override only a few properties of the theme for a subtree of the widget tree.

## 0.37.0

- **FEAT**: Add `tabsGap` and `tabBarAlignment` to `ShadTabs` in order to customize the gaps between tabs and the alignment of the tab bar (thanks to @9dan).
- **FIX**: Fix the resulting TextStyle applied to ShadTab (thanks to @9dan).
- **FIX**: Fix the resulting decoration applied to ShadTab (thanks to @9dan).
- **REFACTOR**: Before all text styles from `ShadTextTheme` had a color applied and `inherited` set to `false`, this prevented customizing the text styles easily. Now all text styles have `inherit` set to `true` and no color applied, so they can be customized more easily (thanks to @9dan)
- **FEAT**: Expose `TextStyle.fallback` method to easily set a fallback property to a TextStyle if it is null; for example, `textStyle.fallback(color: Colors.red)` will set the color to red if it is null, and will keep the original color if it is not null (thanks to @9dan).
- **FIX**: `ShadOption.selectedIcon` was always visible, even if the option was not selected (thanks to @DMouayad).
- **FEAT**: Allow custom exit transition duration in `showShadDialog` (thanks to @DMouayad).
- **FEAT**: Add `showHours`, `showMinutes` and `showSeconds` to `ShadTimePicker` and `ShadTimePickerFormField` to customize which fields are shown.

## 0.36.1

- **FIX**: Expose `ShadButtonSizesTheme`.
- **FEAT**: Add `textStyle` to `ShadButton` and `ShadButtonTheme` to customize the text style of the button.

## 0.36.0

- **BREAKING CHANGE**: Remove `iconData` from `ShadAlert`, use `icon` instead.
- **FEAT**: Add `iconSize` to `ShadAlert` and `ShadAlertTheme`, fallbacks to `16` from inherited `IconTheme`.

## 0.35.1

- **FIX**: The `lerp` method of themes was overriding null double values with 0.
- **FIX**: Replaced `Border` with `ShadBorder` because `Border.merge` from Flutter is a mess (sums widths of a and b).

## 0.35.0

- **BREAKING CHANGE**: The `mergeWith` method has been renamed into `merge` and the `merge` boolean has been renamed into `canMerge` (ShadThemes).
- **CHORE**: The theme generation has been automated by using the [theme_extensions_builder](https://pub.dev/packages/theme_extensions_builder) package (thanks to @pro100andrey).

## 0.34.0

- **FEAT**: Add `leading`, `trailing`, `top` and `bottom` parameters to `ShadAlert` to add widgets before, after, above or below the main content of the alert.

## 0.33.1

- **FIX**: `ShadSelect` always scrolling to the selected option when opening the popover which can now be disabled with `ensureSelectedVisible: false`.
- **CHORE**: Remove `required` from `onSearchChanged` in `ShadSelect` and `ShadSelectFormField` to make it optional, as it is not required when a custom `search` widget is provided.

## 0.33.0

- **FEAT**: Allow extending `ShadTextTheme` with custom text styles through the `custom` parameter. [See docs](https://flutter-shadcn-ui.mariuti.com/typography#extend-with-custom-styles).
- **FEAT**: Allow extending `ShadColorScheme` with custom colors through the `custom` parameter. [See docs](https://flutter-shadcn-ui.mariuti.com/theme/data/#extend-with-custom-colors).

## 0.32.2

- **FIX**: `ShadTooltip` not showing on hover.

## 0.32.1

- **FIX**: `ShadToast` constraints were not being used.
- **FIX**: `ShadToast` text direction was not taken from theme.
- **FEAT**: Add `mainAxisSize` and `mainAxisAlignment` to `ShadToast` and `ShadToastTheme`, defaults to `MainAxisSize.max` and `MainAxisAlignment.spaceBetween`.

## 0.32.0

- **REFACTOR**: Now all components are material-free. The only exception is `ShadApp` which provides platform adaptive routing and scroll behavior.

## 0.31.9

- **FIX**: `ShadSelect` not reacting to the controller and rebuilding `selectedOptionBuilder`.
- **FIX**: `ShadSelectFormField` and `ShadSelectMultipleFormField` not resetting the value on form reset.

## 0.31.8

- **FEAT**: Add support for keyboard navigation in `ShadCalendar` (thanks to @pedromassango).

## 0.31.7

- **FEAT**: Add `controller` to `ShadRadioGroup` to manually control the selected value.

## 0.31.6

- **FIX**: `ShadSwitch` on RTL direction.

## 0.31.5

- **FEAT**: Add `useSafeArea` to `ShadDialog` and `ShadSheet` to wrap the content with a `SafeArea`. Defaults to `true`.

## 0.31.4

- **FIX**: `closeOnTapOutside` of `ShadDatePicker` which wasn't passed to `ShadPopover`.

## 0.31.3

- **FIX**: Convert all `EdgeInsets` to `EdgeInsetsGeometry` to better support RTL and fix many components.

## 0.31.2

- **FEAT**: Add `ShadAccordionController` to manually control the open/close state of the `ShadAccordionItem`s.
- **FEAT**: Toggle `ShadAccordionItem` by pressing `Space` (before it worked only with `Enter`) when the header is focused.

## 0.31.1

- **FEAT**: Add `side` to `ShadSheetTheme` to set the default side of the sheet from the theme.

## 0.31.0

- **FEAT**: Modify the `ShadTooltip` component and its hover strategies to work on mobile on tap without a long press.
- **FEAT**: Add `ShadHoverStrategy.onTapOutside` to trigger unhover when tapping outside the widget. 
- **FEAT**: Add `ShadHoverStrategy.onTap` to trigger hover/unhover when tapping inside the widget.
- **FEAT**: Now if an hover strategy is present in both `hoverStrategies.hover` and `hoverStrategies.unhover`, the hover will be toggled.

## 0.30.5

- **FIX**: change `ShadSeparator.margin` type to `EdgeInsetsGeometry`

## 0.30.4

- **FIX**: `ShadTextareaFormField` initial value assert due to controller being used internally.

## 0.30.3

- **FIX**: `onChanged` of `ShadInputFormField` and `ShadTextareaFormField` fired twice for any change.

## 0.30.2

- **FIX**: Expose `ShadDefaultKeyboardToolbarTheme`.

## 0.30.1+1

- **CHORE**: Remove useless import.

## 0.30.1

- **FIX**: Fix `ShadResizable` on RTL (for real this time).
- **CHORE**: Bump min Flutter SDK version to `3.35.0` to support `FormField.onReset` and `Brightness` from `'package:flutter/widgets.dart'` 

## 0.30.0

- **FEAT**: Add `ShadKeyboardToolbar` and `ShadDefaultKeyboardToolbar` components to show a toolbar above the keyboard. Add `keyboardToolbarBuilder` to `ShadInput`, `ShadInputFormField`, `ShadTextArea`, `ShadTextAreaFormField`, `ShadInputOTP`, `ShadInputOTPFormField` to easily add a keyboard toolbar to these components.

## 0.29.4

- **FIX**: Fix `ShadTextTheme.copyWith` was always overwriting custom font with default `Geist` font. [#425]

## 0.29.3

- **FIX**: Ensure `ShadForm.onChanged` is called for both standard `Form` fields and `ShadFormField` widgets.
- **FIX**: Add missing `forceErrorText` parameter to `ShadFormField` widgets.

## 0.29.2

- **FIX**: Fix `ShadResizable` on RTL. Remove useless `textDirection` parameter from `ShadResizable` and `ShadResizableTheme`.

## 0.29.1

- **FIX**: Add missing `alignment` parameter to `ShadInput`, `ShadInputFormField`, `ShadTextArea` and `ShadTextAreaFormField`.

## 0.29.0

- **FIX**: Add missing popover closing animation (thanks to @DMouayad).

## 0.28.8

- **CHORE**: Resolve lint issues.

## 0.28.7

- **FIX**: Updated `ShadPopover` filter logic to use effectiveFilter instead of widget.filter.

## 0.28.6

- **REFACTOR**: Add `cursor*` customizations through theme (thanks to @GuillaumeMCK).

## 0.28.5

- **FIX**: `ShadCalendar` back and forward buttons on RTL (thanks to @HarithHaroon).

## 0.28.4

- **FEAT**: Add `cursorColor` to `ShadInput` (thanks to @GuillaumeMCK).
- **FIX**: Use `AlignmentGeometry` instead of `Alignment` inside `ShadInput`, `ShadTextarea` and their form fields (thanks to @omaralmgerbie)

## 0.28.3

- **FIX**: pass `backgroundColor` to `ShadAppBuilder` (thanks to @GuillaumeMCK)

## 0.28.2

- **FIX**: `ShadDialog` and `ShadSheet` now use `SafeArea` to prevent the content from being cut off by the system UI.

## 0.28.1

- **FIX**: Add `clearValueOnUnregister` to `ShadForm` (defaults to `false`) to prevent clearing a form field's value from the form state when the field is unregistered (aka disposed).
- **FIX**: `ShadPopover` not closing when pressing ESC (thanks to @DMouayad)

## 0.28.0

- **REFACTOR**: Update `ShadCalendar` `yearSelectorMinWidth` from `100` to `64` and `monthSelectorMinWidth` from `120` to `64`.
- **REFACTOR**: Update `ShadCalendar` position of dropdown, which is now centered in the header.
- **REFACTOR**: Add `dropdownFormatMonth` and `dropdownFormatYear` to `ShadCalendar`.
- **FIX**: Center the placeholder in `ShadAvatar`.
- **DOCS**: Fix missing `MainAxisSize.min` in `ShadCard` notification example.
- **DOCS**: Adjust sheet docs example, with some spacing between buttons.
- **FIX**: Fix the hit test behavior of `ShadContextMenuRegion`.
- **FEAT**: Expose `hitTestBehavior` from `ShadContextMenuRegion`, defaults to `HitTestBehavior.opaque` (thanks to @NonymousMorlock).
- **REFACTOR**: Set default text align of `ShadTooltip` to `null` instead of `TextAlign.center`.

## 0.27.4

- **FIX**: `ShadIconButton` icon size property isn't applied (thanks to @TahaTesser).

## 0.27.3

- **FIX**: `ShadCalendar` `initialMonth` update when the user did not interact with the month selector yet.
- **DOCS**: Fix typo in button code snippet (thanks to @piedcipher).

## 0.27.2

- **FIX**: `ShadAccordion` title overflow when the title is too long (thanks to @monteiz).
- **FIX**: `ShadContextMenuItem` hover background color.
- **CHORE**: Bump the minimum Flutter version to `3.32.0` to support the `RoundedSuperellipseBorder`.

## 0.27.1

- **FEAT**: Add `ShadRoundedSuperellipseBorder` to support the rounded superellipse border style as the primary border of any widget that uses `ShadDecoration`.

## 0.27.0

- **BREAKING CHANGE**: The secondary border of `ShadDecoration` now is drawn outward of the widget, without consuming any extra space. This change affects all components that are focusable.
- **FEAT**: Add `offset` to `ShadBorder` to set the offset between the widget and the outward secondary border.
- **REFACTOR**: Remove all deprecated parameters across the whole package, including `orderPolicy`, `ShadApp.material`, `ShadApp.cupertino` and so on.
- **REFACTOR**: Update the default `anchor` of `ShadSelect`, `ShadTooltip` and `ShadPopover` from `ShadAnchorAuto()` to `ShadAnchorAuto(offset: Offset(0, 4))`.
- **REFACTOR**: Add `checkboxPadding` to `ShadCheckbox`, `ShadCheckboxTheme` and `ShadCheckboxFormField`, defaults to `EdgeInsets.only(top: 1)`.
- **REFACTOR**: Add `radioPadding` to `ShadRadio` and `ShadRadioTheme`, defaults to `EdgeInsets.only(top: 1)`.
- **FIX**: Background color of pages for pure `ShadApp` if no `Scaffold` is used, by adding a new `backgroundColor` parameter to `ShadApp` and `ShadAppBuilder`.
- **FEAT**: Add `actionsGap` to `ShadDialog`, defaults to `8`.
- **REFACTOR**: Update `ShadTimePickerTheme` parameters: `spacing` changed from `0` to `8`, `runSpacing` changed from `0` to `4`, `gap` changed from `2` to `4`, `fieldWidth` changed from `58` to `48`, `periodHeight` changed from `50` to `42`.
- **FIX**: Lookup of correct `ShadTextareaTheme` when retrieving the `scrollbarPadding`.
- **REFACTOR**: Update `ShadCalendarTheme.dayButtonDecoration.secondaryFocusedBorder` to use a new offset and 50% opacity for improved visibility.
- **REFACTOR**: The `ShadInputOTPTheme.padding` changed from `EdgeInsets.symmetric(vertical: 4)` to `null`.
- **REFACTOR**: Change `ShadInputOTPTheme.padding` from `EdgeInsets.symmetric(vertical: 4)` to `null`.
- **REFACTOR**: Automatically select the focused `ShadTab` to prevent secondary border collisions, matching original shadcn keyboard navigation behavior.
- **REFACTOR**: Change `ShadCalendarTheme.monthSelectorMinWidth` from `130` to `120`.
- **REFACTOR**: The `ShadCalendar.yearSelector` and `ShadCalendar.monthSelector` now use a secondary focused border with 50% opacity to match other parts.
- **REFACTOR**: Update `ShadSelect` with presets example by adding padding.
- **REFACTOR**: Remove secondary border removal from `ShadInput` example with trailing icon.
- **REFACTOR**: Update `ShadMenubar.anchor.offset` from `Offset(-8, 8)` to `Offset(-4, 8)`.
- **REFACTOR**: Update `ShadPopover` example by adding a gap between input fields.
- **FIX**: `ShadSelectController` now has a `Set` instead of a `List` to prevent duplicates in the selected options, this change has been applied to `ShadSelect.initialValues` and `ShadSelectFormField` as well.

## 0.26.5

- **CHORE**: Update lower bound dependency versions.

## 0.26.4

- **CHORE**: Relax dependencies, previous versions were too strict and have been retracted.

## 0.26.3

- **CHORE**: Bump the min flutter version to `3.32.0`.

## 0.26.2

- **FIX**: Add `supportedDevices` to `ShadContextMenuRegion` to decide which devices trigger the context menu (thanks to @MousyBusiness).

## 0.26.1

- **CHORE**: Update `intl` dependency to `^0.20.2` (thanks to @jg-l)
- **CHORE**: Update all other dependencies to the latest versions.

## 0.26.0

- **BREAKING CHANGE**: Update the `appBuilder` of the `ShadApp` by removing the `ThemeData` parameter.
- **REFACTOR**: Deprecate `ShadApp.material`, `ShadApp.materialRouter`, `ShadApp.cupertino` and `ShadApp.cupertinoRouter`. Use `ShadApp.custom` instead.

## 0.25.1

- **FIX**: The scrollbar of the `ShadTextarea` component has been fixed, added `scrollbarPadding` to `ShadTextareaTheme` and `ShadInputTheme`.
- **FIX**: Focus of `ShadTextarea` on resize.

## 0.25.0

- **CHORE**: Bump dependency versions (thanks to @mayapaw).
- **FEAT**: Add `ShadTextarea` and `ShadTextareaFormField` components (thanks to @dalroy44).
- **FIX**: `ShadSelectFormField` initial value from `ShadForm` not working.

## 0.24.0

- **FEAT**: Add `Sonner` component.

## 0.23.4

- **FIX**: `ShadSelectFormField` and `ShadSelectMultipleFormField` controller not updating the parent `ShadForm`.

## 0.23.3

- **FIX**: `ShadInput` `onPressedOutside` when tapping on another `ShadInput`.
- **FEAT**: Add `groupId` to `ShadInput` and `ShadInputFormField`, defaults to `UniqueKey` instead of `EditableText`.

## 0.23.2

- **FEAT**: Add `copyWith` method to `ShadColorScheme` (thanks to @Luckey-Elijah).

## 0.23.1

- **FIX**: `ShadResizable` divider alignments when `dividerSize` is overriden.

## 0.23.0

- **FIX**: Expose `ShadMouseCursorProvider`.
- **FIX**: `ShadMenubar` anchor.
- **FIX**: `ShadBadge` should not enter the gesture arena if the `onPressed` callback is not provided.
- **FEAT**: Add `cursor` to `ShadBadge`, defaults to `SystemMouseCursors.click` if `onPressed` is provided.
- **BREAKING CHANGE**: Refactor `ShadAnchorAuto` to make it more powerful, removed `verticalOffset` and `preferBelow` in favor of `offset`, `followerAnchor` and `targetAnchor`. Now every component uses it by default.

## 0.22.5

- **FIX**: `ShadGestureDetector` global coordinates when using multiple `Navigator`s.

## 0.22.4

- **FIX**: Pass `themeMode` to `MaterialApp` (thanks to @mubareksd).
- **FIX**: Add `focusNode` to `ShadInputFormField`.

## 0.22.3

- **FIX**: `ShadTooltip` exit animation, add `duration` and `reverseDuration` to it.
- **FIX**: `ShadMenubar` no longer steals the focus.
- **FIX**: `ShadButton` stealing focus when pressed.
- **FEAT**: Add `stylusHandwritingEnabled` to `ShadInput`.

## 0.22.2

- **FIX**: Add `constraints` to `ShadInput` and `ShadInputFormField`, by default the min height is calculated based on the `style` and `placeholderStyle`.
- **FIX**: `ShadInput` style and placeholder style which are now merged instead of replaced.
- **FIX** `ShadMenubar` wrong padding used for the context menu.
- **CHORE**: Set min flutter version to `3.29.0` (thanks to @qk7b)

## 0.22.1

- **FIX**: `ShadInput` icon color.

## 0.22.0

- **FEAT**: Add `ShadMenubar` component.
- **REFACTOR**: Deprecate `ShadDivider` and `ShadDividerTheme`, use `ShadSeparator` and `ShadSeparatorTheme` instead.
- **FEAT**: Add `onTapInside`, `onTapOutside`, `onTapUpInside` and `onTapUpOutside` to `ShadContextMenu`.

## 0.21.0

- **FEAT**: Add `ShadDivider` component (thanks to @Luckey-Elijah)
- **FIX**: Pass `buttonDecoration` to `ShadButton` inside `ShadDatePicker` (thanks to @plusema86)
- **CHORE**: Add comments to all components + test many of them

## 0.20.3

- **FIX**: Validation mode on form field reset (thanks to @Mayb3Nots)

## 0.20.2

- **REFACTOR**: Deprecate `ShadTab.icon`, use `ShadTab.leading` instead. Add `trailing`.
- **FIX**: Disable scroll inside `ShadCalendar`

## 0.20.1

- **REFACTOR**: Set `debugShowCheckedModeBanner` to `false` by default in `ShadApp`.
- **FIX** Expose `ShadInputOTPTheme`.

## 0.20.0

- **FEAT**: Add `ShadIconButton` component.
- **REFACTOR**: Deprecated `ShadButton.icon`, use `ShadIconButton` for a button with just an icon and `ShadButton.leading` for a button with an icon and a text.
- **REFACTOR**: Deprecate `orderPolicy`, use `leading` and `trailing` in the component.
- **REFACTOR**: Deprecate `prefix` and `suffix` in `ShadInput`, use `leading` and `trailing` instead.
- **REFACTOR** Deprecate `searchInputPrefix` in `ShadSelect`, use `searchInputLeading` instead.

## 0.19.3

- **FIX**: Make `selectedOptionBuilder` required in `ShadSelect` (thanks to @muradab).
- **FIX**: Add `optionsBuilder` to `ShadSelect` and its form fields where it was missing.

## 0.19.2

- **FIX**: Add constraints to `ShadCard` child.

## 0.19.1

- **REFACTOR**: Rename `materialTextTheme` into `applyGoogleFontToTextTheme`.
- **FEAT**: Allow accessing the `ShadTheme` with the context, in the `materialThemeBuilder` and `appBuilder`.

## 0.19.0

- **FIX**: `ShadInput` `readOnly` not updating.
- **BREAKING CHANGE**: Rename `ShadSelect` and form fields `controller` to `popoverController`.
- **FEAT**: Add `controller` to `ShadSelect` and form fields, to control the selected values.
- **FIX**: Improve the `ShadResizable` controller handling and simplify the logic to resize the panels.
- **FIX**: `ShadResizable` handle position with `Axis.vertical`.
- **BREAKING CHANGE**: Now `ShadResizable` requires an `id`, to be able to handle when a panel is removed/added from the widget tree correctly.
- **CHORE**: Correctly set the `theme` or `darkTheme` to the internal `MaterialApp`.

## 0.18.7

- **FIX**: `ShadApp` dark theme behavior now is the same as Material. The dark theme is applied only if you provide a `darkTheme` and the user theme mode is dark

## 0.18.6

- **FIX**: `ShadTimePicker` controller not being used correctly when the component is initialized. Now each field allows a single digit instead of two.

## 0.18.5

- **FIX**: `ShadCalendar` forward button icon color.
- **CHORE**: Bump the version of `universal_image` (thanks to @brunosemfio).

## 0.18.4

- **FIX**: `ShadDatePicker` popover closes on caption selection.
- **CHORE**: Add `onNavigationNotification` to `ShadApp` (thanks to @mllrr96)
- **FIX**: `ShadDatePicker` crash when caption layout is different from label, due to misleading `Locale` type passed to `DateFormat`, thanks `dynamic` for these amazing errors.

## 0.18.3

- **FIX**: Improve `ShadAvatar` (thanks to @mickey35vn).
- **FIX**: Locale not handled in `ShadCalendar` and `ShadDatePicker`.
- **REFACTOR**: Remove `optionsOrderPolicy` from `ShadSelectTheme` and move it to `ShadOptionTheme` with the name `orderPolicy`.

## 0.18.2

- **FIX**: `InputOTP` component with RTL directionality.

## 0.18.1

- **FIX**: Set `ShadCard` clipBehavior to `Clip.antialias`, add `clipBehavior` to `ShadCard` and `ShadCardTheme`.
- **FIX**: Use `selectedDecoration` in `ShadTabs` (thanks to @thisisamank)
- **FEAT**: Add colorSelector to the ShadcnUI docs (thanks to @0xharkirat)
- **FEAT**: Add `hourLabel`, `minuteLabel`, `secondLabel`, `periodLabel`, `hourPlaceholder`, `minutePlaceholder`, `secondPlaceholder` and `periodPlaceholder` to `ShadTimePickerTheme`.

## 0.18.0

- **BREAKING CHANGE**: Remove `applyIconColorFilter` from `ShadButton`.
- **BREAKING CHANGE**: Remove `ShadImage` component. Prefer using the `Icon` widget for `IconData`, the `Image` widget for normal images, and `SvgPicture` (from the [flutter_svg package](https://pub.dev/packages/flutter_svg) for SVG images. If you want a fallback, use `UniversalImage`.
- **BREAKING CHANGE**: Rename `iconSrc` in `iconData` around components.
- **FIX**: `TimePickerFormField` initial value.

## 0.17.6

- **FIX**: Fix the iconSize of `ShadButton`, add `iconSize` to `ShadButton`.

## 0.17.5

- **FEAT**: New `OrderPolicy`, `LinearOrderPolicy`, `ReverseOrderPolicy` and `CustomOrderPolicy` to update the order policy of the items in a list, this can be very useful to arrange the order of the parts of the shadcn components.
- **FEAT**: Add `orderPolicy` to `ShadOption`, `ShadAlert`, `ShadButton`, `ShadCheckbox`, `ShadCheckboxFormField`, `ShadDatePicker`, `ShadDatePickerFormField`, `ShadDateRangePickerFormField`, `ShadRadio`, `ShadSwitch`, `ShadSwitchFormField`, `ShadToast`.
- **FEAT**: Add `expands` to `ShadButton`, defaults to false. Use it if you want the button's child to expand to fill the available space.

## 0.17.4

- **FIX** `ShadTabs` onChanged runtime exception due to misleading type

## 0.17.3

- **FIX**: `ShadTable` protect `onExit` from setting value after dispose (thanks to @jezell)

## 0.17.2

- **FIX**: Add `allowDeselection` to `ShadCalendar.range`
- **CHORE**: Update dependencies

## 0.17.1

- **FIX**: `ShadInputOTP` text alignment and padding
- **FEAT**: Add `textInputAction` to `ShadInputOTPSlot`

## 0.17.0

- **FEAT**: Add `ShadInputOTP` and `ShadInputOTPFormField` components.
- **BREAKING CHANGE**: The `ShadBorder` no longer has default values, if you want to see the border rendered provide a color and a width greater than 0. This fixes the merge of material borders.
- **FIX**: `ShadTabs` border radius.
- **FIX**: `ShadSlider` focused thumb.
- **FIX**: `ShadResizable` resize when Directionality is RTL.
- **FIX**: Update the `destructive` color on dark mode to be more visible.
- **FIX**: Make inherited widget lookup untyped

## 0.16.3

- **FIX**: `showCursor` default value in `ShadInputFormField`

## 0.16.2

- **FIX**: `ShadTabs` and `ShadResizable` lerp
- **FIX**: `ShadTabs` focused border color in dark mode

## 0.16.1

- **FEAT**: Add parameters to `ShadFocusable`.

## 0.16.0

- **FEAT**: New `ShadTimePicker` and `ShadTimePickerFormField` components.
- **FIX**: `maxLength`, `maxLengthEnforcement` and `showCursor` not working on `ShadInput`
- **FIX**: `ShadCalendar` range day button text style when `disableSecondaryBorder` is `true`.
- **CHORE**: Set minimum Flutter version to `3.24.0`
- **CHORE**: Remove `trackColor` from `ShadSwitch` (thanks to @RaghavTheGreat)
- **FIX**: `ShadSlider` `onChanged` called on every controller update (thanks to @helightdev).

## 0.15.3

- **FIX**: `ShadDialog` and `ShadSheet` children constraints.
- **CHORE**: Replace `flutter_svg_plus` dependency with `flutter_svg` and `vector_graphics_plus` with `vector_graphics`.

## 0.15.2

- **FIX**: `ShadDialog` and `ShadSheet` children constraints.

## 0.15.1

- **FIX**: Decoration merge

## 0.15.0

- **FEAT**: New `ShadDatePicker` component.
- **FEAT**: Add `allowDeselection` property to `ShadCalendar`.
- **FIX**: `ShadSelect` crash when using `optionsBuilder`.
- **FEAT**: Add `itemCount` and `shrinkWrap` to `ShadSelect` and `ShadSelectFormField`.

## 0.14.1

- **FIX**: `ShadApp` scroll behavior.

## 0.14.0

- **BREAKING CHANGE**: Remove `onChangedNullable` from `ShadSelect` and `ShadSelectFormField`. Now the `onChanged` callback will be called with `null` when the user deselects an option if `allowDeselection` is set to `true`. (thanks to @moshOntong-IT)
- **FEAT**: Add click mouse cursor to `ShadTable` when `onRowTap` or `onColumnTap` is provided.

## 0.13.5

- **FIX**: Fix `ShadSelect` initial values on widget creation.

## 0.13.4+1

- **CHORE**: Update svg dependencies

## 0.13.4

- **CHORE**: Update svg dependencies

## 0.13.3

- **FEAT**: Add `ShadApp.custom` for custom _WidgetsApp_ implementation.

## 0.13.2

- **CHORE**: Use forked `flutter_svg` and `vector_graphics` packages.

## 0.13.1

- **CHORE**: Update `ShadImage` import due to WASM.

## 0.13.0

- **FEAT**: New `ShadCalendar` component with the `single`, `multiple` and `range` variants.

## 0.12.0

- **FEAT**: Add `axis`, `spacing`, `runSpacing`, `alignment`, `runAlignment`, `crossAxisAlignment` and `crossAxisAlignment` to `ShadRadioGroup` and `ShadRadioGroupFormField`.

## 0.11.1

- **FEAT**: Add `headers` to `ShadImage` to allow custom headers in the network requests.

## 0.11.0

- **FEAT**: Add `ShadSelect.multiple`, `ShadSelect.multipleWithSearch`, `ShadSelectMultipleFormField` and `ShadSelectMultipleFormField.withSearch` constructors.
- **FEAT**: Add `onChangedNullable` to `ShadSelect` and `ShadSelectFormField`, to allow the deselection of an option.
- Improve the `ShadSelect` focus behavior.
- Improve size of `ShadSelect` options to fit the available space.

## 0.10.0

- __BREAKING CHANGE__: Rename `children` parameter of `ShadContextMenu` and `ShadContextMenuRegion` into `items`.

## 0.9.8

- Improve the `ShadContextMenu` right click behavior on Web.

## 0.9.7

- Remove kind event from `ShadMouseArea`

## 0.9.6

- Fix: the browser context menu has been enabled again, and deactivated only for the `ShadContextMenu` component.

## 0.9.5

- Add text selection toolbar to `ShadInput` (thanks to @moshOntong-IT).

## 0.9.4

- Add gestures recognizers to `ShadTable` for rows and columns.

## 0.9.3

- Fix `ShadSelectFormField` focus when `readOnly` is true.

## 0.9.2

- Add `gap` to `ShadInput` and `ShadInputFormField` (thanks to @moshOntong-IT).

## 0.9.1

- Fix native context menu by disabling it on Web.
- Add `controller` to `ShadContextMenu`.
- Add `onLongPress` to `ShadContextMenuRegion`, defaults to `true` on mobile.

## 0.9.0

- New `ShadContextMenu` component.
- Add `groupId` to `ShadPopover`, to determine if the tap is inside the popover or not.
- Add `onFocusChange` to `ShadFocusable` and `ShadButton`.
- Add `onSecondaryTap` to `ShadButton`.

## 0.8.1

- Fix `ShadTabs` not updating the controller when the value changes.

## 0.8.0

- **BREAKING CHANGE**: Refactor `ShadResizablePanelGroup` in order to react to window resize correctly. The sizes have been normalized. You don't need to provide anymore a pixel size, but a value between 0 and 1 which indicates the percentage of the available space.
- Add `onChanged` to `ShadTabs`.
- Add `onSecondaryTap` to `ShadGestureDetector` and `ShadButton`.
- Fix `maxWidth` missing in `ShadSelectForlField`.

## 0.7.3

- Add `header` and `footer` to `ShadSelect` and `ShadSelectFormField`.
- Add `mainAxisAlignment` and `crossAxisAlignment` to `ShadAlert`.
- Fix unintentional disposal of `controller` in `ShadSelect`.
- Remove assert about `icon` and `iconSrc` in `ShadAlert`, you can avoid using an icon now.
- Fix height of Sheet.

## 0.7.2

- Add `controller` parameter to `ShadSelect` and `ShadSelectFormField`.

## 0.7.1

- Fix performance of `ShadSelect` with the new `optionsBuilder` parameter for a large number of options.
- Fix keyboard appearance of `ShadInput` (thanks to @hieupm2096).
- Add `onPressed` to `ShadBadge`.
- Rename button `text` parameter into `child`.
- Rename dialog `content` parameter into `child`.
- Rename sheet `content` parameter into `child`.
- Rename tab `text` parameter into `child`.

## 0.7.0

- Rename Tabs `defaultValue` parameter into `value`.
- Rename Card `content` parameter into `child`.
- Rename Badge `text` parameter into `child`.
- Rename Input `onTap` parameter into `onPressed`.
- Rename AccordionItem `content` parameter into `child`.
- Add `filter` to Select and Popover in order to blur the background when the popover is open.
- Pass `errorText` to `error` build of Form Fields.
- Add `gap` to Buttons, default to `8`.
- Update type of `src` parameter of Avatar
- Add `Alert.raw` constructor
- Add `Dialog.raw` constructor
- Add `Select.raw` and `SelectFormField.raw` constructors
- Add `TableCell.raw` constructor
- Add `draggable` to Sheet to make it draggable, it works on every side.
- Add `ThemeVariant` to handle the default theme variant, and the one without the secondary border.

## 0.6.5

- Add `textDirection` to `ShadButton`

## 0.6.4

- Make `content` of `ShadTab` optional
- Add `TextSelectionTheme` using shadcn colors
- Add `crossAxisAlignment` to `ShadCheckbox`
- Fix `ShadSelect` popover padding

## 0.6.3

- Fix `FormField`s label not getting the correct style.
- Update the `Popover` animation duration to be faster, the same applies to the `Select` component.
- Remove unused `waitDuration` and `showDuration` from `Popover`.
- Add `effects` and `shadows` to `Select` and `SelectTheme`.

## 0.6.2

- Fix form field error border decoration not working
- Add `ShadAutovalidateMode` to `ShadForm`, with the new `alwaysAfterFirstValidation` mode (the new default)
- Fix: apply Google Font to Material text theme

## 0.6.1

- Remove `ShadButtonSize.icon`. Now by default, when the `icon` is provided and the `text` is not, the button will use the `icon` size.

## 0.6.0

- Add `ShadTabs` component
- Add `ShadColorScheme.fromName` to easily create a color scheme from a name (String)
- Add `package` to `ShadImage` (thanks to @farhanfadila1717)
- Fix `decoration` of form fields
- Fix selection controls of `ShadInput`

## 0.5.7

- Renamed the breakpoints
- Add `context.breakpoint` extension

## 0.5.6

- Fix mismatch of `childAlignment` and `overlayAlignment` in `ShadPortal`
- Remove top padding of `ShadPopover`
- Set default values to `ShadAnchor` and `ShadAnchorAuto`

## 0.5.5

- Remove `inputDecoration` from form fields.
- Fix `ShadApp` default dark theme.

## 0.5.4

- Fix double padding on form fields.

## 0.5.3

- Update dependencies
- Removed deprecated parameters `checkerboard...` from `ShadApp`

## 0.5.2

- Fix `onTap` not working in `ShadInput` and `ShadInputFormField`

## 0.5.1

- Fix `ShadInputFormField` which disposed the controller being passed to it.
- Add `scrollable` and `scrollPadding` to `ShadDialog` and `ShadSheet`. By default, the dialogs and sheets are scrollable and the viewInsets are the default scroll padding.

## 0.5.0

- Add the `ShadSelect.withSearch` constructor to easily add a search input to the select component.

## 0.4.7

- Add `maintainState` to `ShadAccordion` to keep the child in the tree even if the item is closed, defaults to `false`.
- Update `ShadAccordion` to use `effects` instead of `transitionBuilder`.
- Remove `rive` dependency and Rive support in `ShadImage` due to many issues with the package.
- Remove `colorScheme` from `ShadTextTheme`. Now the colors will be automatically derived, unless specified.
- Fix popover position in `ShadSelect` component.
- Refactor `ShadDecoration` to easily change the default borders and add new decoration properties to it. Some properties have been moved from the components to the `decoration` of the component.
- Fix `ShadTable` row indexes when using an `headerBuilder` (thanks to @Kyziq).

## 0.4.6

- Update depencencies versions
- Remove `ShadSameWidthColumn` component
- Remove boxy dependency
- Make components keyboard accessible

## 0.4.5

- Remove `placeholderStyle` and `placeholderAlignment` from `ShadDecoration` and move to `ShadInput` and `ShadInputFormField`
- Add `suffix` and `prefix` to `ShadInput` and `ShadInputFormField`

## 0.4.4

- Add `horizontalScrollPhysics` and `verticalScrollPhysics` to `ShadTable`
- Add `mainAxisAlignment` and `crossAxisAlignment` to `ShadButton`
- Fix `ShadDialog` content adding default text style
- Remove popover asserts and ignore operation if already opened/closed.
- Add `longPressDuration` to `ShadGestureDetector`
- Add `hoverStrategies` to ShadButtonTheme's
- Fix use `strutStyle` in `ShadInput`
- Add `backgroundColor` to `ShadInput` and `ShadInputFormField` (thanks to @Dredayduncan)
- Remove `inputDecoration` from `ShadInput`
- Put `placeholder` on top of `ShadInput`
- Fix text style alignment

## 0.4.3

- Fix `ShadResizable` divider position

## 0.4.2

- Add `ShadGestureDetector` with hover strategies for touchscreens.
- Add `ShadTooltipController` to `ShadTooltip`.
- Increase the divider size in the `ShadResizable` component.

## 0.4.1

- Expose `ShadResizableTheme`.

## 0.4.0

- Add `ShadResizable` component

## 0.3.3

- Improve pub dev score

## 0.3.2

- Fix `preferBelow` default value for `ShadSelect` and `ShadPopover`

## 0.3.1

- Add `ShadAnchorAuto` to `ShadPortal`, to automatically adjust the position of the overlay. This applies to all components that use `ShadPortal`, like `ShadSelect`, `ShadTooltip`, `ShadPopover`.

## 0.3.0

- Add `ShadTable` component
- Improved `ShadInput` placeholder alignment

## 0.2.6

- Fix buttons state not updated correctly
- Remove `ShadAssets` in favor of `LucideIcons`

## 0.2.5

- Add `width` and `height` to `ShadCard`
- Add `leading` and `trailing` to `ShadCard`

## 0.2.4

- Add workaround for google_fonts issue about font weights. see <https://github.com/material-foundation/flutter-packages/issues/35>
- Make `from` of `ShadTextTheme.fromGoogleFont` unnamed.

## 0.2.3

- Expose `ShadTextTheme`
- Fix `ShadTextTheme` to add ability to change font family
- Add `materialThemeBuilder` to default `ShadApp`
- Add `ShadTextTheme.fromGoogleFont` to use a Google Font

## 0.2.2

- Fix lerp of `ShadDecoration` and `ShadBorder`
- Add `ShadDecoration.none` and `ShadBorder.none`

## 0.2.1

- Fix export of color schemes (thanks to @Pietervdw)

## 0.2.0

- Add `materialThemeBuilder` and `cupertinoThemeBuilder` to `ShadApp`
- Fix `readOnly` for `ShadInput`
- Fix `initialValue` for `ShadInputFormField`
- Rename `AnimatedShadTheme` into `ShadAnimatedTheme`

## 0.1.0

- new `ShadProgress` component
- new `ShadAccordion` component
- new `ShadSheet` component
- add `onLongPress` to buttons
- add `ShadStatesController` to buttons
- update `showShadDialog`
- set toast default animations based on alignment
- change toast default offset
- add Material and Cupertino constructors in `ShadApp`

## 0.0.1-dev1

- First development release

## 0.0.0

- Initial commit
