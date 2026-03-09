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
class ShadLocalizationsCy extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsCy({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.cy,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <cy>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsCy _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsCy $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsCy(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerCy timePicker = _ShadLocalizationsTimePickerCy._(_root);
	@override late final _ShadLocalizationsDatePickerCy datePicker = _ShadLocalizationsDatePickerCy._(_root);
	@override late final _ShadLocalizationsInputCy input = _ShadLocalizationsInputCy._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarCy keyboardToolbar = _ShadLocalizationsKeyboardToolbarCy._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerCy extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerCy._(ShadLocalizationsCy root) : this._root = root, super.internal(root);

	final ShadLocalizationsCy _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Oriau';
	@override String get minutes => 'Munudau';
	@override String get seconds => 'Eiliadau';
	@override String get period => 'Cyfnod';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerCy extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerCy._(ShadLocalizationsCy root) : this._root = root, super.internal(root);

	final ShadLocalizationsCy _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Dewiswch ddyddiad';
}

// Path: input
class _ShadLocalizationsInputCy extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputCy._(ShadLocalizationsCy root) : this._root = root, super.internal(root);

	final ShadLocalizationsCy _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Torri';
	@override String get copy => 'Copïo';
	@override String get paste => 'Gludo';
	@override String get selectAll => 'Dewis y cyfan';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarCy extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarCy._(ShadLocalizationsCy root) : this._root = root, super.internal(root);

	final ShadLocalizationsCy _root; // ignore: unused_field

	// Translations
	@override String get done => 'Gorffen';
}

/// The flat map containing all translations for locale <cy>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsCy {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Oriau',
			'timePicker.minutes' => 'Munudau',
			'timePicker.seconds' => 'Eiliadau',
			'timePicker.period' => 'Cyfnod',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Dewiswch ddyddiad',
			'input.cut' => 'Torri',
			'input.copy' => 'Copïo',
			'input.paste' => 'Gludo',
			'input.selectAll' => 'Dewis y cyfan',
			'keyboardToolbar.done' => 'Gorffen',
			_ => null,
		};
	}
}
