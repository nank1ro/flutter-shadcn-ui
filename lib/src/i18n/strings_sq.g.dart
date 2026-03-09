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
class ShadLocalizationsSq extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsSq({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.sq,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <sq>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsSq _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsSq $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsSq(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerSq timePicker = _ShadLocalizationsTimePickerSq._(_root);
	@override late final _ShadLocalizationsDatePickerSq datePicker = _ShadLocalizationsDatePickerSq._(_root);
	@override late final _ShadLocalizationsInputSq input = _ShadLocalizationsInputSq._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarSq keyboardToolbar = _ShadLocalizationsKeyboardToolbarSq._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerSq extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerSq._(ShadLocalizationsSq root) : this._root = root, super.internal(root);

	final ShadLocalizationsSq _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Orët';
	@override String get minutes => 'Minutat';
	@override String get seconds => 'Sekondat';
	@override String get period => 'Periudha';
	@override String get periodPlaceholder => 'PD';
}

// Path: datePicker
class _ShadLocalizationsDatePickerSq extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerSq._(ShadLocalizationsSq root) : this._root = root, super.internal(root);

	final ShadLocalizationsSq _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Zgjidh datën';
}

// Path: input
class _ShadLocalizationsInputSq extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputSq._(ShadLocalizationsSq root) : this._root = root, super.internal(root);

	final ShadLocalizationsSq _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Prit';
	@override String get copy => 'Kopjo';
	@override String get paste => 'Ngjit';
	@override String get selectAll => 'Zgjidh të gjitha';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarSq extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarSq._(ShadLocalizationsSq root) : this._root = root, super.internal(root);

	final ShadLocalizationsSq _root; // ignore: unused_field

	// Translations
	@override String get done => 'U krye';
}

/// The flat map containing all translations for locale <sq>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsSq {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Orët',
			'timePicker.minutes' => 'Minutat',
			'timePicker.seconds' => 'Sekondat',
			'timePicker.period' => 'Periudha',
			'timePicker.periodPlaceholder' => 'PD',
			'datePicker.selectDate' => 'Zgjidh datën',
			'input.cut' => 'Prit',
			'input.copy' => 'Kopjo',
			'input.paste' => 'Ngjit',
			'input.selectAll' => 'Zgjidh të gjitha',
			'keyboardToolbar.done' => 'U krye',
			_ => null,
		};
	}
}
