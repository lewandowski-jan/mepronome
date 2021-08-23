import 'dart:async';

import 'package:audioplayers/audioplayers.dart';

class MetroAudio {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioCache _audioCache = AudioCache();
  late Timer _timer;

  Future<void> _onTick(Timer t) async {
    await _audioCache.play("Metronome2.wav");
  }

  void play(int bpm) {
    final _tickIntervalBPS = (60 / bpm * 1000).toInt();
    _timer = Timer.periodic(
        Duration(
          milliseconds: _tickIntervalBPS,
        ),
        _onTick);
  }

  void stop() async {
    _timer.cancel();
    _audioPlayer.pause();
  }
}
