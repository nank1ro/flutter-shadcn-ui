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
class ShadLocalizationsMr extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsMr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.mr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <mr>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsMr _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsMr $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsMr(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerMr timePicker = _ShadLocalizationsTimePickerMr._(_root);
	@override late final _ShadLocalizationsDatePickerMr datePicker = _ShadLocalizationsDatePickerMr._(_root);
	@override late final _ShadLocalizationsInputMr input = _ShadLocalizationsInputMr._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarMr keyboardToolbar = _ShadLocalizationsKeyboardToolbarMr._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerMr extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerMr._(ShadLocalizationsMr root) : this._root = root, super.internal(root);

	final ShadLocalizationsMr _root; // ignore: unused_field

	// Translations
	@override String get hours => 'तास';
	@override String get minutes => 'मिनिटे';
	@override String get seconds => 'सेकंद';
	@override String get period => 'कालावधी';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerMr extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerMr._(ShadLocalizationsMr root) : this._root = root, super.internal(root);

	final ShadLocalizationsMr _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'तारीख निवडा';
}

// Path: input
class _ShadLocalizationsInputMr extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputMr._(ShadLocalizationsMr root) : this._root = root, super.internal(root);

	final ShadLocalizationsMr _root; // ignore: unused_field

	// Translations
	@override String get cut => 'कट';
	@override String get copy => 'कॉपी';
	@override String get paste => 'पेस्ट';
	@override String get selectAll => 'सर्व निवडा';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarMr extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarMr._(ShadLocalizationsMr root) : this._root = root, super.internal(root);

	final ShadLocalizationsMr _root; // ignore: unused_field

	// Translations
	@override String get done => 'पूर्ण';
}

/// The flat map containing all translations for locale <mr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsMr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'तास',
			'timePicker.minutes' => 'मिनिटे',
			'timePicker.seconds' => 'सेकंद',
			'timePicker.period' => 'कालावधी',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'तारीख निवडा',
			'input.cut' => 'कट',
			'input.copy' => 'कॉपी',
			'input.paste' => 'पेस्ट',
			'input.selectAll' => 'सर्व निवडा',
			'keyboardToolbar.done' => 'पूर्ण',
			_ => null,
		};
	}
}
