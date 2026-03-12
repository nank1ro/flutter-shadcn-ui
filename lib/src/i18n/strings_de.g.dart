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
class ShadLocalizationsDataDe extends ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDataDe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.de,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <de>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDataDe _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDataDe $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsDataDe(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsDataTimePickerDe timePicker = _ShadLocalizationsDataTimePickerDe._(_root);
	@override late final _ShadLocalizationsDataDatePickerDe datePicker = _ShadLocalizationsDataDatePickerDe._(_root);
	@override late final _ShadLocalizationsDataInputDe input = _ShadLocalizationsDataInputDe._(_root);
	@override late final _ShadLocalizationsDataKeyboardToolbarDe keyboardToolbar = _ShadLocalizationsDataKeyboardToolbarDe._(_root);
}

// Path: timePicker
class _ShadLocalizationsDataTimePickerDe extends ShadLocalizationsDataTimePickerEn {
	_ShadLocalizationsDataTimePickerDe._(ShadLocalizationsDataDe root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataDe _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Stunden';
	@override String get minutes => 'Minuten';
	@override String get seconds => 'Sekunden';
	@override String get period => 'Zeitraum';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDataDatePickerDe extends ShadLocalizationsDataDatePickerEn {
	_ShadLocalizationsDataDatePickerDe._(ShadLocalizationsDataDe root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataDe _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Datum auswählen';
}

// Path: input
class _ShadLocalizationsDataInputDe extends ShadLocalizationsDataInputEn {
	_ShadLocalizationsDataInputDe._(ShadLocalizationsDataDe root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataDe _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Ausschneiden';
	@override String get copy => 'Kopieren';
	@override String get paste => 'Einfügen';
	@override String get selectAll => 'Alles auswählen';
}

// Path: keyboardToolbar
class _ShadLocalizationsDataKeyboardToolbarDe extends ShadLocalizationsDataKeyboardToolbarEn {
	_ShadLocalizationsDataKeyboardToolbarDe._(ShadLocalizationsDataDe root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataDe _root; // ignore: unused_field

	// Translations
	@override String get done => 'Fertig';
}

/// The flat map containing all translations for locale <de>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDataDe {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Stunden',
			'timePicker.minutes' => 'Minuten',
			'timePicker.seconds' => 'Sekunden',
			'timePicker.period' => 'Zeitraum',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Datum auswählen',
			'input.cut' => 'Ausschneiden',
			'input.copy' => 'Kopieren',
			'input.paste' => 'Einfügen',
			'input.selectAll' => 'Alles auswählen',
			'keyboardToolbar.done' => 'Fertig',
			_ => null,
		};
	}
}
