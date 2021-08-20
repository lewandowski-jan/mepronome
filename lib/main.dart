import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() async {
  runApp(MyApp());
}

Future<AudioPlayer> play(int bpm) async {
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
    final isPlaying = useState(false);
    final bpm = useState(128.0);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xFFF1F7FF),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 25, 0, 15),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/mepronome_logo.png',
                        ),
                     ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: Container(
                          child: Text(
                            'bpm',
                            style: TextStyle(
                              fontFamily: 'Metropolis',
                              color: Color(0xFF3292EB),
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          child: Text(
                            bpm.value.toInt().toString(),
                            style: TextStyle(
                              fontFamily: 'Metropolis',
                              color: Color(0xFFF1F7FF),
                              fontSize: 60,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                          trackHeight: 3,
                          trackShape: RectangularSliderTrackShape(),
                        ),
                        child: Slider(
                            value: bpm.value,
                            onChanged: (newBpm) {
                              bpm.value = newBpm;
                            },
                          min: 50,
                          max: 200,
                          divisions: 150,
                          activeColor: Color(0xFFF1F7FF),
                          inactiveColor: Color(0xFFF1F7FF),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 230),
                        child: Container(
                          child: Container(
                            width: 80,
                            height: 80,
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [
                                    0.4,
                                    1,
                                  ],
                                  colors: [
                                    Color(0xFF3292EB),
                                    Color(0xFF2569A8)
                                  ]
                              ),
                              shape: BoxShape.circle,
                              ),
                            child: GestureDetector(
                              onTap: (){
                                isPlaying.value = !isPlaying.value;
                                if(isPlaying.value) {
                                  play(bpm.value.toInt());
                                }
                              },
                              child: Icon(
                                isPlaying.value ? Icons.stop : Icons.play_arrow,
                                size: 50,
                                color: Color(0xFFF1F7FF),
                            ),
                          ),
                        ),
                      ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [
                        0.4,
                        1,
                      ],
                      colors: [
                        Color(0xFF0E2031),
                        Color(0xFF2569A8)
                      ]
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
