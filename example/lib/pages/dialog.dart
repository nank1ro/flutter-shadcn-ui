import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final profile = [
  (title: 'Name', value: 'Alexandru'),
  (title: 'Username', value: 'nank1ro'),
];

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  var titlePinned = false;
  var descriptionPinned = false;
  var actionsPinned = true;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return BaseScaffold(
      appBarTitle: 'Dialog',
      editable: [
        MyBoolProperty(
          label: 'titlePinned',
          value: titlePinned,
          onChanged: (v) => setState(() => titlePinned = v),
        ),
        MyBoolProperty(
          label: 'descriptionPinned',
          value: descriptionPinned,
          onChanged: (v) => setState(() => descriptionPinned = v),
        ),
        MyBoolProperty(
          label: 'actionsPinned',
          value: actionsPinned,
          onChanged: (v) => setState(() => actionsPinned = v),
        ),
      ],
      children: [
        ShadButton.outline(
          child: const Text('Edit Profile'),
          onPressed: () {
            showShadDialog(
              context: context,
              builder: (context) => ShadDialog(
                title: const Text('Edit Profile'),
                description: const Text(
                  "Make changes to your profile here. Click save when you're done",
                ),
                actions: const [ShadButton(child: Text('Save changes'))],
                titlePinned: titlePinned,
                descriptionPinned: descriptionPinned,
                actionsPinned: actionsPinned,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                child: Container(
                  width: 375,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    spacing: 16,
                    children: profile
                        .map(
                          (p) => Row(
                            children: [
                              Expanded(
                                child: Text(
                                  p.title,
                                  textAlign: TextAlign.end,
                                  style: theme.textTheme.small,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                flex: 3,
                                child: ShadInput(initialValue: p.value),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            );
          },
        ),
        ShadButton.outline(
          child: const Text('Show Dialog'),
          onPressed: () {
            showShadDialog(
              context: context,
              builder: (context) => ShadDialog.alert(
                title: const Text('Are you absolutely sure?'),
                titlePinned: titlePinned,
                descriptionPinned: descriptionPinned,
                actionsPinned: actionsPinned,
                description: const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'This action cannot be undone. This will permanently delete your account and remove your data from our servers.',
                  ),
                ),
                actions: [
                  ShadButton.outline(
                    child: const Text('Cancel'),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  ShadButton(
                    child: const Text('Continue'),
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
