import 'package:flutter/material.dart';
import 'dart:math';

import 'audio_manager.dart';

class DiceRollScreen extends StatefulWidget {
  final String diceType;
  final String diceImage;
  final int maxNumber;

  const DiceRollScreen({
    Key? key,
    required this.diceType,
    required this.diceImage,
    required this.maxNumber,
  }) : super(key: key);

  @override
  _DiceRollScreenState createState() => _DiceRollScreenState();
}

class _DiceRollScreenState extends State<DiceRollScreen> {
  int diceFaceNumber = 1;

  void rollDice() {
    setState(() {
      diceFaceNumber = Random().nextInt(widget.maxNumber) + 1;
    });
    // Play the dice roll sound
    AudioManager.playDiceRollSound();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('Roll a ${widget.diceType}'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        // Make the body scrollable
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: AspectRatio(
                  aspectRatio: 1, // Keep the image square
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        0.6, // Dynamically size based on screen width
                    child: Stack(
                      alignment:
                          Alignment.center, // Center the text on the image
                      children: [
                        Image.asset(
                          widget.diceImage,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          diceFaceNumber.toString(),
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width *
                                0.2, // Make font size responsive
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Ensure the text is visible
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Space between image and button
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.secondary),
                ),
                onPressed: rollDice,
                child: Text(
                  'ROLL',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
