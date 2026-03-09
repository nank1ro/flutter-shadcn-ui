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
class ShadLocalizationsDataSw extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataSw({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.sw,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <sw>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataSw _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataSw $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataSw(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerSw timePicker = _ShadLocalizationsDataTimePickerSw._(_root);
	@override late final _ShadLocalizationsDataDatePickerSw datePicker = _ShadLocalizationsDataDatePickerSw._(_root);
	@override late final _ShadLocalizationsDataInputSw input = _ShadLocalizationsDataInputSw._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarSw keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarSw._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerSw extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerSw._(ShadLocalizationsDataSw root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSw _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Masaa';
	@override String get minutes => 'Dakika';
	@override String get seconds => 'Sekunde';
	@override String get period => 'Kipindi';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerSw extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerSw._(ShadLocalizationsDataSw root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSw _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Chagua tarehe';
}

// Path: input
class _ShadLocalizationsDataInputSw extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputSw._(ShadLocalizationsDataSw root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSw _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Kata';
	@override String get copy => 'Nakili';
	@override String get paste => 'Bandika';
	@override String get selectAll => 'Chagua yote';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarSw extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarSw._(ShadLocalizationsDataSw root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSw _root; // ignore: unused_field

	// Translations
	@override String get done => 'Imekamilika';
}

/// The flat map containing all translations for locale <sw>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataSw {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Masaa',
			'timePicker.minutes' => 'Dakika',
			'timePicker.seconds' => 'Sekunde',
			'timePicker.period' => 'Kipindi',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Chagua tarehe',
			'input.cut' => 'Kata',
			'input.copy' => 'Nakili',
			'input.paste' => 'Bandika',
			'input.selectAll' => 'Chagua yote',
			'keyboardToolbar.done' => 'Imekamilika',
			_ => null,
		};
	}
}
