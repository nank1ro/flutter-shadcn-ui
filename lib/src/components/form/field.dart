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
  });

  /// Used to reference the field within the form, or to reference form data
  /// after the form is submitted.
  final Object id;

  final FocusNode? focusNode;

  @override
  ShadFormBuilderFieldState<ShadFormBuilderField<T>, T> createState() =>
      ShadFormBuilderFieldState<ShadFormBuilderField<T>, T>();
}

class ShadFormBuilderFieldState<F extends ShadFormBuilderField<T>, T>
    extends FormFieldState<T> {
  ShadFormState? _parentForm;

  @override
  F get widget => super.widget as F;

  @override
  void initState() {
    super.initState();
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
  void dispose() {
    _parentForm?.unregisterField(widget.id, this);
    super.dispose();
  }
}
