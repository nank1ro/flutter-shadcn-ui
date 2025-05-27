import 'dart:async';
import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:shadcn/src/models/pubspec.dart';
import 'package:shadcn/src/pubspec_parser.dart';
import 'package:shadcn/src/requirements/git.dart';
import 'package:shadcn/src/requirements/requirements.dart';

class PubspecExistsRequirement extends Requirement<Pubspec> {
  PubspecExistsRequirement();

  final errorMessage = 'No pubspec.yaml file found in the git repository.';

  @override
  FutureOr<RequirementResult<Pubspec>> check() {
    final gitRepoPath =
        Requirements.values[GitTopLevelRepositoryRequirement]! as String;
    final pubspecPath = path.join(gitRepoPath, 'pubspec.yaml');
    final pubspecFile = File(pubspecPath);
    final success = pubspecFile.existsSync();
    if (!success) {
      return RequirementResult.failure(errorMessage: errorMessage);
    }
    final pubspec = PubspecParser.parse(pubspecFile);
    return RequirementResult.success(value: pubspec);
  }
}
