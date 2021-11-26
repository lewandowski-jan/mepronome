import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:metronome/common/app_colors.dart';
import 'package:metronome/common/app_text_styles.dart';
import 'package:metronome/modules/sequencer/widgets/bottom_sheet_sequence_editor.dart';

class Sequence extends HookWidget {
  const Sequence({
    Key? key,
    required this.index,
    this.initialBpm,
    this.initialMetro1,
    this.initialMetro2,
    this.initialRepeats,
  }) : super(key: key);

  final int index;
  final int? initialBpm;
  final int? initialMetro1;
  final int? initialMetro2;
  final int? initialRepeats;

  @override
  Widget build(BuildContext context) {
    final shownBpm = useState(initialBpm ?? 120);
    final shownMetro1 = useState(initialMetro1 ?? 4);
    final shownMetro2 = useState(initialMetro2 ?? 4);
    final shownRepeats = useState(initialRepeats ?? 1);
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
      child: SizedBox(
        width: 100,
        height: 75,
        child: ElevatedButton(
          onPressed: (){
            print(index);
            showModalBottomSheet<void>(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              context: context,
              builder: (_) => BottomSheetSequenceEditor(
                initialBpm: shownBpm.value,
                initialMetro1: shownMetro1.value,
                initialMetro2: shownMetro2.value,
                initialRepeats: shownRepeats.value,
                onDelete: () {
                  print('delete sequence number ${index}'); //TODO: Delete the clicked sequence
                },
                onSave: (int bpm, int metro1, int metro2, int repeats) {
                  shownBpm.value=bpm;
                  shownMetro1.value=metro1;
                  shownMetro2.value=metro2;
                  shownRepeats.value=repeats;
                },
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${shownBpm.value}',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: Text(
                      "${shownMetro1.value}/${shownMetro2.value}",
                      style: AppTextStyles.p,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.autorenew,
                          size: 16,
                          color: Colors.black,
                        ),
                        Text(
                          "${shownRepeats.value}",
                          style: AppTextStyles.p,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          style: ButtonStyle(
            backgroundColor: getColor(AppColors.PrimaryLight, AppColors.PrimaryAccent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: AppColors.PrimaryAccent, width: 2)
                )
            ),
          ),
        ),
      ),
    );
  }
  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    final getColor = (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    };

    return MaterialStateProperty.resolveWith(getColor);
  }
}