import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weather_pepe/app/data/models/weather_model.dart';
import 'package:weather_pepe/app/extensions/bool_extension.dart';

import 'package:weather_pepe/app/routes/app_pages.dart';
import 'package:weather_pepe/app/core/api/weather_api.dart';
import 'package:weather_pepe/app/data/models/app_error_model.dart';

class FindLocationController extends GetxController {
  final WeatherAPI _userAPI = Get.find();

  final TextEditingController searchTextController1 = TextEditingController();
  final TextEditingController searchTextController2 = TextEditingController();
  final TextEditingController searchTextController3 = TextEditingController();

  final RxString searchTextCity = ''.obs;
  final RxString searchTextLat = ''.obs;
  final RxString searchTextLon = ''.obs;

  final isLoadingGetWeather = false.obs;

  RxBool get isLoading {
    return [
      isLoadingGetWeather.value,
    ].atLeastOneTrue.obs;
  }

  @override
  void onInit() {
    super.onInit();
    searchTextController1.addListener(() {
      searchTextCity.value = searchTextController1.text;
    });
    searchTextController2.addListener(() {
      searchTextLat.value = searchTextController2.text;
    });
    searchTextController3.addListener(() {
      searchTextLon.value = searchTextController3.text;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getcity() {
    _getWeatherCity(searchTextCity.value);
  }

  void getLatLon() {
    _getWeatherLatLon(
        lat: double.parse(searchTextLat.toString()),
        lon: double.parse(searchTextLon.toString()));
  }

  void _getWeatherCity(
    String city,
  ) async {
    try {
      isLoadingGetWeather(true);
      final result = await _userAPI.getWeatherCity(
        city: city,
      );
      isLoadingGetWeather(false);
      Get.back(result: result);
    } catch (error) {
      isLoadingGetWeather(false);
      print((error as AppError).message);
    }
  }

  void _getWeatherLatLon({
    required double lat,
    required double lon,
  }) async {
    try {
      isLoadingGetWeather(true);
      final result = await _userAPI.getWeatherLatLon(
        lat: lat,
        lon: lon,
      );
      isLoadingGetWeather(false);
      Get.back(result: result);
    } catch (error) {
      isLoadingGetWeather(false);
      print((error as AppError).message);
    }
  }
}
