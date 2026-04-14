# Geist Font Weight Refactor Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Refactor the font system to leverage `copyWith(fontWeight)` instead of managing font variants manually, enabling dynamic font weight adjustments and simplifying GoogleFonts integration.

**Architecture:** 
Remove the font family parameter from text style builders and instead use weight-based font selection via `copyWith()`. The Geist font family already has all weights configured in pubspec.yaml (100-900). GoogleFonts support remains intact through `GoogleFontTextStyle.copyWith()` override that recalculates font family based on weight changes. This approach reduces code complexity, enables runtime font weight changes, and eliminates the manual variant management pattern.

**Tech Stack:** 
- Flutter 3.35.0+ (supports dynamic font weight via copyWith)
- Local Geist fonts (regular & monospace) with 9 weight variants
- GoogleFonts integration (via GoogleFontTextStyle wrapper)
- Dart 3.8+

---

## Task 1: Refactor ShadTextDefaultTheme to remove family parameter

**Files:**
- Modify: `lib/src/theme/text_theme/text_styles_default.dart`

**Context:**
Currently, each text style method takes a `family` parameter. We'll remove this and let `ShadTextTheme` handle font family assignment via `copyWith()` at the theme level. This simplifies the static builders and makes them reusable across different font families.

- [ ] **Step 1: Read the current file and understand the structure**

Current file has methods like:
```dart
static TextStyle h1Large({required String family}) {
  return TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w800,
    fontFamily: family,
    // ... other properties
  );
}
```

- [ ] **Step 2: Refactor h1Large to remove family parameter**

Replace the method signature and implementation:

```dart
static TextStyle h1Large() {
  return TextStyle(
    fontSize: 48,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w800,
    height: 48 / 48,
    letterSpacing: -0.4,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  );
}
```

Note: `fontFamily` is intentionally omitted. It will be applied via `copyWith()` in `ShadTextTheme`.

- [ ] **Step 3: Apply the same refactoring to all other text style methods**

Remove `family` parameter from:
- h1() → h1Large()
- h2() → h1()
- h3() → h2()
- h4() → h3()
- p() → h4()
- blockquote() → p()
- table() → blockquote()
- list() → table()
- lead() → list()
- large() → lead()
- small() → large()
- muted() → small()

For each, remove the `{required String family}` parameter and the `fontFamily: family,` line from the return statement.

Each method should match the pattern above (only property definitions, no fontFamily).

- [ ] **Step 4: Verify all methods are consistent**

Ensure all methods:
- Have no `family` parameter
- Have no `fontFamily` property set
- Preserve all other properties (fontSize, fontWeight, height, letterSpacing, etc.)
- Still have proper formatting

- [ ] **Step 5: Commit the changes**

```bash
git add lib/src/theme/text_theme/text_styles_default.dart
git commit -m "refactor: remove family parameter from text style builders"
```

---

## Task 2: Update ShadTextTheme factory to apply family via copyWith

**Files:**
- Modify: `lib/src/theme/text_theme/theme.dart`
- Lines to modify: Factory constructor (lines 183-227)

**Context:**
The `ShadTextTheme` factory currently passes `family` to the static builders. We need to:
1. Remove the `family` parameter from builder calls
2. Apply the font family via `copyWith()` after getting the base style
3. Create a helper method `_applyFontFamily()` to reduce repetition

- [ ] **Step 1: Create a helper method to apply font family**

After the `OmitFamilyAndPackageExtension`, add this helper method inside `ShadTextTheme`:

```dart
extension _ApplyFontFamilyExtension on TextStyle {
  TextStyle applyFontFamily(String fontFamily) {
    return copyWith(fontFamily: fontFamily);
  }
}
```

- [ ] **Step 2: Update the factory constructor**

Replace the factory method (lines 183-227) with:

