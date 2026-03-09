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
class ShadLocalizationsDataTh extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataTh({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
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
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataTh _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataTh $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataTh(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerTh timePicker = _ShadLocalizationsDataTimePickerTh._(_root);
	@override late final _ShadLocalizationsDataDatePickerTh datePicker = _ShadLocalizationsDataDatePickerTh._(_root);
	@override late final _ShadLocalizationsDataInputTh input = _ShadLocalizationsDataInputTh._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarTh keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarTh._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerTh extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerTh._(ShadLocalizationsDataTh root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataTh _root; // ignore: unused_field

	// Translations
	@override String get hours => 'ชั่วโมง';
	@override String get minutes => 'นาที';
	@override String get seconds => 'วินาที';
	@override String get period => 'ช่วงเวลา';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerTh extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerTh._(ShadLocalizationsDataTh root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataTh _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'เลือกวันที่';
}

// Path: input
class _ShadLocalizationsDataInputTh extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputTh._(ShadLocalizationsDataTh root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataTh _root; // ignore: unused_field

	// Translations
	@override String get cut => 'ตัด';
	@override String get copy => 'คัดลอก';
	@override String get paste => 'วาง';
	@override String get selectAll => 'เลือกทั้งหมด';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarTh extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarTh._(ShadLocalizationsDataTh root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataTh _root; // ignore: unused_field

	// Translations
	@override String get done => 'เสร็จสิ้น';
}

/// The flat map containing all translations for locale <th>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataTh {
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
