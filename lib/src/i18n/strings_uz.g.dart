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
class ShadLocalizationsUz extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsUz({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.uz,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <uz>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsUz _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsUz $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsUz(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerUz timePicker = _ShadLocalizationsTimePickerUz._(_root);
	@override late final _ShadLocalizationsDatePickerUz datePicker = _ShadLocalizationsDatePickerUz._(_root);
	@override late final _ShadLocalizationsInputUz input = _ShadLocalizationsInputUz._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarUz keyboardToolbar = _ShadLocalizationsKeyboardToolbarUz._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerUz extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerUz._(ShadLocalizationsUz root) : this._root = root, super.internal(root);

	final ShadLocalizationsUz _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Soat';
	@override String get minutes => 'Daqiqa';
	@override String get seconds => 'Soniya';
	@override String get period => 'Davr';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerUz extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerUz._(ShadLocalizationsUz root) : this._root = root, super.internal(root);

	final ShadLocalizationsUz _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Sana tanlang';
}

// Path: input
class _ShadLocalizationsInputUz extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputUz._(ShadLocalizationsUz root) : this._root = root, super.internal(root);

	final ShadLocalizationsUz _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Kesish';
	@override String get copy => 'Nusxa olish';
	@override String get paste => 'Joylashtirish';
	@override String get selectAll => 'Hammasini tanlash';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarUz extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarUz._(ShadLocalizationsUz root) : this._root = root, super.internal(root);

	final ShadLocalizationsUz _root; // ignore: unused_field

	// Translations
	@override String get done => 'Tayyor';
}

/// The flat map containing all translations for locale <uz>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsUz {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Soat',
			'timePicker.minutes' => 'Daqiqa',
			'timePicker.seconds' => 'Soniya',
			'timePicker.period' => 'Davr',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Sana tanlang',
			'input.cut' => 'Kesish',
			'input.copy' => 'Nusxa olish',
			'input.paste' => 'Joylashtirish',
			'input.selectAll' => 'Hammasini tanlash',
			'keyboardToolbar.done' => 'Tayyor',
			_ => null,
		};
	}
}
