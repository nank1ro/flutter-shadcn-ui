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
class ShadLocalizationsIs extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsIs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.icelandic,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <is>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsIs _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsIs $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsIs(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerIs timePicker = _ShadLocalizationsTimePickerIs._(_root);
	@override late final _ShadLocalizationsDatePickerIs datePicker = _ShadLocalizationsDatePickerIs._(_root);
	@override late final _ShadLocalizationsInputIs input = _ShadLocalizationsInputIs._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarIs keyboardToolbar = _ShadLocalizationsKeyboardToolbarIs._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerIs extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerIs._(ShadLocalizationsIs root) : this._root = root, super.internal(root);

	final ShadLocalizationsIs _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Klukkustundir';
	@override String get minutes => 'Mínútur';
	@override String get seconds => 'Sekúndur';
	@override String get period => 'Tímabil';
	@override String get periodPlaceholder => 'fh';
}

// Path: datePicker
class _ShadLocalizationsDatePickerIs extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerIs._(ShadLocalizationsIs root) : this._root = root, super.internal(root);

	final ShadLocalizationsIs _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Veldu dagsetningu';
}

// Path: input
class _ShadLocalizationsInputIs extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputIs._(ShadLocalizationsIs root) : this._root = root, super.internal(root);

	final ShadLocalizationsIs _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Klippa';
	@override String get copy => 'Afrita';
	@override String get paste => 'Líma';
	@override String get selectAll => 'Velja allt';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarIs extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarIs._(ShadLocalizationsIs root) : this._root = root, super.internal(root);

	final ShadLocalizationsIs _root; // ignore: unused_field

	// Translations
	@override String get done => 'Lokið';
}

/// The flat map containing all translations for locale <is>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsIs {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Klukkustundir',
			'timePicker.minutes' => 'Mínútur',
			'timePicker.seconds' => 'Sekúndur',
			'timePicker.period' => 'Tímabil',
			'timePicker.periodPlaceholder' => 'fh',
			'datePicker.selectDate' => 'Veldu dagsetningu',
			'input.cut' => 'Klippa',
			'input.copy' => 'Afrita',
			'input.paste' => 'Líma',
			'input.selectAll' => 'Velja allt',
			'keyboardToolbar.done' => 'Lokið',
			_ => null,
		};
	}
}
