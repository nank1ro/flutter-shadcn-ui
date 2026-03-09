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
class ShadLocalizationsSv extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsSv({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.sv,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <sv>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsSv _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsSv $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsSv(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerSv timePicker = _ShadLocalizationsTimePickerSv._(_root);
	@override late final _ShadLocalizationsDatePickerSv datePicker = _ShadLocalizationsDatePickerSv._(_root);
	@override late final _ShadLocalizationsInputSv input = _ShadLocalizationsInputSv._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarSv keyboardToolbar = _ShadLocalizationsKeyboardToolbarSv._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerSv extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerSv._(ShadLocalizationsSv root) : this._root = root, super.internal(root);

	final ShadLocalizationsSv _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Timmar';
	@override String get minutes => 'Minuter';
	@override String get seconds => 'Sekunder';
	@override String get period => 'Period';
	@override String get periodPlaceholder => 'FM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerSv extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerSv._(ShadLocalizationsSv root) : this._root = root, super.internal(root);

	final ShadLocalizationsSv _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Välj datum';
}

// Path: input
class _ShadLocalizationsInputSv extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputSv._(ShadLocalizationsSv root) : this._root = root, super.internal(root);

	final ShadLocalizationsSv _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Klipp ut';
	@override String get copy => 'Kopiera';
	@override String get paste => 'Klistra in';
	@override String get selectAll => 'Markera allt';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarSv extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarSv._(ShadLocalizationsSv root) : this._root = root, super.internal(root);

	final ShadLocalizationsSv _root; // ignore: unused_field

	// Translations
	@override String get done => 'Klar';
}

/// The flat map containing all translations for locale <sv>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsSv {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Timmar',
			'timePicker.minutes' => 'Minuter',
			'timePicker.seconds' => 'Sekunder',
			'timePicker.period' => 'Period',
			'timePicker.periodPlaceholder' => 'FM',
			'datePicker.selectDate' => 'Välj datum',
			'input.cut' => 'Klipp ut',
			'input.copy' => 'Kopiera',
			'input.paste' => 'Klistra in',
			'input.selectAll' => 'Markera allt',
			'keyboardToolbar.done' => 'Klar',
			_ => null,
		};
	}
}