```dart
factory ShadTextTheme({
  TextStyle? h1Large,
  TextStyle? h1,
  TextStyle? h2,
  TextStyle? h3,
  TextStyle? h4,
  TextStyle? p,
  TextStyle? blockquote,
  TextStyle? table,
  TextStyle? list,
  TextStyle? lead,
  TextStyle? large,
  TextStyle? small,
  TextStyle? muted,
  String? family,
  String? package,
  GoogleFontBuilder? googleFontBuilder,
  Map<String, TextStyle> custom = const {},
}) {
  var effectiveFamily = family ?? kDefaultFontFamily;
  if (package != null && package != '') {
    effectiveFamily = 'packages/$package/$effectiveFamily';
  }

  return ShadTextTheme.custom(
    h1Large: h1Large ?? ShadTextDefaultTheme.h1Large().applyFontFamily(effectiveFamily),
    h1: h1 ?? ShadTextDefaultTheme.h1().applyFontFamily(effectiveFamily),
    h2: h2 ?? ShadTextDefaultTheme.h2().applyFontFamily(effectiveFamily),
    h3: h3 ?? ShadTextDefaultTheme.h3().applyFontFamily(effectiveFamily),
    h4: h4 ?? ShadTextDefaultTheme.h4().applyFontFamily(effectiveFamily),
    p: p ?? ShadTextDefaultTheme.p().applyFontFamily(effectiveFamily),
    blockquote: blockquote ?? ShadTextDefaultTheme.blockquote().applyFontFamily(effectiveFamily),
    table: table ?? ShadTextDefaultTheme.table().applyFontFamily(effectiveFamily),
    list: list ?? ShadTextDefaultTheme.list().applyFontFamily(effectiveFamily),
    lead: lead ?? ShadTextDefaultTheme.lead().applyFontFamily(effectiveFamily),
    large: large ?? ShadTextDefaultTheme.large().applyFontFamily(effectiveFamily),
    small: small ?? ShadTextDefaultTheme.small().applyFontFamily(effectiveFamily),
    muted: muted ?? ShadTextDefaultTheme.muted().applyFontFamily(effectiveFamily),
    family: effectiveFamily,
    googleFontBuilder: googleFontBuilder,
    custom: custom,
  );
}
```

- [ ] **Step 3: Verify GoogleFontTextStyle still works**

The `GoogleFontTextStyle.copyWith()` override (lines 111-178) should continue to work because:
- It captures fontWeight/fontStyle changes
- Its internal logic recalculates fontFamily based on the builder
- Our refactor doesn't change GoogleFontTextStyle behavior

No changes needed to `GoogleFontTextStyle` — it already handles weight-based font selection.

- [ ] **Step 4: Commit the changes**

```bash
git add lib/src/theme/text_theme/theme.dart
git commit -m "refactor: apply font family via copyWith in factory constructor"
```

---

## Task 3: Update ShadTextTheme.fromGoogleFont to use copyWith

**Files:**
- Modify: `lib/src/theme/text_theme/theme.dart`
- Lines to modify: `fromGoogleFont` factory (lines 249-321)

**Context:**
The `fromGoogleFont` factory wraps each style in `GoogleFontTextStyle`. This continues to work, but we should verify it handles weight-based font selection correctly. The wrapper already handles this via its custom `copyWith()` override.

- [ ] **Step 1: Review the fromGoogleFont implementation**

The current code at lines 256-319 creates `GoogleFontTextStyle` wrappers. These wrappers:
- Store the base style (without fontFamily)
- Store the `fontBuilder` function
- Override `copyWith()` to recalculate fontFamily when weight/style changes

This pattern is already weight-aware and doesn't need changes.

- [ ] **Step 2: Verify GoogleFontTextStyle.omitFamilyAndPackage is used**

Ensure lines 257-318 all use `.omitFamilyAndPackage` before wrapping:

```dart
final p = GoogleFontTextStyle(
  effectiveTextTheme.p.omitFamilyAndPackage,  // Removes fontFamily first
  builder: fontBuilder,
);
```

This is correct — it removes the fontFamily, and `GoogleFontTextStyle.copyWith()` will add it back based on weight.

- [ ] **Step 3: No code changes needed**

The `fromGoogleFont` factory is already compatible. The `GoogleFontTextStyle` wrapper handles weight-based font selection through its `copyWith()` override.

- [ ] **Step 4: Add a comment for clarity**

Add a comment above the factory (line 249):

```dart
/// Creates a text theme from a GoogleFonts builder.
/// 
/// The builder function is called with fontWeight/fontStyle to select
/// the appropriate font variant. When users call copyWith(fontWeight),
/// the GoogleFontTextStyle wrapper recalculates the fontFamily dynamically.
factory ShadTextTheme.fromGoogleFont(
```

