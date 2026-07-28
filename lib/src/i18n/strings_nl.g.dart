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
class ShadLocalizationsDataNl extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataNl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
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
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataNl _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataNl $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataNl(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsData$timePicker$nl timePicker = _ShadLocalizationsData$timePicker$nl._(_root);
	@override late final _ShadLocalizationsData$datePicker$nl datePicker = _ShadLocalizationsData$datePicker$nl._(_root);
	@override late final _ShadLocalizationsData$input$nl input = _ShadLocalizationsData$input$nl._(_root);
	@override late final _ShadLocalizationsData$keyboardToolbar$nl keyboardToolbar = _ShadLocalizationsData$keyboardToolbar$nl._(_root);
}

// Path: timePicker
class _ShadLocalizationsData$timePicker$nl extends ShadLocalizationsData$timePicker$en {
	_ShadLocalizationsData$timePicker$nl._(ShadLocalizationsDataNl root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataNl _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Uren';
	@override String get minutes => 'Minuten';
	@override String get seconds => 'Seconden';
	@override String get period => 'Periode';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsData$datePicker$nl extends ShadLocalizationsData$datePicker$en {
	_ShadLocalizationsData$datePicker$nl._(ShadLocalizationsDataNl root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataNl _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Datum selecteren';
}

// Path: input
class _ShadLocalizationsData$input$nl extends ShadLocalizationsData$input$en {
	_ShadLocalizationsData$input$nl._(ShadLocalizationsDataNl root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataNl _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Knippen';
	@override String get copy => 'Kopiëren';
	@override String get paste => 'Plakken';
	@override String get selectAll => 'Alles selecteren';
}

// Path: keyboardToolbar
class _ShadLocalizationsData$keyboardToolbar$nl extends ShadLocalizationsData$keyboardToolbar$en {
	_ShadLocalizationsData$keyboardToolbar$nl._(ShadLocalizationsDataNl root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataNl _root; // ignore: unused_field

	// Translations
	@override String get done => 'Gereed';
}

/// The flat map containing all translations for locale <nl>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataNl {
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
