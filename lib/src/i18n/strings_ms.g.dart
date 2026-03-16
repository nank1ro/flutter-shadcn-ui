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
class ShadLocalizationsDataMs extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataMs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.ms,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ms>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataMs _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataMs $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataMs(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerMs timePicker = _ShadLocalizationsDataTimePickerMs._(_root);
	@override late final _ShadLocalizationsDataDatePickerMs datePicker = _ShadLocalizationsDataDatePickerMs._(_root);
	@override late final _ShadLocalizationsDataInputMs input = _ShadLocalizationsDataInputMs._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarMs keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarMs._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerMs extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerMs._(ShadLocalizationsDataMs root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataMs _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Jam';
	@override String get minutes => 'Minit';
	@override String get seconds => 'Saat';
	@override String get period => 'Tempoh';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerMs extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerMs._(ShadLocalizationsDataMs root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataMs _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Pilih tarikh';
}

// Path: input
class _ShadLocalizationsDataInputMs extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputMs._(ShadLocalizationsDataMs root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataMs _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Potong';
	@override String get copy => 'Salin';
	@override String get paste => 'Tampal';
	@override String get selectAll => 'Pilih Semua';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarMs extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarMs._(ShadLocalizationsDataMs root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataMs _root; // ignore: unused_field

	// Translations
	@override String get done => 'Selesai';
}

/// The flat map containing all translations for locale <ms>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataMs {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Jam',
			'timePicker.minutes' => 'Minit',
			'timePicker.seconds' => 'Saat',
			'timePicker.period' => 'Tempoh',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Pilih tarikh',
			'input.cut' => 'Potong',
			'input.copy' => 'Salin',
			'input.paste' => 'Tampal',
			'input.selectAll' => 'Pilih Semua',
			'keyboardToolbar.done' => 'Selesai',
			_ => null,
		};
	}
}
