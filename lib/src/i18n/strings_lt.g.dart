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
class ShadLocalizationsDataLt extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataLt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.lt,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <lt>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataLt _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataLt $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataLt(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerLt timePicker = _ShadLocalizationsDataTimePickerLt._(_root);
	@override late final _ShadLocalizationsDataDatePickerLt datePicker = _ShadLocalizationsDataDatePickerLt._(_root);
	@override late final _ShadLocalizationsDataInputLt input = _ShadLocalizationsDataInputLt._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarLt keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarLt._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerLt extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerLt._(ShadLocalizationsDataLt root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataLt _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Valandos';
	@override String get minutes => 'Minutės';
	@override String get seconds => 'Sekundės';
	@override String get period => 'Laikotarpis';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerLt extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerLt._(ShadLocalizationsDataLt root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataLt _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Pasirinkite datą';
}

// Path: input
class _ShadLocalizationsDataInputLt extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputLt._(ShadLocalizationsDataLt root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataLt _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Iškirpti';
	@override String get copy => 'Kopijuoti';
	@override String get paste => 'Įklijuoti';
	@override String get selectAll => 'Pasirinkti viską';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarLt extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarLt._(ShadLocalizationsDataLt root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataLt _root; // ignore: unused_field

	// Translations
	@override String get done => 'Atlikta';
}

/// The flat map containing all translations for locale <lt>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataLt {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Valandos',
			'timePicker.minutes' => 'Minutės',
			'timePicker.seconds' => 'Sekundės',
			'timePicker.period' => 'Laikotarpis',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Pasirinkite datą',
			'input.cut' => 'Iškirpti',
			'input.copy' => 'Kopijuoti',
			'input.paste' => 'Įklijuoti',
			'input.selectAll' => 'Pasirinkti viską',
			'keyboardToolbar.done' => 'Atlikta',
			_ => null,
		};
	}
}
