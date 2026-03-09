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
class ShadLocalizationsDataMn extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataMn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.mn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <mn>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataMn _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataMn $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataMn(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerMn timePicker = _ShadLocalizationsDataTimePickerMn._(_root);
	@override late final _ShadLocalizationsDataDatePickerMn datePicker = _ShadLocalizationsDataDatePickerMn._(_root);
	@override late final _ShadLocalizationsDataInputMn input = _ShadLocalizationsDataInputMn._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarMn keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarMn._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerMn extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerMn._(ShadLocalizationsDataMn root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataMn _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Цаг';
	@override String get minutes => 'Минут';
	@override String get seconds => 'Секунд';
	@override String get period => 'Хугацаа';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerMn extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerMn._(ShadLocalizationsDataMn root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataMn _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Огноо сонгох';
}

// Path: input
class _ShadLocalizationsDataInputMn extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputMn._(ShadLocalizationsDataMn root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataMn _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Тайрах';
	@override String get copy => 'Хуулах';
	@override String get paste => 'Буулгах';
	@override String get selectAll => 'Бүгдийг сонгох';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarMn extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarMn._(ShadLocalizationsDataMn root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataMn _root; // ignore: unused_field

	// Translations
	@override String get done => 'Болсон';
}

/// The flat map containing all translations for locale <mn>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataMn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Цаг',
			'timePicker.minutes' => 'Минут',
			'timePicker.seconds' => 'Секунд',
			'timePicker.period' => 'Хугацаа',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Огноо сонгох',
			'input.cut' => 'Тайрах',
			'input.copy' => 'Хуулах',
			'input.paste' => 'Буулгах',
			'input.selectAll' => 'Бүгдийг сонгох',
			'keyboardToolbar.done' => 'Болсон',
			_ => null,
		};
	}
}
