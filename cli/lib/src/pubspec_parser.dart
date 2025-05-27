import 'dart:io';

import 'package:shadcn/src/models/pubspec.dart';
import 'package:yaml/yaml.dart';

abstract class PubspecParser {
  static Pubspec parse(File pubspecFile) {
    // Read the file content
    final yamlString = pubspecFile.readAsStringSync();

    // Parse the YAML content
    final yamlMap = Map<String, dynamic>.from(loadYaml(yamlString) as Map);
    // Convert the parsed YAML to a Dart object
    return PubspecMapper.fromMap(yamlMap);
  }
}
