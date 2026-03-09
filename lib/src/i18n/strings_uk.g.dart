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
class ShadLocalizationsUk extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsUk({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.uk,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <uk>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsUk _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsUk $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsUk(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerUk timePicker = _ShadLocalizationsTimePickerUk._(_root);
	@override late final _ShadLocalizationsDatePickerUk datePicker = _ShadLocalizationsDatePickerUk._(_root);
	@override late final _ShadLocalizationsInputUk input = _ShadLocalizationsInputUk._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarUk keyboardToolbar = _ShadLocalizationsKeyboardToolbarUk._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerUk extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerUk._(ShadLocalizationsUk root) : this._root = root, super.internal(root);

	final ShadLocalizationsUk _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Години';
	@override String get minutes => 'Хвилини';
	@override String get seconds => 'Секунди';
	@override String get period => 'Період';
	@override String get periodPlaceholder => 'ДП';
}

// Path: datePicker
class _ShadLocalizationsDatePickerUk extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerUk._(ShadLocalizationsUk root) : this._root = root, super.internal(root);

	final ShadLocalizationsUk _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Виберіть дату';
}

// Path: input
class _ShadLocalizationsInputUk extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputUk._(ShadLocalizationsUk root) : this._root = root, super.internal(root);

	final ShadLocalizationsUk _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Вирізати';
	@override String get copy => 'Копіювати';
	@override String get paste => 'Вставити';
	@override String get selectAll => 'Вибрати все';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarUk extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarUk._(ShadLocalizationsUk root) : this._root = root, super.internal(root);

	final ShadLocalizationsUk _root; // ignore: unused_field

	// Translations
	@override String get done => 'Готово';
}

/// The flat map containing all translations for locale <uk>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsUk {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Години',
			'timePicker.minutes' => 'Хвилини',
			'timePicker.seconds' => 'Секунди',
			'timePicker.period' => 'Період',
			'timePicker.periodPlaceholder' => 'ДП',
			'datePicker.selectDate' => 'Виберіть дату',
			'input.cut' => 'Вирізати',
			'input.copy' => 'Копіювати',
			'input.paste' => 'Вставити',
			'input.selectAll' => 'Вибрати все',
			'keyboardToolbar.done' => 'Готово',
			_ => null,
		};
	}
}
