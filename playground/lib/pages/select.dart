import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum SelectVariant {
  fruits,
  timezone,
}

class SelectPage extends StatelessWidget {
  const SelectPage({
    super.key,
    required this.variant,
  });

  final SelectVariant variant;

  @override
  Widget build(BuildContext context) {
    final theme = ShadcnTheme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Align(
          alignment: Alignment.topCenter,
          child: () {
            return switch (variant) {
              SelectVariant.fruits => ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 180),
                  child: ShadcnSelect<String>(
                    placeholder: const Text('Select a fruit'),
                    options: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 6, 6, 6),
                        child: Text(
                          'Fruits',
                          style: theme.textTheme.muted.copyWith(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.popoverForeground,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const ShadcnOption(value: 'Apple', child: Text('Apple')),
                      const ShadcnOption(
                          value: 'Banana', child: Text('Banana')),
                      const ShadcnOption(
                          value: 'Blueberry', child: Text('Blueberry')),
                      const ShadcnOption(
                          value: 'Grapes', child: Text('Grapes')),
                      const ShadcnOption(
                          value: 'Pineapple', child: Text('Pineapple')),
                    ],
                    selectedOptionBuilder: (context, value) => Text(value),
                  ),
                ),
              SelectVariant.timezone => ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 280),
                  child: ShadcnSelect<String>(
                    placeholder: const Text('Select a timezone'),
                    options: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 6, 6, 6),
                        child: Text(
                          'North America',
                          style: theme.textTheme.muted.copyWith(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.popoverForeground,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const ShadcnOption(
                        value: 'est',
                        child: Text('Eastern Standard Time (EST)'),
                      ),
                      const ShadcnOption(
                        value: 'cst',
                        child: Text('Central Standard Time (CST)'),
                      ),
                      const ShadcnOption(
                        value: 'mst',
                        child: Text('Mountain Standard Time (MST)'),
                      ),
                      const ShadcnOption(
                        value: 'pst',
                        child: Text('Pacific Standard Time (PST)'),
                      ),
                      const ShadcnOption(
                        value: 'akst',
                        child: Text('Alaska Standard Time (AKST)'),
                      ),
                      const ShadcnOption(
                        value: 'hst',
                        child: Text('Hawaii Standard Time (HST)'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 6, 6, 6),
                        child: Text(
                          'Europe & Africa',
                          style: theme.textTheme.muted.copyWith(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.popoverForeground,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const ShadcnOption(
                        value: 'gmt',
                        child: Text('Greenwich Mean Time (GMT)'),
                      ),
                      const ShadcnOption(
                        value: 'cet',
                        child: Text('Central European Time (CET)'),
                      ),
                      const ShadcnOption(
                        value: 'eet',
                        child: Text('Eastern European Time (EET)'),
                      ),
                      const ShadcnOption(
                        value: 'west',
                        child: Text('Western European Summer Time (WEST)'),
                      ),
                      const ShadcnOption(
                        value: 'cat',
                        child: Text('Central Africa Time (CAT)'),
                      ),
                      const ShadcnOption(
                        value: 'eat',
                        child: Text('East Africa Time (EAT)'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 6, 6, 6),
                        child: Text(
                          'Asia',
                          style: theme.textTheme.muted.copyWith(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.popoverForeground,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const ShadcnOption(
                        value: 'msk',
                        child: Text('Moscow Time (MSK)'),
                      ),
                      const ShadcnOption(
                        value: 'ist',
                        child: Text('India Standard Time (IST)'),
                      ),
                      const ShadcnOption(
                        value: 'cst_china',
                        child: Text('China Standard Time (CST)'),
                      ),
                      const ShadcnOption(
                        value: 'jst',
                        child: Text('Japan Standard Time (JST)'),
                      ),
                      const ShadcnOption(
                        value: 'kst',
                        child: Text('Korea Standard Time (KST)'),
                      ),
                      const ShadcnOption(
                        value: 'ist_indonesia',
                        child: Text('Indonesia Central Standard Time (WITA)'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 6, 6, 6),
                        child: Text(
                          'Australia & Pacific',
                          style: theme.textTheme.muted.copyWith(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.popoverForeground,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const ShadcnOption(
                        value: 'awst',
                        child: Text('Australian Western Standard Time (AWST)'),
                      ),
                      const ShadcnOption(
                        value: 'acst',
                        child: Text('Australian Central Standard Time (ACST)'),
                      ),
                      const ShadcnOption(
                        value: 'aest',
                        child: Text('Australian Eastern Standard Time (AEST)'),
                      ),
                      const ShadcnOption(
                        value: 'nzst',
                        child: Text('New Zealand Standard Time (NZST)'),
                      ),
                      const ShadcnOption(
                        value: 'fjt',
                        child: Text('Fiji Time (FJT)'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 6, 6, 6),
                        child: Text(
                          'South America',
                          style: theme.textTheme.muted.copyWith(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.popoverForeground,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const ShadcnOption(
                        value: 'art',
                        child: Text('Argentina Time (ART)'),
                      ),
                      const ShadcnOption(
                        value: 'bot',
                        child: Text('Bolivia Time (BOT)'),
                      ),
                      const ShadcnOption(
                        value: 'brt',
                        child: Text('Brasilia Time (BRT)'),
                      ),
                      const ShadcnOption(
                        value: 'clt',
                        child: Text('Chile Standard Time (CLT)'),
                      ),
                    ],
                    selectedOptionBuilder: (context, value) => Text(value),
                  ),
                )
            };
          }(),
        ),
      ),
    );
  }
}
