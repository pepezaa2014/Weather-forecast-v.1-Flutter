import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_pepe/app/constant/app_colors.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:weather_pepe/app/constant/converter.dart';
import 'package:weather_pepe/app/constant/theme_view.dart';
import 'package:weather_pepe/app/constant/weather_icon.dart';
import 'package:weather_pepe/app/data/models/weather_model.dart';
import 'package:weather_pepe/app/widgets/text.dart';
import 'package:weather_pepe/resources/resources.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({
    super.key,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.sunrise,
    required this.sunset,
    required this.textColor,
  });

  final String pressure;
  final String humidity;
  final String windSpeed;
  final String windDeg;
  final String windGust;
  final String sunrise;
  final String sunset;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BlurryContainer(
          blur: 60,
          child: Container(
            color: Colors.transparent,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: HeadInformation(
                        img: ImageName.sunrise,
                        text: 'Sunrise',
                        textColor: textColor,
                      ),
                    ),
                    Expanded(
                      child: HeadInformation(
                        img: ImageName.sunset,
                        text: 'Sunset',
                        textColor: textColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: DateTime(
                        text: sunrise,
                        textColor: textColor,
                      ),
                    ),
                    Expanded(
                      child: DateTime(
                        text: sunset,
                        textColor: textColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: HeadInformation(
                        img: ImageName.barometer,
                        text: 'Pressure',
                        textColor: textColor,
                      ),
                    ),
                    Expanded(
                      child: HeadInformation(
                        img: ImageName.humidity,
                        text: 'Humidity',
                        textColor: textColor,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: DetailsInformation(
                        text: pressure,
                        unit: 'hPa',
                        textColor: textColor,
                      ),
                    ),
                    Expanded(
                      child: DetailsInformation(
                        text: humidity,
                        unit: '%',
                        textColor: textColor,
                      ),
                    )
                  ],
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                MainInformation(
                  text: 'Wind',
                  textColor: textColor,
                ),
                Row(
                  children: [
                    Expanded(
                      child: HeadInformation(
                        img: ImageName.wind,
                        text: 'Wind Speed',
                        textColor: textColor,
                      ),
                    ),
                    Expanded(
                      child: HeadInformation(
                        img: ImageName.wind,
                        text: 'Wind Degree',
                        textColor: textColor,
                      ),
                    )
                  ],
                ),
                const VerticalDivider(
                  color: Colors.white,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DetailsInformation(
                        text: windSpeed,
                        unit: 'm/s',
                        textColor: textColor,
                      ),
                    ),
                    Expanded(
                      child: DetailsInformation(
                        text: windDeg,
                        unit: 'degree',
                        textColor: textColor,
                      ),
                    )
                  ],
                ),
                HeadInformation(
                  img: ImageName.wind,
                  text: 'Wind Gust',
                  textColor: textColor,
                ),
                DetailsInformation(
                  text: windDeg,
                  unit: 'm/s',
                  textColor: textColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
    return Expanded(
      child: Column(
        children: [
          TitleText(
            text: itemWeather?.name?.toString() ?? '',
            textColor: textColor,
          ),
          Country(
            text: itemWeather?.sys?.country?.toString() ?? '',
            textColor: textColor,
          ),
          TempText(
            text: Converter.changeTemp(itemWeather?.main?.temp)
                    ?.toStringAsFixed(2) ??
                '',
            textColor: textColor,
          ),
          HighLowTempText(
            high: Converter.changeTemp(itemWeather?.main?.tempMax)
                    ?.toStringAsFixed(2) ??
                '',
            low: Converter.changeTemp(itemWeather?.main?.tempMin)
                    ?.toStringAsFixed(2) ??
                '',
            textColor: textColor,
          ),
          StatusText(
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
          LatLonText(
            lat: itemWeather?.coord?.lat?.toString() ?? '',
            lon: itemWeather?.coord?.lon?.toString() ?? '',
            textColor: textColor,
          ),
          MainContainer(
            sunrise: Converter.convertUnix(
                itemWeather?.sys?.sunrise?.toString() ?? ''),
            sunset: Converter.convertUnix(
                itemWeather?.sys?.sunset?.toString() ?? ''),
            pressure: itemWeather?.main?.pressure?.toString() ?? '',
            humidity: itemWeather?.main?.humidity?.toString() ?? '',
            windDeg: itemWeather?.wind?.deg?.toString() ?? '',
            windSpeed: itemWeather?.wind?.speed?.toString() ?? '',
            windGust: itemWeather?.wind?.gust?.toString() ?? '',
            textColor: textColor,
          ),
        ],
      ),
    );
  }
}
