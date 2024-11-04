import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff006970),
      surfaceTint: Color(0xff006970),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff9df0f8),
      onPrimaryContainer: Color(0xff002022),
      secondary: Color(0xff4a6365),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffcce8ea),
      onSecondaryContainer: Color(0xff051f21),
      tertiary: Color(0xff505e7d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffd7e2ff),
      onTertiaryContainer: Color(0xff0a1b36),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff4fafb),
      onSurface: Color(0xff161d1d),
      onSurfaceVariant: Color(0xff3f4849),
      outline: Color(0xff6f797a),
      outlineVariant: Color(0xffbec8c9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3232),
      inversePrimary: Color(0xff80d4dc),
      primaryFixed: Color(0xff9df0f8),
      onPrimaryFixed: Color(0xff002022),
      primaryFixedDim: Color(0xff80d4dc),
      onPrimaryFixedVariant: Color(0xff004f55),
      secondaryFixed: Color(0xffcce8ea),
      onSecondaryFixed: Color(0xff051f21),
      secondaryFixedDim: Color(0xffb1cbce),
      onSecondaryFixedVariant: Color(0xff324b4d),
      tertiaryFixed: Color(0xffd7e2ff),
      onTertiaryFixed: Color(0xff0a1b36),
      tertiaryFixedDim: Color(0xffb7c7ea),
      onTertiaryFixedVariant: Color(0xff384764),
      surfaceDim: Color(0xffd5dbdc),
      surfaceBright: Color(0xfff4fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f5),
      surfaceContainer: Color(0xffe9efef),
      surfaceContainerHigh: Color(0xffe3e9ea),
      surfaceContainerHighest: Color(0xffdee4e4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff004b50),
      surfaceTint: Color(0xff006970),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff238088),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2e4749),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff60797c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff344360),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff667594),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff4fafb),
      onSurface: Color(0xff161d1d),
      onSurfaceVariant: Color(0xff3b4545),
      outline: Color(0xff576162),
      outlineVariant: Color(0xff737c7d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3232),
      inversePrimary: Color(0xff80d4dc),
      primaryFixed: Color(0xff238088),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff00666d),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff60797c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff476063),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff667594),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4d5c7a),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd5dbdc),
      surfaceBright: Color(0xfff4fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f5),
      surfaceContainer: Color(0xffe9efef),
      surfaceContainerHigh: Color(0xffe3e9ea),
      surfaceContainerHighest: Color(0xffdee4e4),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00272a),
      surfaceTint: Color(0xff006970),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004b50),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff0c2628),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff2e4749),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff12223d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff344360),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff4fafb),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff1c2526),
      outline: Color(0xff3b4545),
      outlineVariant: Color(0xff3b4545),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3232),
      inversePrimary: Color(0xffb2f8ff),
      primaryFixed: Color(0xff004b50),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003236),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff2e4749),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff183033),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff344360),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff1d2d48),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd5dbdc),
      surfaceBright: Color(0xfff4fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f5),
      surfaceContainer: Color(0xffe9efef),
      surfaceContainerHigh: Color(0xffe3e9ea),
      surfaceContainerHighest: Color(0xffdee4e4),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff80d4dc),
      surfaceTint: Color(0xff80d4dc),
      onPrimary: Color(0xff00363b),
      primaryContainer: Color(0xff004f55),
      onPrimaryContainer: Color(0xff9df0f8),
      secondary: Color(0xffb1cbce),
      onSecondary: Color(0xff1b3437),
      secondaryContainer: Color(0xff324b4d),
      onSecondaryContainer: Color(0xffcce8ea),
      tertiary: Color(0xffb7c7ea),
      onTertiary: Color(0xff21304c),
      tertiaryContainer: Color(0xff384764),
      onTertiaryContainer: Color(0xffd7e2ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffdee4e4),
      onSurfaceVariant: Color(0xffbec8c9),
      outline: Color(0xff899393),
      outlineVariant: Color(0xff3f4849),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee4e4),
      inversePrimary: Color(0xff006970),
      primaryFixed: Color(0xff9df0f8),
      onPrimaryFixed: Color(0xff002022),
      primaryFixedDim: Color(0xff80d4dc),
      onPrimaryFixedVariant: Color(0xff004f55),
      secondaryFixed: Color(0xffcce8ea),
      onSecondaryFixed: Color(0xff051f21),
      secondaryFixedDim: Color(0xffb1cbce),
      onSecondaryFixedVariant: Color(0xff324b4d),
      tertiaryFixed: Color(0xffd7e2ff),
      onTertiaryFixed: Color(0xff0a1b36),
      tertiaryFixedDim: Color(0xffb7c7ea),
      onTertiaryFixedVariant: Color(0xff384764),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3b),
      surfaceContainerLowest: Color(0xff090f10),
      surfaceContainerLow: Color(0xff161d1d),
      surfaceContainer: Color(0xff1a2121),
      surfaceContainerHigh: Color(0xff252b2c),
      surfaceContainerHighest: Color(0xff303636),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff85d8e0),
      surfaceTint: Color(0xff80d4dc),
      onPrimary: Color(0xff001a1c),
      primaryContainer: Color(0xff479da5),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffb5d0d2),
      onSecondary: Color(0xff001a1c),
      secondaryContainer: Color(0xff7c9598),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffbbcbee),
      onTertiary: Color(0xff051631),
      tertiaryContainer: Color(0xff8291b2),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1415),
      onSurface: Color(0xfff6fcfc),
      onSurfaceVariant: Color(0xffc3cdcd),
      outline: Color(0xff9ba5a6),
      outlineVariant: Color(0xff7b8586),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee4e4),
      inversePrimary: Color(0xff005056),
      primaryFixed: Color(0xff9df0f8),
      onPrimaryFixed: Color(0xff001416),
      primaryFixedDim: Color(0xff80d4dc),
      onPrimaryFixedVariant: Color(0xff003d41),
      secondaryFixed: Color(0xffcce8ea),
      onSecondaryFixed: Color(0xff001416),
      secondaryFixedDim: Color(0xffb1cbce),
      onSecondaryFixedVariant: Color(0xff213a3d),
      tertiaryFixed: Color(0xffd7e2ff),
      onTertiaryFixed: Color(0xff01102b),
      tertiaryFixedDim: Color(0xffb7c7ea),
      onTertiaryFixedVariant: Color(0xff273652),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3b),
      surfaceContainerLowest: Color(0xff090f10),
      surfaceContainerLow: Color(0xff161d1d),
      surfaceContainer: Color(0xff1a2121),
      surfaceContainerHigh: Color(0xff252b2c),
      surfaceContainerHighest: Color(0xff303636),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffeefeff),
      surfaceTint: Color(0xff80d4dc),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff85d8e0),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffeefeff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffb5d0d2),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffbfaff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffbbcbee),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff3fdfd),
      outline: Color(0xffc3cdcd),
      outlineVariant: Color(0xffc3cdcd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee4e4),
      inversePrimary: Color(0xff002f33),
      primaryFixed: Color(0xffa1f4fd),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff85d8e0),
      onPrimaryFixedVariant: Color(0xff001a1c),
      secondaryFixed: Color(0xffd1ecef),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb5d0d2),
      onSecondaryFixedVariant: Color(0xff001a1c),
      tertiaryFixed: Color(0xffdee7ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffbbcbee),
      onTertiaryFixedVariant: Color(0xff051631),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3b),
      surfaceContainerLowest: Color(0xff090f10),
      surfaceContainerLow: Color(0xff161d1d),
      surfaceContainer: Color(0xff1a2121),
      surfaceContainerHigh: Color(0xff252b2c),
      surfaceContainerHighest: Color(0xff303636),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
