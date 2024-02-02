import 'package:flutter/cupertino.dart';
import 'package:shadcn_ui/src/components/form/field.dart';

typedef ShadFormFields = Map<Object,
    ShadFormBuilderFieldState<ShadFormBuilderField<dynamic>, dynamic>>;

class ShadForm extends StatefulWidget {
  const ShadForm({
    super.key,
    required this.child,
    this.canPop,
    this.onPopInvoked,
    this.autovalidateMode,
  });

  final bool? canPop;
  final void Function(bool)? onPopInvoked;
  final AutovalidateMode? autovalidateMode;
  final Widget child;

  @override
  State<ShadForm> createState() => ShadFormState();

  static ShadFormState of(BuildContext context) {
    final state = maybeOf(context);
    assert(state != null, 'No ShadFormState found in context');
    return state!;
  }

  static ShadFormState? maybeOf(BuildContext context) =>
      context.getElementForInheritedWidgetOfExactType<ShadFormScope>()?.widget
          as ShadFormState?;
}

class ShadFormState extends State<ShadForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ShadFormFields _fields = {};

  void registerField(
    Object id,
    ShadFormBuilderFieldState<ShadFormBuilderField<dynamic>, dynamic> field,
  ) {
    _fields[id] = field;
  }

  void unregisterField(
    Object id,
    ShadFormBuilderFieldState<ShadFormBuilderField<dynamic>, dynamic> field,
  ) {
    _fields.remove(id);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: widget.autovalidateMode,
      onPopInvoked: widget.onPopInvoked,
      canPop: widget.canPop,
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
