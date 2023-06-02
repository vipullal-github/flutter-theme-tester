import 'package:flutter/material.dart';

class AppDataProvider with ChangeNotifier {
  late Color swatchColor;
  late Color seedColor;
  late Color primaryColor;
  late ThemeData lightTheme;
  late ThemeData darkTheme;
  ThemeMode currentMode = ThemeMode.dark;

  // Singleton instance for this simple app.
  AppDataProvider() {
    initInstance();
  }

  void initInstance() {
    ColorScheme lightScheme = ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: const Color.fromARGB(255, 232, 72, 72));
    ColorScheme darkScheme = ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color.fromARGB(255, 7, 79, 11));
    lightTheme = ThemeData.from(colorScheme: lightScheme);
    darkTheme = ThemeData(colorScheme: darkScheme);
  }

  void toggleThemeMode() {
    currentMode =
        currentMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

class AppDataChangerWidget extends StatefulWidget {
  const AppDataChangerWidget({super.key});

  @override
  State<AppDataChangerWidget> createState() => _AppDataChangerWidgetState();
}

class _AppDataChangerWidgetState extends State<AppDataChangerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AppDataChangerWidget")),
      body: const Placeholder(),
    );
  }
}
