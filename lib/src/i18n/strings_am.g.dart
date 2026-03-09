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
class ShadLocalizationsAm extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsAm({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
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
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsAm _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsAm $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsAm(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerAm timePicker = _ShadLocalizationsTimePickerAm._(_root);
	@override late final _ShadLocalizationsDatePickerAm datePicker = _ShadLocalizationsDatePickerAm._(_root);
	@override late final _ShadLocalizationsInputAm input = _ShadLocalizationsInputAm._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarAm keyboardToolbar = _ShadLocalizationsKeyboardToolbarAm._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerAm extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerAm._(ShadLocalizationsAm root) : this._root = root, super.internal(root);

	final ShadLocalizationsAm _root; // ignore: unused_field

	// Translations
	@override String get hours => 'ሰዓቶች';
	@override String get minutes => 'ደቂቃዎች';
	@override String get seconds => 'ሰከንዶች';
	@override String get period => 'ወቅት';
	@override String get periodPlaceholder => 'ጥዋት';
}

// Path: datePicker
class _ShadLocalizationsDatePickerAm extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerAm._(ShadLocalizationsAm root) : this._root = root, super.internal(root);

	final ShadLocalizationsAm _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'ቀን ይምረጡ';
}

// Path: input
class _ShadLocalizationsInputAm extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputAm._(ShadLocalizationsAm root) : this._root = root, super.internal(root);

	final ShadLocalizationsAm _root; // ignore: unused_field

	// Translations
	@override String get cut => 'ቁረጥ';
	@override String get copy => 'ቅዳ';
	@override String get paste => 'ለጥፍ';
	@override String get selectAll => 'ሁሉንም ይምረጡ';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarAm extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarAm._(ShadLocalizationsAm root) : this._root = root, super.internal(root);

	final ShadLocalizationsAm _root; // ignore: unused_field

	// Translations
	@override String get done => 'ተከናውኗል';
}

/// The flat map containing all translations for locale <am>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsAm {
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
