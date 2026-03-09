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
class ShadLocalizationsTh extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsTh({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.th,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <th>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsTh _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsTh $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsTh(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerTh timePicker = _ShadLocalizationsTimePickerTh._(_root);
	@override late final _ShadLocalizationsDatePickerTh datePicker = _ShadLocalizationsDatePickerTh._(_root);
	@override late final _ShadLocalizationsInputTh input = _ShadLocalizationsInputTh._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarTh keyboardToolbar = _ShadLocalizationsKeyboardToolbarTh._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerTh extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerTh._(ShadLocalizationsTh root) : this._root = root, super.internal(root);

	final ShadLocalizationsTh _root; // ignore: unused_field

	// Translations
	@override String get hours => 'ชั่วโมง';
	@override String get minutes => 'นาที';
	@override String get seconds => 'วินาที';
	@override String get period => 'ช่วงเวลา';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerTh extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerTh._(ShadLocalizationsTh root) : this._root = root, super.internal(root);

	final ShadLocalizationsTh _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'เลือกวันที่';
}

// Path: input
class _ShadLocalizationsInputTh extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputTh._(ShadLocalizationsTh root) : this._root = root, super.internal(root);

	final ShadLocalizationsTh _root; // ignore: unused_field

	// Translations
	@override String get cut => 'ตัด';
	@override String get copy => 'คัดลอก';
	@override String get paste => 'วาง';
	@override String get selectAll => 'เลือกทั้งหมด';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarTh extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarTh._(ShadLocalizationsTh root) : this._root = root, super.internal(root);

	final ShadLocalizationsTh _root; // ignore: unused_field

	// Translations
	@override String get done => 'เสร็จสิ้น';
}

/// The flat map containing all translations for locale <th>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsTh {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'ชั่วโมง',
			'timePicker.minutes' => 'นาที',
			'timePicker.seconds' => 'วินาที',
			'timePicker.period' => 'ช่วงเวลา',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'เลือกวันที่',
			'input.cut' => 'ตัด',
			'input.copy' => 'คัดลอก',
			'input.paste' => 'วาง',
			'input.selectAll' => 'เลือกทั้งหมด',
			'keyboardToolbar.done' => 'เสร็จสิ้น',
			_ => null,
		};
	}
}
