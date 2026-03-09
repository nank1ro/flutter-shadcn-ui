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
class ShadLocalizationsAz extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsAz({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.az,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <az>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsAz _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsAz $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsAz(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerAz timePicker = _ShadLocalizationsTimePickerAz._(_root);
	@override late final _ShadLocalizationsDatePickerAz datePicker = _ShadLocalizationsDatePickerAz._(_root);
	@override late final _ShadLocalizationsInputAz input = _ShadLocalizationsInputAz._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarAz keyboardToolbar = _ShadLocalizationsKeyboardToolbarAz._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerAz extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerAz._(ShadLocalizationsAz root) : this._root = root, super.internal(root);

	final ShadLocalizationsAz _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Saat';
	@override String get minutes => 'Dəqiqə';
	@override String get seconds => 'Saniyə';
	@override String get period => 'Dövr';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerAz extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerAz._(ShadLocalizationsAz root) : this._root = root, super.internal(root);

	final ShadLocalizationsAz _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Tarix seçin';
}

// Path: input
class _ShadLocalizationsInputAz extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputAz._(ShadLocalizationsAz root) : this._root = root, super.internal(root);

	final ShadLocalizationsAz _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Kəs';
	@override String get copy => 'Kopyala';
	@override String get paste => 'Yapışdır';
	@override String get selectAll => 'Hamısını seç';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarAz extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarAz._(ShadLocalizationsAz root) : this._root = root, super.internal(root);

	final ShadLocalizationsAz _root; // ignore: unused_field

	// Translations
	@override String get done => 'Hazır';
}

/// The flat map containing all translations for locale <az>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsAz {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Saat',
			'timePicker.minutes' => 'Dəqiqə',
			'timePicker.seconds' => 'Saniyə',
			'timePicker.period' => 'Dövr',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Tarix seçin',
			'input.cut' => 'Kəs',
			'input.copy' => 'Kopyala',
			'input.paste' => 'Yapışdır',
			'input.selectAll' => 'Hamısını seç',
			'keyboardToolbar.done' => 'Hazır',
			_ => null,
		};
	}
}
