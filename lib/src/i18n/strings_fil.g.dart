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
class ShadLocalizationsFil extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsFil({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.fil,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fil>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsFil _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsFil $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsFil(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerFil timePicker = _ShadLocalizationsTimePickerFil._(_root);
	@override late final _ShadLocalizationsDatePickerFil datePicker = _ShadLocalizationsDatePickerFil._(_root);
	@override late final _ShadLocalizationsInputFil input = _ShadLocalizationsInputFil._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarFil keyboardToolbar = _ShadLocalizationsKeyboardToolbarFil._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerFil extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerFil._(ShadLocalizationsFil root) : this._root = root, super.internal(root);

	final ShadLocalizationsFil _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Oras';
	@override String get minutes => 'Minuto';
	@override String get seconds => 'Segundo';
	@override String get period => 'Panahon';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerFil extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerFil._(ShadLocalizationsFil root) : this._root = root, super.internal(root);

	final ShadLocalizationsFil _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Pumili ng petsa';
}

// Path: input
class _ShadLocalizationsInputFil extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputFil._(ShadLocalizationsFil root) : this._root = root, super.internal(root);

	final ShadLocalizationsFil _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Gupitin';
	@override String get copy => 'Kopyahin';
	@override String get paste => 'I-paste';
	@override String get selectAll => 'Piliin lahat';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarFil extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarFil._(ShadLocalizationsFil root) : this._root = root, super.internal(root);

	final ShadLocalizationsFil _root; // ignore: unused_field

	// Translations
	@override String get done => 'Tapos';
}

/// The flat map containing all translations for locale <fil>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsFil {
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
			'keyboardToolbar.done' => 'Tapos',
			_ => null,
		};
	}
}
