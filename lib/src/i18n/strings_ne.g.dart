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
class ShadLocalizationsNe extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsNe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.ne,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ne>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsNe _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsNe $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsNe(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerNe timePicker = _ShadLocalizationsTimePickerNe._(_root);
	@override late final _ShadLocalizationsDatePickerNe datePicker = _ShadLocalizationsDatePickerNe._(_root);
	@override late final _ShadLocalizationsInputNe input = _ShadLocalizationsInputNe._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarNe keyboardToolbar = _ShadLocalizationsKeyboardToolbarNe._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerNe extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerNe._(ShadLocalizationsNe root) : this._root = root, super.internal(root);

	final ShadLocalizationsNe _root; // ignore: unused_field

	// Translations
	@override String get hours => 'घण्टा';
	@override String get minutes => 'मिनेट';
	@override String get seconds => 'सेकेन्ड';
	@override String get period => 'अवधि';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerNe extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerNe._(ShadLocalizationsNe root) : this._root = root, super.internal(root);

	final ShadLocalizationsNe _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'मिति छान्नुहोस्';
}

// Path: input
class _ShadLocalizationsInputNe extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputNe._(ShadLocalizationsNe root) : this._root = root, super.internal(root);

	final ShadLocalizationsNe _root; // ignore: unused_field

	// Translations
	@override String get cut => 'काट्नुहोस्';
	@override String get copy => 'प्रतिलिपि गर्नुहोस्';
	@override String get paste => 'टाँस्नुहोस्';
	@override String get selectAll => 'सबै चयन गर्नुहोस्';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarNe extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarNe._(ShadLocalizationsNe root) : this._root = root, super.internal(root);

	final ShadLocalizationsNe _root; // ignore: unused_field

	// Translations
	@override String get done => 'सम्पन्न';
}

/// The flat map containing all translations for locale <ne>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsNe {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'घण्टा',
			'timePicker.minutes' => 'मिनेट',
			'timePicker.seconds' => 'सेकेन्ड',
			'timePicker.period' => 'अवधि',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'मिति छान्नुहोस्',
			'input.cut' => 'काट्नुहोस्',
			'input.copy' => 'प्रतिलिपि गर्नुहोस्',
			'input.paste' => 'टाँस्नुहोस्',
			'input.selectAll' => 'सबै चयन गर्नुहोस्',
			'keyboardToolbar.done' => 'सम्पन्न',
			_ => null,
		};
	}
}
