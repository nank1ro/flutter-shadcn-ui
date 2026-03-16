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
class ShadLocalizationsDataBs extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataBs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.bs,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <bs>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataBs _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataBs $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataBs(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerBs timePicker = _ShadLocalizationsDataTimePickerBs._(_root);
	@override late final _ShadLocalizationsDataDatePickerBs datePicker = _ShadLocalizationsDataDatePickerBs._(_root);
	@override late final _ShadLocalizationsDataInputBs input = _ShadLocalizationsDataInputBs._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarBs keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarBs._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerBs extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerBs._(ShadLocalizationsDataBs root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataBs _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Sati';
	@override String get minutes => 'Minute';
	@override String get seconds => 'Sekunde';
	@override String get period => 'Period';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerBs extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerBs._(ShadLocalizationsDataBs root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataBs _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Odaberite datum';
}

// Path: input
class _ShadLocalizationsDataInputBs extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputBs._(ShadLocalizationsDataBs root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataBs _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Izreži';
	@override String get copy => 'Kopiraj';
	@override String get paste => 'Zalijepi';
	@override String get selectAll => 'Odaberi sve';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarBs extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarBs._(ShadLocalizationsDataBs root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataBs _root; // ignore: unused_field

	// Translations
	@override String get done => 'Gotovo';
}

/// The flat map containing all translations for locale <bs>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataBs {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Sati',
			'timePicker.minutes' => 'Minute',
			'timePicker.seconds' => 'Sekunde',
			'timePicker.period' => 'Period',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Odaberite datum',
			'input.cut' => 'Izreži',
			'input.copy' => 'Kopiraj',
			'input.paste' => 'Zalijepi',
			'input.selectAll' => 'Odaberi sve',
			'keyboardToolbar.done' => 'Gotovo',
			_ => null,
		};
	}
}
