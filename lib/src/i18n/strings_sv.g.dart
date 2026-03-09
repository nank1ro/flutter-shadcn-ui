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
class ShadLocalizationsDataSv extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataSv({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
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
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataSv _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataSv $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataSv(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerSv timePicker = _ShadLocalizationsDataTimePickerSv._(_root);
	@override late final _ShadLocalizationsDataDatePickerSv datePicker = _ShadLocalizationsDataDatePickerSv._(_root);
	@override late final _ShadLocalizationsDataInputSv input = _ShadLocalizationsDataInputSv._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarSv keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarSv._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerSv extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerSv._(ShadLocalizationsDataSv root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSv _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Timmar';
	@override String get minutes => 'Minuter';
	@override String get seconds => 'Sekunder';
	@override String get period => 'Period';
	@override String get periodPlaceholder => 'FM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerSv extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerSv._(ShadLocalizationsDataSv root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSv _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Välj datum';
}

// Path: input
class _ShadLocalizationsDataInputSv extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputSv._(ShadLocalizationsDataSv root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSv _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Klipp ut';
	@override String get copy => 'Kopiera';
	@override String get paste => 'Klistra in';
	@override String get selectAll => 'Markera allt';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarSv extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarSv._(ShadLocalizationsDataSv root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSv _root; // ignore: unused_field

	// Translations
	@override String get done => 'Klar';
}

/// The flat map containing all translations for locale <sv>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataSv {
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
