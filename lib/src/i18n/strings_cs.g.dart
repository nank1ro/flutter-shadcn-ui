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
class ShadLocalizationsCs extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsCs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
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
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsCs _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsCs $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsCs(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerCs timePicker = _ShadLocalizationsTimePickerCs._(_root);
	@override late final _ShadLocalizationsDatePickerCs datePicker = _ShadLocalizationsDatePickerCs._(_root);
	@override late final _ShadLocalizationsInputCs input = _ShadLocalizationsInputCs._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarCs keyboardToolbar = _ShadLocalizationsKeyboardToolbarCs._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerCs extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerCs._(ShadLocalizationsCs root) : this._root = root, super.internal(root);

	final ShadLocalizationsCs _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Hodiny';
	@override String get minutes => 'Minuty';
	@override String get seconds => 'Sekundy';
	@override String get period => 'Perioda';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerCs extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerCs._(ShadLocalizationsCs root) : this._root = root, super.internal(root);

	final ShadLocalizationsCs _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Vyberte datum';
}

// Path: input
class _ShadLocalizationsInputCs extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputCs._(ShadLocalizationsCs root) : this._root = root, super.internal(root);

	final ShadLocalizationsCs _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Vyjmout';
	@override String get copy => 'Kopírovat';
	@override String get paste => 'Vložit';
	@override String get selectAll => 'Vybrat vše';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarCs extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarCs._(ShadLocalizationsCs root) : this._root = root, super.internal(root);

	final ShadLocalizationsCs _root; // ignore: unused_field

	// Translations
	@override String get done => 'Hotovo';
}

/// The flat map containing all translations for locale <cs>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsCs {
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
