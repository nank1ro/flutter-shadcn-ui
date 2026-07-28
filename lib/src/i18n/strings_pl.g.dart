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
class ShadLocalizationsDataPl extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataPl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.pl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pl>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataPl _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataPl $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataPl(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsData$timePicker$pl timePicker = _ShadLocalizationsData$timePicker$pl._(_root);
	@override late final _ShadLocalizationsData$datePicker$pl datePicker = _ShadLocalizationsData$datePicker$pl._(_root);
	@override late final _ShadLocalizationsData$input$pl input = _ShadLocalizationsData$input$pl._(_root);
	@override late final _ShadLocalizationsData$keyboardToolbar$pl keyboardToolbar = _ShadLocalizationsData$keyboardToolbar$pl._(_root);
}

// Path: timePicker
class _ShadLocalizationsData$timePicker$pl extends ShadLocalizationsData$timePicker$en {
	_ShadLocalizationsData$timePicker$pl._(ShadLocalizationsDataPl root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataPl _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Godziny';
	@override String get minutes => 'Minuty';
	@override String get seconds => 'Sekundy';
	@override String get period => 'Okres';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsData$datePicker$pl extends ShadLocalizationsData$datePicker$en {
	_ShadLocalizationsData$datePicker$pl._(ShadLocalizationsDataPl root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataPl _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Wybierz datę';
}

// Path: input
class _ShadLocalizationsData$input$pl extends ShadLocalizationsData$input$en {
	_ShadLocalizationsData$input$pl._(ShadLocalizationsDataPl root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataPl _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Wytnij';
	@override String get copy => 'Kopiuj';
	@override String get paste => 'Wklej';
	@override String get selectAll => 'Zaznacz wszystko';
}

// Path: keyboardToolbar
class _ShadLocalizationsData$keyboardToolbar$pl extends ShadLocalizationsData$keyboardToolbar$en {
	_ShadLocalizationsData$keyboardToolbar$pl._(ShadLocalizationsDataPl root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataPl _root; // ignore: unused_field

	// Translations
	@override String get done => 'Gotowe';
}

/// The flat map containing all translations for locale <pl>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataPl {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Godziny',
			'timePicker.minutes' => 'Minuty',
			'timePicker.seconds' => 'Sekundy',
			'timePicker.period' => 'Okres',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Wybierz datę',
			'input.cut' => 'Wytnij',
			'input.copy' => 'Kopiuj',
			'input.paste' => 'Wklej',
			'input.selectAll' => 'Zaznacz wszystko',
			'keyboardToolbar.done' => 'Gotowe',
			_ => null,
		};
	}
}
