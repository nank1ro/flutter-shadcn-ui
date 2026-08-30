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
class ShadLocalizationsDataKy extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataKy({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.ky,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ky>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataKy _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataKy $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataKy(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsData$timePicker$ky timePicker = _ShadLocalizationsData$timePicker$ky._(_root);
	@override late final _ShadLocalizationsData$datePicker$ky datePicker = _ShadLocalizationsData$datePicker$ky._(_root);
	@override late final _ShadLocalizationsData$input$ky input = _ShadLocalizationsData$input$ky._(_root);
	@override late final _ShadLocalizationsData$keyboardToolbar$ky keyboardToolbar = _ShadLocalizationsData$keyboardToolbar$ky._(_root);
}

// Path: timePicker
class _ShadLocalizationsData$timePicker$ky extends ShadLocalizationsData$timePicker$en {
	_ShadLocalizationsData$timePicker$ky._(ShadLocalizationsDataKy root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataKy _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Саат';
	@override String get minutes => 'Мүнөт';
	@override String get seconds => 'Секунд';
	@override String get period => 'Мезгил';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsData$datePicker$ky extends ShadLocalizationsData$datePicker$en {
	_ShadLocalizationsData$datePicker$ky._(ShadLocalizationsDataKy root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataKy _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Күндү тандаңыз';
}

// Path: input
class _ShadLocalizationsData$input$ky extends ShadLocalizationsData$input$en {
	_ShadLocalizationsData$input$ky._(ShadLocalizationsDataKy root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataKy _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Кесүү';
	@override String get copy => 'Көчүрүү';
	@override String get paste => 'Чаптоо';
	@override String get selectAll => 'Баарын тандоо';
}

// Path: keyboardToolbar
class _ShadLocalizationsData$keyboardToolbar$ky extends ShadLocalizationsData$keyboardToolbar$en {
	_ShadLocalizationsData$keyboardToolbar$ky._(ShadLocalizationsDataKy root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataKy _root; // ignore: unused_field

	// Translations
	@override String get done => 'Даяр';
}

/// The flat map containing all translations for locale <ky>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataKy {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Саат',
			'timePicker.minutes' => 'Мүнөт',
			'timePicker.seconds' => 'Секунд',
			'timePicker.period' => 'Мезгил',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Күндү тандаңыз',
			'input.cut' => 'Кесүү',
			'input.copy' => 'Көчүрүү',
			'input.paste' => 'Чаптоо',
			'input.selectAll' => 'Баарын тандоо',
			'keyboardToolbar.done' => 'Даяр',
			_ => null,
		};
	}
}
