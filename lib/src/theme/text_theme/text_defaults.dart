import 'package:flutter/widgets.dart';

abstract class ShadcnTextDefaultTheme {
  static TextStyle h1() {
    return const TextStyle(
      fontSize: 48,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 48 / 48,
      letterSpacing: -1.21,
    );
  }

  static TextStyle h2() {
    return const TextStyle(
      fontSize: 30,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 36 / 30,
      letterSpacing: -0.75,
    );
  }

  static TextStyle h3() {
    return const TextStyle(
      fontSize: 24,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 32 / 24,
      letterSpacing: -0.61,
    );
  }

  static TextStyle h4() {
    return const TextStyle(
      fontSize: 20,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 28 / 20,
      letterSpacing: -0.5,
    );
  }

  static TextStyle large() {
    return const TextStyle(
      fontSize: 18,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 28 / 18,
      letterSpacing: 0,
    );
  }

  static TextStyle lead() {
    return const TextStyle(
      fontSize: 20,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 28 / 20,
      letterSpacing: 0,
    );
  }

  static TextStyle p() {
    return const TextStyle(
      fontSize: 16,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 28 / 16,
      letterSpacing: 0,
    );
  }

  static TextStyle list() {
    return const TextStyle(
      fontSize: 16,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 24 / 16,
      letterSpacing: 0,
    );
  }

  static TextStyle body() {
    return const TextStyle(
      fontSize: 14,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 24 / 14,
      letterSpacing: 0,
    );
  }

  static TextStyle bodymedium() {
    return const TextStyle(
      fontSize: 14,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      height: 24 / 14,
      letterSpacing: 0,
    );
  }

  static TextStyle muted() {
    return const TextStyle(
      fontSize: 14,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 20 / 14,
      letterSpacing: 0,
    );
  }

  static TextStyle small() {
    return const TextStyle(
      fontSize: 14,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      height: 14 / 14,
      letterSpacing: 0,
    );
  }

  static TextStyle detail() {
    return const TextStyle(
      fontSize: 12,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      height: 20 / 12,
      letterSpacing: 0,
    );
  }

  static TextStyle blockquote() {
    return const TextStyle(
      fontSize: 16,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w400,
      height: 24 / 16,
      letterSpacing: 0,
    );
  }

  static TextStyle table() {
    return const TextStyle(
      fontSize: 16,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 24 / 16,
      letterSpacing: 0,
    );
  }
}
