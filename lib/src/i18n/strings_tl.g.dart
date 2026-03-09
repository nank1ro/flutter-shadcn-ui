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
class ShadLocalizationsTl extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsTl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.tl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <tl>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsTl _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsTl $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsTl(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerTl timePicker = _ShadLocalizationsTimePickerTl._(_root);
	@override late final _ShadLocalizationsDatePickerTl datePicker = _ShadLocalizationsDatePickerTl._(_root);
	@override late final _ShadLocalizationsInputTl input = _ShadLocalizationsInputTl._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarTl keyboardToolbar = _ShadLocalizationsKeyboardToolbarTl._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerTl extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerTl._(ShadLocalizationsTl root) : this._root = root, super.internal(root);

	final ShadLocalizationsTl _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Oras';
	@override String get minutes => 'Minuto';
	@override String get seconds => 'Segundo';
	@override String get period => 'Panahon';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerTl extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerTl._(ShadLocalizationsTl root) : this._root = root, super.internal(root);

	final ShadLocalizationsTl _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Pumili ng petsa';
}

// Path: input
class _ShadLocalizationsInputTl extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputTl._(ShadLocalizationsTl root) : this._root = root, super.internal(root);

	final ShadLocalizationsTl _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Gupitin';
	@override String get copy => 'Kopyahin';
	@override String get paste => 'I-paste';
	@override String get selectAll => 'Piliin lahat';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarTl extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarTl._(ShadLocalizationsTl root) : this._root = root, super.internal(root);

	final ShadLocalizationsTl _root; // ignore: unused_field

	// Translations
	@override String get done => 'Tapos na';
}

/// The flat map containing all translations for locale <tl>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsTl {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Oras',
			'timePicker.minutes' => 'Minuto',
			'timePicker.seconds' => 'Segundo',
			'timePicker.period' => 'Panahon',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Pumili ng petsa',
			'input.cut' => 'Gupitin',
			'input.copy' => 'Kopyahin',
			'input.paste' => 'I-paste',
			'input.selectAll' => 'Piliin lahat',
			'keyboardToolbar.done' => 'Tapos na',
			_ => null,
		};
	}
}
