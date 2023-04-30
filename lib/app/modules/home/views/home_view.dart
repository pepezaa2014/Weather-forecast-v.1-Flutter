import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_pepe/app/constant/colors.dart';
import 'package:weather_pepe/app/data/models/weather_model.dart';

import 'package:weather_pepe/app/widgets/container.dart';

import 'package:weather_pepe/resources/resources.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WidgetColor.appBar,
      appBar: _appbar(),
      body: _body(),
    );
  }

  _appbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: IconButton(
          onPressed: controller.getcurrentlocation,
          icon: const Icon(Icons.location_on),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: IconButton(
            onPressed: controller.goNext,
            icon: const Icon(Icons.search),
          ),
        ),
      ],
    );
  }

  _body() {
    return Obx(
      () {
        final weathers = controller.weather.value;
        // final Weather weatherIcon;
        final themeApp = weathers?.weather?.firstWhereOrNull((e) => true);

        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                themeApp != null && themeApp.icon.toString().contains('d')
                    ? ImageName.day
                    : ImageName.night,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                themeApp != null
                    ? themeApp.icon.toString().contains('d')
                        ? onTheTopDay(
                            title: weathers?.name?.toString() ?? '',
                            country: weathers?.sys?.country?.toString() ?? '',
                            temp: controller
                                .changeTemp(weathers?.main?.temp)
                                .toStringAsFixed(1),
                            high: controller
                                .changeTemp(weathers?.main?.tempMax)
                                .toStringAsFixed(1),
                            low: controller
                                .changeTemp(weathers?.main?.tempMin)
                                .toStringAsFixed(1),
                            status: themeApp.description.toString(),
                            lat: weathers?.coord?.lat?.toString() ?? '',
                            lon: weathers?.coord?.lon?.toString() ?? '',
                            sunrise: controller.convertUnix(
                                weathers?.sys?.sunrise?.toString() ?? ''),
                            sunset: controller.convertUnix(
                                weathers?.sys?.sunset?.toString() ?? ''),
                            pressure:
                                weathers?.main?.pressure?.toString() ?? '',
                            humidity:
                                weathers?.main?.humidity?.toString() ?? '',
                            windDeg: weathers?.wind?.speed?.toString() ?? '',
                            windSpeed: weathers?.wind?.deg?.toString() ?? '',
                          )
                        : onTheTopNight(
                            title: weathers?.name?.toString() ?? '',
                            country: weathers?.sys?.country?.toString() ?? '',
                            temp: controller
                                .changeTemp(weathers?.main?.temp)
                                .toStringAsFixed(1),
                            high: controller
                                .changeTemp(weathers?.main?.tempMax)
                                .toStringAsFixed(1),
                            low: controller
                                .changeTemp(weathers?.main?.tempMin)
                                .toStringAsFixed(1),
                            status: themeApp.description.toString(),
                            lat: weathers?.coord?.lat?.toString() ?? '',
                            lon: weathers?.coord?.lon?.toString() ?? '',
                            sunrise: controller.convertUnix(
                                weathers?.sys?.sunrise?.toString() ?? ''),
                            sunset: controller.convertUnix(
                                weathers?.sys?.sunset?.toString() ?? ''),
                            pressure:
                                weathers?.main?.pressure?.toString() ?? '',
                            humidity:
                                weathers?.main?.humidity?.toString() ?? '',
                            windDeg: weathers?.wind?.speed?.toString() ?? '',
                            windSpeed: weathers?.wind?.deg?.toString() ?? '',
                          )
                    : const SizedBox.shrink(
                        child: Text(''),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
