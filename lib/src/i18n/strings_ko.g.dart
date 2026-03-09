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
class ShadLocalizationsKo extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsKo({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.ko,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ko>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsKo _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsKo $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsKo(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerKo timePicker = _ShadLocalizationsTimePickerKo._(_root);
	@override late final _ShadLocalizationsDatePickerKo datePicker = _ShadLocalizationsDatePickerKo._(_root);
	@override late final _ShadLocalizationsInputKo input = _ShadLocalizationsInputKo._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarKo keyboardToolbar = _ShadLocalizationsKeyboardToolbarKo._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerKo extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerKo._(ShadLocalizationsKo root) : this._root = root, super.internal(root);

	final ShadLocalizationsKo _root; // ignore: unused_field

	// Translations
	@override String get hours => '시간';
	@override String get minutes => '분';
	@override String get seconds => '초';
	@override String get period => '오전/오후';
	@override String get periodPlaceholder => '오전';
}

// Path: datePicker
class _ShadLocalizationsDatePickerKo extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerKo._(ShadLocalizationsKo root) : this._root = root, super.internal(root);

	final ShadLocalizationsKo _root; // ignore: unused_field

	// Translations
	@override String get selectDate => '날짜 선택';
}

// Path: input
class _ShadLocalizationsInputKo extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputKo._(ShadLocalizationsKo root) : this._root = root, super.internal(root);

	final ShadLocalizationsKo _root; // ignore: unused_field

	// Translations
	@override String get cut => '잘라내기';
	@override String get copy => '복사';
	@override String get paste => '붙여넣기';
	@override String get selectAll => '전체 선택';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarKo extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarKo._(ShadLocalizationsKo root) : this._root = root, super.internal(root);

	final ShadLocalizationsKo _root; // ignore: unused_field

	// Translations
	@override String get done => '완료';
}

/// The flat map containing all translations for locale <ko>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsKo {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => '시간',
			'timePicker.minutes' => '분',
			'timePicker.seconds' => '초',
			'timePicker.period' => '오전/오후',
			'timePicker.periodPlaceholder' => '오전',
			'datePicker.selectDate' => '날짜 선택',
			'input.cut' => '잘라내기',
			'input.copy' => '복사',
			'input.paste' => '붙여넣기',
			'input.selectAll' => '전체 선택',
			'keyboardToolbar.done' => '완료',
			_ => null,
		};
	}
}
