import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shadcn_ui/src/utils/extensions/text_style.dart';

const kDefaultFontFamily = 'Geist';

abstract class ShadTextDefaultTheme {
  static TextStyle h1Large() {
    return GoogleFonts.geist(
      fontSize: 48,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w800,
      height: 48 / 48,
      letterSpacing: -0.4,
      textBaseline: TextBaseline.alphabetic,
    ).fallback(leadingDistribution: TextLeadingDistribution.even);
  }

  static TextStyle h1() {
    return GoogleFonts.geist(
      fontSize: 36,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w800,
      height: 40 / 36,
      letterSpacing: -0.4,
      textBaseline: TextBaseline.alphabetic,
    ).fallback(leadingDistribution: TextLeadingDistribution.even);
  }

  static TextStyle h2() {
    return GoogleFonts.geist(
      fontSize: 30,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: 36 / 30,
      letterSpacing: -0.4,
      textBaseline: TextBaseline.alphabetic,
    ).fallback(leadingDistribution: TextLeadingDistribution.even);
  }

  static TextStyle h3() {
    return GoogleFonts.geist(
      fontSize: 24,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: 32 / 24,
      letterSpacing: -0.4,
      textBaseline: TextBaseline.alphabetic,
    ).fallback(leadingDistribution: TextLeadingDistribution.even);
  }

  static TextStyle h4() {
    return GoogleFonts.geist(
      fontSize: 20,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: 28 / 20,
      letterSpacing: -0.4,
      textBaseline: TextBaseline.alphabetic,
    ).fallback(leadingDistribution: TextLeadingDistribution.even);
  }

  static TextStyle p() {
    return GoogleFonts.geist(
      fontSize: 16,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 28 / 16,
      letterSpacing: 0,
      textBaseline: TextBaseline.alphabetic,
    ).fallback(leadingDistribution: TextLeadingDistribution.even);
  }

  static TextStyle blockquote() {
    return GoogleFonts.geist(
      fontSize: 16,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w400,
      height: 24 / 16,
      letterSpacing: 0,
      textBaseline: TextBaseline.alphabetic,
    ).fallback(leadingDistribution: TextLeadingDistribution.even);
  }

  static TextStyle table() {
    return GoogleFonts.geist(
      fontSize: 16,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 24 / 16,
      letterSpacing: 0,
      textBaseline: TextBaseline.alphabetic,
    ).fallback(leadingDistribution: TextLeadingDistribution.even);
  }

  static TextStyle list() {
    return GoogleFonts.geist(
      fontSize: 16,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 24 / 16,
      letterSpacing: 0,
      textBaseline: TextBaseline.alphabetic,
    ).fallback(leadingDistribution: TextLeadingDistribution.even);
  }

  static TextStyle lead() {
    return GoogleFonts.geist(
      fontSize: 20,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 28 / 20,
      letterSpacing: 0,
      textBaseline: TextBaseline.alphabetic,
    ).fallback(leadingDistribution: TextLeadingDistribution.even);
  }

  static TextStyle large() {
    return GoogleFonts.geist(
      fontSize: 18,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: 28 / 18,
      letterSpacing: 0,
      textBaseline: TextBaseline.alphabetic,
    ).fallback(leadingDistribution: TextLeadingDistribution.even);
  }

  static TextStyle small() {
    return GoogleFonts.geist(
      fontSize: 14,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      height: 14 / 14,
      letterSpacing: 0,
      textBaseline: TextBaseline.alphabetic,
    ).fallback(leadingDistribution: TextLeadingDistribution.even);
  }

  static TextStyle muted() {
    return GoogleFonts.geist(
      fontSize: 14,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 20 / 14,
      letterSpacing: 0,
      textBaseline: TextBaseline.alphabetic,
    ).fallback(leadingDistribution: TextLeadingDistribution.even);
  }
}
