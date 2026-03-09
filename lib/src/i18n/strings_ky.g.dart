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
class ShadLocalizationsKy extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsKy({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.ky,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ky>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsKy _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsKy $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsKy(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerKy timePicker = _ShadLocalizationsTimePickerKy._(_root);
	@override late final _ShadLocalizationsDatePickerKy datePicker = _ShadLocalizationsDatePickerKy._(_root);
	@override late final _ShadLocalizationsInputKy input = _ShadLocalizationsInputKy._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarKy keyboardToolbar = _ShadLocalizationsKeyboardToolbarKy._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerKy extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerKy._(ShadLocalizationsKy root) : this._root = root, super.internal(root);

	final ShadLocalizationsKy _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Саат';
	@override String get minutes => 'Мүнөт';
	@override String get seconds => 'Секунд';
	@override String get period => 'Мезгил';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerKy extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerKy._(ShadLocalizationsKy root) : this._root = root, super.internal(root);

	final ShadLocalizationsKy _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Күндү тандаңыз';
}

// Path: input
class _ShadLocalizationsInputKy extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputKy._(ShadLocalizationsKy root) : this._root = root, super.internal(root);

	final ShadLocalizationsKy _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Кесүү';
	@override String get copy => 'Көчүрүү';
	@override String get paste => 'Чаптоо';
	@override String get selectAll => 'Баарын тандоо';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarKy extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarKy._(ShadLocalizationsKy root) : this._root = root, super.internal(root);

	final ShadLocalizationsKy _root; // ignore: unused_field

	// Translations
	@override String get done => 'Даяр';
}

/// The flat map containing all translations for locale <ky>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsKy {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Саат',
			'timePicker.minutes' => 'Мүнөт',
			'timePicker.seconds' => 'Секунд',
			'timePicker.period' => 'Мезгил',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Күндү тандаңыз',
			'input.cut' => 'Кесүү',
			'input.copy' => 'Көчүрүү',
			'input.paste' => 'Чаптоо',
			'input.selectAll' => 'Баарын тандоо',
			'keyboardToolbar.done' => 'Даяр',
			_ => null,
		};
	}
}
