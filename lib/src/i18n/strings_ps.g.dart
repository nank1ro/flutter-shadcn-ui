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
class ShadLocalizationsDataPs extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataPs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
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
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataPs _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataPs $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataPs(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerPs timePicker = _ShadLocalizationsDataTimePickerPs._(_root);
	@override late final _ShadLocalizationsDataDatePickerPs datePicker = _ShadLocalizationsDataDatePickerPs._(_root);
	@override late final _ShadLocalizationsDataInputPs input = _ShadLocalizationsDataInputPs._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarPs keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarPs._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerPs extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerPs._(ShadLocalizationsDataPs root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataPs _root; // ignore: unused_field

	// Translations
	@override String get hours => 'ساعتونه';
	@override String get minutes => 'دقیقې';
	@override String get seconds => 'ثانیې';
	@override String get period => 'وخت';
	@override String get periodPlaceholder => 'غ.م';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerPs extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerPs._(ShadLocalizationsDataPs root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataPs _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'نیټه غوره کړئ';
}

// Path: input
class _ShadLocalizationsDataInputPs extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputPs._(ShadLocalizationsDataPs root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataPs _root; // ignore: unused_field

	// Translations
	@override String get cut => 'پرې کړئ';
	@override String get copy => 'کاپي کړئ';
	@override String get paste => 'پیسټ کړئ';
	@override String get selectAll => 'ټول غوره کړئ';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarPs extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarPs._(ShadLocalizationsDataPs root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataPs _root; // ignore: unused_field

	// Translations
	@override String get done => 'سم دی';
}

/// The flat map containing all translations for locale <ps>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataPs {
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
