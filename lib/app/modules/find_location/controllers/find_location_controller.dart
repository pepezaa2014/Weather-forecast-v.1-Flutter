import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weather_pepe/app/extensions/bool_extension.dart';

import 'package:weather_pepe/app/core/api/weather_api.dart';
import 'package:weather_pepe/app/data/models/app_error_model.dart';
import 'package:weather_pepe/app/utils/show_alert.dart';

class FindLocationController extends GetxController {
  final WeatherAPI _weatherAPI = Get.find();

  final TextEditingController searchTextCityController =
      TextEditingController();
  final TextEditingController searchTextLatController = TextEditingController();
  final TextEditingController searchTextLonController = TextEditingController();

  final RxString searchCityText = ''.obs;
  final RxString searchLatText = ''.obs;
  final RxString searchLonText = ''.obs;

  final isLoadingGetWeatherLatLon = false.obs;
  final isLoadingGetWeatherCity = false.obs;

  RxBool get isLoading {
    return [
      isLoadingGetWeatherCity.value,
      isLoadingGetWeatherLatLon.value,
    ].atLeastOneTrue.obs;
  }

  @override
  void onInit() {
    super.onInit();
    searchTextCityController.addListener(() {
      searchCityText.value = searchTextCityController.text;
    });
    searchTextLatController.addListener(() {
      searchLatText.value = searchTextLatController.text;
    });
    searchTextLonController.addListener(() {
      searchLonText.value = searchTextLonController.text;
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

  void getCity() {
    if (searchCityText.isNotEmpty) {
      _getWeatherCity(searchCityText.value);
    } else {
      showAlert(title: 'Error', message: 'Please fill the text field.');
    }
  }

  void getLatLon() {
    if (searchLatText.isNotEmpty && searchLonText.isNotEmpty) {
      _getWeatherLatLon(
        lat: double.tryParse(searchLatText.toString()),
        lon: double.tryParse(searchLonText.toString()),
      );
    } else {
      showAlert(title: 'Error', message: 'Please fill the text field.');
    }
  }

  void _getWeatherCity(
    String city,
  ) async {
    try {
      isLoadingGetWeatherCity(true);
      final result = await _weatherAPI.getWeatherCity(
        city: city,
      );
      isLoadingGetWeatherCity(false);
      Get.back(result: result);
    } catch (error) {
      isLoadingGetWeatherCity(false);
      showAlert(
        title: 'Error',
        message: (error as AppError).message,
      );
    }
  }

  void _getWeatherLatLon({
    required double? lat,
    required double? lon,
  }) async {
    try {
      isLoadingGetWeatherLatLon(true);
      if (lat != null && lon != null) {
        final result = await _weatherAPI.getWeatherLatLon(
          lat: lat,
          lon: lon,
        );
        isLoadingGetWeatherLatLon(false);
        Get.back(result: result);
      }
    } catch (error) {
      isLoadingGetWeatherLatLon(false);
      showAlert(
        title: 'Error',
        message: (error as AppError).message,
      );
    }
  }
}
