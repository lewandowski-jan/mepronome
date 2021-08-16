import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() async {
  runApp(MyApp());
}

Future<AudioPlayer> play() async {
  AudioCache cache = new AudioCache();
  return await cache.play("Metronome2.wav");
}

class MyApp extends StatelessWidget {
  const MyApp({
    this.audioCache,
    this.bytes,
  }) : super();

  final AudioCache? audioCache;
  final Uint8List? bytes;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 40,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all()),
              child: MaterialButton(
                onPressed: () => play(),
                enableFeedback: false,
                child: Icon(Icons.play_arrow),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
