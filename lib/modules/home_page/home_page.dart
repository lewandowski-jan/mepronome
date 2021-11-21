import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:metronome/common/app_colors.dart';
import 'package:metronome/common/app_text_styles.dart';
import 'package:metronome/hamburger_menu.dart';

class HomePage extends HookWidget {
  HomePage();

  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isPlaying = useState(false);
    final bpm = useState(128.0);
    return Scaffold(
      drawer: HamburgerMenu(),
      backgroundColor: AppColors.PrimaryLight,
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
        SafeArea(
          bottom: false,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 24, 0, 16),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/mepronome_logo.png',
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                      ),
                      gradient: AppColors.gradientPrimaryDarkGradientDark,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 30),
                        Text(
                          'bpm',
                          style: AppTextStyles.medium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          bpm.value.toInt().toString(),
                          style: AppTextStyles.h1,
                          textAlign: TextAlign.center,
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                            trackHeight: 3,
                            trackShape: RectangularSliderTrackShape(),
                          ),
                          child: Slider(
                            value: bpm.value,
                            onChanged: isPlaying.value
                                ? null
                                : (newBpm) {
                              bpm.value = newBpm;
                            },
                            min: 25,
                            max: 400,
                            divisions: 375,
                            activeColor: AppColors.PrimaryLight,
                            inactiveColor: AppColors.PrimaryLight,
                          ),
                        ),
                        const SizedBox(height: 150),
                        Container(
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              gradient: AppColors
                                  .gradientPrimaryAccentGradientDark,
                              shape: BoxShape.circle,
                            ),
                            child: GestureDetector(
                              onTap: () {},
                              child: Icon(
                                isPlaying.value
                                    ? Icons.stop
                                    : Icons.play_arrow,
                                size: 50,
                                color: AppColors.PrimaryLight,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
        new Positioned(
          top: 0.0,
          left: 2.0,
          right: 0.0,
          child: AppBar(
            leading: IconButton(
              icon: Icon(Icons.menu, size: 33, color: Colors.black,), // change this size and style
              onPressed: () => _scaffoldKey.currentState!.openDrawer(),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0, //Shadow gone
          ),
        ),
      ],
    ),
    );
  }
}


