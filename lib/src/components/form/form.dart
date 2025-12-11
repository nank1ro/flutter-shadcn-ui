import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/form/field.dart';

/// Used to configure the auto validation of [FormField and [ShadForm]
/// widgets.
enum ShadAutovalidateMode {
  /// No auto validation will occur.
  disabled,

  /// Used to auto-validate [ShadForm] and [FormField] even without user
  /// interaction.
  always,

  /// Used to auto-validate [ShadForm] and [FormField] only after each user
  /// interaction.
  onUserInteraction,

  /// Used to auto-validate [ShadForm] and [FormField] every time after the
  /// first validation.
  alwaysAfterFirstValidation,
}

/// A typedef representing a map of form field states with dynamic values.
typedef ShadFormFields =
    Map<
      String,
      ShadFormBuilderFieldState<ShadFormBuilderField<dynamic>, dynamic>
    >;

/// A stateful widget that manages a form with validation and field management.
class ShadForm extends StatefulWidget {
  const ShadForm({
    super.key,
    required this.child,
    this.onChanged,
    this.canPop,
    @Deprecated('Use onPopInvokedWithResult instead') this.onPopInvoked,
    this.onPopInvokedWithResult,
    this.autovalidateMode = ShadAutovalidateMode.alwaysAfterFirstValidation,
    this.initialValue = const {},
    this.enabled = true,
    this.skipDisabled = false,
    this.clearValueOnUnregister = false,
  });

  /// Callback when form value changes
  final VoidCallback? onChanged;

  /// Whether the form can be popped from navigation
  final bool? canPop;
  @Deprecated('Use onPopInvokedWithResult instead')
  final void Function(bool)? onPopInvoked;

  /// Callback when form is popped with a result
  final PopInvokedWithResultCallback<Object?>? onPopInvokedWithResult;

  /// The auto validation mode for the form
  final ShadAutovalidateMode autovalidateMode;

  /// The widget tree contained within the form
  final Widget child;

  /// Initial values for form fields
  final Map<String, dynamic> initialValue;

  /// Whether the form fields are enabled
  final bool enabled;

  /// Whether to skip disabled fields during validation
  final bool skipDisabled;

  /// Whether to clear the value of fields when they are unregistered, defaults
  /// to false;
  final bool clearValueOnUnregister;

  @override
  State<ShadForm> createState() => ShadFormState();

  /// Returns the nearest [ShadFormState] from the widget tree
  /// Throws assertion error if not found
  static ShadFormState of(BuildContext context) {
    final state = maybeOf(context);
    assert(state != null, 'No ShadFormState found in context');
    return state!;
  }

  /// Returns the nearest [ShadFormState] from the widget tree or null if not
  /// found
  static ShadFormState? maybeOf(BuildContext context) {
    return (context
                .getElementForInheritedWidgetOfExactType<ShadFormScope>()
                ?.widget
            as ShadFormScope?)
        ?._formState;
  }
}

