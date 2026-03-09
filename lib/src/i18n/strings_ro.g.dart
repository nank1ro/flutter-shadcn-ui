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
class ShadLocalizationsRo extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsRo({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.ro,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ro>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsRo _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsRo $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsRo(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerRo timePicker = _ShadLocalizationsTimePickerRo._(_root);
	@override late final _ShadLocalizationsDatePickerRo datePicker = _ShadLocalizationsDatePickerRo._(_root);
	@override late final _ShadLocalizationsInputRo input = _ShadLocalizationsInputRo._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarRo keyboardToolbar = _ShadLocalizationsKeyboardToolbarRo._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerRo extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerRo._(ShadLocalizationsRo root) : this._root = root, super.internal(root);

	final ShadLocalizationsRo _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Ore';
	@override String get minutes => 'Minute';
	@override String get seconds => 'Secunde';
	@override String get period => 'Perioadă';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerRo extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerRo._(ShadLocalizationsRo root) : this._root = root, super.internal(root);

	final ShadLocalizationsRo _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Selectați data';
}

// Path: input
class _ShadLocalizationsInputRo extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputRo._(ShadLocalizationsRo root) : this._root = root, super.internal(root);

	final ShadLocalizationsRo _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Taie';
	@override String get copy => 'Copiază';
	@override String get paste => 'Lipește';
	@override String get selectAll => 'Selectează tot';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarRo extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarRo._(ShadLocalizationsRo root) : this._root = root, super.internal(root);

	final ShadLocalizationsRo _root; // ignore: unused_field

	// Translations
	@override String get done => 'Terminat';
}

/// The flat map containing all translations for locale <ro>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsRo {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Ore',
			'timePicker.minutes' => 'Minute',
			'timePicker.seconds' => 'Secunde',
			'timePicker.period' => 'Perioadă',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Selectați data',
			'input.cut' => 'Taie',
			'input.copy' => 'Copiază',
			'input.paste' => 'Lipește',
			'input.selectAll' => 'Selectează tot',
			'keyboardToolbar.done' => 'Terminat',
			_ => null,
		};
	}
}
