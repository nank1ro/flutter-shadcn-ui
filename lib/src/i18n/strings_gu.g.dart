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
class ShadLocalizationsDataGu extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataGu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.gu,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <gu>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataGu _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataGu $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataGu(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerGu timePicker = _ShadLocalizationsDataTimePickerGu._(_root);
	@override late final _ShadLocalizationsDataDatePickerGu datePicker = _ShadLocalizationsDataDatePickerGu._(_root);
	@override late final _ShadLocalizationsDataInputGu input = _ShadLocalizationsDataInputGu._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarGu keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarGu._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerGu extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerGu._(ShadLocalizationsDataGu root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataGu _root; // ignore: unused_field

	// Translations
	@override String get hours => 'કલાક';
	@override String get minutes => 'મિનિટ';
	@override String get seconds => 'સેકન્ડ';
	@override String get period => 'સમયગાળો';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerGu extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerGu._(ShadLocalizationsDataGu root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataGu _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'તારીખ પસંદ કરો';
}

// Path: input
class _ShadLocalizationsDataInputGu extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputGu._(ShadLocalizationsDataGu root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataGu _root; // ignore: unused_field

	// Translations
	@override String get cut => 'કાપો';
	@override String get copy => 'કૉપિ કરો';
	@override String get paste => 'પેસ્ટ કરો';
	@override String get selectAll => 'બધું પસંદ કરો';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarGu extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarGu._(ShadLocalizationsDataGu root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataGu _root; // ignore: unused_field

	// Translations
	@override String get done => 'થઈ ગયું';
}

/// The flat map containing all translations for locale <gu>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataGu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'કલાક',
			'timePicker.minutes' => 'મિનિટ',
			'timePicker.seconds' => 'સેકન્ડ',
			'timePicker.period' => 'સમયગાળો',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'તારીખ પસંદ કરો',
			'input.cut' => 'કાપો',
			'input.copy' => 'કૉપિ કરો',
			'input.paste' => 'પેસ્ટ કરો',
			'input.selectAll' => 'બધું પસંદ કરો',
			'keyboardToolbar.done' => 'થઈ ગયું',
			_ => null,
		};
	}
}
