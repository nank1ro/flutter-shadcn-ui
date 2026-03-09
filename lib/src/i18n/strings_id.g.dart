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
class ShadLocalizationsDataId extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataId({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.id,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <id>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataId _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataId $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataId(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerId timePicker = _ShadLocalizationsDataTimePickerId._(_root);
	@override late final _ShadLocalizationsDataDatePickerId datePicker = _ShadLocalizationsDataDatePickerId._(_root);
	@override late final _ShadLocalizationsDataInputId input = _ShadLocalizationsDataInputId._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarId keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarId._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerId extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerId._(ShadLocalizationsDataId root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataId _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Jam';
	@override String get minutes => 'Menit';
	@override String get seconds => 'Detik';
	@override String get period => 'Periode';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerId extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerId._(ShadLocalizationsDataId root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataId _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Pilih tanggal';
}

// Path: input
class _ShadLocalizationsDataInputId extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputId._(ShadLocalizationsDataId root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataId _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Potong';
	@override String get copy => 'Salin';
	@override String get paste => 'Tempel';
	@override String get selectAll => 'Pilih Semua';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarId extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarId._(ShadLocalizationsDataId root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataId _root; // ignore: unused_field

	// Translations
	@override String get done => 'Selesai';
}

/// The flat map containing all translations for locale <id>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataId {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Jam',
			'timePicker.minutes' => 'Menit',
			'timePicker.seconds' => 'Detik',
			'timePicker.period' => 'Periode',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Pilih tanggal',
			'input.cut' => 'Potong',
			'input.copy' => 'Salin',
			'input.paste' => 'Tempel',
			'input.selectAll' => 'Pilih Semua',
			'keyboardToolbar.done' => 'Selesai',
			_ => null,
		};
	}
}
