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
class ShadLocalizationsDataRu extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataRu _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataRu $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataRu(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerRu timePicker = _ShadLocalizationsDataTimePickerRu._(_root);
	@override late final _ShadLocalizationsDataDatePickerRu datePicker = _ShadLocalizationsDataDatePickerRu._(_root);
	@override late final _ShadLocalizationsDataInputRu input = _ShadLocalizationsDataInputRu._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarRu keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarRu._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerRu extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerRu._(ShadLocalizationsDataRu root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataRu _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Часы';
	@override String get minutes => 'Минуты';
	@override String get seconds => 'Секунды';
	@override String get period => 'Период';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerRu extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerRu._(ShadLocalizationsDataRu root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataRu _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Выбрать дату';
}

// Path: input
class _ShadLocalizationsDataInputRu extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputRu._(ShadLocalizationsDataRu root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataRu _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Вырезать';
	@override String get copy => 'Копировать';
	@override String get paste => 'Вставить';
	@override String get selectAll => 'Выбрать всё';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarRu extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarRu._(ShadLocalizationsDataRu root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataRu _root; // ignore: unused_field

	// Translations
	@override String get done => 'Готово';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataRu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Часы',
			'timePicker.minutes' => 'Минуты',
			'timePicker.seconds' => 'Секунды',
			'timePicker.period' => 'Период',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Выбрать дату',
			'input.cut' => 'Вырезать',
			'input.copy' => 'Копировать',
			'input.paste' => 'Вставить',
			'input.selectAll' => 'Выбрать всё',
			'keyboardToolbar.done' => 'Готово',
			_ => null,
		};
	}
}
