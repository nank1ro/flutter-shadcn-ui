# Select

Displays a list of options for the user to pick from—triggered by a button.



```dart
final fruits = {
  'apple': 'Apple',
  'banana': 'Banana',
  'blueberry': 'Blueberry',
  'grapes': 'Grapes',
  'pineapple': 'Pineapple',
};

class SelectExample extends StatelessWidget {
  const SelectExample({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 180),
      child: ShadSelect<String>(
        placeholder: const Text('Select a fruit'),
        options: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Text(
              'Fruits',
              style: theme.textTheme.muted.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.popoverForeground,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          ...fruits.entries
              .map((e) => ShadOption(value: e.key, child: Text(e.value))),
        ],
        selectedOptionBuilder: (context, value) => Text(fruits[value]!),
        onChanged: print,
      ),
    );
  }
}
```



## Scrollable



```dart
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

List<Widget> getTimezonesWidgets(ShadThemeData theme) {
  final widgets = <Widget>[];
  for (final zone in timezones.entries) {
    widgets.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
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
        .map((e) => ShadOption(value: e.key, child: Text(e.value))));
  }
  return widgets;
}

class SelectExample extends StatelessWidget {
  const SelectExample({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 280),
      child: ShadSelect<String>(
        placeholder: const Text('Select a timezone'),
        options: getTimezonesWidgets(theme),
        selectedOptionBuilder: (context, value) {
          final timezone = timezones.entries
              .firstWhere((element) => element.value.containsKey(value))
              .value[value];
          return Text(timezone!);
        },
      ),
    );
  }
}
```



## Form



```dart
final verifiedEmails = [
  'm@example.com',
  'm@google.com',
  'm@support.com',
];

class SelectFormField extends StatelessWidget {
  const SelectFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadSelectFormField<String>(
      id: 'email',
      minWidth: 350,
      initialValue: null,
      options: verifiedEmails
          .map((email) => ShadOption(value: email, child: Text(email)))
          .toList(),
      selectedOptionBuilder: (context, value) => value == 'none'
          ? const Text('Select a verified email to display')
          : Text(value),
      placeholder: const Text('Select a verified email to display'),
      validator: (v) {
        if (v == null) {
          return 'Please select an email to display';
        }
        return null;
      },
    );
  }
}
```



## With Search



```dart
const frameworks = {
'nextjs': 'Next.js',
'svelte': 'SvelteKit',
'nuxtjs': 'Nuxt.js',
'remix': 'Remix',
'astro': 'Astro',
};

class SelectWithSearch extends StatefulWidget {
  const SelectWithSearch({super.key});

  @override
  State<SelectWithSearch> createState() => _SelectWithSearchState();
}

class _SelectWithSearchState extends State<SelectWithSearch> {
  var searchValue = '';

  Map<String, String> get filteredFrameworks => {
  for (final framework in frameworks.entries)
  if (framework.value.toLowerCase().contains(searchValue.toLowerCase()))
  framework.key: framework.value
  };

  @override
  Widget build(BuildContext context) {
    return ShadSelect<String>.withSearch(
      minWidth: 180,
      maxWidth: 300,
      placeholder: const Text('Select framework...'),
      onSearchChanged: (value) => setState(() => searchValue = value),
      searchPlaceholder: const Text('Search framework'),
      options: [
        if (filteredFrameworks.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text('No framework found'),
          ),
        ...frameworks.entries.map(
          (framework) {
            // this offstage is used to avoid the focus loss when the search results appear again
            // because it keeps the widget in the tree.
            return Offstage(
              offstage: !filteredFrameworks.containsKey(framework.key),
              child: ShadOption(
                value: framework.key,
                child: Text(framework.value),
              ),
            );
          },
        )
      ],
      selectedOptionBuilder: (context, value) => Text(frameworks[value]!),
    );
  }
}
```



If you want to be able to deselect an option, you can use the `allowDeselection` property.


## Multiple

This example shows how to select multiple options.

In addition, the `allowDeselection` property is set to `true` to allow the user to deselect an option and the `closeOnSelect` property is set to `false` to keep the popover open after selecting an option.
If you tap outside the popover, it will close.



