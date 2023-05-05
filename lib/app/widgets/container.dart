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
                      text: Converter.convertUnix(
                          itemWeather?.sys?.sunrise?.toString() ?? ''),
                      textColor: textColor,
                    ),
                  ),
                  Expanded(
                    child: DateTime(
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
                      text: itemWeather?.main?.pressure?.toString() ?? '',
                      unit: 'hPa',
                      textColor: textColor,
                    ),
                  ),
                  Expanded(
                    child: DetailsInformation(
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
                      text: itemWeather?.wind?.speed?.toString() ?? '',
                      unit: 'm/s',
                      textColor: textColor,
                    ),
                  ),
                  Expanded(
                    child: DetailsInformation(
                      text: itemWeather?.wind?.deg?.toString() ?? '',
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
                text: itemWeather?.wind?.gust?.toString() ?? '-',
                unit: 'm/s',
                textColor: textColor,
              ),
              Row(
                children: [
                  Expanded(
                    child: HeadInformation(
                      img: ImageName.weather09d,
                      text: 'Rain',
                      textColor: textColor,
                    ),
                  ),
                  Expanded(
                    child: HeadInformation(
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
                    child: DetailsInformation(
                      text: itemWeather?.rain?.d1h?.toString() ?? '-',
                      unit: 'mm',
                      textColor: textColor,
                    ),
                  ),
                  Expanded(
                    child: DetailsInformation(
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
}
