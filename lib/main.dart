import 'package:flutter/material.dart';
import 'package:metronome/home_page.dart';
import 'package:metronome/utils/metro_audio.dart';

final metro = MetroAudio();
void main() async {
  runApp(MetronomeApp());
}

class MetronomeApp extends StatefulWidget {
  MetronomeApp({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  _MetronomeAppState createState() => _MetronomeAppState();
}

class _MetronomeAppState extends State<MetronomeApp> {
  final metroAudio = MetroAudio();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mepronome',
      home: HomePage(
        metroAudio: metroAudio,
      ),
    );
  }

  @override
  dispose() {
    this.metroAudio.dispose();
    super.dispose();
  }
}
