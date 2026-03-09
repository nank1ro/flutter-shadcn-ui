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
class ShadLocalizationsDataFa extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataFa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.fa,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fa>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataFa _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataFa $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataFa(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerFa timePicker = _ShadLocalizationsDataTimePickerFa._(_root);
	@override late final _ShadLocalizationsDataDatePickerFa datePicker = _ShadLocalizationsDataDatePickerFa._(_root);
	@override late final _ShadLocalizationsDataInputFa input = _ShadLocalizationsDataInputFa._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarFa keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarFa._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerFa extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerFa._(ShadLocalizationsDataFa root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataFa _root; // ignore: unused_field

	// Translations
	@override String get hours => 'ساعت';
	@override String get minutes => 'دقیقه';
	@override String get seconds => 'ثانیه';
	@override String get period => 'دوره';
	@override String get periodPlaceholder => 'ق.ظ';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerFa extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerFa._(ShadLocalizationsDataFa root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataFa _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'انتخاب تاریخ';
}

// Path: input
class _ShadLocalizationsDataInputFa extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputFa._(ShadLocalizationsDataFa root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataFa _root; // ignore: unused_field

	// Translations
	@override String get cut => 'برش';
	@override String get copy => 'کپی';
	@override String get paste => 'چسباندن';
	@override String get selectAll => 'انتخاب همه';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarFa extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarFa._(ShadLocalizationsDataFa root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataFa _root; // ignore: unused_field

	// Translations
	@override String get done => 'تمام';
}

/// The flat map containing all translations for locale <fa>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataFa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'ساعت',
			'timePicker.minutes' => 'دقیقه',
			'timePicker.seconds' => 'ثانیه',
			'timePicker.period' => 'دوره',
			'timePicker.periodPlaceholder' => 'ق.ظ',
			'datePicker.selectDate' => 'انتخاب تاریخ',
			'input.cut' => 'برش',
			'input.copy' => 'کپی',
			'input.paste' => 'چسباندن',
			'input.selectAll' => 'انتخاب همه',
			'keyboardToolbar.done' => 'تمام',
			_ => null,
		};
	}
}