```dart
final fruits = {
  'apple': 'Apple',
  'banana': 'Banana',
  'blueberry': 'Blueberry',
  'grapes': 'Grapes',
  'pineapple': 'Pineapple',
};

class SelectMultiple extends StatelessWidget {
  const SelectMultiple({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ShadSelect<String>.multiple(
      minWidth: 340,
      onChanged: print,
      allowDeselection: true,
      closeOnSelect: false,
      placeholder: const Text('Select multiple fruits'),
      options: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Text(
            'Fruits',
            style: theme.textTheme.large,
            textAlign: TextAlign.start,
          ),
        ),
        ...fruits.entries.map(
          (e) => ShadOption(
            value: e.key,
            child: Text(e.value),
          ),
        ),
      ],
      selectedOptionsBuilder: (context, values) =>
          Text(values.map((v) => v.capitalize()).join(', ')),
    );
  }
}
```

## Example
```dart
// ignore_for_file: avoid_print

import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

const fruits = {
  'apple': 'Apple',
  'banana': 'Banana',
  'blueberry': 'Blueberry',
  'grapes': 'Grapes',
  'pineapple': 'Pineapple',
};

const timezones = {
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

const frameworks = {
  'nextjs': 'Next.js',
  'svelte': 'SvelteKit',
  'nuxtjs': 'Nuxt.js',
  'remix': 'Remix',
  'astro': 'Astro',
};

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  bool enabled = true;
  final focusNodes = [FocusNode(), FocusNode(), FocusNode(), FocusNode()];
  var searchValue = '';
  bool allowDeselection = false;
  bool closeOnSelect = true;
  bool ensureSelectedVisible = true;

  Map<String, String> get filteredFrameworks => {
    for (final framework in frameworks.entries)
      if (framework.value.toLowerCase().contains(searchValue.toLowerCase()))
        framework.key: framework.value,
  };

  @override
  void dispose() {
    for (final node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
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
        MyBoolProperty(
          label: 'Framework Focused',
          value: focusNodes[2].hasFocus,
          onChanged: (value) => setState(
            () =>
                value ? focusNodes[2].requestFocus() : focusNodes[2].unfocus(),
          ),
        ),
        MyBoolProperty(
          label: 'Allow deselection',
          value: allowDeselection,
          onChanged: (value) => setState(() => allowDeselection = value),
        ),
        MyBoolProperty(
          label: 'Close on select',
          value: closeOnSelect,
          onChanged: (value) => setState(() => closeOnSelect = value),
        ),
        MyBoolProperty(
          label: 'Ensure selected visible',
          value: ensureSelectedVisible,
          onChanged: (value) => setState(() => ensureSelectedVisible = value),
        ),
      ],
      children: [
        ShadSelect<String>(
          minWidth: 180,
          onChanged: print,
          closeOnSelect: closeOnSelect,
          enabled: enabled,
          focusNode: focusNodes[0],
          placeholder: const Text('Select a fruit'),
          allowDeselection: allowDeselection,
          ensureSelectedVisible: ensureSelectedVisible,
          options: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Text(
                'Fruits',
                style: theme.textTheme.large,
                textAlign: TextAlign.start,
              ),
            ),
            ...fruits.entries.map(
              (e) => ShadOption(
                value: e.key,
                child: Text(e.value),
              ),
            ),
          ],
          selectedOptionBuilder: (context, value) => Text(value.capitalize()),
        ),
        ShadSelect<String>(
          minWidth: 280,
          focusNode: focusNodes[1],
          onChanged: print,
          enabled: enabled,
          closeOnSelect: closeOnSelect,
          placeholder: const Text('Select a timezone'),
          ensureSelectedVisible: ensureSelectedVisible,
          options: timezones.entries.map(
            (zone) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  child: Text(
                    zone.key,
                    style: theme.textTheme.muted.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.popoverForeground,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                ...zone.value.entries.map(
                  (e) => ShadOption(
                    value: e.key,
                    child: Text(e.value),
                  ),
                ),
              ],
            ),
          ),
          allowDeselection: allowDeselection,
          selectedOptionBuilder: (context, value) {
            final timezone = timezones.entries
                .firstWhere((element) => element.value.containsKey(value))
                .value[value];
            return Text(timezone!);
          },
        ),
        ShadSelect<String>.withSearch(
          enabled: enabled,
          focusNode: focusNodes[2],
          minWidth: 180,
          maxWidth: 300,
          placeholder: const Text('Select framework...'),
          onSearchChanged: (value) => setState(() => searchValue = value),
          closeOnSelect: closeOnSelect,
          searchPlaceholder: const Text('Search framework'),
          ensureSelectedVisible: ensureSelectedVisible,
          options: [
            if (filteredFrameworks.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Text('No framework found'),
              ),
            ...frameworks.entries.map(
              (framework) {
                // this offstage is used to avoid the focus loss when the search results appear again
                // because it keeps the widget in the tree.
                return Offstage(
                  offstage: !filteredFrameworks.containsKey(framework.key),
                  child: ShadOption(
                    value: framework.key,
                    child: Text(framework.value),
                  ),
                );
              },
            ),
          ],
          selectedOptionBuilder: (context, value) => Text(frameworks[value]!),
          onChanged: print,
          allowDeselection: allowDeselection,
        ),
        ShadSelect<String>.multiple(
          minWidth: 340,
          onChanged: print,
          enabled: enabled,
          focusNode: focusNodes[3],
          allowDeselection: allowDeselection,
          placeholder: const Text('Select multiple fruits'),
          closeOnSelect: closeOnSelect,
          ensureSelectedVisible: ensureSelectedVisible,
          options: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Text(
                'Fruits',
                style: theme.textTheme.large,
                textAlign: TextAlign.start,
              ),
            ),
            ...fruits.entries.map(
              (e) => ShadOption(
                value: e.key,
                child: Text(e.value),
              ),
            ),
          ],
          selectedOptionsBuilder: (context, values) =>
              Text(values.map((v) => v.capitalize()).join(', ')),
        ),
      ],
    );
  }
}

```

