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
class ShadLocalizationsLv extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsLv({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.lv,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <lv>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsLv _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsLv $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsLv(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerLv timePicker = _ShadLocalizationsTimePickerLv._(_root);
	@override late final _ShadLocalizationsDatePickerLv datePicker = _ShadLocalizationsDatePickerLv._(_root);
	@override late final _ShadLocalizationsInputLv input = _ShadLocalizationsInputLv._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarLv keyboardToolbar = _ShadLocalizationsKeyboardToolbarLv._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerLv extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerLv._(ShadLocalizationsLv root) : this._root = root, super.internal(root);

	final ShadLocalizationsLv _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Stundas';
	@override String get minutes => 'Minūtes';
	@override String get seconds => 'Sekundes';
	@override String get period => 'Periods';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerLv extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerLv._(ShadLocalizationsLv root) : this._root = root, super.internal(root);

	final ShadLocalizationsLv _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Atlasīt datumu';
}

// Path: input
class _ShadLocalizationsInputLv extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputLv._(ShadLocalizationsLv root) : this._root = root, super.internal(root);

	final ShadLocalizationsLv _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Izgriezt';
	@override String get copy => 'Kopēt';
	@override String get paste => 'Ielīmēt';
	@override String get selectAll => 'Atlasīt visu';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarLv extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarLv._(ShadLocalizationsLv root) : this._root = root, super.internal(root);

	final ShadLocalizationsLv _root; // ignore: unused_field

	// Translations
	@override String get done => 'Gatavs';
}

/// The flat map containing all translations for locale <lv>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsLv {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Stundas',
			'timePicker.minutes' => 'Minūtes',
			'timePicker.seconds' => 'Sekundes',
			'timePicker.period' => 'Periods',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Atlasīt datumu',
			'input.cut' => 'Izgriezt',
			'input.copy' => 'Kopēt',
			'input.paste' => 'Ielīmēt',
			'input.selectAll' => 'Atlasīt visu',
			'keyboardToolbar.done' => 'Gatavs',
			_ => null,
		};
	}
}
