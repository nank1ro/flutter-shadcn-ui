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
class ShadLocalizationsFr extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
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
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsFr _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsFr $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsFr(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerFr timePicker = _ShadLocalizationsTimePickerFr._(_root);
	@override late final _ShadLocalizationsDatePickerFr datePicker = _ShadLocalizationsDatePickerFr._(_root);
	@override late final _ShadLocalizationsInputFr input = _ShadLocalizationsInputFr._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarFr keyboardToolbar = _ShadLocalizationsKeyboardToolbarFr._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerFr extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerFr._(ShadLocalizationsFr root) : this._root = root, super.internal(root);

	final ShadLocalizationsFr _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Heures';
	@override String get minutes => 'Minutes';
	@override String get seconds => 'Secondes';
	@override String get period => 'Période';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerFr extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerFr._(ShadLocalizationsFr root) : this._root = root, super.internal(root);

	final ShadLocalizationsFr _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Sélectionner une date';
}

// Path: input
class _ShadLocalizationsInputFr extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputFr._(ShadLocalizationsFr root) : this._root = root, super.internal(root);

	final ShadLocalizationsFr _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Couper';
	@override String get copy => 'Copier';
	@override String get paste => 'Coller';
	@override String get selectAll => 'Tout sélectionner';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarFr extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarFr._(ShadLocalizationsFr root) : this._root = root, super.internal(root);

	final ShadLocalizationsFr _root; // ignore: unused_field

	// Translations
	@override String get done => 'Terminé';
}

/// The flat map containing all translations for locale <fr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsFr {
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
