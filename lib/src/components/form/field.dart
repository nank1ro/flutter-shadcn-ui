import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/form/form.dart';

@immutable
class ShadFormBuilderField<T> extends FormField<T> {
  const ShadFormBuilderField({
    super.key,
    required super.builder,
    super.onSaved,
    super.validator,
    super.initialValue,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    required this.id,
    this.focusNode,
    this.label,
    this.error,
    this.description,
    this.onChanged,
  });

  /// Used to reference the field within the form, or to reference form data
  /// after the form is submitted.
  final Object id;

  final FocusNode? focusNode;

  final Widget? label;
  final Widget? error;
  final Widget? description;
  final ValueChanged<T?>? onChanged;

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

  T? get initialValue => widget.initialValue;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    // Register this field when there is a parent ShadForm
    _parentForm = ShadForm.maybeOf(context);
    _parentForm?.registerField(widget.id, this);
  }

  @override
  void didUpdateWidget(covariant ShadFormBuilderField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.id != oldWidget.id) {
      _parentForm?.unregisterField(oldWidget.id, this);
      _parentForm?.registerField(widget.id, this);
    }
  }

  @override
  void didChange(T? value) {
    super.didChange(value);
    // _informFormForFieldChange();
    widget.onChanged?.call(value);
  }

  @override
  void dispose() {
    _parentForm?.unregisterField(widget.id, this);
    _focusNode?.dispose();
    super.dispose();
  }

  void focus() {
    FocusScope.of(context).requestFocus(focusNode);
  }

  void ensureVisible() {
    Scrollable.ensureVisible(context);
  }
}
