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
	@override late final _ShadLocalizationsData$timePicker$mr timePicker = _ShadLocalizationsData$timePicker$mr._(_root);
	@override late final _ShadLocalizationsData$datePicker$mr datePicker = _ShadLocalizationsData$datePicker$mr._(_root);
	@override late final _ShadLocalizationsData$input$mr input = _ShadLocalizationsData$input$mr._(_root);
	@override late final _ShadLocalizationsData$keyboardToolbar$mr keyboardToolbar = _ShadLocalizationsData$keyboardToolbar$mr._(_root);
}

// Path: timePicker
class _ShadLocalizationsData$timePicker$mr extends ShadLocalizationsData$timePicker$en {
	_ShadLocalizationsData$timePicker$mr._(ShadLocalizationsDataMr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataMr _root; // ignore: unused_field

	// Translations
	@override String get hours => 'तास';
	@override String get minutes => 'मिनिटे';
	@override String get seconds => 'सेकंद';
	@override String get period => 'कालावधी';
	@override String get periodPlaceholder => 'AM';
}

// Path: datePicker
class _ShadLocalizationsData$datePicker$mr extends ShadLocalizationsData$datePicker$en {
	_ShadLocalizationsData$datePicker$mr._(ShadLocalizationsDataMr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataMr _root; // ignore: unused_field

	// Translations
	@override String get selectDate => 'तारीख निवडा';
}

// Path: input
class _ShadLocalizationsData$input$mr extends ShadLocalizationsData$input$en {
	_ShadLocalizationsData$input$mr._(ShadLocalizationsDataMr root) : this._root = root, super.internal(root);

	final ShadLocalizationsDataMr _root; // ignore: unused_field

	// Translations
	@override String get cut => 'कट';
	@override String get copy => 'कॉपी';
	@override String get paste => 'पेस्ट';
	@override String get selectAll => 'सर्व निवडा';
}

// Path: keyboardToolbar
class _ShadLocalizationsData$keyboardToolbar$mr extends ShadLocalizationsData$keyboardToolbar$en {
	_ShadLocalizationsData$keyboardToolbar$mr._(ShadLocalizationsDataMr root) : this._root = root, super.internal(root);

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