- [ ] **Step 5: Commit the changes**

```bash
git add lib/src/theme/text_theme/theme.dart
git commit -m "docs: clarify GoogleFonts weight-based font selection"
```

---

## Task 4: Update ShadTextTheme.copyWith to use applyFontFamily

**Files:**
- Modify: `lib/src/theme/text_theme/theme.dart`
- Lines to modify: `copyWith` method (lines 345-395)

**Context:**
The `copyWith` method should use the same pattern as the factory — apply fontFamily via `copyWith()` instead of the static builders.

- [ ] **Step 1: Review the current copyWith implementation**

Current implementation at lines 345-395 reconstructs styles by calling the factory or merging with existing styles.

- [ ] **Step 2: Update copyWith to use applyFontFamily**

Replace the copyWith method (lines 345-395) with:

```dart
ShadTextTheme copyWith({
  TextStyle? h1Large,
  TextStyle? h1,
  TextStyle? h2,
  TextStyle? h3,
  TextStyle? h4,
  TextStyle? p,
  TextStyle? blockquote,
  TextStyle? table,
  TextStyle? list,
  TextStyle? lead,
  TextStyle? large,
  TextStyle? small,
  TextStyle? muted,
  String? family,
  String? package,
  GoogleFontBuilder? googleFontBuilder,
  Map<String, TextStyle>? custom,
}) {
  final baseFamily = family ?? this.family;
  late final String effectiveFamily;
  if (package != null && package.isNotEmpty) {
    final alreadyPrefixed = baseFamily.startsWith('packages/');
    effectiveFamily =
        !alreadyPrefixed
            ? 'packages/$package/$baseFamily'
            : baseFamily;
  } else {
    effectiveFamily = baseFamily;
  }

  return ShadTextTheme.custom(
    canMerge: canMerge,
    h1Large: (h1Large ?? this.h1Large).applyFontFamily(effectiveFamily),
    h1: (h1 ?? this.h1).applyFontFamily(effectiveFamily),
    h2: (h2 ?? this.h2).applyFontFamily(effectiveFamily),
    h3: (h3 ?? this.h3).applyFontFamily(effectiveFamily),
    h4: (h4 ?? this.h4).applyFontFamily(effectiveFamily),
    p: (p ?? this.p).applyFontFamily(effectiveFamily),
    blockquote: (blockquote ?? this.blockquote).applyFontFamily(effectiveFamily),
    table: (table ?? this.table).applyFontFamily(effectiveFamily),
    list: (list ?? this.list).applyFontFamily(effectiveFamily),
    lead: (lead ?? this.lead).applyFontFamily(effectiveFamily),
    large: (large ?? this.large).applyFontFamily(effectiveFamily),
    small: (small ?? this.small).applyFontFamily(effectiveFamily),
    muted: (muted ?? this.muted).applyFontFamily(effectiveFamily),
    family: effectiveFamily,
    googleFontBuilder: googleFontBuilder ?? this.googleFontBuilder,
    custom: custom ?? this.custom,
  );
}
```

- [ ] **Step 3: Verify the logic**

The copyWith method should:
- Accept optional style overrides
- Compute the effective font family (handling package prefixing)
- Apply fontFamily to all styles via `.applyFontFamily()`
- Preserve googleFontBuilder if not overridden

- [ ] **Step 4: Commit the changes**

```bash
git add lib/src/theme/text_theme/theme.dart
git commit -m "refactor: use applyFontFamily in copyWith method"
```

---

## Task 5: Verify GoogleFonts override path works

**Files:**
- Read: `lib/src/theme/text_theme/theme.dart` (GoogleFontTextStyle class)
- Read: `lib/src/app.dart` or theme initialization code

**Context:**
We need to verify that users can still override fonts with GoogleFonts even after this refactor. The `GoogleFontTextStyle.copyWith()` override should handle weight-based font selection automatically.

- [ ] **Step 1: Review GoogleFontTextStyle.copyWith override**

Lines 111-178 in theme.dart show the custom copyWith implementation:

