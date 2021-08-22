import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:metronome/common/app_colors.dart';
import 'package:metronome/utils/metro_audio.dart';

void main() async {
  runApp(MyApp());
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
  final _audio = MetroAudio();
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
                  color: AppColors.PrimaryLight,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          child: Text(
                            'bpm',
                            style: TextStyle(
                              fontFamily: 'Metropolis',
                              color: AppColors.PrimaryAccent,
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
                              color: AppColors.PrimaryLight,
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
                            onChanged:isPlaying.value ? null:(newBpm) {
                              bpm.value = newBpm;
                            },
                          min: 50,
                          max: 200,
                          divisions: 150,
                          activeColor: AppColors.PrimaryLight,
                          inactiveColor: AppColors.PrimaryLight,

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 150),
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
                                    AppColors.PrimaryAccent,
                                    AppColors.GradientDark,
                                  ]
                              ),
                              shape: BoxShape.circle,
                              ),
                            child: GestureDetector(
                              onTap: (){
                                isPlaying.value = !isPlaying.value;
                                if(isPlaying.value) {
                                  _audio.play(bpm.value.toInt());

                                } else {
                                  _audio.stop();
                                }
                              },
                              child: Icon(
                                isPlaying.value ? Icons.stop : Icons.play_arrow,
                                size: 50,
                                color: AppColors.PrimaryLight,
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
                        AppColors.PrimaryDark,
                        AppColors.GradientDark,
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
