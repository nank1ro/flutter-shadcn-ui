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

typedef ShadFormFields = Map<Object,
    ShadFormBuilderFieldState<ShadFormBuilderField<dynamic>, dynamic>>;

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
  });

  final VoidCallback? onChanged;
  final bool? canPop;
  @Deprecated('Use onPopInvokedWithResult instead')
  final void Function(bool)? onPopInvoked;
  final PopInvokedWithResultCallback<Object?>? onPopInvokedWithResult;
  final ShadAutovalidateMode autovalidateMode;
  final Widget child;
  final Map<Object, dynamic> initialValue;
  final bool enabled;
  final bool skipDisabled;

  @override
  State<ShadForm> createState() => ShadFormState();

  static ShadFormState of(BuildContext context) {
    final state = maybeOf(context);
    assert(state != null, 'No ShadFormState found in context');
    return state!;
  }

  static ShadFormState? maybeOf(BuildContext context) {
    return (context
            .getElementForInheritedWidgetOfExactType<ShadFormScope>()
            ?.widget as ShadFormScope?)
        ?._formState;
  }
}

class ShadFormState extends State<ShadForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ShadFormFields _fields = {};
  final Map<Object, dynamic> _value = {};
  final Map<Object, Function> _transformers = {};
  late final ValueNotifier<AutovalidateMode> autovalidateMode;

  ShadFormFields get fields => _fields;

  Map<Object, dynamic> get initialValue => widget.initialValue;

  bool get enabled => widget.enabled;

  Map<Object, dynamic> get value => Map<Object, dynamic>.unmodifiable(
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
      ShadAutovalidateMode.disabled =>
        AutovalidateMode.disabled,
    };
    autovalidateMode = ValueNotifier(mode);
  }

  @override
  void dispose() {
    autovalidateMode.dispose();
    super.dispose();
  }

  void registerField(
    Object id,
    ShadFormBuilderFieldState<ShadFormBuilderField<dynamic>, dynamic> field,
  ) {
    final oldField = _fields[id];
    _fields[id] = field;
    field
      ..registerTransformer(_transformers)
      ..setValue(
        oldField?.value ?? (_value[id] ??= field.initialValue),
      );
  }

  void setInternalFieldValue<T>(Object id, T? value) {
    _value[id] = value;
    widget.onChanged?.call();
  }

  void removeInternalFieldValue(Object id) {
    _value.remove(id);
  }

  void unregisterField(
    Object id,
    ShadFormBuilderFieldState<ShadFormBuilderField<dynamic>, dynamic> field,
  ) {
    _fields.remove(id);
    _value.remove(id);
    _transformers.remove(id);
  }

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
      final wrongFields =
          _fields.values.where((element) => element.hasError).toList();
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

  void reset() {
    _formKey.currentState?.reset();
  }

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

class ShadFormScope extends InheritedWidget {
  const ShadFormScope({
    super.key,
    required super.child,
    required ShadFormState formState,
  }) : _formState = formState;

  final ShadFormState _formState;

  ShadForm get form => _formState.widget;

  @override
  bool updateShouldNotify(ShadFormScope oldWidget) =>
      oldWidget._formState != _formState;
}
