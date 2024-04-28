import 'package:dice_app/app_theme.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dice_data.dart';
import 'dice_button.dart';
import 'dice_roll_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roll That Dice',
      theme: appTheme(),
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

class HomeScreen extends StatelessWidget {
  // TODO: Implement the home screen with dice selection menu
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Roll That Dice',
            style: TextStyle(
              fontFamily: 'MontaguSlab',
              fontSize: 24.0,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two items per row
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.75, // Aspect ratio for the dice buttons
        ),
        itemCount: diceAttributes.length,
        itemBuilder: (context, index) {
          final dice = diceAttributes[index];
          return GestureDetector(
            onTap: () {
              // Navigate to the respective dice screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DiceRollScreen(
                    diceType: dice['type'],
                    diceImage: dice['image'],
                    maxNumber: dice['maxNumber'],
                  ),
                ),
              );
            },
            child: DiceButton(dice: dice),
          );
        },
      ),
    );
  }
}
