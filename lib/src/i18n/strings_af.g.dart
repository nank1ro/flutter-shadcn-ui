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
class ShadLocalizationsAf extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsAf({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
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
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsAf _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsAf $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsAf(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerAf timePicker = _ShadLocalizationsTimePickerAf._(_root);
	@override late final _ShadLocalizationsDatePickerAf datePicker = _ShadLocalizationsDatePickerAf._(_root);
	@override late final _ShadLocalizationsInputAf input = _ShadLocalizationsInputAf._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarAf keyboardToolbar = _ShadLocalizationsKeyboardToolbarAf._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerAf extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerAf._(ShadLocalizationsAf root) : this._root = root, super.internal(root);

	final ShadLocalizationsAf _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Ure';
	@override String get minutes => 'Minute';
	@override String get seconds => 'Sekondes';
	@override String get period => 'Periode';
	@override String get periodPlaceholder => 'VM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerAf extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerAf._(ShadLocalizationsAf root) : this._root = root, super.internal(root);

	final ShadLocalizationsAf _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Kies datum';
}

// Path: input
class _ShadLocalizationsInputAf extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputAf._(ShadLocalizationsAf root) : this._root = root, super.internal(root);

	final ShadLocalizationsAf _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Knip';
	@override String get copy => 'Kopieer';
	@override String get paste => 'Plak';
	@override String get selectAll => 'Kies alles';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarAf extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarAf._(ShadLocalizationsAf root) : this._root = root, super.internal(root);

	final ShadLocalizationsAf _root; // ignore: unused_field

	// Translations
	@override String get done => 'Klaar';
}

/// The flat map containing all translations for locale <af>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsAf {
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
