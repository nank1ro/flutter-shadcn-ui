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
class ShadLocalizationsAr extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
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
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsAr _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsAr $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsAr(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerAr timePicker = _ShadLocalizationsTimePickerAr._(_root);
	@override late final _ShadLocalizationsDatePickerAr datePicker = _ShadLocalizationsDatePickerAr._(_root);
	@override late final _ShadLocalizationsInputAr input = _ShadLocalizationsInputAr._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarAr keyboardToolbar = _ShadLocalizationsKeyboardToolbarAr._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerAr extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerAr._(ShadLocalizationsAr root) : this._root = root, super.internal(root);

	final ShadLocalizationsAr _root; // ignore: unused_field

	// Translations
	@override String get hours => 'ساعات';
	@override String get minutes => 'دقائق';
	@override String get seconds => 'ثواني';
	@override String get period => 'الفترة';
	@override String get periodPlaceholder => 'ص';
}

// Path: datePicker
class _ShadLocalizationsDatePickerAr extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerAr._(ShadLocalizationsAr root) : this._root = root, super.internal(root);

	final ShadLocalizationsAr _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'اختر تاريخاً';
}

// Path: input
class _ShadLocalizationsInputAr extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputAr._(ShadLocalizationsAr root) : this._root = root, super.internal(root);

	final ShadLocalizationsAr _root; // ignore: unused_field

	// Translations
	@override String get cut => 'قص';
	@override String get copy => 'نسخ';
	@override String get paste => 'لصق';
	@override String get selectAll => 'تحديد الكل';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarAr extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarAr._(ShadLocalizationsAr root) : this._root = root, super.internal(root);

	final ShadLocalizationsAr _root; // ignore: unused_field

	// Translations
	@override String get done => 'تم';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsAr {
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
