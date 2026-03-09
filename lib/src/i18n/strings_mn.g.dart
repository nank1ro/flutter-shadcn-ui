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
class ShadLocalizationsMn extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsMn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
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
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsMn _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsMn $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsMn(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerMn timePicker = _ShadLocalizationsTimePickerMn._(_root);
	@override late final _ShadLocalizationsDatePickerMn datePicker = _ShadLocalizationsDatePickerMn._(_root);
	@override late final _ShadLocalizationsInputMn input = _ShadLocalizationsInputMn._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarMn keyboardToolbar = _ShadLocalizationsKeyboardToolbarMn._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerMn extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerMn._(ShadLocalizationsMn root) : this._root = root, super.internal(root);

	final ShadLocalizationsMn _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Цаг';
	@override String get minutes => 'Минут';
	@override String get seconds => 'Секунд';
	@override String get period => 'Хугацаа';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerMn extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerMn._(ShadLocalizationsMn root) : this._root = root, super.internal(root);

	final ShadLocalizationsMn _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Огноо сонгох';
}

// Path: input
class _ShadLocalizationsInputMn extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputMn._(ShadLocalizationsMn root) : this._root = root, super.internal(root);

	final ShadLocalizationsMn _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Тайрах';
	@override String get copy => 'Хуулах';
	@override String get paste => 'Буулгах';
	@override String get selectAll => 'Бүгдийг сонгох';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarMn extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarMn._(ShadLocalizationsMn root) : this._root = root, super.internal(root);

	final ShadLocalizationsMn _root; // ignore: unused_field

	// Translations
	@override String get done => 'Болсон';
}

/// The flat map containing all translations for locale <mn>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsMn {
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
