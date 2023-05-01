import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_pepe/app/constant/colors.dart';
import 'package:weather_pepe/app/data/models/weather_model.dart';
import 'package:weather_pepe/app/constant/weather_icon.dart';
import 'package:weather_pepe/app/utils/loading_indicator.dart';

import 'package:weather_pepe/app/widgets/container.dart';

import 'package:weather_pepe/resources/resources.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: WidgetColor.appBar,
          appBar: _appbar(),
          body: _body(),
        ),
        Obx(
          () => loadingIndicator(controller.isLoading.value),
        ),
      ],
    );
  }

  _appbar() {
    return AppBar(
      backgroundColor: WidgetColor.appBar,
      centerTitle: true,
      leading: IconButton(
        onPressed: controller.getCurrentLocation,
        icon: const Icon(Icons.location_on),
      ),
      actions: [
        IconButton(
          onPressed: controller.goNext,
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }

  _body() {
    return Obx(
      () {
        final weathers = controller.weather.value;

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
                        ? OnTheTopDay(
                            itemWeather: weathers,
                          )
                        : OnTheTopNight(
                            itemWeather: weathers,
                          )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    );
  }
}
