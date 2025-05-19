import 'dart:async';
import 'dart:io';

import 'package:cli_util/cli_logging.dart';
import 'package:path/path.dart' as path;
import 'package:shadcn/shadcn.dart';
import 'package:cli_tools/cli_tools.dart' hide Logger;

late Logger logger;

enum Options implements OptionDefinition<String> {
  component(
    StringOption(
      argName: 'component',
      helpText: 'The component to add',
      argPos: 0,
      allowedValues: components,
      mandatory: true,
    ),
  );

  const Options(this.option);

  @override
  final ConfigOptionBase<String> option;
}

class AddComponentCommand extends BetterCommand<Options, void> {
  AddComponentCommand() : super(options: Options.values);
  // argParser.addOption(
  //   'component',
  //   aliases: [],
  //   abbr: 'c',
  //   help: 'The component to add',
  //   mandatory: true,
  //   allowed: components,
  // );
  // }
  @override
  String get name => 'add';

  @override
  String get description => 'Add a component to the project.';

  @override
  Future<void> runWithConfig(Configuration<Options> commandConfig) async {
    final component = commandConfig.value(Options.component);
    logger.progress('Adding component: $component');
    logger.stdout('finish');
  }
}

Future<int> main(List<String> arguments) async {
  final verbose = arguments.contains('-v');
  logger = Logger.verbose(logTime: verbose);

  if (!GitOperations.isGitRepository) {
    logger.stderr('This command must be run inside a git repository.');
    exit(1);
  }
  final repoPath = GitOperations.getGitRepositoryPath();
  final pubspecPath = path.join(repoPath, 'pubspec.yaml');
  final pubspecFile = File(pubspecPath);
  if (!pubspecFile.existsSync()) {
    logger.stderr('No pubspec.yaml file found in the git repository.');
    return 1;
  }

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
    return 1;
  }

  final runner = BetterCommandRunner<OptionDefinition<dynamic>, dynamic>(
    'shadcn',
    'A CLI for installing Flutter shadcn components',
    globalOptions: [StandardGlobalOption.quiet, StandardGlobalOption.verbose],
  )..addCommand(AddComponentCommand());
  await runner.run(arguments);
  return 0;
}
