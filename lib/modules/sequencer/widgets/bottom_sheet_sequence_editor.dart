import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:metronome/modules/sequencer/widgets/change_button.dart';
import 'package:metronome/modules/sequencer/widgets/rounded_button.dart';
import 'package:metronome/modules/sequencer/widgets/touch_spin.dart';

class BottomSheetSequenceEditor extends HookWidget {
  BottomSheetSequenceEditor({
    Key? key,
    required this.onDelete,
    required this.onSave,
    this.initialBpm,
    this.initialMetro1,
    this.initialMetro2,
    this.initialRepeats,
  }) : super(key: key);

  final int? initialBpm;
  final int? initialMetro1;
  final int? initialMetro2;
  final int? initialRepeats;
  final VoidCallback onDelete;
  final void Function(int, int, int, int) onSave;

  @override
  Widget build(BuildContext context) {
    final bpm = useState(initialBpm ?? 120);
    final metro1 = useState(initialMetro1 ?? 3);
    final metro2 = useState(initialMetro2 ?? 4);
    final repeats = useState(initialRepeats ?? 3);

    return Container(
      height: 368,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 4),
          Text(
            'bpm',
            style: TextStyle(fontSize: 24),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                bpm.value.toString(),
                style: TextStyle(fontSize: 96),
              ),
              const SizedBox(width: 24),
              Column(
                children: [
                  ChangeButton(
                    onPressed: () {
                      if (bpm.value < 200) bpm.value = bpm.value + 1;
                    },
                    iconData: Icons.add_circle_outline,
                  ),
                  const SizedBox(height: 4),
                  ChangeButton(
                    onPressed: () {
                      if (bpm.value > 50) bpm.value = bpm.value - 1;
                    },
                    iconData: Icons.remove_circle_outline,
                  ),
                ],
              ),
              const SizedBox(width: 8),
              Column(
                children: [
                  ChangeButton(
                    onPressed: () {
                      if (bpm.value <= 195)
                        bpm.value = bpm.value + 5;
                      else
                        bpm.value = 200;
                    },
                    iconData: Icons.add_circle,
                  ),
                  const SizedBox(height: 4),
                  ChangeButton(
                    onPressed: () {
                      if (bpm.value >= 55)
                        bpm.value = bpm.value - 5;
                      else
                        bpm.value = 50;
                    },
                    iconData: Icons.remove_circle,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'metrum',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 2),
                  TouchSpin(
                    value: metro1.value.toString(),
                    onPressedMinus: () {
                      if (metro1.value > 1) metro1.value = metro1.value - 1;
                    },
                    onPressedPlus: () {
                      if (metro1.value < 16) metro1.value = metro1.value + 1;
                    },
                  ),
                  Container(
                    height: 3,
                    width: 24,
                    color: Colors.black,
                  ),
                  TouchSpin(
                    value: metro2.value.toString(),
                    onPressedMinus: () {
                      if (metro2.value > 1) metro2.value = metro2.value - 1;
                    },
                    onPressedPlus: () {
                      if (metro2.value < 16) metro2.value = metro2.value + 1;
                    },
                  ),
                ],
              ),
              const SizedBox(width: 24),
              Column(
                children: [
                  Text(
                    'powtórzenia',
                    style: TextStyle(fontSize: 24),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.autorenew,
                        size: 40,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        repeats.value.toString(),
                        style: TextStyle(fontSize: 72),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        children: [
                          ChangeButton(
                            iconData: Icons.add_circle_outline,
                            onPressed: () {
                              if (repeats.value < 8)
                                repeats.value = repeats.value + 1;
                            },
                          ),
                          const SizedBox(height: 4),
                          ChangeButton(
                            iconData: Icons.remove_circle_outline,
                            onPressed: () {
                              if (repeats.value > 1)
                                repeats.value = repeats.value - 1;
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedButton(
                text: 'Usuń',
                onPressed: () {
                  onDelete();
                  Navigator.of(context).pop();
                },
              ),
              RoundedButton(
                text: 'Zapisz',
                onPressed: () {
                  onSave(
                    bpm.value,
                    metro1.value,
                    metro2.value,
                    repeats.value,
                  );
                  Navigator.of(context).pop();
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
