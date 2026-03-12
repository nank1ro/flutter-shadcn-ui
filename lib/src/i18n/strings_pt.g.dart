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
class ShadLocalizationsDataPt extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataPt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.pt,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pt>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataPt _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataPt $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataPt(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerPt timePicker = _ShadLocalizationsDataTimePickerPt._(_root);
	@override late final _ShadLocalizationsDataDatePickerPt datePicker = _ShadLocalizationsDataDatePickerPt._(_root);
	@override late final _ShadLocalizationsDataInputPt input = _ShadLocalizationsDataInputPt._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarPt keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarPt._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerPt extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerPt._(ShadLocalizationsDataPt root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataPt _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Horas';
	@override String get minutes => 'Minutos';
	@override String get seconds => 'Segundos';
	@override String get period => 'Período';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerPt extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerPt._(ShadLocalizationsDataPt root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataPt _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Selecionar data';
}

// Path: input
class _ShadLocalizationsDataInputPt extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputPt._(ShadLocalizationsDataPt root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataPt _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Cortar';
	@override String get copy => 'Copiar';
	@override String get paste => 'Colar';
	@override String get selectAll => 'Selecionar tudo';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarPt extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarPt._(ShadLocalizationsDataPt root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataPt _root; // ignore: unused_field

	// Translations
	@override String get done => 'Concluído';
}

/// The flat map containing all translations for locale <pt>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataPt {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Horas',
			'timePicker.minutes' => 'Minutos',
			'timePicker.seconds' => 'Segundos',
			'timePicker.period' => 'Período',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Selecionar data',
			'input.cut' => 'Cortar',
			'input.copy' => 'Copiar',
			'input.paste' => 'Colar',
			'input.selectAll' => 'Selecionar tudo',
			'keyboardToolbar.done' => 'Concluído',
			_ => null,
		};
	}
}
