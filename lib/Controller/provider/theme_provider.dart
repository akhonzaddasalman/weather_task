/*
  ThemeProvider Class

  This Dart file defines the `ThemeProvider` class, which manages the app theme mode and provides functionality to toggle between light, dark, and system themes.

  Dependencies:
  - package:flutter/material.dart
  - ride_driver/View/Constants/Colors/colors.dart (Assumed to be custom color constants)
  - package:shared_preferences/shared_preferences.dart

  Example Usage:
  - Create an instance of `ThemeProvider` providing a `BuildContext`.
  - Access the current theme mode using the `themeMode` property.
  - Access the current theme data using the `themeData` property.
  - Toggle the theme using the `toggleTheme` method, providing the desired `CustomTheme`.
*/

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_application/View/Constants/Colors/colors.dart';

enum CustomTheme { light, dark, system }

class ThemeProvider with ChangeNotifier {
  BuildContext context;
  CustomTheme _themeMode = CustomTheme.system;
  static const String _themeKey = 'themeMode';

  ThemeProvider(this.context) {
    _loadTheme();
  }

  CustomTheme get themeMode => _themeMode;

  Brightness get systemBrightness {
    return WidgetsBinding.instance.window.platformBrightness ?? Brightness.light;
  }

  bool get isDarkMode {
    switch (_themeMode) {
      case CustomTheme.light:
        return false;
      case CustomTheme.dark:
        return true;
      case CustomTheme.system:
        return systemBrightness == Brightness.dark;
    }
  }

  ThemeData get themeData {
    switch (_themeMode) {
      case CustomTheme.light:
        return MyThemes.lightTheme(context);
      case CustomTheme.dark:
        return MyThemes.darkTheme(context);
      case CustomTheme.system:
        return isDarkMode ? MyThemes.darkTheme(context) : MyThemes.lightTheme(context);
    }
  }

  void toggleTheme(CustomTheme newTheme) {
    _themeMode = newTheme;
    _saveTheme();
    notifyListeners();
  }

  Future<void> _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    CustomTheme savedTheme = CustomTheme.values[prefs.getInt(_themeKey) ?? 0];
    _themeMode = savedTheme;
    notifyListeners();
  }

  Future<void> _saveTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_themeKey, _themeMode.index);
  }
}

class MyThemes {
  static ThemeData lightTheme(BuildContext context) {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      brightness: Brightness.light,
      applyElevationOverlayColor: true,
      canvasColor: Colors.white,
      cardColor: Colors.white,
      colorScheme: ColorScheme.light(
        primary: Colors.white,
        primaryContainer: Colors.grey.shade300,
        secondary: Colors.green,
        secondaryContainer: Colors.grey.shade200,
        background: Colors.grey.shade200,
      ),
      dialogBackgroundColor: Colors.white,
      disabledColor: Colors.grey[300],
      dividerColor: Colors.grey[400],
      focusColor: Colors.grey[200],
      highlightColor: Colors.grey[100],
      hintColor: Colors.grey[600],
      hoverColor: Colors.grey[50],
      indicatorColor: Colors.grey[300],
      primaryColor: Colors.grey,
      primaryColorDark: Colors.grey,
      primaryColorLight: Colors.grey[100],
      scaffoldBackgroundColor: Colors.white,
      secondaryHeaderColor: Colors.grey[50],
      shadowColor: Colors.grey[50],
      splashColor: Colors.grey[100],
      unselectedWidgetColor: Colors.grey[500],
      iconTheme: IconThemeData(
        color: Colors.grey[600],
      ),
      textTheme: Theme.of(context).textTheme.copyWith(
            displayLarge: const TextStyle(color: Colors.black),
            displayMedium: const TextStyle(color: Colors.black),
            displaySmall: const TextStyle(color: Colors.black),
            headlineLarge: const TextStyle(color: Colors.black),
            headlineMedium: const TextStyle(color: Colors.black),
            headlineSmall: const TextStyle(color: Colors.black),
            titleLarge: const TextStyle(color: Colors.black),
            titleMedium: const TextStyle(color: Colors.black),
            titleSmall: const TextStyle(color: Colors.black),
            bodyLarge: const TextStyle(color: Colors.black),
            bodyMedium: const TextStyle(color: Colors.black),
            bodySmall: const TextStyle(color: Colors.black),
            labelLarge: const TextStyle(color: Colors.black),
            labelMedium: const TextStyle(color: Colors.black),
            labelSmall: const TextStyle(color: Colors.black),
          ),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
      ),
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: const ColorScheme.light(),
          ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      brightness: Brightness.dark,
      applyElevationOverlayColor: true,
      canvasColor: Colors.black12,
      cardColor: Colors.grey[850],
      colorScheme: ColorScheme.dark(
        primary: Colors.grey.shade200,
        primaryContainer: Colors.grey[800],
        secondary: Colors.grey.shade300,
        secondaryContainer: Colors.grey.shade400,
        background: Colors.grey.shade500,
      ),
      dialogBackgroundColor: Colors.black12,
      disabledColor: Colors.grey[600],
      dividerColor: Colors.grey[300],
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hintColor: Colors.grey[400],
      hoverColor: Colors.transparent,
      indicatorColor: Colors.grey[900],
      primaryColor: Colors.grey[900],
      primaryColorDark: Colors.grey[800],
      primaryColorLight: Colors.grey[500],
      scaffoldBackgroundColor: kPrimaryColor.withOpacity(0.5),
      bottomAppBarTheme: Theme.of(context).bottomAppBarTheme.copyWith(
            color: kPrimaryColor.withOpacity(0.5),
          ),
      secondaryHeaderColor: Colors.grey[400],
      shadowColor: Colors.grey[200],
      splashColor: Colors.transparent,
      unselectedWidgetColor: Colors.grey[800],
      iconTheme: IconThemeData(color: Colors.grey.shade600),
      textTheme: Theme.of(context).textTheme.copyWith(
            displayLarge: const TextStyle(color: Colors.white),
            displayMedium: const TextStyle(color: Colors.white),
            displaySmall: const TextStyle(color: Colors.white),
            headlineLarge: const TextStyle(color: Colors.white),
            headlineMedium: const TextStyle(color: Colors.white),
            headlineSmall: const TextStyle(color: Colors.white),
            titleLarge: const TextStyle(color: Colors.white),
            titleMedium: const TextStyle(color: Colors.white),
            titleSmall: const TextStyle(color: Colors.white),
            bodyLarge: const TextStyle(color: Colors.white),
            bodyMedium: const TextStyle(color: Colors.white),
            bodySmall: const TextStyle(color: Colors.white),
            labelLarge: const TextStyle(color: Colors.white),
            labelMedium: const TextStyle(color: Colors.white),
            labelSmall: const TextStyle(color: Colors.white),
          ),
      primaryIconTheme: IconThemeData(
        color: Colors.grey[300],
      ),
      badgeTheme: BadgeThemeData(
        backgroundColor: Colors.grey[800],
        textColor: Colors.white,
      ),
    );
  }
}
