import 'dart:async';

import 'package:lean_builder/builder.dart';
import 'package:lean_builder/type.dart';
import 'package:shadcn_ui/src/annotations.dart';

/// A very basic example of a generator that generates a JSON serialization method
///
/// it doesn't handle all cases, but it should give you an idea of how to implement
@LeanGenerator.shared()
class SerializableGenerator extends GeneratorForAnnotatedClass<Serializable> {
  @override
  Future<String> generateForClass(buildStep, element, annotation) async {
    final b = StringBuffer();
    final constructor = element.unnamedConstructor;

    if (constructor == null) {
      throw Exception('Class ${element.name} must have a default constructor');
    }

    b.writeln(
      '${element.name} _\$${element.name}FromJson(Map<String, dynamic> json) => ${element.name}(',
    );
    for (final param in constructor.parameters) {
      final type = param.type;
      if (param.isNamed) b.writeln('${param.name}: ');

      if (type.isDartCoreInt ||
          type.isDartCoreBool ||
          type.isDartCoreDouble ||
          type.isDartCoreString ||
          type.isDartCoreNum) {
        b.writeln(
          'json[\'${param.name}\'] as ${param.type} ${param.isOptional ? '?' : ''},',
        );
      } else if (type.isDartCoreList) {
        b.writeln(
          '  (json[\'${param.name}\'] as List<dynamic>).cast<${(type as NamedDartType).typeArguments.first}>(),',
        );
      } else if (type.isDartCoreMap) {
        b.writeln(
          '  (json[\'${param.name}\'] as Map<String, dynamic>).map((k, v) => MapEntry(k, ${type.name}.fromJson(v))),',
        );
      } else {
        b.writeln(
          ' ${type.name}.fromJson(json[\'${param.name}\'] as Map<String, dynamic>),',
        );
      }
    }
    b.write(');');
    return b.toString();
  }
}
