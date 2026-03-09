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
class ShadLocalizationsGa extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsGa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.ga,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ga>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsGa _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsGa $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsGa(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerGa timePicker = _ShadLocalizationsTimePickerGa._(_root);
	@override late final _ShadLocalizationsDatePickerGa datePicker = _ShadLocalizationsDatePickerGa._(_root);
	@override late final _ShadLocalizationsInputGa input = _ShadLocalizationsInputGa._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarGa keyboardToolbar = _ShadLocalizationsKeyboardToolbarGa._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerGa extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerGa._(ShadLocalizationsGa root) : this._root = root, super.internal(root);

	final ShadLocalizationsGa _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Uaireanta';
	@override String get minutes => 'Nóiméid';
	@override String get seconds => 'Soicindí';
	@override String get period => 'Tréimhse';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerGa extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerGa._(ShadLocalizationsGa root) : this._root = root, super.internal(root);

	final ShadLocalizationsGa _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Roghnaigh dáta';
}

// Path: input
class _ShadLocalizationsInputGa extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputGa._(ShadLocalizationsGa root) : this._root = root, super.internal(root);

	final ShadLocalizationsGa _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Gearr';
	@override String get copy => 'Cóipeáil';
	@override String get paste => 'Greamaigh';
	@override String get selectAll => 'Roghnaigh uile';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarGa extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarGa._(ShadLocalizationsGa root) : this._root = root, super.internal(root);

	final ShadLocalizationsGa _root; // ignore: unused_field

	// Translations
	@override String get done => 'Déanta';
}

/// The flat map containing all translations for locale <ga>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsGa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Uaireanta',
			'timePicker.minutes' => 'Nóiméid',
			'timePicker.seconds' => 'Soicindí',
			'timePicker.period' => 'Tréimhse',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Roghnaigh dáta',
			'input.cut' => 'Gearr',
			'input.copy' => 'Cóipeáil',
			'input.paste' => 'Greamaigh',
			'input.selectAll' => 'Roghnaigh uile',
			'keyboardToolbar.done' => 'Déanta',
			_ => null,
		};
	}
}
