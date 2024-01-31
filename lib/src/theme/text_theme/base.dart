import 'package:flutter/widgets.dart';

@immutable
abstract class ShadBaseTextTheme {
  const ShadBaseTextTheme({
    required this.h1Large,
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.p,
    required this.blockquote,
    required this.table,
    required this.list,
    required this.lead,
    required this.large,
    required this.small,
    required this.muted,
  });

  final TextStyle h1Large;
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;
  final TextStyle p;
  final TextStyle blockquote;
  final TextStyle table;
  final TextStyle list;
  final TextStyle lead;
  final TextStyle large;
  final TextStyle small;
  final TextStyle muted;
}
