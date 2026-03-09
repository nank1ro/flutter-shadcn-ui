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
class ShadLocalizationsHu extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsHu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.hu,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <hu>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsHu _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsHu $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsHu(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerHu timePicker = _ShadLocalizationsTimePickerHu._(_root);
	@override late final _ShadLocalizationsDatePickerHu datePicker = _ShadLocalizationsDatePickerHu._(_root);
	@override late final _ShadLocalizationsInputHu input = _ShadLocalizationsInputHu._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarHu keyboardToolbar = _ShadLocalizationsKeyboardToolbarHu._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerHu extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerHu._(ShadLocalizationsHu root) : this._root = root, super.internal(root);

	final ShadLocalizationsHu _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Óra';
	@override String get minutes => 'Perc';
	@override String get seconds => 'Másodperc';
	@override String get period => 'Időszak';
	@override String get periodPlaceholder => 'DE';
}

// Path: datePicker
class _ShadLocalizationsDatePickerHu extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerHu._(ShadLocalizationsHu root) : this._root = root, super.internal(root);

	final ShadLocalizationsHu _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Válasszon dátumot';
}

// Path: input
class _ShadLocalizationsInputHu extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputHu._(ShadLocalizationsHu root) : this._root = root, super.internal(root);

	final ShadLocalizationsHu _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Kivágás';
	@override String get copy => 'Másolás';
	@override String get paste => 'Beillesztés';
	@override String get selectAll => 'Összes kijelölése';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarHu extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarHu._(ShadLocalizationsHu root) : this._root = root, super.internal(root);

	final ShadLocalizationsHu _root; // ignore: unused_field

	// Translations
	@override String get done => 'Kész';
}

/// The flat map containing all translations for locale <hu>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsHu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Óra',
			'timePicker.minutes' => 'Perc',
			'timePicker.seconds' => 'Másodperc',
			'timePicker.period' => 'Időszak',
			'timePicker.periodPlaceholder' => 'DE',
			'datePicker.selectDate' => 'Válasszon dátumot',
			'input.cut' => 'Kivágás',
			'input.copy' => 'Másolás',
			'input.paste' => 'Beillesztés',
			'input.selectAll' => 'Összes kijelölése',
			'keyboardToolbar.done' => 'Kész',
			_ => null,
		};
	}
}
