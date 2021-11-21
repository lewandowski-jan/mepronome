import 'package:flutter/material.dart';
import 'package:metronome/common/app_colors.dart';
import 'package:metronome/modules/sequencer/widgets/add_sequence.dart';
import 'package:metronome/modules/sequencer/widgets/sequence.dart';

class Sequencer extends StatelessWidget {
  const Sequencer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryLight,
      body: SafeArea(
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50, width: double.infinity),
                    Wrap(
                      alignment: WrapAlignment.start,
                      children: [
                        Sequence(),
                        AddSequence(),
                      ],
                    ),
                  ],
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
