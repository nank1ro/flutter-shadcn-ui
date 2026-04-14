// ignore_for_file: avoid_print, lines_longer_than_80_chars

import 'dart:io';

class ComponentInfo {
  ComponentInfo({
    required this.name,
    required this.fileName,
    required this.description,
    required this.content,
  });
  final String name;
  final String fileName;
  final String description;
  final String content;
}

class GuideInfo {
  GuideInfo({
    required this.title,
    required this.fileName,
    required this.content,
  });
  final String title;
  final String fileName;
  final String content;
}

void main() async {
  final componentsDir = Directory('docs/src/content/docs/Components');
  final themeFile = File('docs/src/content/docs/Theme/data.md');
  final typographyFile = File('docs/src/content/docs/typography.mdx');
  final indexFile = File('docs/src/content/docs/index.md');
  final utilsDir = Directory('docs/src/content/docs/Utils');
  final packagesFile = File('docs/src/content/docs/packages.md');
  final outputDir = Directory('skills/shadcn-ui-flutter');

  if (!outputDir.existsSync()) {
    outputDir.createSync(recursive: true);
  }

  // Ensure subdirectories exist
  Directory('skills/shadcn-ui-flutter/components').createSync(recursive: true);
  Directory('skills/shadcn-ui-flutter/guides').createSync(recursive: true);

  print('Parsing components...');
  final components = <ComponentInfo>[];
  if (componentsDir.existsSync()) {
    for (final file in componentsDir.listSync().whereType<File>()) {
      if (file.path.endsWith('.mdx')) {
        final content = await file.readAsString();
        final name =
            _extractTitle(content) ??
            file.uri.pathSegments.last.replaceAll('.mdx', '');
        final cleanedContent = _cleanMdx(content);
        final description = _extractDescription(cleanedContent);
        final exampleContent = await _getExampleContent(
          file.uri.pathSegments.last.replaceAll('.mdx', ''),
        );

        components.add(
          ComponentInfo(
            name: name,
            fileName: file.uri.pathSegments.last.replaceAll('.mdx', '.md'),
            description: description,
            content: '$cleanedContent\n\n$exampleContent',
          ),
        );
      }
    }
  }
  components.sort((a, b) => a.name.compareTo(b.name));

  print('Generating component files...');
  for (final comp in components) {
    final compFile = File(
      'skills/shadcn-ui-flutter/components/${comp.fileName}',
    );
    await compFile.writeAsString('# ${comp.name}\n\n${comp.content}');
  }

  print('Parsing guides...');
  final guides = <GuideInfo>[];

  if (themeFile.existsSync()) {
    final themeContent = await themeFile.readAsString();
    guides.add(
      GuideInfo(
        title: 'Theming',
        fileName: 'theming.md',
        content: _cleanMdx(themeContent),
      ),
    );
  }

  if (typographyFile.existsSync()) {
    final typoContent = await typographyFile.readAsString();
    guides.add(
      GuideInfo(
        title: 'Typography',
        fileName: 'typography.md',
        content: _cleanMdx(typoContent),
      ),
    );
  }

  if (indexFile.existsSync()) {
    final indexContent = await indexFile.readAsString();
    final materialSection = _extractSection(indexContent, 'Shadcn + Material');
    final cupertinoSection = _extractSection(
      indexContent,
      'Shadcn + Cupertino',
    );
    if (materialSection.isNotEmpty || cupertinoSection.isNotEmpty) {
      guides.add(
        GuideInfo(
          title: 'Material & Cupertino Interop',
          fileName: 'interop.md',
          content:
              '# Interoperability\n\n$materialSection\n\n$cupertinoSection',
        ),
      );
    }
  }

  if (utilsDir.existsSync()) {
    for (final file in utilsDir.listSync().whereType<File>()) {
      final path = file.path;
      if (path.endsWith('.md') || path.endsWith('.mdx')) {
        final content = await file.readAsString();
        final title =
            _extractTitle(content) ??
            file.uri.pathSegments.last.replaceAll(RegExp(r'\.mdx?'), '');
        guides.add(
          GuideInfo(
            title: title,
            fileName: file.uri.pathSegments.last.replaceAll(
              RegExp(r'\.mdx?'),
              '.md',
            ),
            content: _cleanMdx(content),
          ),
        );
      }
    }
  }

  print('Generating guide files...');
  for (final guide in guides) {
    final guideFile = File('skills/shadcn-ui-flutter/guides/${guide.fileName}');
    await guideFile.writeAsString(guide.content);
  }

  print('Generating SKILL.md...');
  var packagesContent = '';
  if (packagesFile.existsSync()) {
    packagesContent = _cleanMdx(await packagesFile.readAsString());
  }
  final skillMd = _generateSkillMd(components, guides, packagesContent);
  await File('skills/shadcn-ui-flutter/SKILL.md').writeAsString(skillMd);

  print('Done!');
}

