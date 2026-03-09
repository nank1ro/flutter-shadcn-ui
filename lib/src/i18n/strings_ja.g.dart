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
class ShadLocalizationsJa extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsJa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsJa _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsJa $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsJa(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerJa timePicker = _ShadLocalizationsTimePickerJa._(_root);
	@override late final _ShadLocalizationsDatePickerJa datePicker = _ShadLocalizationsDatePickerJa._(_root);
	@override late final _ShadLocalizationsInputJa input = _ShadLocalizationsInputJa._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarJa keyboardToolbar = _ShadLocalizationsKeyboardToolbarJa._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerJa extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerJa._(ShadLocalizationsJa root) : this._root = root, super.internal(root);

	final ShadLocalizationsJa _root; // ignore: unused_field

	// Translations
	@override String get hours => '時';
	@override String get minutes => '分';
	@override String get seconds => '秒';
	@override String get period => '午前/午後';
	@override String get periodPlaceholder => '午前';
}

// Path: datePicker
class _ShadLocalizationsDatePickerJa extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerJa._(ShadLocalizationsJa root) : this._root = root, super.internal(root);

	final ShadLocalizationsJa _root; // ignore: unused_field

	// Translations
	@override String get selectDate => '日付を選択';
}

// Path: input
class _ShadLocalizationsInputJa extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputJa._(ShadLocalizationsJa root) : this._root = root, super.internal(root);

	final ShadLocalizationsJa _root; // ignore: unused_field

	// Translations
	@override String get cut => 'カット';
	@override String get copy => 'コピー';
	@override String get paste => 'ペースト';
	@override String get selectAll => 'すべて選択';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarJa extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarJa._(ShadLocalizationsJa root) : this._root = root, super.internal(root);

	final ShadLocalizationsJa _root; // ignore: unused_field

	// Translations
	@override String get done => '完了';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsJa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => '時',
			'timePicker.minutes' => '分',
			'timePicker.seconds' => '秒',
			'timePicker.period' => '午前/午後',
			'timePicker.periodPlaceholder' => '午前',
			'datePicker.selectDate' => '日付を選択',
			'input.cut' => 'カット',
			'input.copy' => 'コピー',
			'input.paste' => 'ペースト',
			'input.selectAll' => 'すべて選択',
			'keyboardToolbar.done' => '完了',
			_ => null,
		};
	}
}
