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
class ShadLocalizationsPl extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsPl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.pl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pl>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsPl _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsPl $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsPl(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerPl timePicker = _ShadLocalizationsTimePickerPl._(_root);
	@override late final _ShadLocalizationsDatePickerPl datePicker = _ShadLocalizationsDatePickerPl._(_root);
	@override late final _ShadLocalizationsInputPl input = _ShadLocalizationsInputPl._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarPl keyboardToolbar = _ShadLocalizationsKeyboardToolbarPl._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerPl extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerPl._(ShadLocalizationsPl root) : this._root = root, super.internal(root);

	final ShadLocalizationsPl _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Godziny';
	@override String get minutes => 'Minuty';
	@override String get seconds => 'Sekundy';
	@override String get period => 'Okres';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerPl extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerPl._(ShadLocalizationsPl root) : this._root = root, super.internal(root);

	final ShadLocalizationsPl _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Wybierz datę';
}

// Path: input
class _ShadLocalizationsInputPl extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputPl._(ShadLocalizationsPl root) : this._root = root, super.internal(root);

	final ShadLocalizationsPl _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Wytnij';
	@override String get copy => 'Kopiuj';
	@override String get paste => 'Wklej';
	@override String get selectAll => 'Zaznacz wszystko';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarPl extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarPl._(ShadLocalizationsPl root) : this._root = root, super.internal(root);

	final ShadLocalizationsPl _root; // ignore: unused_field

	// Translations
	@override String get done => 'Gotowe';
}

/// The flat map containing all translations for locale <pl>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsPl {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Godziny',
			'timePicker.minutes' => 'Minuty',
			'timePicker.seconds' => 'Sekundy',
			'timePicker.period' => 'Okres',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Wybierz datę',
			'input.cut' => 'Wytnij',
			'input.copy' => 'Kopiuj',
			'input.paste' => 'Wklej',
			'input.selectAll' => 'Zaznacz wszystko',
			'keyboardToolbar.done' => 'Gotowe',
			_ => null,
		};
	}
}
