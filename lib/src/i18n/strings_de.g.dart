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
class ShadLocalizationsDe extends ShadLocalizations with BaseTranslations<ShadLocale, ShadLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsDe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizations>? meta})
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
	@override final TranslationMetadata<ShadLocale, ShadLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final ShadLocalizationsDe _root = this; // ignore: unused_field

	@override 
	ShadLocalizationsDe $copyWith({TranslationMetadata<ShadLocale, ShadLocalizations>? meta}) => ShadLocalizationsDe(meta: meta ?? this.$meta);

	// Translations
	@override late final _ShadLocalizationsTimePickerDe timePicker = _ShadLocalizationsTimePickerDe._(_root);
	@override late final _ShadLocalizationsDatePickerDe datePicker = _ShadLocalizationsDatePickerDe._(_root);
	@override late final _ShadLocalizationsInputDe input = _ShadLocalizationsInputDe._(_root);
	@override late final _ShadLocalizationsKeyboardToolbarDe keyboardToolbar = _ShadLocalizationsKeyboardToolbarDe._(_root);
}

// Path: timePicker
class _ShadLocalizationsTimePickerDe extends ShadLocalizationsTimePickerEn {
	_ShadLocalizationsTimePickerDe._(ShadLocalizationsDe root) : this._root = root, super.internal(root);

	final ShadLocalizationsDe _root; // ignore: unused_field

	// Translations
	@override String get hours => 'Stunden';
	@override String get minutes => 'Minuten';
	@override String get seconds => 'Sekunden';
	@override String get period => 'Zeitraum';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsDatePickerDe extends ShadLocalizationsDatePickerEn {
	_ShadLocalizationsDatePickerDe._(ShadLocalizationsDe root) : this._root = root, super.internal(root);

	final ShadLocalizationsDe _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'Datum auswählen';
}

// Path: input
class _ShadLocalizationsInputDe extends ShadLocalizationsInputEn {
	_ShadLocalizationsInputDe._(ShadLocalizationsDe root) : this._root = root, super.internal(root);

	final ShadLocalizationsDe _root; // ignore: unused_field

	// Translations
	@override String get cut => 'Ausschneiden';
	@override String get copy => 'Kopieren';
	@override String get paste => 'Einfügen';
	@override String get selectAll => 'Alles auswählen';
}

// Path: keyboardToolbar
class _ShadLocalizationsKeyboardToolbarDe extends ShadLocalizationsKeyboardToolbarEn {
	_ShadLocalizationsKeyboardToolbarDe._(ShadLocalizationsDe root) : this._root = root, super.internal(root);

	final ShadLocalizationsDe _root; // ignore: unused_field

	// Translations
	@override String get done => 'Fertig';
}

/// The flat map containing all translations for locale <de>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsDe {
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
