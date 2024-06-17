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
