import 'package:dice_app/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_theme.dart';
import 'dice_button.dart';
import 'dice_data.dart';
import 'dice_roll_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeData.brightness == Brightness.dark;

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
        actions: <Widget>[
          IconButton(
            icon: Icon(isDarkMode ? Icons.brightness_7 : Icons.brightness_4),
            onPressed: () {
              themeProvider.themeData =
                  isDarkMode ? appTheme() : appDarkTheme();
            },
          ),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.builder(
            padding: const EdgeInsets.all(16.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 0.75,
            ),
            itemCount: diceAttributes.length,
            itemBuilder: (context, index) {
              final dice = diceAttributes[index];
              return GestureDetector(
                onTap: () {
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
          );
        },
      ),
    );
  }
}
