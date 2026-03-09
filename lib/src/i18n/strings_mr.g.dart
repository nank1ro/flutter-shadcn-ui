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
class ShadLocalizationsDataMr extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataMr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
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
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataMr _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataMr $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataMr(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerMr timePicker = _ShadLocalizationsDataTimePickerMr._(_root);
	@override late final _ShadLocalizationsDataDatePickerMr datePicker = _ShadLocalizationsDataDatePickerMr._(_root);
	@override late final _ShadLocalizationsDataInputMr input = _ShadLocalizationsDataInputMr._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarMr keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarMr._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerMr extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerMr._(ShadLocalizationsDataMr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataMr _root; // ignore: unused_field

	// Translations
	@override String get hours => 'तास';
	@override String get minutes => 'मिनिटे';
	@override String get seconds => 'सेकंद';
	@override String get period => 'कालावधी';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerMr extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerMr._(ShadLocalizationsDataMr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataMr _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'तारीख निवडा';
}

// Path: input
class _ShadLocalizationsDataInputMr extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputMr._(ShadLocalizationsDataMr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataMr _root; // ignore: unused_field

	// Translations
	@override String get cut => 'कट';
	@override String get copy => 'कॉपी';
	@override String get paste => 'पेस्ट';
	@override String get selectAll => 'सर्व निवडा';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarMr extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarMr._(ShadLocalizationsDataMr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataMr _root; // ignore: unused_field

	// Translations
	@override String get done => 'पूर्ण';
}

/// The flat map containing all translations for locale <mr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataMr {
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
