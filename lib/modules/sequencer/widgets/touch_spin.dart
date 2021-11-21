import 'package:flutter/material.dart';
import 'package:metronome/modules/sequencer/widgets/change_button.dart';

class TouchSpin extends StatelessWidget {
  const TouchSpin({
    Key? key,
    required this.value,
    this.onPressedMinus,
    this.onPressedPlus,
  }) : super(key: key);

  final String value;
  final VoidCallback? onPressedMinus;
  final VoidCallback? onPressedPlus;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ChangeButton(
          iconData: Icons.remove_circle_outline,
          onPressed: onPressedMinus,
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: TextStyle(fontSize: 36),
        ),
        const SizedBox(width: 4),
        ChangeButton(
          iconData: Icons.add_circle_outline,
          onPressed: onPressedPlus,
        ),
      ],
    );
  }
}
