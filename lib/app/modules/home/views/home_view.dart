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
      // endDrawer: _drawer(),
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
        child: GestureDetector(
          onTap: () {
            controller.getcurrentlocation();
          },
          child: const Icon(Icons.location_on),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              controller.goNext();
            },
            child: const Icon(Icons.search),
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

        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                weathers!.weather![0].icon.toString().contains('d')
                    ? ImageName.day
                    : ImageName.night,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                weathers.weather![0].icon.toString().contains('d')
                    ? onTheTopDay(
                        title: weathers.name.toString(),
                        country: weathers.sys!.country.toString(),
                        temp: controller
                            .changeTemp(weathers.main!.temp)
                            .toStringAsFixed(1),
                        high: controller
                            .changeTemp(weathers.main!.tempMax)
                            .toStringAsFixed(1),
                        low: controller
                            .changeTemp(weathers.main!.tempMin)
                            .toStringAsFixed(1),
                        status: weathers.weather![0].description.toString(),
                        lat: weathers.coord!.lat.toString(),
                        lon: weathers.coord!.lon.toString(),
                      )
                    : onTheTopNight(
                        title: weathers.name.toString(),
                        country: weathers.sys!.country.toString(),
                        temp: controller
                            .changeTemp(weathers.main!.temp)
                            .toStringAsFixed(1),
                        high: controller
                            .changeTemp(weathers.main!.tempMax)
                            .toStringAsFixed(1),
                        low: controller
                            .changeTemp(weathers.main!.tempMin)
                            .toStringAsFixed(1),
                        status: weathers.weather![0].description.toString(),
                        lat: weathers.coord!.lat.toString(),
                        lon: weathers.coord!.lon.toString(),
                      ),
                MainContainer(
                  sunrise:
                      controller.convertUnix(weathers.sys!.sunrise.toString()),
                  sunset:
                      controller.convertUnix(weathers.sys!.sunset.toString()),
                  pressure: weathers.main!.pressure.toString(),
                  humidity: weathers.main!.humidity.toString(),
                  windDeg: weathers.wind!.speed.toString(),
                  windSpeed: weathers.wind!.deg.toString(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
