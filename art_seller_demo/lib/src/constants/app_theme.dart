import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

ThemeData light = FlexThemeData.light(
  scheme: FlexScheme.gold,
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 7,
  tabBarStyle: FlexTabBarStyle.forAppBar,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
// To use the Playground font, add GoogleFonts package and uncomment
// fontFamily: GoogleFonts.notoSans().fontFamily,
);

ThemeData dark = FlexThemeData.dark(
  scheme: FlexScheme.gold,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 13,
  tabBarStyle: FlexTabBarStyle.forAppBar,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
// To use the Playground font, add GoogleFonts package and uncomment
// fontFamily: GoogleFonts.notoSans().fontFamily,
);
