import 'package:flutter/material.dart';
import 'package:weather_pepe/app/constant/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: 120,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondaryButton,
            minimumSize: const Size.fromHeight(80),
          ),
          child: const Text(
            'Enter',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
