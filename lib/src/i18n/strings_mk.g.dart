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
class ShadLocalizationsMk extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsMk({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.mk,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <mk>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsMk _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsMk $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsMk(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerMk timePicker = _ShadLocalizationsTimePickerMk._(_root);
	@override late final _ShadLocalizationsDatePickerMk datePicker = _ShadLocalizationsDatePickerMk._(_root);
	@override late final _ShadLocalizationsInputMk input = _ShadLocalizationsInputMk._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarMk keyboardToolbar = _ShadLocalizationsKeyboardToolbarMk._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerMk extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerMk._(ShadLocalizationsMk root) : this._root = root, super.internal(root);

	final ShadLocalizationsMk _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Часови';
	@override String get minutes => 'Минути';
	@override String get seconds => 'Секунди';
	@override String get period => 'Период';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerMk extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerMk._(ShadLocalizationsMk root) : this._root = root, super.internal(root);

	final ShadLocalizationsMk _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Изберете датум';
}

// Path: input
class _ShadLocalizationsInputMk extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputMk._(ShadLocalizationsMk root) : this._root = root, super.internal(root);

	final ShadLocalizationsMk _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Исечи';
	@override String get copy => 'Копирај';
	@override String get paste => 'Залепи';
	@override String get selectAll => 'Избери сè';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarMk extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarMk._(ShadLocalizationsMk root) : this._root = root, super.internal(root);

	final ShadLocalizationsMk _root; // ignore: unused_field

	// Translations
	@override String get done => 'Готово';
}

/// The flat map containing all translations for locale <mk>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsMk {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Часови',
			'timePicker.minutes' => 'Минути',
			'timePicker.seconds' => 'Секунди',
			'timePicker.period' => 'Период',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Изберете датум',
			'input.cut' => 'Исечи',
			'input.copy' => 'Копирај',
			'input.paste' => 'Залепи',
			'input.selectAll' => 'Избери сè',
			'keyboardToolbar.done' => 'Готово',
			_ => null,
		};
	}
}
