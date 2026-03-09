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
class ShadLocalizationsDataSr extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataSr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.sr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <sr>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataSr _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataSr $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataSr(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerSr timePicker = _ShadLocalizationsDataTimePickerSr._(_root);
	@override late final _ShadLocalizationsDataDatePickerSr datePicker = _ShadLocalizationsDataDatePickerSr._(_root);
	@override late final _ShadLocalizationsDataInputSr input = _ShadLocalizationsDataInputSr._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarSr keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarSr._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerSr extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerSr._(ShadLocalizationsDataSr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSr _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Sati';
	@override String get minutes => 'Minuti';
	@override String get seconds => 'Sekunde';
	@override String get period => 'Period';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerSr extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerSr._(ShadLocalizationsDataSr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSr _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Izaberi datum';
}

// Path: input
class _ShadLocalizationsDataInputSr extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputSr._(ShadLocalizationsDataSr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSr _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Iseci';
	@override String get copy => 'Kopiraj';
	@override String get paste => 'Nalepi';
	@override String get selectAll => 'Izaberi sve';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarSr extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarSr._(ShadLocalizationsDataSr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSr _root; // ignore: unused_field

	// Translations
	@override String get done => 'Gotovo';
}

/// The flat map containing all translations for locale <sr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataSr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Sati',
			'timePicker.minutes' => 'Minuti',
			'timePicker.seconds' => 'Sekunde',
			'timePicker.period' => 'Period',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Izaberi datum',
			'input.cut' => 'Iseci',
			'input.copy' => 'Kopiraj',
			'input.paste' => 'Nalepi',
			'input.selectAll' => 'Izaberi sve',
			'keyboardToolbar.done' => 'Gotovo',
			_ => null,
		};
	}
}
