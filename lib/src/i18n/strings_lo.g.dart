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
class ShadLocalizationsLo extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsLo({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.lo,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <lo>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsLo _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsLo $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsLo(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerLo timePicker = _ShadLocalizationsTimePickerLo._(_root);
	@override late final _ShadLocalizationsDatePickerLo datePicker = _ShadLocalizationsDatePickerLo._(_root);
	@override late final _ShadLocalizationsInputLo input = _ShadLocalizationsInputLo._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarLo keyboardToolbar = _ShadLocalizationsKeyboardToolbarLo._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerLo extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerLo._(ShadLocalizationsLo root) : this._root = root, super.internal(root);

	final ShadLocalizationsLo _root; // ignore: unused_field

	// Translations
	@override String get hours => 'ຊົ່ວໂມງ';
	@override String get minutes => 'ນາທີ';
	@override String get seconds => 'ວິນາທີ';
	@override String get period => 'ຊ່ວງເວລາ';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerLo extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerLo._(ShadLocalizationsLo root) : this._root = root, super.internal(root);

	final ShadLocalizationsLo _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'ເລືອກວັນທີ';
}

// Path: input
class _ShadLocalizationsInputLo extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputLo._(ShadLocalizationsLo root) : this._root = root, super.internal(root);

	final ShadLocalizationsLo _root; // ignore: unused_field

	// Translations
	@override String get cut => 'ຕັດ';
	@override String get copy => 'ຄັດລອກ';
	@override String get paste => 'ວາງ';
	@override String get selectAll => 'ເລືອກທັງໝົດ';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarLo extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarLo._(ShadLocalizationsLo root) : this._root = root, super.internal(root);

	final ShadLocalizationsLo _root; // ignore: unused_field

	// Translations
	@override String get done => 'ສຳເລັດ';
}

/// The flat map containing all translations for locale <lo>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsLo {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'ຊົ່ວໂມງ',
			'timePicker.minutes' => 'ນາທີ',
			'timePicker.seconds' => 'ວິນາທີ',
			'timePicker.period' => 'ຊ່ວງເວລາ',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'ເລືອກວັນທີ',
			'input.cut' => 'ຕັດ',
			'input.copy' => 'ຄັດລອກ',
			'input.paste' => 'ວາງ',
			'input.selectAll' => 'ເລືອກທັງໝົດ',
			'keyboardToolbar.done' => 'ສຳເລັດ',
			_ => null,
		};
	}
}
