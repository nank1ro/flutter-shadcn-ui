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
class ShadLocalizationsHi extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsHi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
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
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsHi _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsHi $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsHi(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerHi timePicker = _ShadLocalizationsTimePickerHi._(_root);
	@override late final _ShadLocalizationsDatePickerHi datePicker = _ShadLocalizationsDatePickerHi._(_root);
	@override late final _ShadLocalizationsInputHi input = _ShadLocalizationsInputHi._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarHi keyboardToolbar = _ShadLocalizationsKeyboardToolbarHi._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerHi extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerHi._(ShadLocalizationsHi root) : this._root = root, super.internal(root);

	final ShadLocalizationsHi _root; // ignore: unused_field

	// Translations
	@override String get hours => 'घंटे';
	@override String get minutes => 'मिनट';
	@override String get seconds => 'सेकंड';
	@override String get period => 'अवधि';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerHi extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerHi._(ShadLocalizationsHi root) : this._root = root, super.internal(root);

	final ShadLocalizationsHi _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'तारीख चुनें';
}

// Path: input
class _ShadLocalizationsInputHi extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputHi._(ShadLocalizationsHi root) : this._root = root, super.internal(root);

	final ShadLocalizationsHi _root; // ignore: unused_field

	// Translations
	@override String get cut => 'काटें';
	@override String get copy => 'कॉपी करें';
	@override String get paste => 'पेस्ट करें';
	@override String get selectAll => 'सभी चुनें';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarHi extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarHi._(ShadLocalizationsHi root) : this._root = root, super.internal(root);

	final ShadLocalizationsHi _root; // ignore: unused_field

	// Translations
	@override String get done => 'हो गया';
}

/// The flat map containing all translations for locale <hi>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsHi {
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
