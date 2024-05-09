import 'package:dice_app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'dart:async';

import 'home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(appTheme()), // Default to light theme
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Roll That Dice',
      theme: themeProvider.themeData,
      debugShowCheckedModeBanner: false, // This disables the debug banner
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5), // Define how long the splash screen should display
      () => Navigator.pushReplacement(
        // Navigate to home screen after delay
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Text(
          'ROLL\nTHAT\nDICE',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'MontaguSlab',
            fontSize: 64,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
