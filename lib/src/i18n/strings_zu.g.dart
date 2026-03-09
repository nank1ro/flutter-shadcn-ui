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
class ShadLocalizationsZu extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsZu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.zu,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zu>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsZu _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsZu $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsZu(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerZu timePicker = _ShadLocalizationsTimePickerZu._(_root);
	@override late final _ShadLocalizationsDatePickerZu datePicker = _ShadLocalizationsDatePickerZu._(_root);
	@override late final _ShadLocalizationsInputZu input = _ShadLocalizationsInputZu._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarZu keyboardToolbar = _ShadLocalizationsKeyboardToolbarZu._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerZu extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerZu._(ShadLocalizationsZu root) : this._root = root, super.internal(root);

	final ShadLocalizationsZu _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Amahora';
	@override String get minutes => 'Amaminithi';
	@override String get seconds => 'Amasekhondi';
	@override String get period => 'Isikhathi';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerZu extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerZu._(ShadLocalizationsZu root) : this._root = root, super.internal(root);

	final ShadLocalizationsZu _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Khetha usuku';
}

// Path: input
class _ShadLocalizationsInputZu extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputZu._(ShadLocalizationsZu root) : this._root = root, super.internal(root);

	final ShadLocalizationsZu _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Sika';
	@override String get copy => 'Kopisha';
	@override String get paste => 'Namathisela';
	@override String get selectAll => 'Khetha konke';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarZu extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarZu._(ShadLocalizationsZu root) : this._root = root, super.internal(root);

	final ShadLocalizationsZu _root; // ignore: unused_field

	// Translations
	@override String get done => 'Kuqediwe';
}

/// The flat map containing all translations for locale <zu>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsZu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Amahora',
			'timePicker.minutes' => 'Amaminithi',
			'timePicker.seconds' => 'Amasekhondi',
			'timePicker.period' => 'Isikhathi',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Khetha usuku',
			'input.cut' => 'Sika',
			'input.copy' => 'Kopisha',
			'input.paste' => 'Namathisela',
			'input.selectAll' => 'Khetha konke',
			'keyboardToolbar.done' => 'Kuqediwe',
			_ => null,
		};
	}
}
