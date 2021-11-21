import 'package:flutter/material.dart';
import 'package:metronome/common/app_colors.dart';
import 'package:metronome/common/app_text_styles.dart';
import 'package:metronome/modules/sequencer/widgets/bottom_sheet_sequence_editor.dart';

class Sequence extends StatelessWidget {
  const Sequence({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
      child: SizedBox(
        width: 100,
        height: 75,
        child: ElevatedButton(
          onPressed: (){
            showModalBottomSheet<void>(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              context: context,
              builder: (_) => BottomSheetSequenceEditor(
                onDelete: () {
                  print('delete'); //TODO: Delete the clicked sequence
                },
                onSave: (int bpm, int metro1, int metro2, int repeats) {
                  print(
                    '$bpm, $metro1, $metro2, $repeats',
                  ); //TODO: Update data
                },
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "126",
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
                      "4/4",
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
                          "3",
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