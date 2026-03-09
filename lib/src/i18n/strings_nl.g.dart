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
class ShadLocalizationsNl extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsNl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.nl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <nl>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsNl _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsNl $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsNl(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerNl timePicker = _ShadLocalizationsTimePickerNl._(_root);
	@override late final _ShadLocalizationsDatePickerNl datePicker = _ShadLocalizationsDatePickerNl._(_root);
	@override late final _ShadLocalizationsInputNl input = _ShadLocalizationsInputNl._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarNl keyboardToolbar = _ShadLocalizationsKeyboardToolbarNl._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerNl extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerNl._(ShadLocalizationsNl root) : this._root = root, super.internal(root);

	final ShadLocalizationsNl _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Uren';
	@override String get minutes => 'Minuten';
	@override String get seconds => 'Seconden';
	@override String get period => 'Periode';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerNl extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerNl._(ShadLocalizationsNl root) : this._root = root, super.internal(root);

	final ShadLocalizationsNl _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Datum selecteren';
}

// Path: input
class _ShadLocalizationsInputNl extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputNl._(ShadLocalizationsNl root) : this._root = root, super.internal(root);

	final ShadLocalizationsNl _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Knippen';
	@override String get copy => 'Kopiëren';
	@override String get paste => 'Plakken';
	@override String get selectAll => 'Alles selecteren';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarNl extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarNl._(ShadLocalizationsNl root) : this._root = root, super.internal(root);

	final ShadLocalizationsNl _root; // ignore: unused_field

	// Translations
	@override String get done => 'Gereed';
}

/// The flat map containing all translations for locale <nl>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsNl {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Uren',
			'timePicker.minutes' => 'Minuten',
			'timePicker.seconds' => 'Seconden',
			'timePicker.period' => 'Periode',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Datum selecteren',
			'input.cut' => 'Knippen',
			'input.copy' => 'Kopiëren',
			'input.paste' => 'Plakken',
			'input.selectAll' => 'Alles selecteren',
			'keyboardToolbar.done' => 'Gereed',
			_ => null,
		};
	}
}
