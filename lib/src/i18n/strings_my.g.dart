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
class ShadLocalizationsDataMy extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataMy({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.my,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <my>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataMy _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataMy $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataMy(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerMy timePicker = _ShadLocalizationsDataTimePickerMy._(_root);
	@override late final _ShadLocalizationsDataDatePickerMy datePicker = _ShadLocalizationsDataDatePickerMy._(_root);
	@override late final _ShadLocalizationsDataInputMy input = _ShadLocalizationsDataInputMy._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarMy keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarMy._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerMy extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerMy._(ShadLocalizationsDataMy root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataMy _root; // ignore: unused_field

	// Translations
	@override String get hours => 'နာရီ';
	@override String get minutes => 'မိနစ်';
	@override String get seconds => 'စက္ကန့်';
	@override String get period => 'အချိန်ကာလ';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerMy extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerMy._(ShadLocalizationsDataMy root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataMy _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'ရက်စွဲရွေးချယ်ပါ';
}

// Path: input
class _ShadLocalizationsDataInputMy extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputMy._(ShadLocalizationsDataMy root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataMy _root; // ignore: unused_field

	// Translations
	@override String get cut => 'ဖြတ်';
	@override String get copy => 'မိတ္တူကူး';
	@override String get paste => 'ကူးထည့်';
	@override String get selectAll => 'အားလုံးရွေးချယ်';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarMy extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarMy._(ShadLocalizationsDataMy root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataMy _root; // ignore: unused_field

	// Translations
	@override String get done => 'ပြီးပြီ';
}

/// The flat map containing all translations for locale <my>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataMy {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'နာရီ',
			'timePicker.minutes' => 'မိနစ်',
			'timePicker.seconds' => 'စက္ကန့်',
			'timePicker.period' => 'အချိန်ကာလ',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'ရက်စွဲရွေးချယ်ပါ',
			'input.cut' => 'ဖြတ်',
			'input.copy' => 'မိတ္တူကူး',
			'input.paste' => 'ကူးထည့်',
			'input.selectAll' => 'အားလုံးရွေးချယ်',
			'keyboardToolbar.done' => 'ပြီးပြီ',
			_ => null,
		};
	}
}
