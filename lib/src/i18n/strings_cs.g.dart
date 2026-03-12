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
class ShadLocalizationsDataCs extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataCs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.cs,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <cs>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataCs _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataCs $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataCs(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerCs timePicker = _ShadLocalizationsDataTimePickerCs._(_root);
	@override late final _ShadLocalizationsDataDatePickerCs datePicker = _ShadLocalizationsDataDatePickerCs._(_root);
	@override late final _ShadLocalizationsDataInputCs input = _ShadLocalizationsDataInputCs._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarCs keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarCs._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerCs extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerCs._(ShadLocalizationsDataCs root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataCs _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Hodiny';
	@override String get minutes => 'Minuty';
	@override String get seconds => 'Sekundy';
	@override String get period => 'Perioda';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerCs extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerCs._(ShadLocalizationsDataCs root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataCs _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Vyberte datum';
}

// Path: input
class _ShadLocalizationsDataInputCs extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputCs._(ShadLocalizationsDataCs root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataCs _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Vyjmout';
	@override String get copy => 'Kopírovat';
	@override String get paste => 'Vložit';
	@override String get selectAll => 'Vybrat vše';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarCs extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarCs._(ShadLocalizationsDataCs root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataCs _root; // ignore: unused_field

	// Translations
	@override String get done => 'Hotovo';
}

/// The flat map containing all translations for locale <cs>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataCs {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Hodiny',
			'timePicker.minutes' => 'Minuty',
			'timePicker.seconds' => 'Sekundy',
			'timePicker.period' => 'Perioda',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Vyberte datum',
			'input.cut' => 'Vyjmout',
			'input.copy' => 'Kopírovat',
			'input.paste' => 'Vložit',
			'input.selectAll' => 'Vybrat vše',
			'keyboardToolbar.done' => 'Hotovo',
			_ => null,
		};
	}
}
