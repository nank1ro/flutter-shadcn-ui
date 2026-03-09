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
class ShadLocalizationsDataHe extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataHe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.he,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <he>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataHe _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataHe $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataHe(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerHe timePicker = _ShadLocalizationsDataTimePickerHe._(_root);
	@override late final _ShadLocalizationsDataDatePickerHe datePicker = _ShadLocalizationsDataDatePickerHe._(_root);
	@override late final _ShadLocalizationsDataInputHe input = _ShadLocalizationsDataInputHe._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarHe keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarHe._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerHe extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerHe._(ShadLocalizationsDataHe root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataHe _root; // ignore: unused_field

	// Translations
	@override String get hours => 'שעות';
	@override String get minutes => 'דקות';
	@override String get seconds => 'שניות';
	@override String get period => 'תקופה';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerHe extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerHe._(ShadLocalizationsDataHe root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataHe _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'בחר תאריך';
}

// Path: input
class _ShadLocalizationsDataInputHe extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputHe._(ShadLocalizationsDataHe root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataHe _root; // ignore: unused_field

	// Translations
	@override String get cut => 'גזור';
	@override String get copy => 'העתק';
	@override String get paste => 'הדבק';
	@override String get selectAll => 'בחר הכל';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarHe extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarHe._(ShadLocalizationsDataHe root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataHe _root; // ignore: unused_field

	// Translations
	@override String get done => 'סיום';
}

/// The flat map containing all translations for locale <he>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataHe {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'שעות',
			'timePicker.minutes' => 'דקות',
			'timePicker.seconds' => 'שניות',
			'timePicker.period' => 'תקופה',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'בחר תאריך',
			'input.cut' => 'גזור',
			'input.copy' => 'העתק',
			'input.paste' => 'הדבק',
			'input.selectAll' => 'בחר הכל',
			'keyboardToolbar.done' => 'סיום',
			_ => null,
		};
	}
}
