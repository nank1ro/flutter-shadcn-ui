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
class ShadLocalizationsDataGsw extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataGsw({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
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
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataGsw _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataGsw $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataGsw(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerGsw timePicker = _ShadLocalizationsDataTimePickerGsw._(_root);
	@override late final _ShadLocalizationsDataDatePickerGsw datePicker = _ShadLocalizationsDataDatePickerGsw._(_root);
	@override late final _ShadLocalizationsDataInputGsw input = _ShadLocalizationsDataInputGsw._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarGsw keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarGsw._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerGsw extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerGsw._(ShadLocalizationsDataGsw root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataGsw _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Stunde';
	@override String get minutes => 'Minuute';
	@override String get seconds => 'Sekunde';
	@override String get period => 'Ziitraum';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerGsw extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerGsw._(ShadLocalizationsDataGsw root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataGsw _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Datum uswähle';
}

// Path: input
class _ShadLocalizationsDataInputGsw extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputGsw._(ShadLocalizationsDataGsw root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataGsw _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Usschnide';
	@override String get copy => 'Kopiere';
	@override String get paste => 'Iifüege';
	@override String get selectAll => 'Alles uswähle';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarGsw extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarGsw._(ShadLocalizationsDataGsw root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataGsw _root; // ignore: unused_field

	// Translations
	@override String get done => 'Fertig';
}

/// The flat map containing all translations for locale <gsw>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataGsw {
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
