import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

class ServiceDefinition {
  final String name;
  final String description;
  final String image;
  final String command;
  final String roomStoragePath;
  final List<Port> ports;
  final Icon icon;
  final Map<String, String> env;

  const ServiceDefinition({
    required this.name,
    required this.icon,
    required this.description,
    required this.image,
    required this.command,
    this.roomStoragePath = '',
    required this.ports,
    this.env = const {},
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ServiceDefinition &&
        other.name == name &&
        other.description == description &&
        other.image == image &&
        other.command == command &&
        other.roomStoragePath == roomStoragePath &&
        listEquals(other.ports, ports) &&
        other.icon == icon &&
        mapEquals(other.env, env);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        image.hashCode ^
        command.hashCode ^
        roomStoragePath.hashCode ^
        ports.hashCode ^
        icon.hashCode ^
        env.hashCode;
  }
}

class Port {
  final int number;
  final List<Endpoint> endpoints;

  const Port({required this.number, required this.endpoints});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Port &&
        other.number == number &&
        listEquals(other.endpoints, endpoints);
  }

  @override
  int get hashCode => number.hashCode ^ endpoints.hashCode;
}

class Endpoint {
  final String participantName;
  final String path;

  const Endpoint({required this.participantName, required this.path});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Endpoint &&
        other.participantName == participantName &&
        other.path == path;
  }

  @override
  int get hashCode => participantName.hashCode ^ path.hashCode;
}

final services = const [
  ServiceDefinition(
    icon: Icon(LucideIcons.bot),
    name: "chatbot",
    description: "a simple chatbot",
    image: "cli:{SERVER_VERSION}",
    command: "meshagent chatbot service --agent-name='chatbot' --port=8081",
    env: {},
    ports: [],
  ),
  ServiceDefinition(
    icon: Icon(LucideIcons.image),
    name: "imagebot",
    description: "a chatbot with image gen capabilities",
    image: "cli:{SERVER_VERSION}",
    command:
        "meshagent chatbot service --agent-name='imagebot' --port=8082 --image-generation=gpt-image-1",
    env: {},
    ports: [],
  ),
  ServiceDefinition(
    icon: Icon(LucideIcons.code),
    name: "codebot",
    description:
        "a coding agent that can write code and use commands inside the room",
    image: "cli:{SERVER_VERSION}",
    command:
        "meshagent chatbot service --agent-name='codebot' --port=8083 --model=codex-mini-latest --local-shell --toolkit=ui --rule='you may only write files inside the /data folder, everything else is read only. You should use the display_document tool to show files to users. strip the leading /data when showing files with display_document since the display_document tool expects a path relative to /data.'",
    env: {},
    roomStoragePath: "/data",
    ports: [],
  ),
  ServiceDefinition(
    icon: Icon(LucideIcons.chartArea),
    name: "analyzer",
    description:
        "a coding agent that can analyze data and generate charts by writing code and using commands inside the room",
    image: "cli:{SERVER_VERSION}",
    command:
        "meshagent chatbot service --agent-name='analyzer' --port=8084 --model=codex-mini-latest --local-shell --toolkit=ui --rule='you may only write files inside the /data folder, everything else is read only. You should use the display_document tool to show files to users. if the user asks for a chart, install mathplotlib and use it to make a chart image. strip the leading /data when showing files with display_document since the display_document tool expects a path relative to /data.'",
    env: {},
    roomStoragePath: "/data",
    ports: [],
  ),
  ServiceDefinition(
    icon: Icon(LucideIcons.mic),
    name: "voicebot",
    description: "a simple voicebot",
    image: "cli:{SERVER_VERSION}}",
    command: "meshagent voicebot service --agent-name='voicebot' --port=8085",
    env: {},
    ports: [],
  ),
];

class TestBug extends StatefulWidget {
  const TestBug({super.key});

  @override
  State<TestBug> createState() => _TestBugState();
}

class _TestBugState extends State<TestBug> {
  late ServiceDefinition selectedServiceDefinition = services[0];
  bool provisioning = false;
  final formKey = GlobalKey<ShadFormState>();

  @override
  Widget build(BuildContext context) {
    return ShadForm(
      key: formKey,
      child: ShadDialog(
        constraints: BoxConstraints.tight(Size(800, 650)),
        title: Text("Add Ephemeral Service"),
        description:
            Text("An ephemeral service will run until the session ends"),
        actions: [
          SizedBox(
              width: 20,
              height: 20,
              child: provisioning ? CircularProgressIndicator() : null),
          SizedBox(width: 10),
          ShadButton(
            enabled: !provisioning,
            onPressed: () async {
              setState(() {
                provisioning = true;
              });
              try {
                if (!formKey.currentState!.validate()) return;
                await Future.value();
                print(formKey.currentState!.value);
              } finally {
                if (mounted) {
                  setState(() {
                    provisioning = false;
                  });
                }
              }
            },
            child: Text("Start Service"),
          ),
        ],
        child: SizedBox(
          width: 800,
          height: 550,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 96,
                child: ListView(
                  padding: EdgeInsets.only(right: 26, top: 16),
                  children: [
                    for (final service in services)
                      Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: ShadGestureDetector(
                          cursor: SystemMouseCursors.click,
                          onTap: () async {
                            setState(() {
                              selectedServiceDefinition = service;
                              // formKey = GlobalKey<ShadFormState>();
                            });

                            WidgetsBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              formKey.currentState!.reset();
                            });
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 8,
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: ShadCard(
                                  backgroundColor: selectedServiceDefinition ==
                                          service
                                      ? ShadTheme.of(context).colorScheme.accent
                                      : null,
                                  border: selectedServiceDefinition == service
                                      ? Border.all(color: Colors.green)
                                      : null,
                                  child: service.icon,
                                ),
                              ),
                              Text(service.name),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  key: ObjectKey(selectedServiceDefinition),
                  padding: EdgeInsets.only(left: 16, top: 16),
                  child: ShadCard(
                    title: Text(selectedServiceDefinition.name),
                    description: Text(selectedServiceDefinition.description),
                    child: Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          spacing: 16,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShadInputFormField(
                                id: "image",
                                label: Text("image"),
                                initialValue: selectedServiceDefinition.image),
                            ShadInputFormField(
                                id: "command",
                                label: Text("command"),
                                initialValue:
                                    selectedServiceDefinition.command),
                            ShadInputFormField(
                              id: "roomStoragePath",
                              label: Text("room storage mount path"),
                              initialValue:
                                  selectedServiceDefinition.roomStoragePath,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
