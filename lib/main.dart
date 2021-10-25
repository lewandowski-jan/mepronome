import 'package:flutter/material.dart';
import 'package:metronome/router.dart';
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
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mepronome',
      navigatorKey: navigatorKey,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRoutes.homepage.route,
    );
  }

  @override
  dispose() {
    this.metroAudio.dispose();
    super.dispose();
  }
}
