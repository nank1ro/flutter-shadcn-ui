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
class ShadLocalizationsDataHi extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataHi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.hi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <hi>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataHi _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataHi $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataHi(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerHi timePicker = _ShadLocalizationsDataTimePickerHi._(_root);
	@override late final _ShadLocalizationsDataDatePickerHi datePicker = _ShadLocalizationsDataDatePickerHi._(_root);
	@override late final _ShadLocalizationsDataInputHi input = _ShadLocalizationsDataInputHi._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarHi keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarHi._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerHi extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerHi._(ShadLocalizationsDataHi root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataHi _root; // ignore: unused_field

	// Translations
	@override String get hours => 'घंटे';
	@override String get minutes => 'मिनट';
	@override String get seconds => 'सेकंड';
	@override String get period => 'अवधि';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerHi extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerHi._(ShadLocalizationsDataHi root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataHi _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'तारीख चुनें';
}

// Path: input
class _ShadLocalizationsDataInputHi extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputHi._(ShadLocalizationsDataHi root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataHi _root; // ignore: unused_field

	// Translations
	@override String get cut => 'काटें';
	@override String get copy => 'कॉपी करें';
	@override String get paste => 'पेस्ट करें';
	@override String get selectAll => 'सभी चुनें';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarHi extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarHi._(ShadLocalizationsDataHi root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataHi _root; // ignore: unused_field

	// Translations
	@override String get done => 'हो गया';
}

/// The flat map containing all translations for locale <hi>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataHi {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'घंटे',
			'timePicker.minutes' => 'मिनट',
			'timePicker.seconds' => 'सेकंड',
			'timePicker.period' => 'अवधि',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'तारीख चुनें',
			'input.cut' => 'काटें',
			'input.copy' => 'कॉपी करें',
			'input.paste' => 'पेस्ट करें',
			'input.selectAll' => 'सभी चुनें',
			'keyboardToolbar.done' => 'हो गया',
			_ => null,
		};
	}
}
