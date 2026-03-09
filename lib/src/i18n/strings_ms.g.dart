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
class ShadLocalizationsMs extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsMs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
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
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsMs _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsMs $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsMs(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerMs timePicker = _ShadLocalizationsTimePickerMs._(_root);
	@override late final _ShadLocalizationsDatePickerMs datePicker = _ShadLocalizationsDatePickerMs._(_root);
	@override late final _ShadLocalizationsInputMs input = _ShadLocalizationsInputMs._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarMs keyboardToolbar = _ShadLocalizationsKeyboardToolbarMs._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerMs extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerMs._(ShadLocalizationsMs root) : this._root = root, super.internal(root);

	final ShadLocalizationsMs _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Jam';
	@override String get minutes => 'Minit';
	@override String get seconds => 'Saat';
	@override String get period => 'Tempoh';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerMs extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerMs._(ShadLocalizationsMs root) : this._root = root, super.internal(root);

	final ShadLocalizationsMs _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Pilih tarikh';
}

// Path: input
class _ShadLocalizationsInputMs extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputMs._(ShadLocalizationsMs root) : this._root = root, super.internal(root);

	final ShadLocalizationsMs _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Potong';
	@override String get copy => 'Salin';
	@override String get paste => 'Tampal';
	@override String get selectAll => 'Pilih Semua';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarMs extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarMs._(ShadLocalizationsMs root) : this._root = root, super.internal(root);

	final ShadLocalizationsMs _root; // ignore: unused_field

	// Translations
	@override String get done => 'Selesai';
}

/// The flat map containing all translations for locale <ms>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsMs {
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
