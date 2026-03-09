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
class ShadLocalizationsEu extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsEu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.eu,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <eu>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsEu _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsEu $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsEu(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerEu timePicker = _ShadLocalizationsTimePickerEu._(_root);
	@override late final _ShadLocalizationsDatePickerEu datePicker = _ShadLocalizationsDatePickerEu._(_root);
	@override late final _ShadLocalizationsInputEu input = _ShadLocalizationsInputEu._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarEu keyboardToolbar = _ShadLocalizationsKeyboardToolbarEu._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerEu extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerEu._(ShadLocalizationsEu root) : this._root = root, super.internal(root);

	final ShadLocalizationsEu _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Orduak';
	@override String get minutes => 'Minutuak';
	@override String get seconds => 'Segundoak';
	@override String get period => 'Aldia';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerEu extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerEu._(ShadLocalizationsEu root) : this._root = root, super.internal(root);

	final ShadLocalizationsEu _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Hautatu data';
}

// Path: input
class _ShadLocalizationsInputEu extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputEu._(ShadLocalizationsEu root) : this._root = root, super.internal(root);

	final ShadLocalizationsEu _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Ebaki';
	@override String get copy => 'Kopiatu';
	@override String get paste => 'Itsatsi';
	@override String get selectAll => 'Hautatu dena';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarEu extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarEu._(ShadLocalizationsEu root) : this._root = root, super.internal(root);

	final ShadLocalizationsEu _root; // ignore: unused_field

	// Translations
	@override String get done => 'Eginda';
}

/// The flat map containing all translations for locale <eu>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsEu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Orduak',
			'timePicker.minutes' => 'Minutuak',
			'timePicker.seconds' => 'Segundoak',
			'timePicker.period' => 'Aldia',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Hautatu data',
			'input.cut' => 'Ebaki',
			'input.copy' => 'Kopiatu',
			'input.paste' => 'Itsatsi',
			'input.selectAll' => 'Hautatu dena',
			'keyboardToolbar.done' => 'Eginda',
			_ => null,
		};
	}
}
