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
class ShadLocalizationsDataAr extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataAr _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataAr $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataAr(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerAr timePicker = _ShadLocalizationsDataTimePickerAr._(_root);
	@override late final _ShadLocalizationsDataDatePickerAr datePicker = _ShadLocalizationsDataDatePickerAr._(_root);
	@override late final _ShadLocalizationsDataInputAr input = _ShadLocalizationsDataInputAr._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarAr keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarAr._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerAr extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerAr._(ShadLocalizationsDataAr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataAr _root; // ignore: unused_field

	// Translations
	@override String get hours => 'ساعات';
	@override String get minutes => 'دقائق';
	@override String get seconds => 'ثواني';
	@override String get period => 'الفترة';
	@override String get periodPlaceholder => 'ص';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerAr extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerAr._(ShadLocalizationsDataAr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataAr _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'اختر تاريخاً';
}

// Path: input
class _ShadLocalizationsDataInputAr extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputAr._(ShadLocalizationsDataAr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataAr _root; // ignore: unused_field

	// Translations
	@override String get cut => 'قص';
	@override String get copy => 'نسخ';
	@override String get paste => 'لصق';
	@override String get selectAll => 'تحديد الكل';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarAr extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarAr._(ShadLocalizationsDataAr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataAr _root; // ignore: unused_field

	// Translations
	@override String get done => 'تم';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataAr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'ساعات',
			'timePicker.minutes' => 'دقائق',
			'timePicker.seconds' => 'ثواني',
			'timePicker.period' => 'الفترة',
			'timePicker.periodPlaceholder' => 'ص',
			'datePicker.selectDate' => 'اختر تاريخاً',
			'input.cut' => 'قص',
			'input.copy' => 'نسخ',
			'input.paste' => 'لصق',
			'input.selectAll' => 'تحديد الكل',
			'keyboardToolbar.done' => 'تم',
			_ => null,
		};
	}
}
