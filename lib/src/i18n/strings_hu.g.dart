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
class ShadLocalizationsDataHu extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataHu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.hu,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <hu>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataHu _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataHu $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataHu(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsData$timePicker$hu timePicker = _ShadLocalizationsData$timePicker$hu._(_root);
	@override late final _ShadLocalizationsData$datePicker$hu datePicker = _ShadLocalizationsData$datePicker$hu._(_root);
	@override late final _ShadLocalizationsData$input$hu input = _ShadLocalizationsData$input$hu._(_root);
	@override late final _ShadLocalizationsData$keyboardToolbar$hu keyboardToolbar = _ShadLocalizationsData$keyboardToolbar$hu._(_root);
}

// Path: timePicker
class _ShadLocalizationsData$timePicker$hu extends ShadLocalizationsData$timePicker$en {
	_ShadLocalizationsData$timePicker$hu._(ShadLocalizationsDataHu root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataHu _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Óra';
	@override String get minutes => 'Perc';
	@override String get seconds => 'Másodperc';
	@override String get period => 'Időszak';
	@override String get periodPlaceholder => 'DE';
}

// Path: datePicker
class _ShadLocalizationsData$datePicker$hu extends ShadLocalizationsData$datePicker$en {
	_ShadLocalizationsData$datePicker$hu._(ShadLocalizationsDataHu root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataHu _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Válasszon dátumot';
}

// Path: input
class _ShadLocalizationsData$input$hu extends ShadLocalizationsData$input$en {
	_ShadLocalizationsData$input$hu._(ShadLocalizationsDataHu root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataHu _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Kivágás';
	@override String get copy => 'Másolás';
	@override String get paste => 'Beillesztés';
	@override String get selectAll => 'Összes kijelölése';
}

// Path: keyboardToolbar
class _ShadLocalizationsData$keyboardToolbar$hu extends ShadLocalizationsData$keyboardToolbar$en {
	_ShadLocalizationsData$keyboardToolbar$hu._(ShadLocalizationsDataHu root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataHu _root; // ignore: unused_field

	// Translations
	@override String get done => 'Kész';
}

/// The flat map containing all translations for locale <hu>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataHu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Óra',
			'timePicker.minutes' => 'Perc',
			'timePicker.seconds' => 'Másodperc',
			'timePicker.period' => 'Időszak',
			'timePicker.periodPlaceholder' => 'DE',
			'datePicker.selectDate' => 'Válasszon dátumot',
			'input.cut' => 'Kivágás',
			'input.copy' => 'Másolás',
			'input.paste' => 'Beillesztés',
			'input.selectAll' => 'Összes kijelölése',
			'keyboardToolbar.done' => 'Kész',
			_ => null,
		};
	}
}
