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
class ShadLocalizationsLt extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsLt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.lt,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <lt>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsLt _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsLt $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsLt(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerLt timePicker = _ShadLocalizationsTimePickerLt._(_root);
	@override late final _ShadLocalizationsDatePickerLt datePicker = _ShadLocalizationsDatePickerLt._(_root);
	@override late final _ShadLocalizationsInputLt input = _ShadLocalizationsInputLt._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarLt keyboardToolbar = _ShadLocalizationsKeyboardToolbarLt._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerLt extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerLt._(ShadLocalizationsLt root) : this._root = root, super.internal(root);

	final ShadLocalizationsLt _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Valandos';
	@override String get minutes => 'Minutės';
	@override String get seconds => 'Sekundės';
	@override String get period => 'Laikotarpis';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerLt extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerLt._(ShadLocalizationsLt root) : this._root = root, super.internal(root);

	final ShadLocalizationsLt _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Pasirinkite datą';
}

// Path: input
class _ShadLocalizationsInputLt extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputLt._(ShadLocalizationsLt root) : this._root = root, super.internal(root);

	final ShadLocalizationsLt _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Iškirpti';
	@override String get copy => 'Kopijuoti';
	@override String get paste => 'Įklijuoti';
	@override String get selectAll => 'Pasirinkti viską';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarLt extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarLt._(ShadLocalizationsLt root) : this._root = root, super.internal(root);

	final ShadLocalizationsLt _root; // ignore: unused_field

	// Translations
	@override String get done => 'Atlikta';
}

/// The flat map containing all translations for locale <lt>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsLt {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Valandos',
			'timePicker.minutes' => 'Minutės',
			'timePicker.seconds' => 'Sekundės',
			'timePicker.period' => 'Laikotarpis',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Pasirinkite datą',
			'input.cut' => 'Iškirpti',
			'input.copy' => 'Kopijuoti',
			'input.paste' => 'Įklijuoti',
			'input.selectAll' => 'Pasirinkti viską',
			'keyboardToolbar.done' => 'Atlikta',
			_ => null,
		};
	}
}
