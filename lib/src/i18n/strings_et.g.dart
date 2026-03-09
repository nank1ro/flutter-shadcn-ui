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
class ShadLocalizationsEt extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsEt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.et,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <et>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsEt _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsEt $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsEt(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerEt timePicker = _ShadLocalizationsTimePickerEt._(_root);
	@override late final _ShadLocalizationsDatePickerEt datePicker = _ShadLocalizationsDatePickerEt._(_root);
	@override late final _ShadLocalizationsInputEt input = _ShadLocalizationsInputEt._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarEt keyboardToolbar = _ShadLocalizationsKeyboardToolbarEt._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerEt extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerEt._(ShadLocalizationsEt root) : this._root = root, super.internal(root);

	final ShadLocalizationsEt _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Tunnid';
	@override String get minutes => 'Minutid';
	@override String get seconds => 'Sekundid';
	@override String get period => 'Periood';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerEt extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerEt._(ShadLocalizationsEt root) : this._root = root, super.internal(root);

	final ShadLocalizationsEt _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Vali kuupäev';
}

// Path: input
class _ShadLocalizationsInputEt extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputEt._(ShadLocalizationsEt root) : this._root = root, super.internal(root);

	final ShadLocalizationsEt _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Lõika';
	@override String get copy => 'Kopeeri';
	@override String get paste => 'Kleebi';
	@override String get selectAll => 'Vali kõik';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarEt extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarEt._(ShadLocalizationsEt root) : this._root = root, super.internal(root);

	final ShadLocalizationsEt _root; // ignore: unused_field

	// Translations
	@override String get done => 'Valmis';
}

/// The flat map containing all translations for locale <et>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsEt {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Tunnid',
			'timePicker.minutes' => 'Minutid',
			'timePicker.seconds' => 'Sekundid',
			'timePicker.period' => 'Periood',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Vali kuupäev',
			'input.cut' => 'Lõika',
			'input.copy' => 'Kopeeri',
			'input.paste' => 'Kleebi',
			'input.selectAll' => 'Vali kõik',
			'keyboardToolbar.done' => 'Valmis',
			_ => null,
		};
	}
}
