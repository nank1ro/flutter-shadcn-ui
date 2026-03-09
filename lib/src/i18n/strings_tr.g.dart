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
class ShadLocalizationsDataTr extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataTr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.tr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <tr>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataTr _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataTr $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataTr(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerTr timePicker = _ShadLocalizationsDataTimePickerTr._(_root);
	@override late final _ShadLocalizationsDataDatePickerTr datePicker = _ShadLocalizationsDataDatePickerTr._(_root);
	@override late final _ShadLocalizationsDataInputTr input = _ShadLocalizationsDataInputTr._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarTr keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarTr._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerTr extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerTr._(ShadLocalizationsDataTr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataTr _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Saat';
	@override String get minutes => 'Dakika';
	@override String get seconds => 'Saniye';
	@override String get period => 'Dönem';
	@override String get periodPlaceholder => 'ÖÖ';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerTr extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerTr._(ShadLocalizationsDataTr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataTr _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Tarih seçin';
}

// Path: input
class _ShadLocalizationsDataInputTr extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputTr._(ShadLocalizationsDataTr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataTr _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Kes';
	@override String get copy => 'Kopyala';
	@override String get paste => 'Yapıştır';
	@override String get selectAll => 'Tümünü seç';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarTr extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarTr._(ShadLocalizationsDataTr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataTr _root; // ignore: unused_field

	// Translations
	@override String get done => 'Tamam';
}

/// The flat map containing all translations for locale <tr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataTr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Saat',
			'timePicker.minutes' => 'Dakika',
			'timePicker.seconds' => 'Saniye',
			'timePicker.period' => 'Dönem',
			'timePicker.periodPlaceholder' => 'ÖÖ',
			'datePicker.selectDate' => 'Tarih seçin',
			'input.cut' => 'Kes',
			'input.copy' => 'Kopyala',
			'input.paste' => 'Yapıştır',
			'input.selectAll' => 'Tümünü seç',
			'keyboardToolbar.done' => 'Tamam',
			_ => null,
		};
	}
}
