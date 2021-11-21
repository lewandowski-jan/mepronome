import 'package:flutter/material.dart';
import 'package:metronome/common/app_colors.dart';

class AddSequence extends StatelessWidget {
  const AddSequence({
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
          onPressed: (){},
          child: Icon(
            Icons.add_circle_outline,
            color: AppColors.PrimaryLight,
            size: 24,
          ),
          style: ButtonStyle(
            backgroundColor: getColor(Color.fromRGBO(0, 0, 0, 0), AppColors.PrimaryAccent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: AppColors.PrimaryLight, width: 2)
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