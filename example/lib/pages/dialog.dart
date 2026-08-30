import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/widgets.dart';
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
        ShadButton.outline(
          child: const Text('Full Screen Dialog'),
          onPressed: () {
            showShadDialog(
              context: context,
              opaque: true,
              barrierDismissible: true,
              builder: (context) => ShadDialog(
                extendBackground: true,
                constraints: BoxConstraints.expand(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                ),
                title: const Text('Full Screen Dialog'),
                description: const Text(
                  'A dialog that fills the screen, with its background '
                  'extending behind the status bar and gesture bar.',
                ),
                actions: [
                  ShadButton.outline(
                    child: const Text('Close'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.muted,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Content Area',
                      style: theme.textTheme.muted,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        ShadButton.outline(
          child: const Text('Full Screen Scrollable Dialog'),
          onPressed: () {
            showShadDialog(
              context: context,
              opaque: true,
              barrierDismissible: true,
              builder: (context) => ShadDialog(
                extendBackground: true,
                constraints: BoxConstraints.expand(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                ),
                title: const Text('Terms and Conditions'),
                titlePinned: titlePinned,
                descriptionPinned: descriptionPinned,
                actionsPinned: actionsPinned,
                description: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    30,
                    (i) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Paragraph ${i + 1}: A full-screen dialog with '
                        'long content still scrolls correctly, and stays '
                        'clear of the status bar and gesture bar while the '
                        'background extends behind them.',
                      ),
                    ),
                  ),
                ),
                actions: [
                  ShadButton.outline(
                    child: const Text('Decline'),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  ShadButton(
                    child: const Text('Accept'),
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
