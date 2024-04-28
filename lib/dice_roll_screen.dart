import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Roll a ${widget.diceType}',
          style: TextStyle(
            fontFamily: 'MontaguSlab',
            fontSize: 24.0,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(widget.diceImage),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.1,
                  child: Text(
                    diceFaceNumber.toString(),
                    style: TextStyle(
                      fontSize: 128, // Adjust the size accordingly
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                    Theme.of(context).colorScheme.secondary),
              ),
              onPressed: rollDice,
              child: Text(
                'ROLL',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: 24.0,
                  fontFamily: 'MontaguSlab',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
