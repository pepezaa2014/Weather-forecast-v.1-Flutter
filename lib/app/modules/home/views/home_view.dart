import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_pepe/app/constant/theme_view_extension.dart';
import 'package:weather_pepe/app/utils/loading_indicator.dart';
import 'package:weather_pepe/app/widgets/main_container.dart';
import 'package:weather_pepe/app/widgets/on_the_top.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
                    ? ThemeView.day.backgroundImage
                    : ThemeView.night.backgroundImage,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                themeApp != null
                    ? themeApp.icon.toString().contains('d')
                        ? OnTheTop(
                            itemWeather: weathers,
                            textColor: ThemeView.day.textColor,
                          )
                        : OnTheTop(
                            itemWeather: weathers,
                            textColor: ThemeView.night.textColor,
                          )
                    : const SizedBox.shrink(),
                themeApp != null
                    ? themeApp.icon.toString().contains('d')
                        ? MainContainer(
                            itemWeather: weathers,
                            textColor: ThemeView.day.textColor,
                          )
                        : MainContainer(
                            itemWeather: weathers,
                            textColor: ThemeView.night.textColor,
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
