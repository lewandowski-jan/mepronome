import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';
import 'package:quiver/async.dart';

class MetroAudio {
  MetroAudio() {
    this.pool = Soundpool.fromOptions(
      options: SoundpoolOptions(
        streamType: StreamType.notification,
        maxStreams: 12,
      ),
    );
  }
  
  late Soundpool pool;
  late int soundId;
  final String filePath = 'assets/Metronome2.wav';
  late StreamSubscription<DateTime> _timer;

  Future<void> prepare() async {
    soundId = await rootBundle.load(filePath).then(
          (ByteData soundData) => pool.load(soundData),
        );
  }

  Future<void> _onTick() async {
    await pool.play(soundId);
  }

  void play(int bpm) async {
    await prepare();
    final _tickIntervalBPS = (60 / bpm * 1000 * 1000).toInt();
    _timer = Metronome.periodic(new Duration(
      microseconds: _tickIntervalBPS,
    )).listen((_) => _onTick());
  }

  void stop() async {
    _timer.cancel();
    pool.stop(soundId);
  }

  void dispose() {
    pool.dispose();
  }
}
