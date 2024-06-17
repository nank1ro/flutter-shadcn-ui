import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/form/form.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

typedef ValueTransformer<T> = dynamic Function(T value);

@immutable
class ShadFormBuilderField<T> extends FormField<T> {
  ShadFormBuilderField({
    super.key,
    required Widget Function(FormFieldState<T>) builder,
    super.onSaved,
    super.validator,
    super.initialValue,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    this.id,
    this.focusNode,
    this.label,
    this.error,
    this.description,
    this.onChanged,
    this.valueTransformer,
    this.onReset,
  }) : super(
          builder: (field) {
            final hasError = field.hasError;

            final effectiveError =
                hasError ? error ?? Text(field.errorText!) : null;

            return ShadDecorator(
              // The decoration is set to none because the component itself has
              // its own decoration
              decoration: ShadDecoration.none,
              label: label,
              hasError: hasError,
              error: effectiveError,
              description: description,
              child: builder(field),
            );
          },
        );

  /// Used to reference the field within the form, or to reference form data
  /// after the form is submitted.
  final Object? id;

  final FocusNode? focusNode;

  final Widget? label;
  final Widget? error;
  final Widget? description;
  final ValueChanged<T?>? onChanged;
  final ValueTransformer<T?>? valueTransformer;
  final VoidCallback? onReset;

  @override
  ShadFormBuilderFieldState<ShadFormBuilderField<T>, T> createState() =>
      ShadFormBuilderFieldState<ShadFormBuilderField<T>, T>();
}

class ShadFormBuilderFieldState<F extends ShadFormBuilderField<T>, T>
    extends FormFieldState<T> {
  FocusNode? _focusNode;
  ShadFormState? _parentForm;

  FocusNode get focusNode => widget.focusNode ?? _focusNode!;

  @override
  F get widget => super.widget as F;

  T? get initialValue =>
      widget.initialValue ??
      (_parentForm?.widget.initialValue[widget.id] as T?);

  bool get enabled => widget.enabled && (_parentForm?.enabled ?? true);

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    // Register this field when there is a parent ShadForm
    _parentForm = ShadForm.maybeOf(context);
    if (widget.id != null) _parentForm?.registerField(widget.id!, this);
  }

  @override
  void didUpdateWidget(covariant ShadFormBuilderField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.id != oldWidget.id) {
      if (oldWidget.id != null) {
        _parentForm?.unregisterField(oldWidget.id!, this);
      }
      if (widget.id != null) _parentForm?.registerField(widget.id!, this);
    }
  }

  @override
  void didChange(T? value) {
    super.didChange(value);
    _informFormForFieldChange();
    widget.onChanged?.call(value);
  }

  @override
  void reset() {
    super.reset();
    didChange(initialValue);
    widget.onReset?.call();
  }

  @override
  void dispose() {
    if (widget.id != null) _parentForm?.unregisterField(widget.id!, this);
    _focusNode?.dispose();
    super.dispose();
  }

  void focus() {
    FocusScope.of(context).requestFocus(focusNode);
  }

  void ensureVisible() {
    Scrollable.ensureVisible(context);
  }

  @override
  void setValue(T? value, {bool populateForm = true}) {
    super.setValue(value);
    if (populateForm) {
      _informFormForFieldChange();
    }
  }

  void _informFormForFieldChange() {
    if (_parentForm != null) {
      if (enabled) {
        if (widget.id != null) {
          _parentForm!.setInternalFieldValue<T>(widget.id!, value);
        }
        return;
      }
      if (widget.id != null) _parentForm!.removeInternalFieldValue(widget.id!);
    }
  }

  void registerTransformer(Map<Object, Function> map) {
    if (widget.id == null) return;
    final fun = widget.valueTransformer;
    if (fun != null) {
      map[widget.id!] = fun;
    }
  }
}
