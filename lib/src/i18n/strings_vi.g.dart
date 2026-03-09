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
class ShadLocalizationsVi extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsVi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.vi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <vi>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsVi _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsVi $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsVi(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerVi timePicker = _ShadLocalizationsTimePickerVi._(_root);
	@override late final _ShadLocalizationsDatePickerVi datePicker = _ShadLocalizationsDatePickerVi._(_root);
	@override late final _ShadLocalizationsInputVi input = _ShadLocalizationsInputVi._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarVi keyboardToolbar = _ShadLocalizationsKeyboardToolbarVi._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerVi extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerVi._(ShadLocalizationsVi root) : this._root = root, super.internal(root);

	final ShadLocalizationsVi _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Giờ';
	@override String get minutes => 'Phút';
	@override String get seconds => 'Giây';
	@override String get period => 'Buổi';
	@override String get periodPlaceholder => 'SA';
}

// Path: datePicker
class _ShadLocalizationsDatePickerVi extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerVi._(ShadLocalizationsVi root) : this._root = root, super.internal(root);

	final ShadLocalizationsVi _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Chọn ngày';
}

// Path: input
class _ShadLocalizationsInputVi extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputVi._(ShadLocalizationsVi root) : this._root = root, super.internal(root);

	final ShadLocalizationsVi _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Cắt';
	@override String get copy => 'Sao chép';
	@override String get paste => 'Dán';
	@override String get selectAll => 'Chọn tất cả';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarVi extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarVi._(ShadLocalizationsVi root) : this._root = root, super.internal(root);

	final ShadLocalizationsVi _root; // ignore: unused_field

	// Translations
	@override String get done => 'Xong';
}

/// The flat map containing all translations for locale <vi>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsVi {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Giờ',
			'timePicker.minutes' => 'Phút',
			'timePicker.seconds' => 'Giây',
			'timePicker.period' => 'Buổi',
			'timePicker.periodPlaceholder' => 'SA',
			'datePicker.selectDate' => 'Chọn ngày',
			'input.cut' => 'Cắt',
			'input.copy' => 'Sao chép',
			'input.paste' => 'Dán',
			'input.selectAll' => 'Chọn tất cả',
			'keyboardToolbar.done' => 'Xong',
			_ => null,
		};
	}
}
