import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    // Color scheme for light theme
    colorScheme: ColorScheme.light(
      primary: Colors.green[700]!, // Main color used throughout the app
      onPrimary:
          Colors.amber[50]!, // Color for text/icons on primary color background
      secondary:
          Colors.purple, // Secondary color for elements like FABs and Buttons
      onSecondary: Colors
          .amber[50]!, // Color for text/icons on secondary color background
      surface: Colors.amber[50]!, // Surface color for cards and sheets
      onSurface: Colors.black, // Color for text/icons on surface
      background:
          Colors.amber[50]!, // General background color for the app's scaffold
      onBackground: Colors.black, // Color for text/icons on background
    ),
    // Define the default brightness and colors
    brightness: Brightness.light,
    primaryColor: Colors.green[700],
    scaffoldBackgroundColor: Colors.amber[50],
    // AppBar theme
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.green[700], // AppBar background color
      titleTextStyle: TextStyle(
        fontFamily: 'MontaguSlab',
        fontSize: 24.0,
        color: Colors.amber[50], // AppBar text color
      ),
      iconTheme: IconThemeData(
        color: Colors.amber[50], // AppBar icon color
      ),
    ),
    // Elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            Colors.purple), // Button background color
        foregroundColor: MaterialStateProperty.all<Color>(
            Colors.amber[50]!), // Button text color
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            fontFamily: 'MontaguSlab',
            fontSize: 24.0,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    ),
    // Floating action button theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.purple, // Floating action button background color
    ),
  );
}

ThemeData appDarkTheme() {
  return ThemeData(
    colorScheme: ColorScheme.dark(
      primary: Colors.green[800]!, // Slightly darker than light theme
      onPrimary: Colors.white,
      secondary: Colors.purple[700]!,
      onSecondary: Colors.white,
      surface: Colors.grey[850]!,
      onSurface: Colors.white,
      background: Colors.grey[900]!,
      onBackground: Colors.white,
    ),
    brightness: Brightness.dark,
    primaryColor: Colors.green[800],
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.green[800],
      titleTextStyle: TextStyle(
        fontFamily: 'MontaguSlab',
        fontSize: 24.0,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.purple[700]!),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            fontFamily: 'MontaguSlab',
            fontSize: 24.0,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.purple[700],
    ),
  );
}
