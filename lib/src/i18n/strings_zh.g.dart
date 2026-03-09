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
class ShadLocalizationsZh extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsZh({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.zh,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsZh _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsZh $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsZh(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerZh timePicker = _ShadLocalizationsTimePickerZh._(_root);
	@override late final _ShadLocalizationsDatePickerZh datePicker = _ShadLocalizationsDatePickerZh._(_root);
	@override late final _ShadLocalizationsInputZh input = _ShadLocalizationsInputZh._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarZh keyboardToolbar = _ShadLocalizationsKeyboardToolbarZh._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerZh extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerZh._(ShadLocalizationsZh root) : this._root = root, super.internal(root);

	final ShadLocalizationsZh _root; // ignore: unused_field

	// Translations
	@override String get hours => '时';
	@override String get minutes => '分';
	@override String get seconds => '秒';
	@override String get period => '时段';
	@override String get periodPlaceholder => '上午';
}

// Path: datePicker
class _ShadLocalizationsDatePickerZh extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerZh._(ShadLocalizationsZh root) : this._root = root, super.internal(root);

	final ShadLocalizationsZh _root; // ignore: unused_field

	// Translations
	@override String get selectDate => '选择日期';
}

// Path: input
class _ShadLocalizationsInputZh extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputZh._(ShadLocalizationsZh root) : this._root = root, super.internal(root);

	final ShadLocalizationsZh _root; // ignore: unused_field

	// Translations
	@override String get cut => '剪切';
	@override String get copy => '复制';
	@override String get paste => '粘贴';
	@override String get selectAll => '全选';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarZh extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarZh._(ShadLocalizationsZh root) : this._root = root, super.internal(root);

	final ShadLocalizationsZh _root; // ignore: unused_field

	// Translations
	@override String get done => '完成';
}

/// The flat map containing all translations for locale <zh>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsZh {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => '时',
			'timePicker.minutes' => '分',
			'timePicker.seconds' => '秒',
			'timePicker.period' => '时段',
			'timePicker.periodPlaceholder' => '上午',
			'datePicker.selectDate' => '选择日期',
			'input.cut' => '剪切',
			'input.copy' => '复制',
			'input.paste' => '粘贴',
			'input.selectAll' => '全选',
			'keyboardToolbar.done' => '完成',
			_ => null,
		};
	}
}
