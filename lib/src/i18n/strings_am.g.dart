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
class ShadLocalizationsDataAm extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataAm({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.am,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <am>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataAm _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataAm $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataAm(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerAm timePicker = _ShadLocalizationsDataTimePickerAm._(_root);
	@override late final _ShadLocalizationsDataDatePickerAm datePicker = _ShadLocalizationsDataDatePickerAm._(_root);
	@override late final _ShadLocalizationsDataInputAm input = _ShadLocalizationsDataInputAm._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarAm keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarAm._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerAm extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerAm._(ShadLocalizationsDataAm root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataAm _root; // ignore: unused_field

	// Translations
	@override String get hours => 'ሰዓቶች';
	@override String get minutes => 'ደቂቃዎች';
	@override String get seconds => 'ሰከንዶች';
	@override String get period => 'ወቅት';
	@override String get periodPlaceholder => 'ጥዋት';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerAm extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerAm._(ShadLocalizationsDataAm root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataAm _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'ቀን ይምረጡ';
}

// Path: input
class _ShadLocalizationsDataInputAm extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputAm._(ShadLocalizationsDataAm root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataAm _root; // ignore: unused_field

	// Translations
	@override String get cut => 'ቁረጥ';
	@override String get copy => 'ቅዳ';
	@override String get paste => 'ለጥፍ';
	@override String get selectAll => 'ሁሉንም ይምረጡ';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarAm extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarAm._(ShadLocalizationsDataAm root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataAm _root; // ignore: unused_field

	// Translations
	@override String get done => 'ተከናውኗል';
}

/// The flat map containing all translations for locale <am>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataAm {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'ሰዓቶች',
			'timePicker.minutes' => 'ደቂቃዎች',
			'timePicker.seconds' => 'ሰከንዶች',
			'timePicker.period' => 'ወቅት',
			'timePicker.periodPlaceholder' => 'ጥዋት',
			'datePicker.selectDate' => 'ቀን ይምረጡ',
			'input.cut' => 'ቁረጥ',
			'input.copy' => 'ቅዳ',
			'input.paste' => 'ለጥፍ',
			'input.selectAll' => 'ሁሉንም ይምረጡ',
			'keyboardToolbar.done' => 'ተከናውኗል',
			_ => null,
		};
	}
}
