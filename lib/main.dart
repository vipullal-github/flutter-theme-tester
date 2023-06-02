import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:theming/app_data_provider.dart';

import 'sample_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider<AppDataProvider>(
      create: (_) => AppDataProvider(),
      builder: (_, __) => const MyApp(),
    ),
  );
}

// Theme config for FlexColorScheme version 7.1.x. Make sure you use
// same or higher package version, but still same major version. If you
// use a lower package version, some properties may not be supported.
// In that case remove them after copying this theme to your app.
ThemeData lightTheme = FlexThemeData.light(
  scheme: FlexScheme.materialBaseline,
  usedColors: 1,
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  blendLevel: 1,
  appBarStyle: FlexAppBarStyle.background,
  subThemesData: const FlexSubThemesData(
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
    elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
    segmentedButtonSchemeColor: SchemeColor.primary,
    inputDecoratorSchemeColor: SchemeColor.primary,
    inputDecoratorBackgroundAlpha: 21,
    inputDecoratorRadius: 8.0,
    inputDecoratorUnfocusedHasBorder: false,
    inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
    popupMenuRadius: 6.0,
    popupMenuElevation: 4.0,
    dialogRadius: 20.0,
    dialogElevation: 3.0,
    timePickerDialogRadius: 20.0,
    drawerIndicatorSchemeColor: SchemeColor.primary,
    bottomNavigationBarMutedUnselectedLabel: false,
    bottomNavigationBarMutedUnselectedIcon: false,
    menuRadius: 6.0,
    menuElevation: 4.0,
    menuBarRadius: 0.0,
    menuBarElevation: 1.0,
    navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
    navigationBarMutedUnselectedLabel: false,
    navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
    navigationBarMutedUnselectedIcon: false,
    navigationBarIndicatorSchemeColor: SchemeColor.primary,
    navigationBarIndicatorOpacity: 1.00,
    navigationBarBackgroundSchemeColor: SchemeColor.background,
    navigationBarElevation: 0.0,
    navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
    navigationRailMutedUnselectedLabel: false,
    navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
    navigationRailMutedUnselectedIcon: false,
    navigationRailIndicatorSchemeColor: SchemeColor.primary,
    navigationRailIndicatorOpacity: 1.00,
  ),
  keyColors: const FlexKeyColors(
    useSecondary: true,
    useTertiary: true,
    keepPrimary: true,
  ),
  tones: FlexTones.oneHue(Brightness.light),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);

ThemeData darkTheme = FlexThemeData.dark(
  scheme: FlexScheme.materialBaseline,
  usedColors: 1,
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  blendLevel: 4,
  appBarStyle: FlexAppBarStyle.background,
  subThemesData: const FlexSubThemesData(
    blendTextTheme: true,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
    elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
    segmentedButtonSchemeColor: SchemeColor.primary,
    inputDecoratorSchemeColor: SchemeColor.primary,
    inputDecoratorBackgroundAlpha: 43,
    inputDecoratorRadius: 8.0,
    inputDecoratorUnfocusedHasBorder: false,
    inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
    popupMenuRadius: 6.0,
    popupMenuElevation: 4.0,
    dialogRadius: 20.0,
    dialogElevation: 3.0,
    timePickerDialogRadius: 20.0,
    drawerIndicatorSchemeColor: SchemeColor.primary,
    bottomNavigationBarMutedUnselectedLabel: false,
    bottomNavigationBarMutedUnselectedIcon: false,
    menuRadius: 6.0,
    menuElevation: 4.0,
    menuBarRadius: 0.0,
    menuBarElevation: 1.0,
    navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
    navigationBarMutedUnselectedLabel: false,
    navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
    navigationBarMutedUnselectedIcon: false,
    navigationBarIndicatorSchemeColor: SchemeColor.primary,
    navigationBarIndicatorOpacity: 1.00,
    navigationBarBackgroundSchemeColor: SchemeColor.background,
    navigationBarElevation: 0.0,
    navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
    navigationRailMutedUnselectedLabel: false,
    navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
    navigationRailMutedUnselectedIcon: false,
    navigationRailIndicatorSchemeColor: SchemeColor.primary,
    navigationRailIndicatorOpacity: 1.00,
  ),
  keyColors: const FlexKeyColors(
    useSecondary: true,
    useTertiary: true,
  ),
  tones: FlexTones.oneHue(Brightness.dark),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);

// ThemeData myDarkTheme = ThemeData(colorSchemeSeed: Colors.green[800]);
// ThemeData myLightTheme = ThemeData(colorSchemeSeed: Colors.green[100]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppDataProvider p = Provider.of<AppDataProvider>(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Theming',
      theme: p.lightTheme, //lightTheme,
      darkTheme: p.darkTheme, //darkTheme,
      themeMode: p.currentMode,
      home: const SamplePage(),
    );
  }
}
