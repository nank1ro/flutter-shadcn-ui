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
class ShadLocalizationsDataNe extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataNe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
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
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataNe _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataNe $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataNe(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerNe timePicker = _ShadLocalizationsDataTimePickerNe._(_root);
	@override late final _ShadLocalizationsDataDatePickerNe datePicker = _ShadLocalizationsDataDatePickerNe._(_root);
	@override late final _ShadLocalizationsDataInputNe input = _ShadLocalizationsDataInputNe._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarNe keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarNe._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerNe extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerNe._(ShadLocalizationsDataNe root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataNe _root; // ignore: unused_field

	// Translations
	@override String get hours => 'घण्टा';
	@override String get minutes => 'मिनेट';
	@override String get seconds => 'सेकेन्ड';
	@override String get period => 'अवधि';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerNe extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerNe._(ShadLocalizationsDataNe root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataNe _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'मिति छान्नुहोस्';
}

// Path: input
class _ShadLocalizationsDataInputNe extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputNe._(ShadLocalizationsDataNe root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataNe _root; // ignore: unused_field

	// Translations
	@override String get cut => 'काट्नुहोस्';
	@override String get copy => 'प्रतिलिपि गर्नुहोस्';
	@override String get paste => 'टाँस्नुहोस्';
	@override String get selectAll => 'सबै चयन गर्नुहोस्';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarNe extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarNe._(ShadLocalizationsDataNe root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataNe _root; // ignore: unused_field

	// Translations
	@override String get done => 'सम्पन्न';
}

/// The flat map containing all translations for locale <ne>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataNe {
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
