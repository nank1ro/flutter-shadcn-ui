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
class ShadLocalizationsDataDa extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataDa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.da,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <da>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataDa _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataDa $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataDa(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerDa timePicker = _ShadLocalizationsDataTimePickerDa._(_root);
	@override late final _ShadLocalizationsDataDatePickerDa datePicker = _ShadLocalizationsDataDatePickerDa._(_root);
	@override late final _ShadLocalizationsDataInputDa input = _ShadLocalizationsDataInputDa._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarDa keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarDa._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerDa extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerDa._(ShadLocalizationsDataDa root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataDa _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Timer';
	@override String get minutes => 'Minutter';
	@override String get seconds => 'Sekunder';
	@override String get period => 'Periode';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerDa extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerDa._(ShadLocalizationsDataDa root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataDa _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Vælg dato';
}

// Path: input
class _ShadLocalizationsDataInputDa extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputDa._(ShadLocalizationsDataDa root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataDa _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Klip';
	@override String get copy => 'Kopiér';
	@override String get paste => 'Sæt ind';
	@override String get selectAll => 'Vælg alt';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarDa extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarDa._(ShadLocalizationsDataDa root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataDa _root; // ignore: unused_field

	// Translations
	@override String get done => 'Færdig';
}

/// The flat map containing all translations for locale <da>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataDa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Timer',
			'timePicker.minutes' => 'Minutter',
			'timePicker.seconds' => 'Sekunder',
			'timePicker.period' => 'Periode',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Vælg dato',
			'input.cut' => 'Klip',
			'input.copy' => 'Kopiér',
			'input.paste' => 'Sæt ind',
			'input.selectAll' => 'Vælg alt',
			'keyboardToolbar.done' => 'Færdig',
			_ => null,
		};
	}
}
