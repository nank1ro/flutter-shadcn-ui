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
class ShadLocalizationsFi extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsFi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.fi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fi>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsFi _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsFi $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsFi(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerFi timePicker = _ShadLocalizationsTimePickerFi._(_root);
	@override late final _ShadLocalizationsDatePickerFi datePicker = _ShadLocalizationsDatePickerFi._(_root);
	@override late final _ShadLocalizationsInputFi input = _ShadLocalizationsInputFi._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarFi keyboardToolbar = _ShadLocalizationsKeyboardToolbarFi._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerFi extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerFi._(ShadLocalizationsFi root) : this._root = root, super.internal(root);

	final ShadLocalizationsFi _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Tunnit';
	@override String get minutes => 'Minuutit';
	@override String get seconds => 'Sekunnit';
	@override String get period => 'Jakso';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerFi extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerFi._(ShadLocalizationsFi root) : this._root = root, super.internal(root);

	final ShadLocalizationsFi _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Valitse päivämäärä';
}

// Path: input
class _ShadLocalizationsInputFi extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputFi._(ShadLocalizationsFi root) : this._root = root, super.internal(root);

	final ShadLocalizationsFi _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Leikkaa';
	@override String get copy => 'Kopioi';
	@override String get paste => 'Liitä';
	@override String get selectAll => 'Valitse kaikki';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarFi extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarFi._(ShadLocalizationsFi root) : this._root = root, super.internal(root);

	final ShadLocalizationsFi _root; // ignore: unused_field

	// Translations
	@override String get done => 'Valmis';
}

/// The flat map containing all translations for locale <fi>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsFi {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Tunnit',
			'timePicker.minutes' => 'Minuutit',
			'timePicker.seconds' => 'Sekunnit',
			'timePicker.period' => 'Jakso',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Valitse päivämäärä',
			'input.cut' => 'Leikkaa',
			'input.copy' => 'Kopioi',
			'input.paste' => 'Liitä',
			'input.selectAll' => 'Valitse kaikki',
			'keyboardToolbar.done' => 'Valmis',
			_ => null,
		};
	}
}
