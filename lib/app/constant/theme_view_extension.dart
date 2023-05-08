import 'package:flutter/material.dart';
import 'package:weather_pepe/app/constant/app_colors.dart';
import 'package:weather_pepe/resources/resources.dart';

enum ThemeView {
  day,
  night,
}

extension ThemeViewExtension on ThemeView {
  String get backgroundImage {
    switch (this) {
      case ThemeView.day:
        return ImageName.day;
      case ThemeView.night:
        return ImageName.night;
    }
  }

  Color get textColor {
    switch (this) {
      case ThemeView.day:
        return AppColors.textDayColor;
      case ThemeView.night:
        return AppColors.textNightColor;
    }
  }
}
