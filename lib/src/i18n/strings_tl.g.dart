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
class ShadLocalizationsDataTl extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataTl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.tl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <tl>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataTl _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataTl $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataTl(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsData$timePicker$tl timePicker = _ShadLocalizationsData$timePicker$tl._(_root);
	@override late final _ShadLocalizationsData$datePicker$tl datePicker = _ShadLocalizationsData$datePicker$tl._(_root);
	@override late final _ShadLocalizationsData$input$tl input = _ShadLocalizationsData$input$tl._(_root);
	@override late final _ShadLocalizationsData$keyboardToolbar$tl keyboardToolbar = _ShadLocalizationsData$keyboardToolbar$tl._(_root);
}

// Path: timePicker
class _ShadLocalizationsData$timePicker$tl extends ShadLocalizationsData$timePicker$en {
	_ShadLocalizationsData$timePicker$tl._(ShadLocalizationsDataTl root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataTl _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Oras';
	@override String get minutes => 'Minuto';
	@override String get seconds => 'Segundo';
	@override String get period => 'Panahon';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsData$datePicker$tl extends ShadLocalizationsData$datePicker$en {
	_ShadLocalizationsData$datePicker$tl._(ShadLocalizationsDataTl root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataTl _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Pumili ng petsa';
}

// Path: input
class _ShadLocalizationsData$input$tl extends ShadLocalizationsData$input$en {
	_ShadLocalizationsData$input$tl._(ShadLocalizationsDataTl root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataTl _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Gupitin';
	@override String get copy => 'Kopyahin';
	@override String get paste => 'I-paste';
	@override String get selectAll => 'Piliin lahat';
}

// Path: keyboardToolbar
class _ShadLocalizationsData$keyboardToolbar$tl extends ShadLocalizationsData$keyboardToolbar$en {
	_ShadLocalizationsData$keyboardToolbar$tl._(ShadLocalizationsDataTl root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataTl _root; // ignore: unused_field

	// Translations
	@override String get done => 'Tapos na';
}

/// The flat map containing all translations for locale <tl>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataTl {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Oras',
			'timePicker.minutes' => 'Minuto',
			'timePicker.seconds' => 'Segundo',
			'timePicker.period' => 'Panahon',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Pumili ng petsa',
			'input.cut' => 'Gupitin',
			'input.copy' => 'Kopyahin',
			'input.paste' => 'I-paste',
			'input.selectAll' => 'Piliin lahat',
			'keyboardToolbar.done' => 'Tapos na',
			_ => null,
		};
	}
}
