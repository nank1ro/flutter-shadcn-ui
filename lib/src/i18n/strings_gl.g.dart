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
class ShadLocalizationsGl extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsGl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.gl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <gl>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsGl _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsGl $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsGl(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerGl timePicker = _ShadLocalizationsTimePickerGl._(_root);
	@override late final _ShadLocalizationsDatePickerGl datePicker = _ShadLocalizationsDatePickerGl._(_root);
	@override late final _ShadLocalizationsInputGl input = _ShadLocalizationsInputGl._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarGl keyboardToolbar = _ShadLocalizationsKeyboardToolbarGl._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerGl extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerGl._(ShadLocalizationsGl root) : this._root = root, super.internal(root);

	final ShadLocalizationsGl _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Horas';
	@override String get minutes => 'Minutos';
	@override String get seconds => 'Segundos';
	@override String get period => 'Período';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerGl extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerGl._(ShadLocalizationsGl root) : this._root = root, super.internal(root);

	final ShadLocalizationsGl _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Seleccionar data';
}

// Path: input
class _ShadLocalizationsInputGl extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputGl._(ShadLocalizationsGl root) : this._root = root, super.internal(root);

	final ShadLocalizationsGl _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Cortar';
	@override String get copy => 'Copiar';
	@override String get paste => 'Pegar';
	@override String get selectAll => 'Seleccionar todo';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarGl extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarGl._(ShadLocalizationsGl root) : this._root = root, super.internal(root);

	final ShadLocalizationsGl _root; // ignore: unused_field

	// Translations
	@override String get done => 'Feito';
}

/// The flat map containing all translations for locale <gl>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsGl {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Horas',
			'timePicker.minutes' => 'Minutos',
			'timePicker.seconds' => 'Segundos',
			'timePicker.period' => 'Período',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Seleccionar data',
			'input.cut' => 'Cortar',
			'input.copy' => 'Copiar',
			'input.paste' => 'Pegar',
			'input.selectAll' => 'Seleccionar todo',
			'keyboardToolbar.done' => 'Feito',
			_ => null,
		};
	}
}
