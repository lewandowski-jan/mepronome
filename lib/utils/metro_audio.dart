import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:quiver/async.dart';

class MetroAudio {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioCache _audioCache = AudioCache();
  // late Timer _timer;
  late StreamSubscription<DateTime> _timer;

  Future<void> _onTick() async {
    await _audioCache.play("Metronome2.wav");
  }

  void play(int bpm) async{
    final _tickIntervalBPS = (60 / bpm * 1000 * 1000).toInt();
    _timer = Metronome.periodic(new Duration(microseconds: _tickIntervalBPS)).listen((d) { _onTick();});
    // _timer = Timer.periodic(
    //     Duration(
    //       microseconds: _tickIntervalBPS,
    //     ),
    //     _onTick);
  }

  void stop() async {
    _timer.cancel();
    _audioPlayer.stop();
  }
}
