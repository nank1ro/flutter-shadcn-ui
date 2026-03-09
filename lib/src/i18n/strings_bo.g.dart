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
class ShadLocalizationsDataBo extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataBo({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.bo,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <bo>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataBo _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataBo $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataBo(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerBo timePicker = _ShadLocalizationsDataTimePickerBo._(_root);
	@override late final _ShadLocalizationsDataDatePickerBo datePicker = _ShadLocalizationsDataDatePickerBo._(_root);
	@override late final _ShadLocalizationsDataInputBo input = _ShadLocalizationsDataInputBo._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarBo keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarBo._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerBo extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerBo._(ShadLocalizationsDataBo root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataBo _root; // ignore: unused_field

	// Translations
	@override String get hours => 'ཆུ་ཚོད།';
	@override String get minutes => 'སྐར་མ།';
	@override String get seconds => 'སྐར་ཆ།';
	@override String get period => 'དུས་ཚོད།';
	@override String get periodPlaceholder => 'སྔ་དྲོ།';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerBo extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerBo._(ShadLocalizationsDataBo root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataBo _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'ཚེས་གྲངས་འདེམས།';
}

// Path: input
class _ShadLocalizationsDataInputBo extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputBo._(ShadLocalizationsDataBo root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataBo _root; // ignore: unused_field

	// Translations
	@override String get cut => 'གཅོད།';
	@override String get copy => 'བེད་སྤྱོད།';
	@override String get paste => 'སྦྱར།';
	@override String get selectAll => 'ཚང་མ་འདེམས།';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarBo extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarBo._(ShadLocalizationsDataBo root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataBo _root; // ignore: unused_field

	// Translations
	@override String get done => 'འགྲུབ།';
}

/// The flat map containing all translations for locale <bo>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataBo {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'ཆུ་ཚོད།',
			'timePicker.minutes' => 'སྐར་མ།',
			'timePicker.seconds' => 'སྐར་ཆ།',
			'timePicker.period' => 'དུས་ཚོད།',
			'timePicker.periodPlaceholder' => 'སྔ་དྲོ།',
			'datePicker.selectDate' => 'ཚེས་གྲངས་འདེམས།',
			'input.cut' => 'གཅོད།',
			'input.copy' => 'བེད་སྤྱོད།',
			'input.paste' => 'སྦྱར།',
			'input.selectAll' => 'ཚང་མ་འདེམས།',
			'keyboardToolbar.done' => 'འགྲུབ།',
			_ => null,
		};
	}
}
