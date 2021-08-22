import 'dart:async';

import 'package:audioplayers/audioplayers.dart';

class MetroAudio {
  AudioPlayer _instance = new AudioPlayer();
  AudioCache _cache = new AudioCache();
  late Timer _tickTimer;
  late int _tickIntervalBPS;


  void play(int bpm) {
    _tickIntervalBPS = (60 /bpm * 1000).toInt();
    _tickTimer = new Timer.periodic(new Duration(milliseconds: _tickIntervalBPS), _onTick);

  }

  Future<AudioPlayer> _onTick(Timer t) async {
    _instance = await _cache.play("Metronome2.wav");
    return _instance;

  }

  void stop() async {
    _tickTimer.cancel();
    _instance.pause();
  }
}