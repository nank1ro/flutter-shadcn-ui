import 'dart:io';

abstract class GitOperations {
  static bool get isGitRepository {
    final value = Process.runSync('git', [
      'rev-parse',
      '--is-inside-work-tree',
    ]);
    return value.exitCode == 0;
  }

  static String getGitRepositoryPath() {
    final path = Process.runSync('git', ['rev-parse', '--show-toplevel']);
    return path.stdout.toString().trim();
  }
}
