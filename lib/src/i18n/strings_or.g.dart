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
class ShadLocalizationsDataOr extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataOr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.or,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <or>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataOr _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataOr $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataOr(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerOr timePicker = _ShadLocalizationsDataTimePickerOr._(_root);
	@override late final _ShadLocalizationsDataDatePickerOr datePicker = _ShadLocalizationsDataDatePickerOr._(_root);
	@override late final _ShadLocalizationsDataInputOr input = _ShadLocalizationsDataInputOr._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarOr keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarOr._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerOr extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerOr._(ShadLocalizationsDataOr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataOr _root; // ignore: unused_field

	// Translations
	@override String get hours => 'ଘଣ୍ଟା';
	@override String get minutes => 'ମିନିଟ';
	@override String get seconds => 'ସେକେଣ୍ଡ';
	@override String get period => 'ସମୟ';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerOr extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerOr._(ShadLocalizationsDataOr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataOr _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'ତାରିଖ ବାଛନ୍ତୁ';
}

// Path: input
class _ShadLocalizationsDataInputOr extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputOr._(ShadLocalizationsDataOr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataOr _root; // ignore: unused_field

	// Translations
	@override String get cut => 'କଟ';
	@override String get copy => 'କପି';
	@override String get paste => 'ପେଷ୍ଟ';
	@override String get selectAll => 'ସବୁ ଚୟନ କରନ୍ତୁ';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarOr extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarOr._(ShadLocalizationsDataOr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataOr _root; // ignore: unused_field

	// Translations
	@override String get done => 'ସମ୍ପନ୍ନ';
}

/// The flat map containing all translations for locale <or>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataOr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'ଘଣ୍ଟା',
			'timePicker.minutes' => 'ମିନିଟ',
			'timePicker.seconds' => 'ସେକେଣ୍ଡ',
			'timePicker.period' => 'ସମୟ',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'ତାରିଖ ବାଛନ୍ତୁ',
			'input.cut' => 'କଟ',
			'input.copy' => 'କପି',
			'input.paste' => 'ପେଷ୍ଟ',
			'input.selectAll' => 'ସବୁ ଚୟନ କରନ୍ତୁ',
			'keyboardToolbar.done' => 'ସମ୍ପନ୍ନ',
			_ => null,
		};
	}
}
