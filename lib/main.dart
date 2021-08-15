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
            ElevatedButton(
                onPressed: () => play(),
                child: Text(
                  'Play',
                )),
          ],
        ),
      ),
    );
  }
}
