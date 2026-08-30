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
class ShadLocalizationsDataKa extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataKa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.ka,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ka>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataKa _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataKa $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataKa(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsData$timePicker$ka timePicker = _ShadLocalizationsData$timePicker$ka._(_root);
	@override late final _ShadLocalizationsData$datePicker$ka datePicker = _ShadLocalizationsData$datePicker$ka._(_root);
	@override late final _ShadLocalizationsData$input$ka input = _ShadLocalizationsData$input$ka._(_root);
	@override late final _ShadLocalizationsData$keyboardToolbar$ka keyboardToolbar = _ShadLocalizationsData$keyboardToolbar$ka._(_root);
}

// Path: timePicker
class _ShadLocalizationsData$timePicker$ka extends ShadLocalizationsData$timePicker$en {
	_ShadLocalizationsData$timePicker$ka._(ShadLocalizationsDataKa root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataKa _root; // ignore: unused_field

	// Translations
	@override String get hours => 'საათი';
	@override String get minutes => 'წუთი';
	@override String get seconds => 'წამი';
	@override String get period => 'პერიოდი';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsData$datePicker$ka extends ShadLocalizationsData$datePicker$en {
	_ShadLocalizationsData$datePicker$ka._(ShadLocalizationsDataKa root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataKa _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'აირჩიეთ თარიღი';
}

// Path: input
class _ShadLocalizationsData$input$ka extends ShadLocalizationsData$input$en {
	_ShadLocalizationsData$input$ka._(ShadLocalizationsDataKa root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataKa _root; // ignore: unused_field

	// Translations
	@override String get cut => 'ამოჭრა';
	@override String get copy => 'კოპირება';
	@override String get paste => 'ჩასმა';
	@override String get selectAll => 'ყველაფრის მონიშვნა';
}

// Path: keyboardToolbar
class _ShadLocalizationsData$keyboardToolbar$ka extends ShadLocalizationsData$keyboardToolbar$en {
	_ShadLocalizationsData$keyboardToolbar$ka._(ShadLocalizationsDataKa root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataKa _root; // ignore: unused_field

	// Translations
	@override String get done => 'მზადაა';
}

/// The flat map containing all translations for locale <ka>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataKa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'საათი',
			'timePicker.minutes' => 'წუთი',
			'timePicker.seconds' => 'წამი',
			'timePicker.period' => 'პერიოდი',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'აირჩიეთ თარიღი',
			'input.cut' => 'ამოჭრა',
			'input.copy' => 'კოპირება',
			'input.paste' => 'ჩასმა',
			'input.selectAll' => 'ყველაფრის მონიშვნა',
			'keyboardToolbar.done' => 'მზადაა',
			_ => null,
		};
	}
}
