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
class ShadLocalizationsDataCa extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataCa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.ca,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ca>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataCa _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataCa $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataCa(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerCa timePicker = _ShadLocalizationsDataTimePickerCa._(_root);
	@override late final _ShadLocalizationsDataDatePickerCa datePicker = _ShadLocalizationsDataDatePickerCa._(_root);
	@override late final _ShadLocalizationsDataInputCa input = _ShadLocalizationsDataInputCa._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarCa keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarCa._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerCa extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerCa._(ShadLocalizationsDataCa root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataCa _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Hores';
	@override String get minutes => 'Minuts';
	@override String get seconds => 'Segons';
	@override String get period => 'Període';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerCa extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerCa._(ShadLocalizationsDataCa root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataCa _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Selecciona una data';
}

// Path: input
class _ShadLocalizationsDataInputCa extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputCa._(ShadLocalizationsDataCa root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataCa _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Retalla';
	@override String get copy => 'Copia';
	@override String get paste => 'Enganxa';
	@override String get selectAll => 'Selecciona-ho tot';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarCa extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarCa._(ShadLocalizationsDataCa root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataCa _root; // ignore: unused_field

	// Translations
	@override String get done => 'Fet';
}

/// The flat map containing all translations for locale <ca>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataCa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Hores',
			'timePicker.minutes' => 'Minuts',
			'timePicker.seconds' => 'Segons',
			'timePicker.period' => 'Període',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Selecciona una data',
			'input.cut' => 'Retalla',
			'input.copy' => 'Copia',
			'input.paste' => 'Enganxa',
			'input.selectAll' => 'Selecciona-ho tot',
			'keyboardToolbar.done' => 'Fet',
			_ => null,
		};
	}
}
