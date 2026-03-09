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
class ShadLocalizationsTe extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsTe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.te,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <te>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsTe _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsTe $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsTe(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerTe timePicker = _ShadLocalizationsTimePickerTe._(_root);
	@override late final _ShadLocalizationsDatePickerTe datePicker = _ShadLocalizationsDatePickerTe._(_root);
	@override late final _ShadLocalizationsInputTe input = _ShadLocalizationsInputTe._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarTe keyboardToolbar = _ShadLocalizationsKeyboardToolbarTe._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerTe extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerTe._(ShadLocalizationsTe root) : this._root = root, super.internal(root);

	final ShadLocalizationsTe _root; // ignore: unused_field

	// Translations
	@override String get hours => 'గంటలు';
	@override String get minutes => 'నిమిషాలు';
	@override String get seconds => 'సెకన్లు';
	@override String get period => 'కాలం';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerTe extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerTe._(ShadLocalizationsTe root) : this._root = root, super.internal(root);

	final ShadLocalizationsTe _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'తేదీని ఎంచుకోండి';
}

// Path: input
class _ShadLocalizationsInputTe extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputTe._(ShadLocalizationsTe root) : this._root = root, super.internal(root);

	final ShadLocalizationsTe _root; // ignore: unused_field

	// Translations
	@override String get cut => 'కత్తిరించు';
	@override String get copy => 'కాపీ చేయి';
	@override String get paste => 'అతికించు';
	@override String get selectAll => 'అన్నీ ఎంచుకో';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarTe extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarTe._(ShadLocalizationsTe root) : this._root = root, super.internal(root);

	final ShadLocalizationsTe _root; // ignore: unused_field

	// Translations
	@override String get done => 'పూర్తయింది';
}

/// The flat map containing all translations for locale <te>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsTe {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'గంటలు',
			'timePicker.minutes' => 'నిమిషాలు',
			'timePicker.seconds' => 'సెకన్లు',
			'timePicker.period' => 'కాలం',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'తేదీని ఎంచుకోండి',
			'input.cut' => 'కత్తిరించు',
			'input.copy' => 'కాపీ చేయి',
			'input.paste' => 'అతికించు',
			'input.selectAll' => 'అన్నీ ఎంచుకో',
			'keyboardToolbar.done' => 'పూర్తయింది',
			_ => null,
		};
	}
}
