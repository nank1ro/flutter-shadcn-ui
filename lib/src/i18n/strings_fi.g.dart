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
class ShadLocalizationsDataFi extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataFi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.fi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fi>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataFi _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataFi $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataFi(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsData$timePicker$fi timePicker = _ShadLocalizationsData$timePicker$fi._(_root);
	@override late final _ShadLocalizationsData$datePicker$fi datePicker = _ShadLocalizationsData$datePicker$fi._(_root);
	@override late final _ShadLocalizationsData$input$fi input = _ShadLocalizationsData$input$fi._(_root);
	@override late final _ShadLocalizationsData$keyboardToolbar$fi keyboardToolbar = _ShadLocalizationsData$keyboardToolbar$fi._(_root);
}

// Path: timePicker
class _ShadLocalizationsData$timePicker$fi extends ShadLocalizationsData$timePicker$en {
	_ShadLocalizationsData$timePicker$fi._(ShadLocalizationsDataFi root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataFi _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Tunnit';
	@override String get minutes => 'Minuutit';
	@override String get seconds => 'Sekunnit';
	@override String get period => 'Jakso';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsData$datePicker$fi extends ShadLocalizationsData$datePicker$en {
	_ShadLocalizationsData$datePicker$fi._(ShadLocalizationsDataFi root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataFi _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Valitse päivämäärä';
}

// Path: input
class _ShadLocalizationsData$input$fi extends ShadLocalizationsData$input$en {
	_ShadLocalizationsData$input$fi._(ShadLocalizationsDataFi root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataFi _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Leikkaa';
	@override String get copy => 'Kopioi';
	@override String get paste => 'Liitä';
	@override String get selectAll => 'Valitse kaikki';
}

// Path: keyboardToolbar
class _ShadLocalizationsData$keyboardToolbar$fi extends ShadLocalizationsData$keyboardToolbar$en {
	_ShadLocalizationsData$keyboardToolbar$fi._(ShadLocalizationsDataFi root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataFi _root; // ignore: unused_field

	// Translations
	@override String get done => 'Valmis';
}

/// The flat map containing all translations for locale <fi>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataFi {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Tunnit',
			'timePicker.minutes' => 'Minuutit',
			'timePicker.seconds' => 'Sekunnit',
			'timePicker.period' => 'Jakso',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Valitse päivämäärä',
			'input.cut' => 'Leikkaa',
			'input.copy' => 'Kopioi',
			'input.paste' => 'Liitä',
			'input.selectAll' => 'Valitse kaikki',
			'keyboardToolbar.done' => 'Valmis',
			_ => null,
		};
	}
}