String? _extractTitle(String content) {
  final match = RegExp(r'^title:\s*(.*)$', multiLine: true).firstMatch(content);
  return match?.group(1)?.trim();
}

String _cleanMdx(String content) {
  // Remove frontmatter
  var cleaned = content.replaceFirst(RegExp(r'^---[\s\S]*?---'), '');

  // Remove Astro imports
  cleaned = cleaned.replaceAll(RegExp(r'^import .*?;$', multiLine: true), '');

  // Remove <Preview> tags but keep content inside
  cleaned = cleaned.replaceAll(RegExp('<Preview.*?>'), '');
  cleaned = cleaned.replaceAll('</Preview>', '');

  // Remove other common MDX components if any
  cleaned = cleaned.replaceAll(
    RegExp(r':::.+?(\n|$)'),
    '',
  ); // :::tip, :::note etc
  cleaned = cleaned.replaceAll(':::', '');

  return cleaned.trim();
}

String _extractDescription(String content) {
  final lines = content.split('\n');
  for (final line in lines) {
    final trimmed = line.trim();
    if (trimmed.isNotEmpty &&
        !trimmed.startsWith('#') &&
        !trimmed.startsWith('![')) {
      return trimmed;
    }
  }
  return '';
}

String _extractSection(String content, String sectionTitle) {
  final lines = content.split('\n');
  var inSection = false;
  final sectionLines = <String>[];

  for (final line in lines) {
    if (line.startsWith('## ') && line.contains(sectionTitle)) {
      inSection = true;
      sectionLines.add(line);
      continue;
    }
    if (inSection && line.startsWith('## ')) {
      break;
    }
    if (inSection) {
      sectionLines.add(line);
    }
  }
  return sectionLines.join('\n').trim();
}

