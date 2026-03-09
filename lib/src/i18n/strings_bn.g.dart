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
class ShadLocalizationsBn extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsBn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.bn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <bn>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsBn _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsBn $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsBn(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerBn timePicker = _ShadLocalizationsTimePickerBn._(_root);
	@override late final _ShadLocalizationsDatePickerBn datePicker = _ShadLocalizationsDatePickerBn._(_root);
	@override late final _ShadLocalizationsInputBn input = _ShadLocalizationsInputBn._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarBn keyboardToolbar = _ShadLocalizationsKeyboardToolbarBn._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerBn extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerBn._(ShadLocalizationsBn root) : this._root = root, super.internal(root);

	final ShadLocalizationsBn _root; // ignore: unused_field

	// Translations
	@override String get hours => 'ঘণ্টা';
	@override String get minutes => 'মিনিট';
	@override String get seconds => 'সেকেন্ড';
	@override String get period => 'সময়কাল';
	@override String get periodPlaceholder => 'পূর্বাহ্ন';
}

// Path: datePicker
class _ShadLocalizationsDatePickerBn extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerBn._(ShadLocalizationsBn root) : this._root = root, super.internal(root);

	final ShadLocalizationsBn _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'তারিখ বেছে নিন';
}

// Path: input
class _ShadLocalizationsInputBn extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputBn._(ShadLocalizationsBn root) : this._root = root, super.internal(root);

	final ShadLocalizationsBn _root; // ignore: unused_field

	// Translations
	@override String get cut => 'কাট';
	@override String get copy => 'কপি';
	@override String get paste => 'পেস্ট';
	@override String get selectAll => 'সব নির্বাচন করুন';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarBn extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarBn._(ShadLocalizationsBn root) : this._root = root, super.internal(root);

	final ShadLocalizationsBn _root; // ignore: unused_field

	// Translations
	@override String get done => 'সম্পন্ন';
}

/// The flat map containing all translations for locale <bn>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsBn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'ঘণ্টা',
			'timePicker.minutes' => 'মিনিট',
			'timePicker.seconds' => 'সেকেন্ড',
			'timePicker.period' => 'সময়কাল',
			'timePicker.periodPlaceholder' => 'পূর্বাহ্ন',
			'datePicker.selectDate' => 'তারিখ বেছে নিন',
			'input.cut' => 'কাট',
			'input.copy' => 'কপি',
			'input.paste' => 'পেস্ট',
			'input.selectAll' => 'সব নির্বাচন করুন',
			'keyboardToolbar.done' => 'সম্পন্ন',
			_ => null,
		};
	}
}
