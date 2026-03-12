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
class ShadLocalizationsDataKn extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataKn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
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
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataKn _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataKn $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataKn(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerKn timePicker = _ShadLocalizationsDataTimePickerKn._(_root);
	@override late final _ShadLocalizationsDataDatePickerKn datePicker = _ShadLocalizationsDataDatePickerKn._(_root);
	@override late final _ShadLocalizationsDataInputKn input = _ShadLocalizationsDataInputKn._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarKn keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarKn._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerKn extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerKn._(ShadLocalizationsDataKn root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataKn _root; // ignore: unused_field

	// Translations
	@override String get hours => 'ಗಂಟೆಗಳು';
	@override String get minutes => 'ನಿಮಿಷಗಳು';
	@override String get seconds => 'ಸೆಕೆಂಡುಗಳು';
	@override String get period => 'ಅವಧಿ';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerKn extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerKn._(ShadLocalizationsDataKn root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataKn _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'ದಿನಾಂಕ ಆಯ್ಕೆಮಾಡಿ';
}

// Path: input
class _ShadLocalizationsDataInputKn extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputKn._(ShadLocalizationsDataKn root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataKn _root; // ignore: unused_field

	// Translations
	@override String get cut => 'ಕಟ್';
	@override String get copy => 'ಕಾಪಿ';
	@override String get paste => 'ಪೇಸ್ಟ್';
	@override String get selectAll => 'ಎಲ್ಲವನ್ನೂ ಆಯ್ಕೆಮಾಡಿ';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarKn extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarKn._(ShadLocalizationsDataKn root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataKn _root; // ignore: unused_field

	// Translations
	@override String get done => 'ಮುಗಿದಿದೆ';
}

/// The flat map containing all translations for locale <kn>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataKn {
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
