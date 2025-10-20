import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/form/field.dart';
import 'package:shadcn_ui/src/components/radio.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

class ShadRadioGroupFormField<T> extends ShadFormBuilderField<T> {
  ShadRadioGroupFormField({
    super.id,
    super.key,
    super.onSaved,
    super.forceErrorText,
    super.label,
    super.error,
    super.description,
    super.onChanged,
    super.valueTransformer,
    super.onReset,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    T? initialValue,
    super.focusNode,
    super.validator,
    required Iterable<Widget> items,

    /// {@macro ShadRadioGroup.axis}
    Axis? axis,

    /// {@macro ShadRadioGroup.spacing}
    double? spacing,

    /// {@macro ShadRadioGroup.runSpacing}
    double? runSpacing,

    /// {@macro ShadRadioGroup.alignment}
    WrapAlignment? alignment,

    /// {@macro ShadRadioGroup.runAlignment}
    WrapAlignment? runAlignment,

    /// {@macro ShadRadioGroup.crossAxisAlignment}
    WrapCrossAlignment? crossAxisAlignment,

    /// {@macro ShadRadioGroup.controller}
    this.controller,
  }) : super(
         decorationBuilder: (context) =>
             ShadTheme.of(context).radioTheme.decoration ??
             const ShadDecoration(),
         initialValue: controller?.value ?? initialValue,
         builder: (field) {
           final state = field as _ShadFormBuilderRadioGroupState;
           return ShadRadioGroup(
             items: items,
             onChanged: state.didChange,
             enabled: state.enabled,
             initialValue: initialValue,
             axis: axis,
             spacing: spacing,
             runSpacing: runSpacing,
             alignment: alignment,
             runAlignment: runAlignment,
             crossAxisAlignment: crossAxisAlignment,
             controller: state.controller,
           );
         },
       );

  final ShadRadioController<T>? controller;

  @override
  ShadFormBuilderFieldState<ShadRadioGroupFormField<T>, T> createState() =>
      _ShadFormBuilderRadioGroupState<T>();
}

class _ShadFormBuilderRadioGroupState<T>
    extends ShadFormBuilderFieldState<ShadRadioGroupFormField<T>, T> {
  ShadRadioController<T>? _controller;

  ShadRadioController<T> get controller => widget.controller ?? _controller!;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = ShadRadioController<T>(
        value: initialValue,
        enabled: enabled,
      );
    }
    controller.addListener(onControllerChanged);
  }

  @override
  void didChange(T? value) {
    super.didChange(value);
    if (controller.value != value) {
      controller.value = value;
    }
  }

  @override
  void didUpdateWidget(covariant ShadRadioGroupFormField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller == null && widget.controller != null) {
      _controller?.dispose();
    }
    if (oldWidget.controller != null && widget.controller == null) {
      _controller = ShadRadioController(value: value, enabled: enabled);
    }
  }

  @override
  void reset() {
    super.reset();
    controller.value = initialValue;
  }

  @override
  void dispose() {
    controller.removeListener(onControllerChanged);
    _controller?.dispose();
    super.dispose();
  }

  void onControllerChanged() {
    if (controller.value != value) {
      didChange(controller.value);
      widget.onChanged?.call(controller.value);
    }
  }
}
