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
class ShadLocalizationsDataSk extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataSk({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.sk,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <sk>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataSk _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataSk $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataSk(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsData$timePicker$sk timePicker = _ShadLocalizationsData$timePicker$sk._(_root);
	@override late final _ShadLocalizationsData$datePicker$sk datePicker = _ShadLocalizationsData$datePicker$sk._(_root);
	@override late final _ShadLocalizationsData$input$sk input = _ShadLocalizationsData$input$sk._(_root);
	@override late final _ShadLocalizationsData$keyboardToolbar$sk keyboardToolbar = _ShadLocalizationsData$keyboardToolbar$sk._(_root);
}

// Path: timePicker
class _ShadLocalizationsData$timePicker$sk extends ShadLocalizationsData$timePicker$en {
	_ShadLocalizationsData$timePicker$sk._(ShadLocalizationsDataSk root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSk _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Hodiny';
	@override String get minutes => 'Minúty';
	@override String get seconds => 'Sekundy';
	@override String get period => 'Obdobie';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsData$datePicker$sk extends ShadLocalizationsData$datePicker$en {
	_ShadLocalizationsData$datePicker$sk._(ShadLocalizationsDataSk root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSk _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Vybrať dátum';
}

// Path: input
class _ShadLocalizationsData$input$sk extends ShadLocalizationsData$input$en {
	_ShadLocalizationsData$input$sk._(ShadLocalizationsDataSk root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSk _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Vystrihnúť';
	@override String get copy => 'Kopírovať';
	@override String get paste => 'Vložiť';
	@override String get selectAll => 'Vybrať všetko';
}

// Path: keyboardToolbar
class _ShadLocalizationsData$keyboardToolbar$sk extends ShadLocalizationsData$keyboardToolbar$en {
	_ShadLocalizationsData$keyboardToolbar$sk._(ShadLocalizationsDataSk root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSk _root; // ignore: unused_field

	// Translations
	@override String get done => 'Hotovo';
}

/// The flat map containing all translations for locale <sk>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataSk {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Hodiny',
			'timePicker.minutes' => 'Minúty',
			'timePicker.seconds' => 'Sekundy',
			'timePicker.period' => 'Obdobie',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Vybrať dátum',
			'input.cut' => 'Vystrihnúť',
			'input.copy' => 'Kopírovať',
			'input.paste' => 'Vložiť',
			'input.selectAll' => 'Vybrať všetko',
			'keyboardToolbar.done' => 'Hotovo',
			_ => null,
		};
	}
}
