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
class ShadLocalizationsSi extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsSi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.si,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <si>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsSi _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsSi $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsSi(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerSi timePicker = _ShadLocalizationsTimePickerSi._(_root);
	@override late final _ShadLocalizationsDatePickerSi datePicker = _ShadLocalizationsDatePickerSi._(_root);
	@override late final _ShadLocalizationsInputSi input = _ShadLocalizationsInputSi._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarSi keyboardToolbar = _ShadLocalizationsKeyboardToolbarSi._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerSi extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerSi._(ShadLocalizationsSi root) : this._root = root, super.internal(root);

	final ShadLocalizationsSi _root; // ignore: unused_field

	// Translations
	@override String get hours => 'පැය';
	@override String get minutes => 'මිනිත්තු';
	@override String get seconds => 'තත්පර';
	@override String get period => 'කාලය';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerSi extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerSi._(ShadLocalizationsSi root) : this._root = root, super.internal(root);

	final ShadLocalizationsSi _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'දිනය තෝරන්න';
}

// Path: input
class _ShadLocalizationsInputSi extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputSi._(ShadLocalizationsSi root) : this._root = root, super.internal(root);

	final ShadLocalizationsSi _root; // ignore: unused_field

	// Translations
	@override String get cut => 'කපන්න';
	@override String get copy => 'පිටපත් කරන්න';
	@override String get paste => 'අලවන්න';
	@override String get selectAll => 'සියල්ල තෝරන්න';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarSi extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarSi._(ShadLocalizationsSi root) : this._root = root, super.internal(root);

	final ShadLocalizationsSi _root; // ignore: unused_field

	// Translations
	@override String get done => 'සිදු විය';
}

/// The flat map containing all translations for locale <si>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsSi {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'පැය',
			'timePicker.minutes' => 'මිනිත්තු',
			'timePicker.seconds' => 'තත්පර',
			'timePicker.period' => 'කාලය',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'දිනය තෝරන්න',
			'input.cut' => 'කපන්න',
			'input.copy' => 'පිටපත් කරන්න',
			'input.paste' => 'අලවන්න',
			'input.selectAll' => 'සියල්ල තෝරන්න',
			'keyboardToolbar.done' => 'සිදු විය',
			_ => null,
		};
	}
}
