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
class ShadLocalizationsBe extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsBe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.be,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <be>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsBe _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsBe $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsBe(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerBe timePicker = _ShadLocalizationsTimePickerBe._(_root);
	@override late final _ShadLocalizationsDatePickerBe datePicker = _ShadLocalizationsDatePickerBe._(_root);
	@override late final _ShadLocalizationsInputBe input = _ShadLocalizationsInputBe._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarBe keyboardToolbar = _ShadLocalizationsKeyboardToolbarBe._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerBe extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerBe._(ShadLocalizationsBe root) : this._root = root, super.internal(root);

	final ShadLocalizationsBe _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Гадзіны';
	@override String get minutes => 'Хвіліны';
	@override String get seconds => 'Секунды';
	@override String get period => 'Перыяд';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerBe extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerBe._(ShadLocalizationsBe root) : this._root = root, super.internal(root);

	final ShadLocalizationsBe _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Выберыце дату';
}

// Path: input
class _ShadLocalizationsInputBe extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputBe._(ShadLocalizationsBe root) : this._root = root, super.internal(root);

	final ShadLocalizationsBe _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Выразаць';
	@override String get copy => 'Капіяваць';
	@override String get paste => 'Уставіць';
	@override String get selectAll => 'Вылучыць усё';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarBe extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarBe._(ShadLocalizationsBe root) : this._root = root, super.internal(root);

	final ShadLocalizationsBe _root; // ignore: unused_field

	// Translations
	@override String get done => 'Гатова';
}

/// The flat map containing all translations for locale <be>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsBe {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Гадзіны',
			'timePicker.minutes' => 'Хвіліны',
			'timePicker.seconds' => 'Секунды',
			'timePicker.period' => 'Перыяд',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Выберыце дату',
			'input.cut' => 'Выразаць',
			'input.copy' => 'Капіяваць',
			'input.paste' => 'Уставіць',
			'input.selectAll' => 'Вылучыць усё',
			'keyboardToolbar.done' => 'Гатова',
			_ => null,
		};
	}
}
