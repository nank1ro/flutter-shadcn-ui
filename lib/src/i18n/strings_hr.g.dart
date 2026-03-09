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
class ShadLocalizationsHr extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsHr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.hr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <hr>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsHr _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsHr $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsHr(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerHr timePicker = _ShadLocalizationsTimePickerHr._(_root);
	@override late final _ShadLocalizationsDatePickerHr datePicker = _ShadLocalizationsDatePickerHr._(_root);
	@override late final _ShadLocalizationsInputHr input = _ShadLocalizationsInputHr._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarHr keyboardToolbar = _ShadLocalizationsKeyboardToolbarHr._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerHr extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerHr._(ShadLocalizationsHr root) : this._root = root, super.internal(root);

	final ShadLocalizationsHr _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Sati';
	@override String get minutes => 'Minute';
	@override String get seconds => 'Sekunde';
	@override String get period => 'Razdoblje';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerHr extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerHr._(ShadLocalizationsHr root) : this._root = root, super.internal(root);

	final ShadLocalizationsHr _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Odaberite datum';
}

// Path: input
class _ShadLocalizationsInputHr extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputHr._(ShadLocalizationsHr root) : this._root = root, super.internal(root);

	final ShadLocalizationsHr _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Izreži';
	@override String get copy => 'Kopiraj';
	@override String get paste => 'Zalijepi';
	@override String get selectAll => 'Odaberi sve';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarHr extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarHr._(ShadLocalizationsHr root) : this._root = root, super.internal(root);

	final ShadLocalizationsHr _root; // ignore: unused_field

	// Translations
	@override String get done => 'Gotovo';
}

/// The flat map containing all translations for locale <hr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsHr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Sati',
			'timePicker.minutes' => 'Minute',
			'timePicker.seconds' => 'Sekunde',
			'timePicker.period' => 'Razdoblje',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Odaberite datum',
			'input.cut' => 'Izreži',
			'input.copy' => 'Kopiraj',
			'input.paste' => 'Zalijepi',
			'input.selectAll' => 'Odaberi sve',
			'keyboardToolbar.done' => 'Gotovo',
			_ => null,
		};
	}
}
