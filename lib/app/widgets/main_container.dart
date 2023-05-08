import 'package:flutter/material.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:weather_pepe/app/constant/converter.dart';
import 'package:weather_pepe/app/data/models/weather_model.dart';
import 'package:weather_pepe/app/widgets/text.dart';
import 'package:weather_pepe/resources/resources.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({
    super.key,
    required this.itemWeather,
    required this.textColor,
  });

  final Weather? itemWeather;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    child: _headInformation(
                      img: ImageName.sunrise,
                      text: 'Sunrise',
                      textColor: textColor,
                    ),
                  ),
                  Expanded(
                    child: _headInformation(
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
                    child: _dateTime(
                      text: Converter.convertUnix(
                          itemWeather?.sys?.sunrise?.toString() ?? ''),
                      textColor: textColor,
                    ),
                  ),
                  Expanded(
                    child: _dateTime(
                      text: Converter.convertUnix(
                          itemWeather?.sys?.sunset?.toString() ?? ''),
                      textColor: textColor,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _headInformation(
                      img: ImageName.barometer,
                      text: 'Pressure',
                      textColor: textColor,
                    ),
                  ),
                  Expanded(
                    child: _headInformation(
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
                    child: _detailsInformation(
                      text: itemWeather?.main?.pressure?.toString() ?? '',
                      unit: 'hPa',
                      textColor: textColor,
                    ),
                  ),
                  Expanded(
                    child: _detailsInformation(
                      text: itemWeather?.main?.humidity?.toString() ?? '',
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
                    child: _headInformation(
                      img: ImageName.wind,
                      text: 'Wind Speed',
                      textColor: textColor,
                    ),
                  ),
                  Expanded(
                    child: _headInformation(
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
                    child: _detailsInformation(
                      text: itemWeather?.wind?.speed?.toString() ?? '',
                      unit: 'm/s',
                      textColor: textColor,
                    ),
                  ),
                  Expanded(
                    child: _detailsInformation(
                      text: itemWeather?.wind?.deg?.toString() ?? '',
                      unit: 'degree',
                      textColor: textColor,
                    ),
                  )
                ],
              ),
              _headInformation(
                img: ImageName.wind,
                text: 'Wind Gust',
                textColor: textColor,
              ),
              _detailsInformation(
                text: itemWeather?.wind?.gust?.toString() ?? '-',
                unit: 'm/s',
                textColor: textColor,
              ),
              Row(
                children: [
                  Expanded(
                    child: _headInformation(
                      img: ImageName.weather09d,
                      text: 'Rain',
                      textColor: textColor,
                    ),
                  ),
                  Expanded(
                    child: _headInformation(
                      img: ImageName.weather13d,
                      text: 'Snow',
                      textColor: textColor,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _detailsInformation(
                      text: itemWeather?.rain?.d1h?.toString() ?? '-',
                      unit: 'mm',
                      textColor: textColor,
                    ),
                  ),
                  Expanded(
                    child: _detailsInformation(
                      text: itemWeather?.snow?.d1h?.toString() ?? '-',
                      unit: 'mm',
                      textColor: textColor,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _headInformation({
    required String text,
    required String img,
    required Color textColor,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset(
                img,
                width: 20,
                height: 20,
                color: textColor,
              ),
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

  _detailsInformation({
    required String text,
    required String unit,
    required Color textColor,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        textAlign: TextAlign.center,
        text + ' ' + unit,
        style: TextStyle(
          fontSize: 16,
          color: textColor,
        ),
      ),
    );
  }

  _dateTime({
    required String text,
    required Color textColor,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: TextStyle(
          fontSize: 16,
          color: textColor,
        ),
      ),
    );
  }
}
