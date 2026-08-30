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
class ShadLocalizationsDataKo extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataKo({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
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
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataKo _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataKo $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataKo(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsData$timePicker$ko timePicker = _ShadLocalizationsData$timePicker$ko._(_root);
	@override late final _ShadLocalizationsData$datePicker$ko datePicker = _ShadLocalizationsData$datePicker$ko._(_root);
	@override late final _ShadLocalizationsData$input$ko input = _ShadLocalizationsData$input$ko._(_root);
	@override late final _ShadLocalizationsData$keyboardToolbar$ko keyboardToolbar = _ShadLocalizationsData$keyboardToolbar$ko._(_root);
}

// Path: timePicker
class _ShadLocalizationsData$timePicker$ko extends ShadLocalizationsData$timePicker$en {
	_ShadLocalizationsData$timePicker$ko._(ShadLocalizationsDataKo root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataKo _root; // ignore: unused_field

	// Translations
	@override String get hours => '시간';
	@override String get minutes => '분';
	@override String get seconds => '초';
	@override String get period => '오전/오후';
	@override String get periodPlaceholder => '오전';
}

// Path: datePicker
class _ShadLocalizationsData$datePicker$ko extends ShadLocalizationsData$datePicker$en {
	_ShadLocalizationsData$datePicker$ko._(ShadLocalizationsDataKo root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataKo _root; // ignore: unused_field

	// Translations
	@override String get selectDate => '날짜 선택';
}

// Path: input
class _ShadLocalizationsData$input$ko extends ShadLocalizationsData$input$en {
	_ShadLocalizationsData$input$ko._(ShadLocalizationsDataKo root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataKo _root; // ignore: unused_field

	// Translations
	@override String get cut => '잘라내기';
	@override String get copy => '복사';
	@override String get paste => '붙여넣기';
	@override String get selectAll => '전체 선택';
}

// Path: keyboardToolbar
class _ShadLocalizationsData$keyboardToolbar$ko extends ShadLocalizationsData$keyboardToolbar$en {
	_ShadLocalizationsData$keyboardToolbar$ko._(ShadLocalizationsDataKo root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataKo _root; // ignore: unused_field

	// Translations
	@override String get done => '완료';
}

/// The flat map containing all translations for locale <ko>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataKo {
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
