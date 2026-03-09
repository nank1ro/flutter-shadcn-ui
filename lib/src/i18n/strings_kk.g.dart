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
class ShadLocalizationsKk extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsKk({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.kk,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <kk>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsKk _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsKk $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsKk(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerKk timePicker = _ShadLocalizationsTimePickerKk._(_root);
	@override late final _ShadLocalizationsDatePickerKk datePicker = _ShadLocalizationsDatePickerKk._(_root);
	@override late final _ShadLocalizationsInputKk input = _ShadLocalizationsInputKk._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarKk keyboardToolbar = _ShadLocalizationsKeyboardToolbarKk._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerKk extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerKk._(ShadLocalizationsKk root) : this._root = root, super.internal(root);

	final ShadLocalizationsKk _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Сағат';
	@override String get minutes => 'Минут';
	@override String get seconds => 'Секунд';
	@override String get period => 'Кезең';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerKk extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerKk._(ShadLocalizationsKk root) : this._root = root, super.internal(root);

	final ShadLocalizationsKk _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Күнді таңдаңыз';
}

// Path: input
class _ShadLocalizationsInputKk extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputKk._(ShadLocalizationsKk root) : this._root = root, super.internal(root);

	final ShadLocalizationsKk _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Кесу';
	@override String get copy => 'Көшіру';
	@override String get paste => 'Қою';
	@override String get selectAll => 'Барлығын таңдау';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarKk extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarKk._(ShadLocalizationsKk root) : this._root = root, super.internal(root);

	final ShadLocalizationsKk _root; // ignore: unused_field

	// Translations
	@override String get done => 'Дайын';
}

/// The flat map containing all translations for locale <kk>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsKk {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Сағат',
			'timePicker.minutes' => 'Минут',
			'timePicker.seconds' => 'Секунд',
			'timePicker.period' => 'Кезең',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Күнді таңдаңыз',
			'input.cut' => 'Кесу',
			'input.copy' => 'Көшіру',
			'input.paste' => 'Қою',
			'input.selectAll' => 'Барлығын таңдау',
			'keyboardToolbar.done' => 'Дайын',
			_ => null,
		};
	}
}
