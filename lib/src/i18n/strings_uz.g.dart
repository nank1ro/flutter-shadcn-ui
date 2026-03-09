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
class ShadLocalizationsDataUz extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataUz({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
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
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataUz _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataUz $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataUz(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerUz timePicker = _ShadLocalizationsDataTimePickerUz._(_root);
	@override late final _ShadLocalizationsDataDatePickerUz datePicker = _ShadLocalizationsDataDatePickerUz._(_root);
	@override late final _ShadLocalizationsDataInputUz input = _ShadLocalizationsDataInputUz._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarUz keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarUz._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerUz extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerUz._(ShadLocalizationsDataUz root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataUz _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Soat';
	@override String get minutes => 'Daqiqa';
	@override String get seconds => 'Soniya';
	@override String get period => 'Davr';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerUz extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerUz._(ShadLocalizationsDataUz root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataUz _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Sana tanlang';
}

// Path: input
class _ShadLocalizationsDataInputUz extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputUz._(ShadLocalizationsDataUz root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataUz _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Kesish';
	@override String get copy => 'Nusxa olish';
	@override String get paste => 'Joylashtirish';
	@override String get selectAll => 'Hammasini tanlash';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarUz extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarUz._(ShadLocalizationsDataUz root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataUz _root; // ignore: unused_field

	// Translations
	@override String get done => 'Tayyor';
}

/// The flat map containing all translations for locale <uz>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataUz {
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
