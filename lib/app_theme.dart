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
