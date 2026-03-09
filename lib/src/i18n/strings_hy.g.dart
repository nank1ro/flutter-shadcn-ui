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
class ShadLocalizationsDataHy extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataHy({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.hy,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <hy>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataHy _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataHy $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataHy(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerHy timePicker = _ShadLocalizationsDataTimePickerHy._(_root);
	@override late final _ShadLocalizationsDataDatePickerHy datePicker = _ShadLocalizationsDataDatePickerHy._(_root);
	@override late final _ShadLocalizationsDataInputHy input = _ShadLocalizationsDataInputHy._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarHy keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarHy._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerHy extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerHy._(ShadLocalizationsDataHy root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataHy _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Ժամ';
	@override String get minutes => 'Րոպե';
	@override String get seconds => 'Վայրկյան';
	@override String get period => 'Ժամաշրջան';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerHy extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerHy._(ShadLocalizationsDataHy root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataHy _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Ընտրեք ամսաթիվ';
}

// Path: input
class _ShadLocalizationsDataInputHy extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputHy._(ShadLocalizationsDataHy root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataHy _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Կտրել';
	@override String get copy => 'Պատճենել';
	@override String get paste => 'Տեղադրել';
	@override String get selectAll => 'Ընտրել բոլորը';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarHy extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarHy._(ShadLocalizationsDataHy root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataHy _root; // ignore: unused_field

	// Translations
	@override String get done => 'Պատրաստ';
}

/// The flat map containing all translations for locale <hy>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataHy {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Ժամ',
			'timePicker.minutes' => 'Րոպե',
			'timePicker.seconds' => 'Վայրկյան',
			'timePicker.period' => 'Ժամաշրջան',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Ընտրեք ամսաթիվ',
			'input.cut' => 'Կտրել',
			'input.copy' => 'Պատճենել',
			'input.paste' => 'Տեղադրել',
			'input.selectAll' => 'Ընտրել բոլորը',
			'keyboardToolbar.done' => 'Պատրաստ',
			_ => null,
		};
	}
}
