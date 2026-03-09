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
class ShadLocalizationsNo extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsNo({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.no,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <no>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsNo _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsNo $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsNo(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerNo timePicker = _ShadLocalizationsTimePickerNo._(_root);
	@override late final _ShadLocalizationsDatePickerNo datePicker = _ShadLocalizationsDatePickerNo._(_root);
	@override late final _ShadLocalizationsInputNo input = _ShadLocalizationsInputNo._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarNo keyboardToolbar = _ShadLocalizationsKeyboardToolbarNo._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerNo extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerNo._(ShadLocalizationsNo root) : this._root = root, super.internal(root);

	final ShadLocalizationsNo _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Timer';
	@override String get minutes => 'Minutter';
	@override String get seconds => 'Sekunder';
	@override String get period => 'Periode';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerNo extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerNo._(ShadLocalizationsNo root) : this._root = root, super.internal(root);

	final ShadLocalizationsNo _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Velg dato';
}

// Path: input
class _ShadLocalizationsInputNo extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputNo._(ShadLocalizationsNo root) : this._root = root, super.internal(root);

	final ShadLocalizationsNo _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Klipp ut';
	@override String get copy => 'Kopier';
	@override String get paste => 'Lim inn';
	@override String get selectAll => 'Merk alt';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarNo extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarNo._(ShadLocalizationsNo root) : this._root = root, super.internal(root);

	final ShadLocalizationsNo _root; // ignore: unused_field

	// Translations
	@override String get done => 'Ferdig';
}

/// The flat map containing all translations for locale <no>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsNo {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Timer',
			'timePicker.minutes' => 'Minutter',
			'timePicker.seconds' => 'Sekunder',
			'timePicker.period' => 'Periode',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Velg dato',
			'input.cut' => 'Klipp ut',
			'input.copy' => 'Kopier',
			'input.paste' => 'Lim inn',
			'input.selectAll' => 'Merk alt',
			'keyboardToolbar.done' => 'Ferdig',
			_ => null,
		};
	}
}
