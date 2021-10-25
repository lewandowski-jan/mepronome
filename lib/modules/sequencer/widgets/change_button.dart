import 'package:flutter/material.dart';

class ChangeButton extends StatelessWidget {
  const ChangeButton({
    Key? key,
    required this.iconData,
    this.onPressed,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        iconData,
        size: 38,
      ),
    );
  }
}
