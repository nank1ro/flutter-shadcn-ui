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
class ShadLocalizationsPs extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsPs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.ps,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ps>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsPs _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsPs $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsPs(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerPs timePicker = _ShadLocalizationsTimePickerPs._(_root);
	@override late final _ShadLocalizationsDatePickerPs datePicker = _ShadLocalizationsDatePickerPs._(_root);
	@override late final _ShadLocalizationsInputPs input = _ShadLocalizationsInputPs._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarPs keyboardToolbar = _ShadLocalizationsKeyboardToolbarPs._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerPs extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerPs._(ShadLocalizationsPs root) : this._root = root, super.internal(root);

	final ShadLocalizationsPs _root; // ignore: unused_field

	// Translations
	@override String get hours => 'ساعتونه';
	@override String get minutes => 'دقیقې';
	@override String get seconds => 'ثانیې';
	@override String get period => 'وخت';
	@override String get periodPlaceholder => 'غ.م';
}

// Path: datePicker
class _ShadLocalizationsDatePickerPs extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerPs._(ShadLocalizationsPs root) : this._root = root, super.internal(root);

	final ShadLocalizationsPs _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'نیټه غوره کړئ';
}

// Path: input
class _ShadLocalizationsInputPs extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputPs._(ShadLocalizationsPs root) : this._root = root, super.internal(root);

	final ShadLocalizationsPs _root; // ignore: unused_field

	// Translations
	@override String get cut => 'پرې کړئ';
	@override String get copy => 'کاپي کړئ';
	@override String get paste => 'پیسټ کړئ';
	@override String get selectAll => 'ټول غوره کړئ';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarPs extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarPs._(ShadLocalizationsPs root) : this._root = root, super.internal(root);

	final ShadLocalizationsPs _root; // ignore: unused_field

	// Translations
	@override String get done => 'سم دی';
}

/// The flat map containing all translations for locale <ps>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsPs {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'ساعتونه',
			'timePicker.minutes' => 'دقیقې',
			'timePicker.seconds' => 'ثانیې',
			'timePicker.period' => 'وخت',
			'timePicker.periodPlaceholder' => 'غ.م',
			'datePicker.selectDate' => 'نیټه غوره کړئ',
			'input.cut' => 'پرې کړئ',
			'input.copy' => 'کاپي کړئ',
			'input.paste' => 'پیسټ کړئ',
			'input.selectAll' => 'ټول غوره کړئ',
			'keyboardToolbar.done' => 'سم دی',
			_ => null,
		};
	}
}
