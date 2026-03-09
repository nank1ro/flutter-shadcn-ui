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
class ShadLocalizationsGsw extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsGsw({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.gsw,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <gsw>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsGsw _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsGsw $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsGsw(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerGsw timePicker = _ShadLocalizationsTimePickerGsw._(_root);
	@override late final _ShadLocalizationsDatePickerGsw datePicker = _ShadLocalizationsDatePickerGsw._(_root);
	@override late final _ShadLocalizationsInputGsw input = _ShadLocalizationsInputGsw._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarGsw keyboardToolbar = _ShadLocalizationsKeyboardToolbarGsw._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerGsw extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerGsw._(ShadLocalizationsGsw root) : this._root = root, super.internal(root);

	final ShadLocalizationsGsw _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Stunde';
	@override String get minutes => 'Minuute';
	@override String get seconds => 'Sekunde';
	@override String get period => 'Ziitraum';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerGsw extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerGsw._(ShadLocalizationsGsw root) : this._root = root, super.internal(root);

	final ShadLocalizationsGsw _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Datum uswähle';
}

// Path: input
class _ShadLocalizationsInputGsw extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputGsw._(ShadLocalizationsGsw root) : this._root = root, super.internal(root);

	final ShadLocalizationsGsw _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Usschnide';
	@override String get copy => 'Kopiere';
	@override String get paste => 'Iifüege';
	@override String get selectAll => 'Alles uswähle';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarGsw extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarGsw._(ShadLocalizationsGsw root) : this._root = root, super.internal(root);

	final ShadLocalizationsGsw _root; // ignore: unused_field

	// Translations
	@override String get done => 'Fertig';
}

/// The flat map containing all translations for locale <gsw>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsGsw {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Stunde',
			'timePicker.minutes' => 'Minuute',
			'timePicker.seconds' => 'Sekunde',
			'timePicker.period' => 'Ziitraum',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Datum uswähle',
			'input.cut' => 'Usschnide',
			'input.copy' => 'Kopiere',
			'input.paste' => 'Iifüege',
			'input.selectAll' => 'Alles uswähle',
			'keyboardToolbar.done' => 'Fertig',
			_ => null,
		};
	}
}
