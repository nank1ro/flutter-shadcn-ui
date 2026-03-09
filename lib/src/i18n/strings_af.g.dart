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
class ShadLocalizationsDataAf extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataAf({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.af,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <af>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataAf _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataAf $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataAf(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerAf timePicker = _ShadLocalizationsDataTimePickerAf._(_root);
	@override late final _ShadLocalizationsDataDatePickerAf datePicker = _ShadLocalizationsDataDatePickerAf._(_root);
	@override late final _ShadLocalizationsDataInputAf input = _ShadLocalizationsDataInputAf._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarAf keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarAf._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerAf extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerAf._(ShadLocalizationsDataAf root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataAf _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Ure';
	@override String get minutes => 'Minute';
	@override String get seconds => 'Sekondes';
	@override String get period => 'Periode';
	@override String get periodPlaceholder => 'VM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerAf extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerAf._(ShadLocalizationsDataAf root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataAf _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Kies datum';
}

// Path: input
class _ShadLocalizationsDataInputAf extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputAf._(ShadLocalizationsDataAf root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataAf _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Knip';
	@override String get copy => 'Kopieer';
	@override String get paste => 'Plak';
	@override String get selectAll => 'Kies alles';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarAf extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarAf._(ShadLocalizationsDataAf root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataAf _root; // ignore: unused_field

	// Translations
	@override String get done => 'Klaar';
}

/// The flat map containing all translations for locale <af>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataAf {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Ure',
			'timePicker.minutes' => 'Minute',
			'timePicker.seconds' => 'Sekondes',
			'timePicker.period' => 'Periode',
			'timePicker.periodPlaceholder' => 'VM',
			'datePicker.selectDate' => 'Kies datum',
			'input.cut' => 'Knip',
			'input.copy' => 'Kopieer',
			'input.paste' => 'Plak',
			'input.selectAll' => 'Kies alles',
			'keyboardToolbar.done' => 'Klaar',
			_ => null,
		};
	}
}
