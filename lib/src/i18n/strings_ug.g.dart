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
class ShadLocalizationsUg extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsUg({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.ug,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ug>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsUg _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsUg $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsUg(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerUg timePicker = _ShadLocalizationsTimePickerUg._(_root);
	@override late final _ShadLocalizationsDatePickerUg datePicker = _ShadLocalizationsDatePickerUg._(_root);
	@override late final _ShadLocalizationsInputUg input = _ShadLocalizationsInputUg._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarUg keyboardToolbar = _ShadLocalizationsKeyboardToolbarUg._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerUg extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerUg._(ShadLocalizationsUg root) : this._root = root, super.internal(root);

	final ShadLocalizationsUg _root; // ignore: unused_field

	// Translations
	@override String get hours => 'سائەت';
	@override String get minutes => 'مىنۇت';
	@override String get seconds => 'سېكۇنت';
	@override String get period => 'ۋاقىت';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerUg extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerUg._(ShadLocalizationsUg root) : this._root = root, super.internal(root);

	final ShadLocalizationsUg _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'چېسلا تاللاڭ';
}

// Path: input
class _ShadLocalizationsInputUg extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputUg._(ShadLocalizationsUg root) : this._root = root, super.internal(root);

	final ShadLocalizationsUg _root; // ignore: unused_field

	// Translations
	@override String get cut => 'كەس';
	@override String get copy => 'كۆچۈر';
	@override String get paste => 'چاپلا';
	@override String get selectAll => 'ھەممىنى تاللا';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarUg extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarUg._(ShadLocalizationsUg root) : this._root = root, super.internal(root);

	final ShadLocalizationsUg _root; // ignore: unused_field

	// Translations
	@override String get done => 'تامام';
}

/// The flat map containing all translations for locale <ug>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsUg {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'سائەت',
			'timePicker.minutes' => 'مىنۇت',
			'timePicker.seconds' => 'سېكۇنت',
			'timePicker.period' => 'ۋاقىت',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'چېسلا تاللاڭ',
			'input.cut' => 'كەس',
			'input.copy' => 'كۆچۈر',
			'input.paste' => 'چاپلا',
			'input.selectAll' => 'ھەممىنى تاللا',
			'keyboardToolbar.done' => 'تامام',
			_ => null,
		};
	}
}
