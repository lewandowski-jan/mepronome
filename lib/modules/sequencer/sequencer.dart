import 'package:flutter/material.dart';
import 'package:metronome/modules/sequencer/widgets/bottom_sheet_sequence_editor.dart';

class Sequencer extends StatelessWidget {
  const Sequencer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.amber,
          child: MaterialButton(
            child: Text('klik'),
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
          ),
        ),
      ),
    );
  }
}
