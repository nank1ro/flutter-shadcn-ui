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
class ShadLocalizationsDataEl extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataEl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.el,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <el>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataEl _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataEl $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataEl(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerEl timePicker = _ShadLocalizationsDataTimePickerEl._(_root);
	@override late final _ShadLocalizationsDataDatePickerEl datePicker = _ShadLocalizationsDataDatePickerEl._(_root);
	@override late final _ShadLocalizationsDataInputEl input = _ShadLocalizationsDataInputEl._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarEl keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarEl._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerEl extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerEl._(ShadLocalizationsDataEl root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataEl _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Ώρες';
	@override String get minutes => 'Λεπτά';
	@override String get seconds => 'Δευτερόλεπτα';
	@override String get period => 'Περίοδος';
	@override String get periodPlaceholder => 'πμ';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerEl extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerEl._(ShadLocalizationsDataEl root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataEl _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Επιλογή ημερομηνίας';
}

// Path: input
class _ShadLocalizationsDataInputEl extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputEl._(ShadLocalizationsDataEl root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataEl _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Αποκοπή';
	@override String get copy => 'Αντιγραφή';
	@override String get paste => 'Επικόλληση';
	@override String get selectAll => 'Επιλογή όλων';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarEl extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarEl._(ShadLocalizationsDataEl root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataEl _root; // ignore: unused_field

	// Translations
	@override String get done => 'Τέλος';
}

/// The flat map containing all translations for locale <el>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataEl {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Ώρες',
			'timePicker.minutes' => 'Λεπτά',
			'timePicker.seconds' => 'Δευτερόλεπτα',
			'timePicker.period' => 'Περίοδος',
			'timePicker.periodPlaceholder' => 'πμ',
			'datePicker.selectDate' => 'Επιλογή ημερομηνίας',
			'input.cut' => 'Αποκοπή',
			'input.copy' => 'Αντιγραφή',
			'input.paste' => 'Επικόλληση',
			'input.selectAll' => 'Επιλογή όλων',
			'keyboardToolbar.done' => 'Τέλος',
			_ => null,
		};
	}
}
