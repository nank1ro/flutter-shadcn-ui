///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class ShadLocalizationsKn extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsKn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.kn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <kn>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsKn _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsKn $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsKn(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerKn timePicker = _ShadLocalizationsTimePickerKn._(_root);
	@override late final _ShadLocalizationsDatePickerKn datePicker = _ShadLocalizationsDatePickerKn._(_root);
	@override late final _ShadLocalizationsInputKn input = _ShadLocalizationsInputKn._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarKn keyboardToolbar = _ShadLocalizationsKeyboardToolbarKn._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerKn extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerKn._(ShadLocalizationsKn root) : this._root = root, super.internal(root);

	final ShadLocalizationsKn _root; // ignore: unused_field

	// Translations
	@override String get hours => 'ಗಂಟೆಗಳು';
	@override String get minutes => 'ನಿಮಿಷಗಳು';
	@override String get seconds => 'ಸೆಕೆಂಡುಗಳು';
	@override String get period => 'ಅವಧಿ';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerKn extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerKn._(ShadLocalizationsKn root) : this._root = root, super.internal(root);

	final ShadLocalizationsKn _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'ದಿನಾಂಕ ಆಯ್ಕೆಮಾಡಿ';
}

// Path: input
class _ShadLocalizationsInputKn extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputKn._(ShadLocalizationsKn root) : this._root = root, super.internal(root);

	final ShadLocalizationsKn _root; // ignore: unused_field

	// Translations
	@override String get cut => 'ಕಟ್';
	@override String get copy => 'ಕಾಪಿ';
	@override String get paste => 'ಪೇಸ್ಟ್';
	@override String get selectAll => 'ಎಲ್ಲವನ್ನೂ ಆಯ್ಕೆಮಾಡಿ';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarKn extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarKn._(ShadLocalizationsKn root) : this._root = root, super.internal(root);

	final ShadLocalizationsKn _root; // ignore: unused_field

	// Translations
	@override String get done => 'ಮುಗಿದಿದೆ';
}

/// The flat map containing all translations for locale <kn>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsKn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'ಗಂಟೆಗಳು',
			'timePicker.minutes' => 'ನಿಮಿಷಗಳು',
			'timePicker.seconds' => 'ಸೆಕೆಂಡುಗಳು',
			'timePicker.period' => 'ಅವಧಿ',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'ದಿನಾಂಕ ಆಯ್ಕೆಮಾಡಿ',
			'input.cut' => 'ಕಟ್',
			'input.copy' => 'ಕಾಪಿ',
			'input.paste' => 'ಪೇಸ್ಟ್',
			'input.selectAll' => 'ಎಲ್ಲವನ್ನೂ ಆಯ್ಕೆಮಾಡಿ',
			'keyboardToolbar.done' => 'ಮುಗಿದಿದೆ',
			_ => null,
		};
	}
}
