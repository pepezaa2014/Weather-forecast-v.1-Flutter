import 'package:flutter/material.dart';
import 'package:weather_pepe/app/constant/app_colors.dart';
import 'package:weather_pepe/resources/resources.dart';

enum Time {
  day,
  night,
}

extension TimeExtension on Time {
  String get backgroundImage {
    switch (this) {
      case Time.day:
        return ImageName.day;
      case Time.night:
        return ImageName.night;
    }
  }

  Color get textColor {
    switch (this) {
      case Time.day:
        return AppColors.textDayColor;
      case Time.night:
        return AppColors.textNightColor;
    }
  }
}
