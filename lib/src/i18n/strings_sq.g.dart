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
class ShadLocalizationsDataSq extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataSq({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.sq,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <sq>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataSq _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataSq $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataSq(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerSq timePicker = _ShadLocalizationsDataTimePickerSq._(_root);
	@override late final _ShadLocalizationsDataDatePickerSq datePicker = _ShadLocalizationsDataDatePickerSq._(_root);
	@override late final _ShadLocalizationsDataInputSq input = _ShadLocalizationsDataInputSq._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarSq keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarSq._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerSq extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerSq._(ShadLocalizationsDataSq root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSq _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Orët';
	@override String get minutes => 'Minutat';
	@override String get seconds => 'Sekondat';
	@override String get period => 'Periudha';
	@override String get periodPlaceholder => 'PD';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerSq extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerSq._(ShadLocalizationsDataSq root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSq _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Zgjidh datën';
}

// Path: input
class _ShadLocalizationsDataInputSq extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputSq._(ShadLocalizationsDataSq root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSq _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Prit';
	@override String get copy => 'Kopjo';
	@override String get paste => 'Ngjit';
	@override String get selectAll => 'Zgjidh të gjitha';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarSq extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarSq._(ShadLocalizationsDataSq root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSq _root; // ignore: unused_field

	// Translations
	@override String get done => 'U krye';
}

/// The flat map containing all translations for locale <sq>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataSq {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Orët',
			'timePicker.minutes' => 'Minutat',
			'timePicker.seconds' => 'Sekondat',
			'timePicker.period' => 'Periudha',
			'timePicker.periodPlaceholder' => 'PD',
			'datePicker.selectDate' => 'Zgjidh datën',
			'input.cut' => 'Prit',
			'input.copy' => 'Kopjo',
			'input.paste' => 'Ngjit',
			'input.selectAll' => 'Zgjidh të gjitha',
			'keyboardToolbar.done' => 'U krye',
			_ => null,
		};
	}
}