/// The state class for [ShadForm] managing form fields and validation
class ShadFormState extends State<ShadForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ShadFormFields _fields = {};
  final Map<String, dynamic> _value = {};
  final Map<String, Function> _transformers = {};
  late final ValueNotifier<AutovalidateMode> autovalidateMode;

  /// Returns the registered form fields
  ShadFormFields get fields => _fields;

  /// Returns the initial form values
  Map<String, dynamic> get initialValue => widget.initialValue;

  /// Whether the form is enabled
  bool get enabled => widget.enabled;

  /// Returns an unmodifiable view of the current form values with
  /// transformations applied
  Map<String, dynamic> get value => Map<String, dynamic>.unmodifiable(
    _value.map(
      (key, value) =>
          // ignore: avoid_dynamic_calls
          MapEntry(key, _transformers[key]?.call(value) ?? value),
    ),
  );

  @override
  void initState() {
    super.initState();
    final mode = switch (widget.autovalidateMode) {
      ShadAutovalidateMode.always => AutovalidateMode.always,
      ShadAutovalidateMode.onUserInteraction =>
        AutovalidateMode.onUserInteraction,
      ShadAutovalidateMode.alwaysAfterFirstValidation ||
      ShadAutovalidateMode.disabled => AutovalidateMode.disabled,
    };
    autovalidateMode = ValueNotifier(mode);
  }

  @override
  void dispose() {
    autovalidateMode.dispose();
    super.dispose();
  }

  /// Registers a form field with the specified id
  void registerField(
    String id,
    ShadFormBuilderFieldState<ShadFormBuilderField<dynamic>, dynamic> field,
  ) {
    _fields[id] = field;
    _value[id] = field.initialValue ?? initialValue[id];
    field
      ..registerTransformer(_transformers)
      ..setValue(_value[id]);
  }

  /// Sets the value for a form field with the specified id
  ///
  /// Throws if the field with [id] is not registered with the form.
  ///
  /// The [value] parameter is the new value to set for the field.
  /// This will call the `didChange` method of the field state to update its
  /// value and all the side effects, like validation and notifying listeners.
  ///
  /// If you don't want to trigger those side effects, but only want to change
  /// the form's map value use [setInternalFieldValue] instead.
  void setValue<T>(String id, T? value) {
    setInternalFieldValue(id, value);
    _fields[id]?.didChange(value);
  }

  /// Sets internal value for a form field without calling didChange
  ///
  /// Throws if the field with [id] is not registered with the form.
  ///
  /// If you want to trigger all side effects like validation and notifying
  /// listeners, use [setValue] instead.
  void setInternalFieldValue<T>(String id, T? value) {
    _value[id] = value;
  }

  /// Sets forced internal error for a form field
  /// Throws if the field with [id] is not registered with the form.
  void setInternalFieldError(String id, String? error) {
    final field = _fields[id];
    if (field == null) {
      throw FlutterError(
        'Field with id "$id" not found. '
        'Make sure the field is registered with the form.',
      );
    }
    field.setInternalError(error);
  }

  /// Removes internal field value
  void removeInternalFieldValue(String id) {
    _value.remove(id);
  }

  /// Unregisters a form field
  void unregisterField(
    String id,
    ShadFormBuilderFieldState<ShadFormBuilderField<dynamic>, dynamic> field,
  ) {
    _fields.remove(id);
    _transformers.remove(id);
    if (widget.clearValueOnUnregister) {
      _value.remove(id);
    }
  }

  /// Validates the form with optional focus and scroll behavior
  bool validate({
    bool focusOnInvalid = true,
    bool autoScrollWhenFocusOnInvalid = false,
  }) {
    if (widget.autovalidateMode ==
        ShadAutovalidateMode.alwaysAfterFirstValidation) {
      autovalidateMode.value = AutovalidateMode.always;
    }
    final hasError = !_formKey.currentState!.validate();
    if (hasError) {
      final wrongFields = _fields.values
          .where((element) => element.hasError)
          .toList();
      if (wrongFields.isNotEmpty) {
        if (focusOnInvalid) {
          wrongFields.first.focus();
        }
        if (autoScrollWhenFocusOnInvalid) {
          wrongFields.first.ensureVisible();
        }
      }
    }
    return !hasError;
  }

  /// Saves and validates the form with optional focus and scroll behavior
  bool saveAndValidate({
    bool focusOnInvalid = true,
    bool autoScrollWhenFocusOnInvalid = false,
  }) {
    save();
    return validate(
      focusOnInvalid: focusOnInvalid,
      autoScrollWhenFocusOnInvalid: autoScrollWhenFocusOnInvalid,
    );
  }

  /// Resets the form to its initial state
  void reset() {
    autovalidateMode.value = switch (widget.autovalidateMode) {
      ShadAutovalidateMode.always => AutovalidateMode.always,
      ShadAutovalidateMode.onUserInteraction =>
        AutovalidateMode.onUserInteraction,
      ShadAutovalidateMode.alwaysAfterFirstValidation ||
      ShadAutovalidateMode.disabled => AutovalidateMode.disabled,
    };
    _formKey.currentState?.reset();
  }

  /// Saves the current form state
  void save() {
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: autovalidateMode,
      builder: (context, mode, child) {
        return Form(
          key: _formKey,
          autovalidateMode: mode,
          // ignore: deprecated_member_use_from_same_package, deprecated_member_use
          onPopInvoked: widget.onPopInvoked,
          onPopInvokedWithResult: widget.onPopInvokedWithResult,
          canPop: widget.canPop,
          onChanged: widget.onChanged,
          child: child!,
        );
      },
      child: ShadFormScope(
        formState: this,
        child: FocusTraversalGroup(
          policy: WidgetOrderTraversalPolicy(),
          child: widget.child,
        ),
      ),
    );
  }
}

/// An inherited widget that provides access to the [ShadFormState]
class ShadFormScope extends InheritedWidget {
  const ShadFormScope({
    super.key,
    required super.child,
    required ShadFormState formState,
  }) : _formState = formState;

  final ShadFormState _formState;

  /// The ShadForm widget associated with this scope
  ShadForm get form => _formState.widget;

  @override
  bool updateShouldNotify(ShadFormScope oldWidget) =>
      oldWidget._formState != _formState;
}
