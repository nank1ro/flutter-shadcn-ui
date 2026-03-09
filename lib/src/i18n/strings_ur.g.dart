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
class ShadLocalizationsUr extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsUr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.ur,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ur>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsUr _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsUr $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsUr(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerUr timePicker = _ShadLocalizationsTimePickerUr._(_root);
	@override late final _ShadLocalizationsDatePickerUr datePicker = _ShadLocalizationsDatePickerUr._(_root);
	@override late final _ShadLocalizationsInputUr input = _ShadLocalizationsInputUr._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarUr keyboardToolbar = _ShadLocalizationsKeyboardToolbarUr._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerUr extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerUr._(ShadLocalizationsUr root) : this._root = root, super.internal(root);

	final ShadLocalizationsUr _root; // ignore: unused_field

	// Translations
	@override String get hours => 'گھنٹے';
	@override String get minutes => 'منٹ';
	@override String get seconds => 'سیکنڈ';
	@override String get period => 'وقت';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerUr extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerUr._(ShadLocalizationsUr root) : this._root = root, super.internal(root);

	final ShadLocalizationsUr _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'تاریخ منتخب کریں';
}

// Path: input
class _ShadLocalizationsInputUr extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputUr._(ShadLocalizationsUr root) : this._root = root, super.internal(root);

	final ShadLocalizationsUr _root; // ignore: unused_field

	// Translations
	@override String get cut => 'کاٹیں';
	@override String get copy => 'کاپی کریں';
	@override String get paste => 'چسپاں کریں';
	@override String get selectAll => 'سب منتخب کریں';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarUr extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarUr._(ShadLocalizationsUr root) : this._root = root, super.internal(root);

	final ShadLocalizationsUr _root; // ignore: unused_field

	// Translations
	@override String get done => 'ہو گیا';
}

/// The flat map containing all translations for locale <ur>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsUr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'گھنٹے',
			'timePicker.minutes' => 'منٹ',
			'timePicker.seconds' => 'سیکنڈ',
			'timePicker.period' => 'وقت',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'تاریخ منتخب کریں',
			'input.cut' => 'کاٹیں',
			'input.copy' => 'کاپی کریں',
			'input.paste' => 'چسپاں کریں',
			'input.selectAll' => 'سب منتخب کریں',
			'keyboardToolbar.done' => 'ہو گیا',
			_ => null,
		};
	}
}
