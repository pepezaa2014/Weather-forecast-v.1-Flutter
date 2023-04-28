import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_pepe/app/constant/colors.dart';

class PrimaryButton extends StatelessWidget {
  final Function() onPressed;

  const PrimaryButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: onPressed,
          child: const Icon(Icons.add), //
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              const CircleBorder(),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(20),
            ),
            backgroundColor: MaterialStateProperty.all(WidgetColor.mainButton),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (states) {
                if (states.contains(MaterialState.pressed))
                  return WidgetColor.mainButtonAfter;
              },
            ),
          ),
        ),
      ),
    );
  }
}
