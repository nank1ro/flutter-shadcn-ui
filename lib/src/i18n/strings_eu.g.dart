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
class ShadLocalizationsDataEu extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataEu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.eu,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <eu>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataEu _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataEu $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataEu(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsData$timePicker$eu timePicker = _ShadLocalizationsData$timePicker$eu._(_root);
	@override late final _ShadLocalizationsData$datePicker$eu datePicker = _ShadLocalizationsData$datePicker$eu._(_root);
	@override late final _ShadLocalizationsData$input$eu input = _ShadLocalizationsData$input$eu._(_root);
	@override late final _ShadLocalizationsData$keyboardToolbar$eu keyboardToolbar = _ShadLocalizationsData$keyboardToolbar$eu._(_root);
}

// Path: timePicker
class _ShadLocalizationsData$timePicker$eu extends ShadLocalizationsData$timePicker$en {
	_ShadLocalizationsData$timePicker$eu._(ShadLocalizationsDataEu root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataEu _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Orduak';
	@override String get minutes => 'Minutuak';
	@override String get seconds => 'Segundoak';
	@override String get period => 'Aldia';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsData$datePicker$eu extends ShadLocalizationsData$datePicker$en {
	_ShadLocalizationsData$datePicker$eu._(ShadLocalizationsDataEu root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataEu _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Hautatu data';
}

// Path: input
class _ShadLocalizationsData$input$eu extends ShadLocalizationsData$input$en {
	_ShadLocalizationsData$input$eu._(ShadLocalizationsDataEu root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataEu _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Ebaki';
	@override String get copy => 'Kopiatu';
	@override String get paste => 'Itsatsi';
	@override String get selectAll => 'Hautatu dena';
}

// Path: keyboardToolbar
class _ShadLocalizationsData$keyboardToolbar$eu extends ShadLocalizationsData$keyboardToolbar$en {
	_ShadLocalizationsData$keyboardToolbar$eu._(ShadLocalizationsDataEu root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataEu _root; // ignore: unused_field

	// Translations
	@override String get done => 'Eginda';
}

/// The flat map containing all translations for locale <eu>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataEu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Orduak',
			'timePicker.minutes' => 'Minutuak',
			'timePicker.seconds' => 'Segundoak',
			'timePicker.period' => 'Aldia',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Hautatu data',
			'input.cut' => 'Ebaki',
			'input.copy' => 'Kopiatu',
			'input.paste' => 'Itsatsi',
			'input.selectAll' => 'Hautatu dena',
			'keyboardToolbar.done' => 'Eginda',
			_ => null,
		};
	}
}
