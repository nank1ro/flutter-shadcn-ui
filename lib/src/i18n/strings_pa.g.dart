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
class ShadLocalizationsPa extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsPa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.pa,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pa>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsPa _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsPa $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsPa(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerPa timePicker = _ShadLocalizationsTimePickerPa._(_root);
	@override late final _ShadLocalizationsDatePickerPa datePicker = _ShadLocalizationsDatePickerPa._(_root);
	@override late final _ShadLocalizationsInputPa input = _ShadLocalizationsInputPa._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarPa keyboardToolbar = _ShadLocalizationsKeyboardToolbarPa._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerPa extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerPa._(ShadLocalizationsPa root) : this._root = root, super.internal(root);

	final ShadLocalizationsPa _root; // ignore: unused_field

	// Translations
	@override String get hours => 'ਘੰਟੇ';
	@override String get minutes => 'ਮਿੰਟ';
	@override String get seconds => 'ਸਕਿੰਟ';
	@override String get period => 'ਸਮਾਂ';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerPa extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerPa._(ShadLocalizationsPa root) : this._root = root, super.internal(root);

	final ShadLocalizationsPa _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'ਮਿਤੀ ਚੁਣੋ';
}

// Path: input
class _ShadLocalizationsInputPa extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputPa._(ShadLocalizationsPa root) : this._root = root, super.internal(root);

	final ShadLocalizationsPa _root; // ignore: unused_field

	// Translations
	@override String get cut => 'ਕੱਟੋ';
	@override String get copy => 'ਕਾਪੀ ਕਰੋ';
	@override String get paste => 'ਪੇਸਟ ਕਰੋ';
	@override String get selectAll => 'ਸਭ ਚੁਣੋ';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarPa extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarPa._(ShadLocalizationsPa root) : this._root = root, super.internal(root);

	final ShadLocalizationsPa _root; // ignore: unused_field

	// Translations
	@override String get done => 'ਹੋ ਗਿਆ';
}

/// The flat map containing all translations for locale <pa>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsPa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'ਘੰਟੇ',
			'timePicker.minutes' => 'ਮਿੰਟ',
			'timePicker.seconds' => 'ਸਕਿੰਟ',
			'timePicker.period' => 'ਸਮਾਂ',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'ਮਿਤੀ ਚੁਣੋ',
			'input.cut' => 'ਕੱਟੋ',
			'input.copy' => 'ਕਾਪੀ ਕਰੋ',
			'input.paste' => 'ਪੇਸਟ ਕਰੋ',
			'input.selectAll' => 'ਸਭ ਚੁਣੋ',
			'keyboardToolbar.done' => 'ਹੋ ਗਿਆ',
			_ => null,
		};
	}
}
