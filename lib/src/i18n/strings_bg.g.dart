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
class ShadLocalizationsDataBg extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataBg({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.bg,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <bg>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataBg _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataBg $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataBg(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerBg timePicker = _ShadLocalizationsDataTimePickerBg._(_root);
	@override late final _ShadLocalizationsDataDatePickerBg datePicker = _ShadLocalizationsDataDatePickerBg._(_root);
	@override late final _ShadLocalizationsDataInputBg input = _ShadLocalizationsDataInputBg._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarBg keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarBg._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerBg extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerBg._(ShadLocalizationsDataBg root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataBg _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Часове';
	@override String get minutes => 'Минути';
	@override String get seconds => 'Секунди';
	@override String get period => 'Период';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerBg extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerBg._(ShadLocalizationsDataBg root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataBg _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Изберете дата';
}

// Path: input
class _ShadLocalizationsDataInputBg extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputBg._(ShadLocalizationsDataBg root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataBg _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Изрежи';
	@override String get copy => 'Копирай';
	@override String get paste => 'Постави';
	@override String get selectAll => 'Избери всичко';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarBg extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarBg._(ShadLocalizationsDataBg root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataBg _root; // ignore: unused_field

	// Translations
	@override String get done => 'Готово';
}

/// The flat map containing all translations for locale <bg>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataBg {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Часове',
			'timePicker.minutes' => 'Минути',
			'timePicker.seconds' => 'Секунди',
			'timePicker.period' => 'Период',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Изберете дата',
			'input.cut' => 'Изрежи',
			'input.copy' => 'Копирай',
			'input.paste' => 'Постави',
			'input.selectAll' => 'Избери всичко',
			'keyboardToolbar.done' => 'Готово',
			_ => null,
		};
	}
}
