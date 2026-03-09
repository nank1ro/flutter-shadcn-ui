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
class ShadLocalizationsAs extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsAs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.as,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <as>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsAs _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsAs $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsAs(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerAs timePicker = _ShadLocalizationsTimePickerAs._(_root);
	@override late final _ShadLocalizationsDatePickerAs datePicker = _ShadLocalizationsDatePickerAs._(_root);
	@override late final _ShadLocalizationsInputAs input = _ShadLocalizationsInputAs._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarAs keyboardToolbar = _ShadLocalizationsKeyboardToolbarAs._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerAs extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerAs._(ShadLocalizationsAs root) : this._root = root, super.internal(root);

	final ShadLocalizationsAs _root; // ignore: unused_field

	// Translations
	@override String get hours => 'ঘণ্টা';
	@override String get minutes => 'মিনিট';
	@override String get seconds => 'ছেকেণ্ড';
	@override String get period => 'সময়কাল';
	@override String get periodPlaceholder => 'পূৰ্বাহ্ন';
}

// Path: datePicker
class _ShadLocalizationsDatePickerAs extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerAs._(ShadLocalizationsAs root) : this._root = root, super.internal(root);

	final ShadLocalizationsAs _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'তাৰিখ বাছক';
}

// Path: input
class _ShadLocalizationsInputAs extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputAs._(ShadLocalizationsAs root) : this._root = root, super.internal(root);

	final ShadLocalizationsAs _root; // ignore: unused_field

	// Translations
	@override String get cut => 'কাট';
	@override String get copy => 'কপি';
	@override String get paste => 'পেষ্ট';
	@override String get selectAll => 'সকলো বাছক';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarAs extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarAs._(ShadLocalizationsAs root) : this._root = root, super.internal(root);

	final ShadLocalizationsAs _root; // ignore: unused_field

	// Translations
	@override String get done => 'সম্পন্ন';
}

/// The flat map containing all translations for locale <as>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsAs {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'ঘণ্টা',
			'timePicker.minutes' => 'মিনিট',
			'timePicker.seconds' => 'ছেকেণ্ড',
			'timePicker.period' => 'সময়কাল',
			'timePicker.periodPlaceholder' => 'পূৰ্বাহ্ন',
			'datePicker.selectDate' => 'তাৰিখ বাছক',
			'input.cut' => 'কাট',
			'input.copy' => 'কপি',
			'input.paste' => 'পেষ্ট',
			'input.selectAll' => 'সকলো বাছক',
			'keyboardToolbar.done' => 'সম্পন্ন',
			_ => null,
		};
	}
}
