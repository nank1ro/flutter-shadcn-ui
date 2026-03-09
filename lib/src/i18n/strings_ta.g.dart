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
class ShadLocalizationsDataTa extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataTa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
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
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataTa _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataTa $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataTa(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerTa timePicker = _ShadLocalizationsDataTimePickerTa._(_root);
	@override late final _ShadLocalizationsDataDatePickerTa datePicker = _ShadLocalizationsDataDatePickerTa._(_root);
	@override late final _ShadLocalizationsDataInputTa input = _ShadLocalizationsDataInputTa._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarTa keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarTa._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerTa extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerTa._(ShadLocalizationsDataTa root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataTa _root; // ignore: unused_field

	// Translations
	@override String get hours => 'மணி';
	@override String get minutes => 'நிமிடங்கள்';
	@override String get seconds => 'விநாடிகள்';
	@override String get period => 'காலம்';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerTa extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerTa._(ShadLocalizationsDataTa root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataTa _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'தேதியை தேர்ந்தெடுக்கவும்';
}

// Path: input
class _ShadLocalizationsDataInputTa extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputTa._(ShadLocalizationsDataTa root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataTa _root; // ignore: unused_field

	// Translations
	@override String get cut => 'வெட்டு';
	@override String get copy => 'நகலெடு';
	@override String get paste => 'ஒட்டு';
	@override String get selectAll => 'அனைத்தையும் தேர்ந்தெடு';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarTa extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarTa._(ShadLocalizationsDataTa root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataTa _root; // ignore: unused_field

	// Translations
	@override String get done => 'முடிந்தது';
}

/// The flat map containing all translations for locale <ta>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataTa {
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
