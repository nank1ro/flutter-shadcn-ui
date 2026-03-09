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
class ShadLocalizationsDataMk extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataMk({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
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
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataMk _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataMk $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataMk(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerMk timePicker = _ShadLocalizationsDataTimePickerMk._(_root);
	@override late final _ShadLocalizationsDataDatePickerMk datePicker = _ShadLocalizationsDataDatePickerMk._(_root);
	@override late final _ShadLocalizationsDataInputMk input = _ShadLocalizationsDataInputMk._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarMk keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarMk._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerMk extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerMk._(ShadLocalizationsDataMk root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataMk _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Часови';
	@override String get minutes => 'Минути';
	@override String get seconds => 'Секунди';
	@override String get period => 'Период';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerMk extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerMk._(ShadLocalizationsDataMk root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataMk _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Изберете датум';
}

// Path: input
class _ShadLocalizationsDataInputMk extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputMk._(ShadLocalizationsDataMk root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataMk _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Исечи';
	@override String get copy => 'Копирај';
	@override String get paste => 'Залепи';
	@override String get selectAll => 'Избери сè';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarMk extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarMk._(ShadLocalizationsDataMk root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataMk _root; // ignore: unused_field

	// Translations
	@override String get done => 'Готово';
}

/// The flat map containing all translations for locale <mk>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataMk {
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
