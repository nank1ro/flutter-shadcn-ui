import 'dart:io';

import 'package:cli_util/cli_logging.dart';
import 'package:path/path.dart' as path;
import 'package:shadcn/shadcn.dart';

void main(List<String> arguments) {
  final verbose = arguments.contains('-v');
  final logger = Logger.verbose(logTime: verbose);
  if (!GitOperations.isGitRepository) {
    logger.stderr('This command must be run inside a git repository.');
    exit(1);
  }
  final repoPath = GitOperations.getGitRepositoryPath();
  final pubspecPath = path.join(repoPath, 'pubspec.yaml');
  final pubspecFile = File(pubspecPath);
  if (!pubspecFile.existsSync()) {
    logger.stderr('No pubspec.yaml file found in the git repository.');
    exit(1);
  }
  print('Git repository path: $repoPath');

  final pubspec = PubspecParser.parse(pubspecFile);
  final satifiesMinFlutterVersion = pubspec.satifiesMinFlutterVersion();
  if (!satifiesMinFlutterVersion.success) {
    var errorMessage =
        'Minimum Flutter version is not met, it should be '
        '>= $kMinFlutterVersion';
    if (satifiesMinFlutterVersion.errorMessage != null) {
      errorMessage += ' ${satifiesMinFlutterVersion.errorMessage!}';
    }
    logger.stderr(errorMessage);
    exit(1);
  }
  print(pubspec);
}
