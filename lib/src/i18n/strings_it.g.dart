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
class ShadLocalizationsDataIt extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataIt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.it,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <it>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataIt _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataIt $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataIt(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerIt timePicker = _ShadLocalizationsDataTimePickerIt._(_root);
	@override late final _ShadLocalizationsDataDatePickerIt datePicker = _ShadLocalizationsDataDatePickerIt._(_root);
	@override late final _ShadLocalizationsDataInputIt input = _ShadLocalizationsDataInputIt._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarIt keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarIt._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerIt extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerIt._(ShadLocalizationsDataIt root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataIt _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Ore';
	@override String get minutes => 'Minuti';
	@override String get seconds => 'Secondi';
	@override String get period => 'Periodo';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerIt extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerIt._(ShadLocalizationsDataIt root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataIt _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Seleziona data';
}

// Path: input
class _ShadLocalizationsDataInputIt extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputIt._(ShadLocalizationsDataIt root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataIt _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Taglia';
	@override String get copy => 'Copia';
	@override String get paste => 'Incolla';
	@override String get selectAll => 'Seleziona tutto';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarIt extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarIt._(ShadLocalizationsDataIt root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataIt _root; // ignore: unused_field

	// Translations
	@override String get done => 'Fine';
}

/// The flat map containing all translations for locale <it>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataIt {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Ore',
			'timePicker.minutes' => 'Minuti',
			'timePicker.seconds' => 'Secondi',
			'timePicker.period' => 'Periodo',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Seleziona data',
			'input.cut' => 'Taglia',
			'input.copy' => 'Copia',
			'input.paste' => 'Incolla',
			'input.selectAll' => 'Seleziona tutto',
			'keyboardToolbar.done' => 'Fine',
			_ => null,
		};
	}
}
