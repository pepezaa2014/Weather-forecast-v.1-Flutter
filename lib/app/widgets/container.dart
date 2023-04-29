import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:weather_pepe/app/constant/colors.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
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
    required this.sunrise,
    required this.sunset,
  });

  final String pressure;
  final String humidity;
  final String windSpeed;
  final String windDeg;
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class onTheTopDay extends StatelessWidget {
  onTheTopDay({
    required this.title,
    required this.country,
    required this.temp,
    required this.high,
    required this.low,
    required this.status,
    required this.lat,
    required this.lon,
    // required this.img,
  });

  final String title;
  final String country;
  final String temp;
  final String high;
  final String low;
  final String status;
  final String lat;
  final String lon;
  // final String img;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TitleTextDay(
            text: title,
          ),
          CountryDay(
            text: country,
          ),
          TempTextDay(
            text: temp,
          ),
          HighLowTempTextDay(
            high: high,
            low: low,
          ),
          StatusTextDay(
            // img: img,
            text: status,
          ),
          LatLonTextDay(
            lat: lat,
            lon: lon,
          ),
        ],
      ),
    );
  }
}

class onTheTopNight extends StatelessWidget {
  onTheTopNight({
    required this.title,
    required this.country,
    required this.temp,
    required this.high,
    required this.low,
    required this.status,
    required this.lat,
    required this.lon,
  });

  final String title;
  final String country;
  final String temp;
  final String high;
  final String low;
  final String status;
  final String lat;
  final String lon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TitleTextNight(
            text: title,
          ),
          CountryNight(
            text: country,
          ),
          TempTextNight(
            text: temp,
          ),
          HighLowTempTextNight(
            high: high,
            low: low,
          ),
          StatusTextNight(
            text: status,
          ),
          LatLonTextNight(
            lat: lat,
            lon: lon,
          ),
        ],
      ),
    );
  }
}

class FindLocation extends StatelessWidget {
  FindLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(),
          ),
        ),
      ),
    );
  }
}
