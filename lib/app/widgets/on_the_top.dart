import 'package:flutter/material.dart';
import 'package:weather_pepe/app/constant/converter.dart';
import 'package:weather_pepe/app/data/models/weather_model.dart';
import 'package:get/get.dart';
import 'package:weather_pepe/app/constant/weather_icon_extension.dart';

class OnTheTop extends StatelessWidget {
  const OnTheTop({
    super.key,
    required this.itemWeather,
    required this.textColor,
  });

  final Weather? itemWeather;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _titleText(
            text: itemWeather?.name?.toString() ?? '',
            textColor: textColor,
          ),
          _country(
            text: itemWeather?.sys?.country?.toString() ?? '',
            textColor: textColor,
          ),
          _tempText(
            text: Converter.convertTemp(itemWeather?.main?.temp)
                    ?.toStringAsFixed(2) ??
                '',
            textColor: textColor,
          ),
          _highLowTempText(
            high: Converter.convertTemp(itemWeather?.main?.tempMax)
                    ?.toStringAsFixed(2) ??
                '',
            low: Converter.convertTemp(itemWeather?.main?.tempMin)
                    ?.toStringAsFixed(2) ??
                '',
            textColor: textColor,
          ),
          _statusText(
            img: itemWeather?.weather
                    ?.firstWhereOrNull((element) => true)
                    ?.weatherIcon
                    ?.imageName
                    .toString() ??
                '',
            text: itemWeather?.weather
                    ?.firstWhereOrNull((element) => true)
                    ?.description
                    ?.toString() ??
                '',
            textColor: textColor,
          ),
          _latLonText(
            lat: itemWeather?.coord?.lat?.toString() ?? '',
            lon: itemWeather?.coord?.lon?.toString() ?? '',
            textColor: textColor,
          ),
        ],
      ),
    );
  }

  _titleText({
    required String text,
    required Color textColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }

  _country({
    required String text,
    required Color textColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }

  _tempText({
    required String text,
    required Color textColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: Text(
        '$text°',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }

  _highLowTempText({
    required String high,
    required String low,
    required Color textColor,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        'H:$high°  L:$low°',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }

  _statusText({
    required String img,
    required String text,
    required Color textColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              img,
              width: 60,
              height: 60,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _latLonText({
    required String lat,
    required String lon,
    required Color textColor,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        'Lat:$lat  Lon:$lon',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}
