import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:metronome/common/app_colors.dart';
import 'package:metronome/common/app_text_styles.dart';
import 'package:metronome/modules/sequencer/widgets/bottom_sheet_sequence_editor.dart';
import 'package:metronome/utils/metro_audio.dart';

class SequenceTile extends StatelessWidget {
  const SequenceTile({
    Key? key,
    required this.onDelete,
    required this.onSave,
    required this.sequence,
    required this.onLongPress,
  }) : super(key: key);

  final VoidCallback? onDelete;
  final VoidCallback? onLongPress;
  final void Function(int, int, int, int) onSave;
  final Sequence sequence;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
      child: SizedBox(
        width: 100,
        height: 75,
        child: ElevatedButton(
          onLongPress: onLongPress,
          onPressed: () {
            showModalBottomSheet<void>(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              context: context,
              builder: (_) => BottomSheetSequenceEditor(
                initialBpm: sequence.bpm,
                initialMetro1: sequence.notesInSequence,
                initialMetro2: sequence.note,
                initialRepeats: sequence.repeats,
                onDelete: onDelete,
                onSave: onSave,
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${sequence.bpm}',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Text(
                        "${sequence.notesInSequence}/${sequence.note}",
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
                            "${sequence.repeats}",
                            style: AppTextStyles.p,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          style: ButtonStyle(
            backgroundColor:
                getColor(AppColors.PrimaryLight, AppColors.PrimaryAccent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side:
                        BorderSide(color: AppColors.PrimaryAccent, width: 2))),
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
