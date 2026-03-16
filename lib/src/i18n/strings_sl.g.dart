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
class ShadLocalizationsDataSl extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataSl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.sl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <sl>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataSl _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataSl $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataSl(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerSl timePicker = _ShadLocalizationsDataTimePickerSl._(_root);
	@override late final _ShadLocalizationsDataDatePickerSl datePicker = _ShadLocalizationsDataDatePickerSl._(_root);
	@override late final _ShadLocalizationsDataInputSl input = _ShadLocalizationsDataInputSl._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarSl keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarSl._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerSl extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerSl._(ShadLocalizationsDataSl root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSl _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Ure';
	@override String get minutes => 'Minute';
	@override String get seconds => 'Sekunde';
	@override String get period => 'Obdobje';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerSl extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerSl._(ShadLocalizationsDataSl root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSl _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Izberite datum';
}

// Path: input
class _ShadLocalizationsDataInputSl extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputSl._(ShadLocalizationsDataSl root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSl _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Izreži';
	@override String get copy => 'Kopiraj';
	@override String get paste => 'Prilepi';
	@override String get selectAll => 'Izberi vse';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarSl extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarSl._(ShadLocalizationsDataSl root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataSl _root; // ignore: unused_field

	// Translations
	@override String get done => 'Končano';
}

/// The flat map containing all translations for locale <sl>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataSl {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Ure',
			'timePicker.minutes' => 'Minute',
			'timePicker.seconds' => 'Sekunde',
			'timePicker.period' => 'Obdobje',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Izberite datum',
			'input.cut' => 'Izreži',
			'input.copy' => 'Kopiraj',
			'input.paste' => 'Prilepi',
			'input.selectAll' => 'Izberi vse',
			'keyboardToolbar.done' => 'Končano',
			_ => null,
		};
	}
}
