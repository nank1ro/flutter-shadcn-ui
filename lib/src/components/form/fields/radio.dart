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
    @Deprecated('Use toValueTransformer instead') super.valueTransformer,
    super.toValueTransformer,
    super.fromValueTransformer,
    super.onReset,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,

    /// {@macro ShadRadioGroup.initialValue}
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
         builder: (state) {
           state as ShadFormBuilderRadioGroupState<T>;
           return ShadRadioGroup(
             items: items,
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
      ShadFormBuilderRadioGroupState<T>();
}

class ShadFormBuilderRadioGroupState<T>
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
    // The constructor passes `controller?.value ?? initialValue` to super, so
    // removing the external controller looks like an initialValue change:
    // the previous value was the controller's, the new one is initialValue.
    // Seed the replacement from the current field value instead.
    final swappedToInternal =
        oldWidget.controller != null && widget.controller == null;
    if (oldWidget.controller != widget.controller) {
      final previousController = oldWidget.controller ?? _controller;
      // Drop the listener from the controller being replaced. A caller-owned
      // controller is left alive; only the controller this field created is
      // disposed.
      previousController?.removeListener(onControllerChanged);
      if (oldWidget.controller == null && widget.controller != null) {
        _controller?.dispose();
        _controller = null;
      }
      if (swappedToInternal) {
        _controller = ShadRadioController<T>(value: value, enabled: enabled);
      }
      controller.addListener(onControllerChanged);
      // The listener does not replay a value the controller already holds.
      // didChange would setState on Form during this build and invoke the
      // user's onChanged synchronously, so adopt the selection with setValue.
      if (controller.value != value) {
        setValue(controller.value);
      }
    }
    // The group always receives this field's controller, so it will not apply
    // initialValue itself. Keep tracking it on the controller this field owns.
    if (!swappedToInternal &&
        widget.controller == null &&
        oldWidget.initialValue != widget.initialValue) {
      controller.value = widget.initialValue;
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
    }
  }
}
