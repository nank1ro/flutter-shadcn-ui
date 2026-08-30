///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef ShadLocalizationsDataEn = ShadLocalizationsData; // ignore: unused_element
class ShadLocalizationsData with BaseTranslations<ShadLocale, ShadLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [ShadLocale.build] is preferred.
	ShadLocalizationsData({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: ShadLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<ShadLocale, ShadLocalizationsData> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final ShadLocalizationsData _root = this; // ignore: unused_field

	ShadLocalizationsData $copyWith({TranslationMetadata<ShadLocale, ShadLocalizationsData>? meta}) => ShadLocalizationsData(meta: meta ?? this.$meta);

	// Translations
	late final ShadLocalizationsData$timePicker$en timePicker = ShadLocalizationsData$timePicker$en.internal(_root);
	late final ShadLocalizationsData$datePicker$en datePicker = ShadLocalizationsData$datePicker$en.internal(_root);
	late final ShadLocalizationsData$input$en input = ShadLocalizationsData$input$en.internal(_root);
	late final ShadLocalizationsData$keyboardToolbar$en keyboardToolbar = ShadLocalizationsData$keyboardToolbar$en.internal(_root);
}

// Path: timePicker
class ShadLocalizationsData$timePicker$en {
	ShadLocalizationsData$timePicker$en.internal(this._root);

	final ShadLocalizationsData _root; // ignore: unused_field

	// Translations

	/// en: 'Hours'
	String get hours => 'Hours';

	/// en: 'Minutes'
	String get minutes => 'Minutes';

	/// en: 'Seconds'
	String get seconds => 'Seconds';

	/// en: 'Period'
	String get period => 'Period';

	/// en: 'AM'
	String get periodPlaceholder => 'AM';
}

// Path: datePicker
class ShadLocalizationsData$datePicker$en {
	ShadLocalizationsData$datePicker$en.internal(this._root);

	final ShadLocalizationsData _root; // ignore: unused_field

	// Translations

	/// en: 'Select date'
	String get selectDate => 'Select date';
}

// Path: input
class ShadLocalizationsData$input$en {
	ShadLocalizationsData$input$en.internal(this._root);

	final ShadLocalizationsData _root; // ignore: unused_field

	// Translations

	/// en: 'Cut'
	String get cut => 'Cut';

	/// en: 'Copy'
	String get copy => 'Copy';

	/// en: 'Paste'
	String get paste => 'Paste';

	/// en: 'Select All'
	String get selectAll => 'Select All';
}

// Path: keyboardToolbar
class ShadLocalizationsData$keyboardToolbar$en {
	ShadLocalizationsData$keyboardToolbar$en.internal(this._root);

	final ShadLocalizationsData _root; // ignore: unused_field

	// Translations

	/// en: 'Done'
	String get done => 'Done';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ShadLocalizationsData {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'timePicker.hours' => 'Hours',
			'timePicker.minutes' => 'Minutes',
			'timePicker.seconds' => 'Seconds',
			'timePicker.period' => 'Period',
			'timePicker.periodPlaceholder' => 'AM',
			'datePicker.selectDate' => 'Select date',
			'input.cut' => 'Cut',
			'input.copy' => 'Copy',
			'input.paste' => 'Paste',
			'input.selectAll' => 'Select All',
			'keyboardToolbar.done' => 'Done',
			_ => null,
		};
	}
}
