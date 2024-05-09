import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioPlayer _audioPlayer = AudioPlayer();

  static Future<void> playDiceRollSound() async {
    const String audioPath = 'sounds/rpg-dice-rolling-95182.mp3';
    await _audioPlayer.play(AssetSource(audioPath));
  }
}
