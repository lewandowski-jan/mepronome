import 'package:audioplayers/audioplayers.dart';

class MetroAudio {
  AudioPlayer instance = new AudioPlayer();
  AudioCache cache = new AudioCache();

  Future<AudioPlayer> play(int bpm) async {
    instance = await cache.loop("Metronome2.wav");
    return instance;
  }

  void stop() async {
    instance.pause();
  }
}