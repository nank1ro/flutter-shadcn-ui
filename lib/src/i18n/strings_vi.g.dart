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
class ShadLocalizationsDataVi extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataVi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
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
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataVi _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataVi $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataVi(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerVi timePicker = _ShadLocalizationsDataTimePickerVi._(_root);
	@override late final _ShadLocalizationsDataDatePickerVi datePicker = _ShadLocalizationsDataDatePickerVi._(_root);
	@override late final _ShadLocalizationsDataInputVi input = _ShadLocalizationsDataInputVi._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarVi keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarVi._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerVi extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerVi._(ShadLocalizationsDataVi root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataVi _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Giờ';
	@override String get minutes => 'Phút';
	@override String get seconds => 'Giây';
	@override String get period => 'Buổi';
	@override String get periodPlaceholder => 'SA';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerVi extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerVi._(ShadLocalizationsDataVi root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataVi _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Chọn ngày';
}

// Path: input
class _ShadLocalizationsDataInputVi extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputVi._(ShadLocalizationsDataVi root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataVi _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Cắt';
	@override String get copy => 'Sao chép';
	@override String get paste => 'Dán';
	@override String get selectAll => 'Chọn tất cả';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarVi extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarVi._(ShadLocalizationsDataVi root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataVi _root; // ignore: unused_field

	// Translations
	@override String get done => 'Xong';
}

/// The flat map containing all translations for locale <vi>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataVi {
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
