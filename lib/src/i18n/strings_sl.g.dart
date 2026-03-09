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
class ShadLocalizationsSl extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsSl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.sl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <sl>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsSl _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsSl $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsSl(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerSl timePicker = _ShadLocalizationsTimePickerSl._(_root);
	@override late final _ShadLocalizationsDatePickerSl datePicker = _ShadLocalizationsDatePickerSl._(_root);
	@override late final _ShadLocalizationsInputSl input = _ShadLocalizationsInputSl._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarSl keyboardToolbar = _ShadLocalizationsKeyboardToolbarSl._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerSl extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerSl._(ShadLocalizationsSl root) : this._root = root, super.internal(root);

	final ShadLocalizationsSl _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Ure';
	@override String get minutes => 'Minute';
	@override String get seconds => 'Sekunde';
	@override String get period => 'Obdobje';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerSl extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerSl._(ShadLocalizationsSl root) : this._root = root, super.internal(root);

	final ShadLocalizationsSl _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Izberite datum';
}

// Path: input
class _ShadLocalizationsInputSl extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputSl._(ShadLocalizationsSl root) : this._root = root, super.internal(root);

	final ShadLocalizationsSl _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Izreži';
	@override String get copy => 'Kopiraj';
	@override String get paste => 'Prilepi';
	@override String get selectAll => 'Izberi vse';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarSl extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarSl._(ShadLocalizationsSl root) : this._root = root, super.internal(root);

	final ShadLocalizationsSl _root; // ignore: unused_field

	// Translations
	@override String get done => 'Končano';
}

/// The flat map containing all translations for locale <sl>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsSl {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Ure',
			'timePicker.minutes' => 'Minute',
			'timePicker.seconds' => 'Sekunde',
			'timePicker.period' => 'Obdobje',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Izberite datum',
			'input.cut' => 'Izreži',
			'input.copy' => 'Kopiraj',
			'input.paste' => 'Prilepi',
			'input.selectAll' => 'Izberi vse',
			'keyboardToolbar.done' => 'Končano',
			_ => null,
		};
	}
}
