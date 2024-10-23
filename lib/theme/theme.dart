import "package:flutter/material.dart";

class MyAppTheme {
  final TextTheme textTheme;

  const MyAppTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff765a0b),
      surfaceTint: Color(0xff765a0b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdf9a),
      onPrimaryContainer: Color(0xff251a00),
      secondary: Color(0xff6b5d3f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfff4e0bb),
      onSecondaryContainer: Color(0xff241a04),
      tertiary: Color(0xff496547),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffcbebc5),
      onTertiaryContainer: Color(0xff062109),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff171d1e),
      onSurfaceVariant: Color(0xff4d4639),
      outline: Color(0xff7f7667),
      outlineVariant: Color(0xffd0c5b4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xffe8c26c),
      primaryFixed: Color(0xffffdf9a),
      onPrimaryFixed: Color(0xff251a00),
      primaryFixedDim: Color(0xffe8c26c),
      onPrimaryFixedVariant: Color(0xff5a4300),
      secondaryFixed: Color(0xfff4e0bb),
      onSecondaryFixed: Color(0xff241a04),
      secondaryFixedDim: Color(0xffd7c4a0),
      onSecondaryFixedVariant: Color(0xff52452a),
      tertiaryFixed: Color(0xffcbebc5),
      onTertiaryFixed: Color(0xff062109),
      tertiaryFixedDim: Color(0xffafcfaa),
      onTertiaryFixedVariant: Color(0xff324d31),
      surfaceDim: Color(0xffd5dbdc),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe9eff0),
      surfaceContainerHigh: Color(0xffe3e9ea),
      surfaceContainerHighest: Color(0xffdee3e5),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff563f00),
      surfaceTint: Color(0xff765a0b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff8f7023),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4e4126),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff827354),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2e492e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5f7c5c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff171d1e),
      onSurfaceVariant: Color(0xff494235),
      outline: Color(0xff665e50),
      outlineVariant: Color(0xff827a6b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xffe8c26c),
      primaryFixed: Color(0xff8f7023),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff745808),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff827354),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff685a3d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5f7c5c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff476345),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd5dbdc),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe9eff0),
      surfaceContainerHigh: Color(0xffe3e9ea),
      surfaceContainerHighest: Color(0xffdee3e5),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2d2000),
      surfaceTint: Color(0xff765a0b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff563f00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2b2108),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4e4126),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff0d280f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff2e492e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff292318),
      outline: Color(0xff494235),
      outlineVariant: Color(0xff494235),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xffffeac1),
      primaryFixed: Color(0xff563f00),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff3a2a00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4e4126),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff362b12),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff2e492e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff183219),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd5dbdc),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe9eff0),
      surfaceContainerHigh: Color(0xffe3e9ea),
      surfaceContainerHighest: Color(0xffdee3e5),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe8c26c),
      surfaceTint: Color(0xffe8c26c),
      onPrimary: Color(0xff3f2e00),
      primaryContainer: Color(0xff5a4300),
      onPrimaryContainer: Color(0xffffdf9a),
      secondary: Color(0xffd7c4a0),
      onSecondary: Color(0xff3a2f15),
      secondaryContainer: Color(0xff52452a),
      onSecondaryContainer: Color(0xfff4e0bb),
      tertiary: Color(0xffafcfaa),
      onTertiary: Color(0xff1c361c),
      tertiaryContainer: Color(0xff324d31),
      onTertiaryContainer: Color(0xffcbebc5),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffdee3e5),
      onSurfaceVariant: Color(0xffd0c5b4),
      outline: Color(0xff999080),
      outlineVariant: Color(0xff4d4639),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff765a0b),
      primaryFixed: Color(0xffffdf9a),
      onPrimaryFixed: Color(0xff251a00),
      primaryFixedDim: Color(0xffe8c26c),
      onPrimaryFixedVariant: Color(0xff5a4300),
      secondaryFixed: Color(0xfff4e0bb),
      onSecondaryFixed: Color(0xff241a04),
      secondaryFixedDim: Color(0xffd7c4a0),
      onSecondaryFixedVariant: Color(0xff52452a),
      tertiaryFixed: Color(0xffcbebc5),
      onTertiaryFixed: Color(0xff062109),
      tertiaryFixedDim: Color(0xffafcfaa),
      onTertiaryFixedVariant: Color(0xff324d31),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3b),
      surfaceContainerLowest: Color(0xff090f10),
      surfaceContainerLow: Color(0xff171d1e),
      surfaceContainer: Color(0xff1b2122),
      surfaceContainerHigh: Color(0xff252b2c),
      surfaceContainerHighest: Color(0xff303637),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffecc670),
      surfaceTint: Color(0xffe8c26c),
      onPrimary: Color(0xff1f1500),
      primaryContainer: Color(0xffae8c3d),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffdbc9a4),
      onSecondary: Color(0xff1e1501),
      secondaryContainer: Color(0xff9f8f6e),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffb4d3ae),
      onTertiary: Color(0xff021b05),
      tertiaryContainer: Color(0xff7b9877),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1415),
      onSurface: Color(0xfff6fcfd),
      onSurfaceVariant: Color(0xffd4c9b8),
      outline: Color(0xffaba291),
      outlineVariant: Color(0xff8b8273),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff5c4400),
      primaryFixed: Color(0xffffdf9a),
      onPrimaryFixed: Color(0xff181000),
      primaryFixedDim: Color(0xffe8c26c),
      onPrimaryFixedVariant: Color(0xff463300),
      secondaryFixed: Color(0xfff4e0bb),
      onSecondaryFixed: Color(0xff181000),
      secondaryFixedDim: Color(0xffd7c4a0),
      onSecondaryFixedVariant: Color(0xff40351b),
      tertiaryFixed: Color(0xffcbebc5),
      onTertiaryFixed: Color(0xff001603),
      tertiaryFixedDim: Color(0xffafcfaa),
      onTertiaryFixedVariant: Color(0xff223c22),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3b),
      surfaceContainerLowest: Color(0xff090f10),
      surfaceContainerLow: Color(0xff171d1e),
      surfaceContainer: Color(0xff1b2122),
      surfaceContainerHigh: Color(0xff252b2c),
      surfaceContainerHighest: Color(0xff303637),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffffaf7),
      surfaceTint: Color(0xffe8c26c),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffecc670),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffffaf7),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffdbc9a4),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff1ffea),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffb4d3ae),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffffaf7),
      outline: Color(0xffd4c9b8),
      outlineVariant: Color(0xffd4c9b8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff372800),
      primaryFixed: Color(0xffffe4ac),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffecc670),
      onPrimaryFixedVariant: Color(0xff1f1500),
      secondaryFixed: Color(0xfff9e5bf),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffdbc9a4),
      onSecondaryFixedVariant: Color(0xff1e1501),
      tertiaryFixed: Color(0xffcff0c9),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffb4d3ae),
      onTertiaryFixedVariant: Color(0xff021b05),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3b),
      surfaceContainerLowest: Color(0xff090f10),
      surfaceContainerLow: Color(0xff171d1e),
      surfaceContainer: Color(0xff1b2122),
      surfaceContainerHigh: Color(0xff252b2c),
      surfaceContainerHighest: Color(0xff303637),
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
        scaffoldBackgroundColor: colorScheme.surface,
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
