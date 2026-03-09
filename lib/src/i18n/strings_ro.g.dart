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
class ShadLocalizationsDataRo extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataRo({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.ro,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ro>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataRo _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataRo $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataRo(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerRo timePicker = _ShadLocalizationsDataTimePickerRo._(_root);
	@override late final _ShadLocalizationsDataDatePickerRo datePicker = _ShadLocalizationsDataDatePickerRo._(_root);
	@override late final _ShadLocalizationsDataInputRo input = _ShadLocalizationsDataInputRo._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarRo keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarRo._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerRo extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerRo._(ShadLocalizationsDataRo root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataRo _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Ore';
	@override String get minutes => 'Minute';
	@override String get seconds => 'Secunde';
	@override String get period => 'Perioadă';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerRo extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerRo._(ShadLocalizationsDataRo root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataRo _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Selectați data';
}

// Path: input
class _ShadLocalizationsDataInputRo extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputRo._(ShadLocalizationsDataRo root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataRo _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Taie';
	@override String get copy => 'Copiază';
	@override String get paste => 'Lipește';
	@override String get selectAll => 'Selectează tot';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarRo extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarRo._(ShadLocalizationsDataRo root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataRo _root; // ignore: unused_field

	// Translations
	@override String get done => 'Terminat';
}

/// The flat map containing all translations for locale <ro>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataRo {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Ore',
			'timePicker.minutes' => 'Minute',
			'timePicker.seconds' => 'Secunde',
			'timePicker.period' => 'Perioadă',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Selectați data',
			'input.cut' => 'Taie',
			'input.copy' => 'Copiază',
			'input.paste' => 'Lipește',
			'input.selectAll' => 'Selectează tot',
			'keyboardToolbar.done' => 'Terminat',
			_ => null,
		};
	}
}
