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
class ShadLocalizationsDataAz extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataAz({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.az,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <az>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataAz _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataAz $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataAz(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerAz timePicker = _ShadLocalizationsDataTimePickerAz._(_root);
	@override late final _ShadLocalizationsDataDatePickerAz datePicker = _ShadLocalizationsDataDatePickerAz._(_root);
	@override late final _ShadLocalizationsDataInputAz input = _ShadLocalizationsDataInputAz._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarAz keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarAz._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerAz extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerAz._(ShadLocalizationsDataAz root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataAz _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Saat';
	@override String get minutes => 'Dəqiqə';
	@override String get seconds => 'Saniyə';
	@override String get period => 'Dövr';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerAz extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerAz._(ShadLocalizationsDataAz root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataAz _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Tarix seçin';
}

// Path: input
class _ShadLocalizationsDataInputAz extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputAz._(ShadLocalizationsDataAz root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataAz _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Kəs';
	@override String get copy => 'Kopyala';
	@override String get paste => 'Yapışdır';
	@override String get selectAll => 'Hamısını seç';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarAz extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarAz._(ShadLocalizationsDataAz root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataAz _root; // ignore: unused_field

	// Translations
	@override String get done => 'Hazır';
}

/// The flat map containing all translations for locale <az>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataAz {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Saat',
			'timePicker.minutes' => 'Dəqiqə',
			'timePicker.seconds' => 'Saniyə',
			'timePicker.period' => 'Dövr',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Tarix seçin',
			'input.cut' => 'Kəs',
			'input.copy' => 'Kopyala',
			'input.paste' => 'Yapışdır',
			'input.selectAll' => 'Hamısını seç',
			'keyboardToolbar.done' => 'Hazır',
			_ => null,
		};
	}
}
