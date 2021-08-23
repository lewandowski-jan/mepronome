import 'package:flutter/material.dart';
import 'package:metronome/home_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mepronome',
      home: HomePage(),
    );
  }
}