```dart
@override
TextStyle copyWith({
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  // ... other params
}) {
  var family = fontFamily ??
      ((fontWeight != null || fontStyle != null)
          ? builder(fontWeight: fontWeight, fontStyle: fontStyle).fontFamily
          : null);
  if (overrideFamilyWithBuilder) {
    family = builder(
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    ).fontFamily;
  }
  return super.copyWith(
    // ... with updated family
  );
}
```

This is correct — it recalculates `fontFamily` when `fontWeight` changes.

- [ ] **Step 2: Verify usage pattern**

Find where `ShadTextTheme.fromGoogleFont` is called and verify it still works:

```bash
grep -r "fromGoogleFont" lib/
```

Expected: Find references in theme initialization code. The pattern should still work because `GoogleFontTextStyle` handles the weight-based selection internally.

- [ ] **Step 3: No code changes needed**

The GoogleFonts path is already compatible with weight-based font selection. The `GoogleFontTextStyle` wrapper is explicitly designed for this.

- [ ] **Step 4: Document the override path**

Add a comment in theme.dart near the GoogleFontTextStyle class (before line 62):

```dart
/// Workaround for google fonts to support weight-based font selection.
/// 
/// When a GoogleFontBuilder is provided, this wrapper intercepts copyWith()
/// calls and recalculates the fontFamily based on fontWeight/fontStyle.
/// This enables users to override the font with GoogleFonts while still
/// supporting dynamic weight changes via copyWith(fontWeight).
///
/// Usage:
/// ```dart
/// final theme = ShadTextTheme.fromGoogleFont(
///   GoogleFonts.roboto,
/// );
/// ```
class GoogleFontTextStyle extends TextStyle {
```

- [ ] **Step 5: Commit the changes**

```bash
git add lib/src/theme/text_theme/theme.dart
git commit -m "docs: clarify GoogleFonts override and weight-based selection"
```

---

## Task 6: Add tests for font weight changes via copyWith

**Files:**
- Create: `test/src/theme/text_theme_test.dart` (if it doesn't exist)
- Modify: Existing test file if present

**Context:**
Add tests to verify:
1. Default Geist font is applied to all styles
2. Font weight can be changed via copyWith
3. GoogleFonts override works
4. Font family is preserved when copying without weight changes

- [ ] **Step 1: Check if test file exists**

```bash
ls -la test/src/theme/text_theme_test.dart 2>/dev/null || echo "File does not exist"
```

If the file exists, open it. If not, we'll create it.

- [ ] **Step 2: Create test file if needed**

If not found, create `test/src/theme/text_theme_test.dart`:

```dart
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/theme/text_theme/text_styles_default.dart';
import 'package:shadcn_ui/src/theme/text_theme/theme.dart';

void main() {
  group('ShadTextTheme', () {
    test('h1Large has default font family', () {
      final theme = ShadTextTheme();
      expect(
        theme.h1Large.fontFamily,
        'packages/shadcn_ui/Geist',
      );
    });

    test('p has default font family', () {
      final theme = ShadTextTheme();
      expect(
        theme.p.fontFamily,
        'packages/shadcn_ui/Geist',
      );
    });

    test('copyWith fontWeight changes font weight', () {
      final theme = ShadTextTheme();
      final updated = theme.p.copyWith(fontWeight: FontWeight.w700);
      expect(updated.fontWeight, FontWeight.w700);
      // Font family should be preserved
      expect(
        updated.fontFamily,
        'packages/shadcn_ui/Geist',
      );
    });

    test('text styles have no initial fontFamily in builders', () {
      // Verify the static builders return styles without fontFamily
      final style = ShadTextDefaultTheme.h1Large();
      expect(style.fontFamily, isNull);
    });

    test('custom family overrides default', () {
      final theme = ShadTextTheme(family: 'Roboto');
      expect(theme.h1Large.fontFamily, 'Roboto');
      expect(theme.p.fontFamily, 'Roboto');
    });
  });
}
```

- [ ] **Step 3: Run the tests**

```bash
flutter test test/src/theme/text_theme_test.dart -v
```

Expected output: All tests pass (4 tests).

- [ ] **Step 4: If tests fail, diagnose and fix**

Common issues:
- Font family is `null` when expected (check Task 2 implementation)
- Font weight not applied (check TextStyle.copyWith works)

- [ ] **Step 5: Commit the tests**

```bash
git add test/src/theme/text_theme_test.dart
git commit -m "test: add text theme font weight and family tests"
```

---

## Task 7: Verify existing theme variants still work

**Files:**
- Read: `lib/src/theme/themes/default_theme_variant.dart`
- Read: `lib/src/theme/themes/default_theme_no_secondary_border_variant.dart`

**Context:**
Verify that existing theme variants (which may use `ShadTextTheme`) still work after our refactoring. We should check that they don't make assumptions about the `family` parameter.

- [ ] **Step 1: Check default theme variant**

```bash
grep -n "ShadTextTheme\|family" lib/src/theme/themes/default_theme_variant.dart | head -20
```

Look for any direct calls to `ShadTextDefaultTheme` methods with `family` parameter.

- [ ] **Step 2: Review the usage**

If you see lines like:
```dart
ShadTextDefaultTheme.h1(family: 'someFont')
```

These need to be updated to:
```dart
ShadTextDefaultTheme.h1().copyWith(fontFamily: 'someFont')
```

- [ ] **Step 3: Update theme variants if needed**

If changes are found, apply them following the pattern from Task 2.

- [ ] **Step 4: Run a quick check**

```bash
flutter analyze lib/src/theme/
```

Should show no errors related to missing `family` parameters.

- [ ] **Step 5: Commit any changes**

```bash
git add lib/src/theme/themes/
git commit -m "refactor: update theme variants to use copyWith for font family"
```

---

## Task 8: Run full test suite and verify no regressions

**Files:**
- Run tests: `flutter test`
- Build: `flutter build web` (or appropriate target)

**Context:**
Ensure the refactoring doesn't break existing functionality. We'll run the full test suite and verify the build works.

- [ ] **Step 1: Run all tests**

```bash
flutter test --coverage
```

Expected: All tests pass. Look for any failures in theme-related tests.

- [ ] **Step 2: Check coverage (optional)**

```bash
open coverage/index.html  # macOS
# or on Linux:
xdg-open coverage/index.html
```

Verify that text theme classes have adequate coverage.

- [ ] **Step 3: Run code analysis**

```bash
flutter analyze
```

Expected: No errors or warnings introduced by the refactoring.

- [ ] **Step 4: Build for a target platform**

```bash
flutter build web --release
```

Or build for iOS/Android/macOS as appropriate. This verifies the refactored code compiles correctly.

- [ ] **Step 5: Manual verification (if applicable)**

If there's a demo/example app:
```bash
flutter run -d chrome --release
```

Visually inspect that text rendering and fonts look correct. Font weights should be smooth and responsive.

- [ ] **Step 6: Commit a final verification note**

```bash
git add .
git commit -m "test: verify full test suite and build success post-refactor"
```

---

## Summary of Changes

| File | Change | Impact |
|------|--------|--------|
| `text_styles_default.dart` | Remove `family` parameter from all methods | Simplifies builders, makes them reusable |
| `theme.dart` (factory) | Apply family via `copyWith()` in factory | Centralizes font family assignment |
| `theme.dart` (copyWith) | Use `applyFontFamily()` helper | Consistent font family handling |
| `theme.dart` (GoogleFontTextStyle) | Verified already weight-aware | No changes needed |
| Test file | Add weight/family tests | Ensures refactor works correctly |
| Theme variants | Update if using `family` parameter | Maintains compatibility |

---

## Benefits

✅ **Simpler code** - No more manual variant parameter passing  
✅ **Dynamic font weights** - `copyWith(fontWeight)` now works intuitively  
✅ **GoogleFonts compatible** - Override mechanism unchanged  
✅ **Future-proof** - Leverages Flutter's native weight support  
✅ **Better testability** - Pure styles without package dependencies

---

## Execution

Plan complete and saved to `docs/superpowers/plans/2026-04-14-geist-font-weight-refactor.md`.

**Two execution options:**

**1. Subagent-Driven (recommended)** - I dispatch a fresh subagent per task, review between tasks, fast iteration

**2. Inline Execution** - Execute tasks in this session using executing-plans, batch execution with checkpoints

**Which approach?**
