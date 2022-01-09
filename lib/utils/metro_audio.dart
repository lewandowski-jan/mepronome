import 'dart:async';

import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';
import 'package:quiver/async.dart';

class Sequence {
  final int notesInSequence;
  final int note;
  final int repeats;
  final int bpm;

  Sequence({
    required this.notesInSequence,
    required this.note,
    required this.bpm,
    required this.repeats,
  });
}

class Sequencer {
  Sequencer({required this.metro});
  final MetroAudio metro;

  void playSequence(Sequence sequence) async {
    final _tickIntervalBPS = 60 ~/ _getLength(sequence.note, sequence.bpm) * 1000 * 1000;
    metro.playOnce();
    for (var i = 0; i < sequence.notesInSequence * sequence.repeats - 1; i++) {
      await Future.delayed(Duration(microseconds: _tickIntervalBPS), () {
        metro.playOnce();
      });
    }
  }

  int _getLength(int note, int bpm) {
    switch (note) {
      case 1:
        return bpm * 4;
      case 2:
        return bpm * 2;
      case 4:
        return bpm * 1;
      case 8:
        return bpm ~/ 2;
      case 16:
        return bpm ~/ 4;
      default:
        return 0;
    }
  }
}

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
  late int streamId;
  final String filePath = 'assets/Metronome2.wav';
  late StreamSubscription<DateTime> _timer;

  Future<void> prepare() async {
    soundId = await rootBundle.load(filePath).then(
          (ByteData soundData) => pool.load(soundData),
        );
  }

  void playOnce() async {
    streamId = await pool.play(soundId);
  }

  void play(int bpm) {
    final _tickIntervalBPS = 60 ~/ bpm * 1000 * 1000;
    _timer = Metronome.periodic(Duration(
      microseconds: _tickIntervalBPS,
    )).listen((_) => playOnce());
  }

  void stop() async {
    _timer.cancel();
    pool.stop(streamId);
  }

  void dispose() {
    pool.dispose();
  }
}
