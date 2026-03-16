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
class ShadLocalizationsDataKm extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataKm({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.km,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <km>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataKm _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataKm $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataKm(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerKm timePicker = _ShadLocalizationsDataTimePickerKm._(_root);
	@override late final _ShadLocalizationsDataDatePickerKm datePicker = _ShadLocalizationsDataDatePickerKm._(_root);
	@override late final _ShadLocalizationsDataInputKm input = _ShadLocalizationsDataInputKm._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarKm keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarKm._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerKm extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerKm._(ShadLocalizationsDataKm root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataKm _root; // ignore: unused_field

	// Translations
	@override String get hours => 'ម៉ោង';
	@override String get minutes => 'នាទី';
	@override String get seconds => 'វិនាទី';
	@override String get period => 'វេលា';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerKm extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerKm._(ShadLocalizationsDataKm root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataKm _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'ជ្រើសរើសកាលបរិច្ឆេទ';
}

// Path: input
class _ShadLocalizationsDataInputKm extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputKm._(ShadLocalizationsDataKm root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataKm _root; // ignore: unused_field

	// Translations
	@override String get cut => 'កាត់';
	@override String get copy => 'ចម្លង';
	@override String get paste => 'បិទភ្ជាប់';
	@override String get selectAll => 'ជ្រើសរើសទាំងអស់';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarKm extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarKm._(ShadLocalizationsDataKm root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataKm _root; // ignore: unused_field

	// Translations
	@override String get done => 'រួចរាល់';
}

/// The flat map containing all translations for locale <km>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataKm {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'ម៉ោង',
			'timePicker.minutes' => 'នាទី',
			'timePicker.seconds' => 'វិនាទី',
			'timePicker.period' => 'វេលា',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'ជ្រើសរើសកាលបរិច្ឆេទ',
			'input.cut' => 'កាត់',
			'input.copy' => 'ចម្លង',
			'input.paste' => 'បិទភ្ជាប់',
			'input.selectAll' => 'ជ្រើសរើសទាំងអស់',
			'keyboardToolbar.done' => 'រួចរាល់',
			_ => null,
		};
	}
}
