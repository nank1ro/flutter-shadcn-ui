// ignore_for_file: avoid_print

import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  bool enabled = true;
  final focusNodes = [FocusNode(), FocusNode()];

  final fruits = {
    'apple': 'Apple',
    'banana': 'Banana',
    'blueberry': 'Blueberry',
    'grapes': 'Grapes',
    'pineapple': 'Pineapple',
  };

  final timezones = {
    'North America': {
      'est': 'Eastern Standard Time (EST)',
      'cst': 'Central Standard Time (CST)',
      'mst': 'Mountain Standard Time (MST)',
      'pst': 'Pacific Standard Time (PST)',
      'akst': 'Alaska Standard Time (AKST)',
      'hst': 'Hawaii Standard Time (HST)',
    },
    'Europe & Africa': {
      'gmt': 'Greenwich Mean Time (GMT)',
      'cet': 'Central European Time (CET)',
      'eet': 'Eastern European Time (EET)',
      'west': 'Western European Summer Time (WEST)',
      'cat': 'Central Africa Time (CAT)',
      'eat': 'Eastern Africa Time (EAT)',
    },
    'Asia': {
      'msk': 'Moscow Time (MSK)',
      'ist': 'India Standard Time (IST)',
      'cst_china': 'China Standard Time (CST)',
      'jst': 'Japan Standard Time (JST)',
      'kst': 'Korea Standard Time (KST)',
      'ist_indonasia': 'Indonesia Standard Time (IST)',
    },
    'Australia & Pacific': {
      'awst': 'Australian Western Standard Time (AWST)',
      'acst': 'Australian Central Standard Time (ACST)',
      'aest': 'Australian Eastern Standard Time (AEST)',
      'nzst': 'New Zealand Standard Time (NZST)',
      'fjt': 'Fiji Time (FJT)',
    },
    'South America': {
      'art': 'Argentina Time (ART)',
      'bot': 'Bolivia Time (BOT)',
      'brt': 'Brasilia Time (BRT)',
      'clt': 'Chile Standard Time (CLT)',
    },
  };

  @override
  void dispose() {
    for (final node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  List<Widget> getTimezonesWidgets(ShadcnThemeData theme) {
    final widgets = <Widget>[];
    for (final zone in timezones.entries) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 6, 6, 6),
          child: Text(
            zone.key,
            style: theme.textTheme.muted.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.popoverForeground,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      );
      widgets.addAll(zone.value.entries
          .map((e) => ShadcnOption(value: e.key, child: Text(e.value))));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadcnTheme.of(context);
    return BaseScaffold(
      appBarTitle: 'Select',
      editable: [
        MyBoolProperty(
          label: 'Enabled',
          value: enabled,
          onChanged: (value) => setState(() => enabled = value),
        ),
        MyBoolProperty(
          label: 'Fruits Focused',
          value: focusNodes[0].hasFocus,
          onChanged: (value) => setState(
            () =>
                value ? focusNodes[0].requestFocus() : focusNodes[0].unfocus(),
          ),
        ),
        MyBoolProperty(
          label: 'Timezone Focused',
          value: focusNodes[1].hasFocus,
          onChanged: (value) => setState(
            () =>
                value ? focusNodes[1].requestFocus() : focusNodes[1].unfocus(),
          ),
        ),
      ],
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 180),
          child: ShadcnSelect<String>(
            onChanged: enabled ? (v) => print(v) : null,
            focusNode: focusNodes[0],
            placeholder: const Text('Select a fruit'),
            options: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 6, 6, 6),
                child: Text(
                  'Fruits',
                  style: theme.textTheme.large,
                  textAlign: TextAlign.start,
                ),
              ),
              const ShadcnOption(value: 'apple', child: Text('Apple')),
              const ShadcnOption(value: 'banana', child: Text('Banana')),
              const ShadcnOption(value: 'blueberry', child: Text('Blueberry')),
              const ShadcnOption(value: 'grapes', child: Text('Grapes')),
              const ShadcnOption(value: 'pineapple', child: Text('Pineapple')),
            ],
            selectedOptionBuilder: (context, value) => Text(value.capitalize()),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 280),
          child: ShadcnSelect<String>(
            focusNode: focusNodes[1],
            onChanged: enabled ? (v) => print(v) : null,
            placeholder: const Text('Select a timezone'),
            options: getTimezonesWidgets(theme),
            selectedOptionBuilder: (context, value) {
              final timezone = timezones.entries
                  .firstWhere((element) => element.value.containsKey(value))
                  .value[value];
              return Text(timezone!);
            },
          ),
        ),
      ],
    );
  }
}
