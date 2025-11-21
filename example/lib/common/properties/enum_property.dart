import 'package:example/common/properties/option_property.dart';

class MyEnumProperty<T extends Enum> extends MyOptionProperty<T> {
  MyEnumProperty({
    super.key,
    required super.label,
    required T value,
    required List<T> values,
    required super.onChanged,
  }) : super(
          initialOption: value,
          options: values,
          optionToString: (e) => e.name.replaceAll('\$', ''),
        );
}
