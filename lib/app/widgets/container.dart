import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_pepe/app/constant/app_color.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:weather_pepe/app/constant/converter.dart';
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
  });

  final String pressure;
  final String humidity;
  final String windSpeed;
  final String windDeg;
  final String windGust;
  final String sunrise;
  final String sunset;

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
                  children: const [
                    Expanded(
                      child: HeadInformation(
                        img: ImageName.sunrise,
                        text: 'Sunrise',
                      ),
                    ),
                    Expanded(
                      child: HeadInformation(
                        img: ImageName.sunset,
                        text: 'Sunset',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: DateTime(
                        text: sunrise,
                      ),
                    ),
                    Expanded(
                      child: DateTime(
                        text: sunset,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Expanded(
                      child: HeadInformation(
                        img: ImageName.barometer,
                        text: 'Pressure',
                      ),
                    ),
                    Expanded(
                      child: HeadInformation(
                        img: ImageName.humidity,
                        text: 'Humidity',
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
                      ),
                    ),
                    Expanded(
                      child: DetailsInformation(
                        text: humidity,
                        unit: '%',
                      ),
                    )
                  ],
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                const MainInformation(
                  text: 'Wind',
                ),
                Row(
                  children: const [
                    Expanded(
                      child: HeadInformation(
                        img: ImageName.wind,
                        text: 'Wind Speed',
                      ),
                    ),
                    Expanded(
                      child: HeadInformation(
                        img: ImageName.wind,
                        text: 'Wind Degree',
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
                      ),
                    ),
                    Expanded(
                      child: DetailsInformation(
                        text: windDeg,
                        unit: 'degree',
                      ),
                    )
                  ],
                ),
                const HeadInformation(
                  img: ImageName.wind,
                  text: 'Wind Gust',
                ),
                DetailsInformation(
                  text: windDeg,
                  unit: 'm/s',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnTheTopDay extends StatelessWidget {
  const OnTheTopDay({
    super.key,
    required this.itemWeather,
  });

  final Weather? itemWeather;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TitleTextDay(
            text: itemWeather?.name?.toString() ?? '',
          ),
          CountryDay(
            text: itemWeather?.sys?.country?.toString() ?? '',
          ),
          TempTextDay(
            text: Converter.changeTemp(itemWeather?.main?.temp)
                    ?.toStringAsFixed(2) ??
                '',
          ),
          HighLowTempTextDay(
            high: Converter.changeTemp(itemWeather?.main?.tempMax)
                    ?.toStringAsFixed(2) ??
                '',
            low: Converter.changeTemp(itemWeather?.main?.tempMin)
                    ?.toStringAsFixed(2) ??
                '',
          ),
          StatusTextDay(
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
          ),
          LatLonTextDay(
            lat: itemWeather?.coord?.lat?.toString() ?? '',
            lon: itemWeather?.coord?.lon?.toString() ?? '',
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
          ),
        ],
      ),
    );
  }
}

class OnTheTopNight extends StatelessWidget {
  const OnTheTopNight({
    super.key,
    required this.itemWeather,
  });

  final Weather? itemWeather;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TitleTextNight(
            text: itemWeather?.name?.toString() ?? '',
          ),
          CountryNight(
            text: itemWeather?.sys?.country?.toString() ?? '',
          ),
          TempTextNight(
            text: Converter.changeTemp(itemWeather?.main?.temp)
                    ?.toStringAsFixed(2) ??
                '',
          ),
          HighLowTempTextNight(
            high: Converter.changeTemp(itemWeather?.main?.tempMax)
                    ?.toStringAsFixed(2) ??
                '',
            low: Converter.changeTemp(itemWeather?.main?.tempMin)
                    ?.toStringAsFixed(2) ??
                '',
          ),
          StatusTextNight(
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
          ),
          LatLonTextNight(
            lat: itemWeather?.coord?.lat?.toString() ?? '',
            lon: itemWeather?.coord?.lon?.toString() ?? '',
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
          ),
        ],
      ),
    );
  }
}
