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
class ShadLocalizationsMl extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsMl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.ml,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ml>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsMl _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsMl $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsMl(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerMl timePicker = _ShadLocalizationsTimePickerMl._(_root);
	@override late final _ShadLocalizationsDatePickerMl datePicker = _ShadLocalizationsDatePickerMl._(_root);
	@override late final _ShadLocalizationsInputMl input = _ShadLocalizationsInputMl._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarMl keyboardToolbar = _ShadLocalizationsKeyboardToolbarMl._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerMl extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerMl._(ShadLocalizationsMl root) : this._root = root, super.internal(root);

	final ShadLocalizationsMl _root; // ignore: unused_field

	// Translations
	@override String get hours => 'മണിക്കൂർ';
	@override String get minutes => 'മിനിറ്റ്';
	@override String get seconds => 'സെക്കൻഡ്';
	@override String get period => 'കാലഘട്ടം';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerMl extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerMl._(ShadLocalizationsMl root) : this._root = root, super.internal(root);

	final ShadLocalizationsMl _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'തീയതി തിരഞ്ഞെടുക്കുക';
}

// Path: input
class _ShadLocalizationsInputMl extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputMl._(ShadLocalizationsMl root) : this._root = root, super.internal(root);

	final ShadLocalizationsMl _root; // ignore: unused_field

	// Translations
	@override String get cut => 'മുറിക്കുക';
	@override String get copy => 'പകർത്തുക';
	@override String get paste => 'ഒട്ടിക്കുക';
	@override String get selectAll => 'എല്ലാം തിരഞ്ഞെടുക്കുക';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarMl extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarMl._(ShadLocalizationsMl root) : this._root = root, super.internal(root);

	final ShadLocalizationsMl _root; // ignore: unused_field

	// Translations
	@override String get done => 'പൂർത്തിയായി';
}

/// The flat map containing all translations for locale <ml>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsMl {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'മണിക്കൂർ',
			'timePicker.minutes' => 'മിനിറ്റ്',
			'timePicker.seconds' => 'സെക്കൻഡ്',
			'timePicker.period' => 'കാലഘട്ടം',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'തീയതി തിരഞ്ഞെടുക്കുക',
			'input.cut' => 'മുറിക്കുക',
			'input.copy' => 'പകർത്തുക',
			'input.paste' => 'ഒട്ടിക്കുക',
			'input.selectAll' => 'എല്ലാം തിരഞ്ഞെടുക്കുക',
			'keyboardToolbar.done' => 'പൂർത്തിയായി',
			_ => null,
		};
	}
}