String _generateSkillMd(
  List<ComponentInfo> components,
  List<GuideInfo> guides,
  String packagesContent,
) {
  final buffer = StringBuffer();
  buffer.writeln('---');
  buffer.writeln('name: shadcn-ui-flutter');
  buffer.writeln(
    'description: A comprehensive Flutter UI library inspired by shadcn/ui. Provides high-quality, customizable, and accessible components including Buttons, Cards, Forms, and more. Use this skill when building Flutter UIs, implementing design systems, or needing specific component usage examples.',
  );
  buffer.writeln('---');
  buffer.writeln();
  buffer.writeln('# Shadcn UI for Flutter');
  buffer.writeln();
  buffer.writeln(
    'This skill provides documentation and examples for using the `shadcn_ui` package in Flutter.',
  );
  buffer.writeln();
  buffer.writeln('## Theming and Customization');
  buffer.writeln(
    'Shadcn UI for Flutter provides a powerful theming system. You can use built-in color schemes (blue, gray, green, neutral, orange, red, rose, slate, stone, violet, yellow, zinc) or create your own.',
  );
  buffer.writeln();
  buffer.writeln('### Applying a Theme');
  buffer.writeln(
    'Use `ShadThemeData` within `ShadApp` to define your light and dark themes.',
  );
  buffer.writeln();
  buffer.writeln('### Detailed Guides');
  for (final guide in guides) {
    buffer.writeln('- [${guide.title}](guides/${guide.fileName})');
  }
  buffer.writeln();
  buffer.writeln('## Components');
  buffer.writeln('| Name | Description | Reference |');
  buffer.writeln('| :--- | :--- | :--- |');
  for (final comp in components) {
    buffer.writeln(
      '| ${comp.name} | ${comp.description} | [${comp.fileName}](components/${comp.fileName}) |',
    );
  }
  buffer.writeln();
  buffer.writeln('## Usage Examples');
  buffer.writeln(
    'Examples are available at the bottom of each component page.',
  );
  buffer.writeln();
  buffer.writeln('### Basic Setup');
  buffer.writeln(
    'Here is a complete example of a Counter App using `shadcn_ui`, including light and dark theme support.',
  );
  buffer.writeln('```dart');
  buffer.writeln("import 'package:shadcn_ui/shadcn_ui.dart';");
  buffer.writeln();
  buffer.writeln('void main() {');
  buffer.writeln('  runApp(const MyApp());');
  buffer.writeln('}');
  buffer.writeln();
  buffer.writeln('class MyApp extends StatelessWidget {');
  buffer.writeln('  const MyApp({super.key});');
  buffer.writeln();
  buffer.writeln('  @override');
  buffer.writeln('  Widget build(BuildContext context) {');
  buffer.writeln('    return ShadApp(');
  buffer.writeln('      debugShowCheckedModeBanner: false,');
  buffer.writeln('      theme: ShadThemeData(');
  buffer.writeln('        brightness: Brightness.light,');
  buffer.writeln('        colorScheme: const ShadZincColorScheme.light(),');
  buffer.writeln('      ),');
  buffer.writeln('      darkTheme: ShadThemeData(');
  buffer.writeln('        brightness: Brightness.dark,');
  buffer.writeln('        colorScheme: const ShadZincColorScheme.dark(),');
  buffer.writeln('      ),');
  buffer.writeln('      themeMode: ThemeMode.system,');
  buffer.writeln('      home: const CounterPage(),');
  buffer.writeln('    );');
  buffer.writeln('  }');
  buffer.writeln('}');
  buffer.writeln();
  buffer.writeln('class CounterPage extends StatefulWidget {');
  buffer.writeln('  const CounterPage({super.key});');
  buffer.writeln();
  buffer.writeln('  @override');
  buffer.writeln('  State<CounterPage> createState() => _CounterPageState();');
  buffer.writeln('}');
  buffer.writeln();
  buffer.writeln('class _CounterPageState extends State<CounterPage> {');
  buffer.writeln('  int _counter = 0;');
  buffer.writeln();
  buffer.writeln('  void _incrementCounter() {');
  buffer.writeln('    setState(() {');
  buffer.writeln('      _counter++;');
  buffer.writeln('    });');
  buffer.writeln('  }');
  buffer.writeln();
  buffer.writeln('  @override');
  buffer.writeln('  Widget build(BuildContext context) {');
  buffer.writeln('    final theme = ShadTheme.of(context);');
  buffer.writeln('    return Scaffold(');
  buffer.writeln("      appBar: AppBar(title: const Text('Shadcn Counter')),");
  buffer.writeln('      body: Center(');
  buffer.writeln('        child: Column(');
  buffer.writeln('          mainAxisAlignment: MainAxisAlignment.center,');
  buffer.writeln('          children: [');
  buffer.writeln('            Text(');
  buffer.writeln(
    "              'You have pushed the button this many times:',",
  );
  buffer.writeln('              style: theme.textTheme.muted,');
  buffer.writeln('            ),');
  buffer.writeln('            Text(');
  buffer.writeln(r"              '$_counter',");
  buffer.writeln('              style: theme.textTheme.h1,');
  buffer.writeln('            ),');
  buffer.writeln('          ],');
  buffer.writeln('        ),');
  buffer.writeln('      ),');
  buffer.writeln('      floatingActionButton: ShadButton(');
  buffer.writeln('        onPressed: _incrementCounter,');
  buffer.writeln('        child: const Icon(LucideIcons.plus),');
  buffer.writeln('      ),');
  buffer.writeln('    );');
  buffer.writeln('  }');
  buffer.writeln('}');
  buffer.writeln('```');

  if (packagesContent.isNotEmpty) {
    buffer.writeln();
    buffer.writeln(packagesContent);
  }

  return buffer.toString();
}

Future<String> _getExampleContent(String componentName) async {
  final name = componentName.replaceAll('-', '_');
  final mainExample = File('example/lib/pages/$name.dart');
  final formExample = File('example/lib/pages/${name}_form_field.dart');

  final buffer = StringBuffer();

  if (mainExample.existsSync()) {
    buffer.writeln('## Example');
    buffer.writeln('```dart');
    buffer.writeln(await mainExample.readAsString());
    buffer.writeln('```');

    if (formExample.existsSync()) {
      buffer.writeln('\n## Form Example');
      buffer.writeln('```dart');
      buffer.writeln(await formExample.readAsString());
      buffer.writeln('```');
    }
  } else if (formExample.existsSync()) {
    buffer.writeln('## Example');
    buffer.writeln('```dart');
    buffer.writeln(await formExample.readAsString());
    buffer.writeln('```');
  }

  return buffer.toString();
}
