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
class ShadLocalizationsSk extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsSk({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.sk,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <sk>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsSk _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsSk $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsSk(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerSk timePicker = _ShadLocalizationsTimePickerSk._(_root);
	@override late final _ShadLocalizationsDatePickerSk datePicker = _ShadLocalizationsDatePickerSk._(_root);
	@override late final _ShadLocalizationsInputSk input = _ShadLocalizationsInputSk._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarSk keyboardToolbar = _ShadLocalizationsKeyboardToolbarSk._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerSk extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerSk._(ShadLocalizationsSk root) : this._root = root, super.internal(root);

	final ShadLocalizationsSk _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Hodiny';
	@override String get minutes => 'Minúty';
	@override String get seconds => 'Sekundy';
	@override String get period => 'Obdobie';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerSk extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerSk._(ShadLocalizationsSk root) : this._root = root, super.internal(root);

	final ShadLocalizationsSk _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Vybrať dátum';
}

// Path: input
class _ShadLocalizationsInputSk extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputSk._(ShadLocalizationsSk root) : this._root = root, super.internal(root);

	final ShadLocalizationsSk _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Vystrihnúť';
	@override String get copy => 'Kopírovať';
	@override String get paste => 'Vložiť';
	@override String get selectAll => 'Vybrať všetko';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarSk extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarSk._(ShadLocalizationsSk root) : this._root = root, super.internal(root);

	final ShadLocalizationsSk _root; // ignore: unused_field

	// Translations
	@override String get done => 'Hotovo';
}

/// The flat map containing all translations for locale <sk>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsSk {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Hodiny',
			'timePicker.minutes' => 'Minúty',
			'timePicker.seconds' => 'Sekundy',
			'timePicker.period' => 'Obdobie',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Vybrať dátum',
			'input.cut' => 'Vystrihnúť',
			'input.copy' => 'Kopírovať',
			'input.paste' => 'Vložiť',
			'input.selectAll' => 'Vybrať všetko',
			'keyboardToolbar.done' => 'Hotovo',
			_ => null,
		};
	}
}
