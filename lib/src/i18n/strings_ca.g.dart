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
class ShadLocalizationsCa extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsCa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.ca,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ca>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsCa _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsCa $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsCa(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerCa timePicker = _ShadLocalizationsTimePickerCa._(_root);
	@override late final _ShadLocalizationsDatePickerCa datePicker = _ShadLocalizationsDatePickerCa._(_root);
	@override late final _ShadLocalizationsInputCa input = _ShadLocalizationsInputCa._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarCa keyboardToolbar = _ShadLocalizationsKeyboardToolbarCa._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerCa extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerCa._(ShadLocalizationsCa root) : this._root = root, super.internal(root);

	final ShadLocalizationsCa _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Hores';
	@override String get minutes => 'Minuts';
	@override String get seconds => 'Segons';
	@override String get period => 'Període';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerCa extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerCa._(ShadLocalizationsCa root) : this._root = root, super.internal(root);

	final ShadLocalizationsCa _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Selecciona una data';
}

// Path: input
class _ShadLocalizationsInputCa extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputCa._(ShadLocalizationsCa root) : this._root = root, super.internal(root);

	final ShadLocalizationsCa _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Retalla';
	@override String get copy => 'Copia';
	@override String get paste => 'Enganxa';
	@override String get selectAll => 'Selecciona-ho tot';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarCa extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarCa._(ShadLocalizationsCa root) : this._root = root, super.internal(root);

	final ShadLocalizationsCa _root; // ignore: unused_field

	// Translations
	@override String get done => 'Fet';
}

/// The flat map containing all translations for locale <ca>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsCa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Hores',
			'timePicker.minutes' => 'Minuts',
			'timePicker.seconds' => 'Segons',
			'timePicker.period' => 'Període',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Selecciona una data',
			'input.cut' => 'Retalla',
			'input.copy' => 'Copia',
			'input.paste' => 'Enganxa',
			'input.selectAll' => 'Selecciona-ho tot',
			'keyboardToolbar.done' => 'Fet',
			_ => null,
		};
	}
}
