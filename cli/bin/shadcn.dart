import 'dart:async';
import 'dart:io';

import 'package:cli_tools/cli_tools.dart' hide Logger;
import 'package:cli_util/cli_logging.dart';
import 'package:shadcn/shadcn.dart';

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

  @override
  String get name => 'add';

  @override
  String get description => 'Add a component to the project.';

  @override
  Future<void> runWithConfig(Configuration<Options> commandConfig) async {
    final component = commandConfig.value(Options.component);
    logger.progress('Adding component: $component');
    // final result = await GitOperations.fetchFileFromGitHub(
    //   path: 'lib/src/components/$component.dart',
    // );
    final button = File(
      '/Users/ale/github/flutter-shadcn-ui/lib/src/components/button.dart',
    );
    final bytes = await button.readAsBytes();
    final localHash = GitOperations.calculateHashOfFile(bytes);
    print('localHash: $localHash');
    // print(result);
    logger.stdout('finish');
  }
}

Future<int> main(List<String> arguments) async {
  final verbose = arguments.contains('-v');
  logger = Logger.verbose(logTime: verbose);

  final requirements = Requirements([
    IsGitInstalledRequirement(),
    IsGitRepositoryRequirement(),
    GitTopLevelRepositoryRequirement(),
    PubspecExistsRequirement(),
    MinFlutterVersionRequirement(),
  ]);

  final result = await requirements.checkAll();
  if (!result.success) {
    logger.stderr(result.errorMessage!);
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
