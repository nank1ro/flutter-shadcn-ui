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
class ShadLocalizationsTa extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsTa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.ta,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ta>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsTa _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsTa $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsTa(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerTa timePicker = _ShadLocalizationsTimePickerTa._(_root);
	@override late final _ShadLocalizationsDatePickerTa datePicker = _ShadLocalizationsDatePickerTa._(_root);
	@override late final _ShadLocalizationsInputTa input = _ShadLocalizationsInputTa._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarTa keyboardToolbar = _ShadLocalizationsKeyboardToolbarTa._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerTa extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerTa._(ShadLocalizationsTa root) : this._root = root, super.internal(root);

	final ShadLocalizationsTa _root; // ignore: unused_field

	// Translations
	@override String get hours => 'மணி';
	@override String get minutes => 'நிமிடங்கள்';
	@override String get seconds => 'விநாடிகள்';
	@override String get period => 'காலம்';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerTa extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerTa._(ShadLocalizationsTa root) : this._root = root, super.internal(root);

	final ShadLocalizationsTa _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'தேதியை தேர்ந்தெடுக்கவும்';
}

// Path: input
class _ShadLocalizationsInputTa extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputTa._(ShadLocalizationsTa root) : this._root = root, super.internal(root);

	final ShadLocalizationsTa _root; // ignore: unused_field

	// Translations
	@override String get cut => 'வெட்டு';
	@override String get copy => 'நகலெடு';
	@override String get paste => 'ஒட்டு';
	@override String get selectAll => 'அனைத்தையும் தேர்ந்தெடு';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarTa extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarTa._(ShadLocalizationsTa root) : this._root = root, super.internal(root);

	final ShadLocalizationsTa _root; // ignore: unused_field

	// Translations
	@override String get done => 'முடிந்தது';
}

/// The flat map containing all translations for locale <ta>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsTa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'மணி',
			'timePicker.minutes' => 'நிமிடங்கள்',
			'timePicker.seconds' => 'விநாடிகள்',
			'timePicker.period' => 'காலம்',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'தேதியை தேர்ந்தெடுக்கவும்',
			'input.cut' => 'வெட்டு',
			'input.copy' => 'நகலெடு',
			'input.paste' => 'ஒட்டு',
			'input.selectAll' => 'அனைத்தையும் தேர்ந்தெடு',
			'keyboardToolbar.done' => 'முடிந்தது',
			_ => null,
		};
	}
}