## Form Example
```dart
// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SelectFormFieldPage extends StatefulWidget {
  const SelectFormFieldPage({super.key});

  @override
  State<SelectFormFieldPage> createState() => _SelectFormFieldPageState();
}

class _SelectFormFieldPageState extends State<SelectFormFieldPage> {
  bool enabled = true;
  var autovalidateMode = ShadAutovalidateMode.alwaysAfterFirstValidation;
  final verifiedEmails = [
    'm@example.com',
    'm@google.com',
    'm@support.com',
  ];
  String? initialValue;
  Map<Object, dynamic> formValue = {};
  final formKey = GlobalKey<ShadFormState>();
  bool allowDeselection = false;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ShadForm(
      key: formKey,
      enabled: enabled,
      autovalidateMode: autovalidateMode,
      initialValue: {'email': initialValue},
      child: BaseScaffold(
        appBarTitle: 'SelectFormField',
        editable: [
          MyBoolProperty(
            label: 'Enabled',
            value: enabled,
            onChanged: (value) => setState(() => enabled = value),
          ),
          MyEnumProperty(
            label: 'autovalidateMode',
            value: autovalidateMode,
            values: ShadAutovalidateMode.values,
            onChanged: (value) {
              if (value != null) {
                setState(() => autovalidateMode = value);
              }
            },
          ),
          ShadSelect(
            options: ['none', ...verifiedEmails].map(
              (e) => ShadOption(value: e, child: Text(e.toString())),
            ),
            initialValue: initialValue,
            placeholder: const Text('Form Initial Value'),
            onChanged: (v) {
              formKey.currentState!.setFieldValue('email', v);
            },
            selectedOptionBuilder: (context, value) => Text(
              value.toString(),
            ),
          ),
          MyBoolProperty(
            label: 'Allow deselection',
            value: allowDeselection,
            onChanged: (value) => setState(() => allowDeselection = value),
          ),
        ],
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShadSelectFormField(
                  id: 'email',
                  allowDeselection: allowDeselection,
                  minWidth: 350,
                  initialValue: initialValue,
                  onChanged: print,
                  options: verifiedEmails
                      .map(
                        (email) => ShadOption(value: email, child: Text(email)),
                      )
                      .toList(),
                  selectedOptionBuilder: (context, value) => value == 'none'
                      ? const Text('Select a verified email to display')
                      : Text(value),
                  placeholder: const Text('Select a verified email to display'),
                  validator: (v) {
                    if (v == null) {
                      return 'Please select an email to display';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ShadButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    print('submitted');
                    if (formKey.currentState!.saveAndValidate()) {
                      setState(() {
                        formValue = formKey.currentState!.value;
                      });
                    } else {
                      print('validation failed');
                    }
                  },
                ),
                if (formValue.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 24, left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('FormValue', style: theme.textTheme.p),
                        const SizedBox(height: 4),
                        SelectableText(
                          const JsonEncoder.withIndent(
                            '    ',
                          ).convert(formValue),
                          style: theme.textTheme.small,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

```
