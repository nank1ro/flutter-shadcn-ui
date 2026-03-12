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
class ShadLocalizationsDataFr extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataFr _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataFr $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataFr(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerFr timePicker = _ShadLocalizationsDataTimePickerFr._(_root);
	@override late final _ShadLocalizationsDataDatePickerFr datePicker = _ShadLocalizationsDataDatePickerFr._(_root);
	@override late final _ShadLocalizationsDataInputFr input = _ShadLocalizationsDataInputFr._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarFr keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarFr._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerFr extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerFr._(ShadLocalizationsDataFr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataFr _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Heures';
	@override String get minutes => 'Minutes';
	@override String get seconds => 'Secondes';
	@override String get period => 'Période';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerFr extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerFr._(ShadLocalizationsDataFr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataFr _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Sélectionner une date';
}

// Path: input
class _ShadLocalizationsDataInputFr extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputFr._(ShadLocalizationsDataFr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataFr _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Couper';
	@override String get copy => 'Copier';
	@override String get paste => 'Coller';
	@override String get selectAll => 'Tout sélectionner';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarFr extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarFr._(ShadLocalizationsDataFr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataFr _root; // ignore: unused_field

	// Translations
	@override String get done => 'Terminé';
}

/// The flat map containing all translations for locale <fr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataFr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Heures',
			'timePicker.minutes' => 'Minutes',
			'timePicker.seconds' => 'Secondes',
			'timePicker.period' => 'Période',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Sélectionner une date',
			'input.cut' => 'Couper',
			'input.copy' => 'Copier',
			'input.paste' => 'Coller',
			'input.selectAll' => 'Tout sélectionner',
			'keyboardToolbar.done' => 'Terminé',
			_ => null,
		};
	}
}
