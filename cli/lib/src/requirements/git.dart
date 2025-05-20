import 'dart:async';
import 'dart:io';

import 'package:shadcn/src/requirements/requirements.dart';

class IsGitInstalledRequirement extends Requirement<void> {
  final errorMessage = 'Git is not installed. Please install Git first.';

  @override
  FutureOr<RequirementResult<void>> check() {
    try {
      final result = Process.runSync('git', ['--version']);
      final success = result.exitCode == 0;
      if (success) {
        return RequirementResult.success();
      }
      return RequirementResult.failure(errorMessage: errorMessage);
    } catch (e) {
      return RequirementResult.failure(
        errorMessage: errorMessage,
        internalError: e,
      );
    }
  }
}

class IsGitRepositoryRequirement extends Requirement<void> {
  final errorMessage =
      '''This is not a git repository. Please run this command in a git repository.''';

  @override
  FutureOr<RequirementResult<void>> check() {
    try {
      final result = Process.runSync('gitx', [
        'rev-parse',
        '--is-inside-work-tree',
      ]);
      final success = result.exitCode == 0;
      if (success) {
        return RequirementResult.success();
      }
      return RequirementResult.failure(errorMessage: errorMessage);
    } catch (e) {
      return RequirementResult.failure(
        errorMessage: errorMessage,
        internalError: e,
      );
    }
  }
}

class GitTopLevelRepositoryRequirement extends Requirement<String> {
  final errorMessage =
      '''Cannot find the top-level directory of a git repository. Please run this command in a git repository.''';

  @override
  FutureOr<RequirementResult<String>> check() {
    try {
      final result = Process.runSync('git', ['rev-parse', '--show-toplevel']);
      final success = result.exitCode == 0;
      if (!success) {
        return RequirementResult.failure(errorMessage: errorMessage);
      }
      final gitPath = result.stdout.toString().trim();
      return RequirementResult.success(value: gitPath);
    } catch (e) {
      return RequirementResult.failure(
        errorMessage: errorMessage,
        internalError: e,
      );
    }
  }
}
