import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/i18n/strings.g.dart';

/// Flutter localizations delegate for [ShadLocalizationsData].
///
/// Automatically added by `ShadApp`. Consumers can also provide it manually
/// through `WidgetsApp.localizationsDelegates`.
class ShadLocalizationsDelegate
    extends LocalizationsDelegate<ShadLocalizationsData> {
  const ShadLocalizationsDelegate();

  /// The singleton instance of this delegate.
  static const ShadLocalizationsDelegate instance =
      ShadLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<ShadLocalizationsData> load(Locale locale) {
    // Two-pass: prefer exact language+country match, fall back to
    // language-only, then to English.
    final exact = ShadLocale.values.where((l) {
      return l.languageCode == locale.languageCode &&
          l.countryCode == locale.countryCode;
    }).firstOrNull;
    final match = exact ??
        ShadLocale.values
            .where((l) => l.languageCode == locale.languageCode)
            .firstOrNull ??
        ShadLocale.en;

    // English is the base locale (not deferred) — load synchronously so the
    // widget tree is ready on the first frame, keeping tests fast.
    if (match == ShadLocale.en) {
      return SynchronousFuture<ShadLocalizationsData>(match.buildSync());
    }

    // All other locales are deferred imports. Must use the async build() so
    // loadLibrary() is called before accessing the locale class (required on
    // Flutter web / dart2js / wasm).
    return match.build();
  }

  @override
  bool shouldReload(ShadLocalizationsDelegate old) => false;
}

/// Provides access to [ShadLocalizationsData] from the widget tree.
///
/// Usage:
/// ```dart
/// final l = ShadLocalizations.of(context);
/// ```
abstract class ShadLocalizations {
  /// Returns the [ShadLocalizationsData] for the nearest [Localizations]
  /// ancestor.
  ///
  /// Falls back to English when no delegate is found in the widget tree.
  static ShadLocalizationsData of(BuildContext context) {
     final data= Localizations.of<ShadLocalizationsData>(
        context,
        ShadLocalizationsData
      );
    return data ?? ShadLocalizationsData();
  }
}
