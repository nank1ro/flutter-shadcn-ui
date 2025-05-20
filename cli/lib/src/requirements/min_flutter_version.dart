import 'dart:async';

import 'package:shadcn/shadcn.dart';
import 'package:version/version.dart';

class MinFlutterVersionRequirement extends Requirement<Version> {
  MinFlutterVersionRequirement();

  final flutterNotFoundInEnvironmentErrorMessage =
      'Flutter not found in the environment section of pubspec.yaml';

  final minFlutterVersionErrorMessage =
      'Minimum Flutter version is not met, it should be >= $kMinFlutterVersion';

  @override
  FutureOr<RequirementResult<Version>> check() {
    final pubspec = Requirements.values[PubspecExistsRequirement]! as Pubspec;
    final flutterVersion = pubspec.environment?['flutter'];
    if (flutterVersion is String) {
      final versionString = flutterVersion.split('>=')[1].trim();
      final version = Version.parse(versionString);
      final success = version >= kMinFlutterVersion;
      if (success) {
        return RequirementResult.success(value: version);
      }

      return RequirementResult.failure(
        errorMessage: minFlutterVersionErrorMessage,
      );
    }
    return RequirementResult.failure(
      errorMessage: flutterNotFoundInEnvironmentErrorMessage,
    );
  }
}
