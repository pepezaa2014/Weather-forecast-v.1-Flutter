import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weather_pepe/app/extensions/bool_extension.dart';

import 'package:weather_pepe/app/core/api/weather_api.dart';
import 'package:weather_pepe/app/data/models/app_error_model.dart';
import 'package:weather_pepe/app/utils/show_alert.dart';

class FindLocationController extends GetxController {
  final WeatherAPI _weatherAPI = Get.find();

  final TextEditingController searchTextController1 = TextEditingController();
  final TextEditingController searchTextController2 = TextEditingController();
  final TextEditingController searchTextController3 = TextEditingController();

  final RxString searchTextCity = ''.obs;
  final RxString searchTextLat = ''.obs;
  final RxString searchTextLon = ''.obs;

  final isLoadingGetWeatherLatLon = false.obs;
  final isLoadingGetWeatherCity = false.obs;

  FocusNode focusNode = FocusNode();

  RxBool get isLoadingLatLon {
    return [
      isLoadingGetWeatherLatLon.value,
    ].atLeastOneTrue.obs;
  }

  RxBool get isLoadingCity {
    return [
      isLoadingGetWeatherCity.value,
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

  void getCity() {
    if (searchTextCity != '') {
      _getWeatherCity(searchTextCity.value);
    } else {
      showAlert(title: 'Error', message: 'Please fill the text field.');
    }
  }

  void getLatLon() {
    if (searchTextLat != '' && searchTextLon != '') {
      _getWeatherLatLon(
        lat: double.parse(searchTextLat.toString()),
        lon: double.parse(searchTextLon.toString()),
      );
    } else {
      showAlert(title: 'Error', message: 'Please fill the text field.');
    }
  }

  void unFocus() {
    focusNode.unfocus();
  }

  void _getWeatherCity(
    String city,
  ) async {
    try {
      isLoadingGetWeatherCity(true);
      unFocus();
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
    required double lat,
    required double lon,
  }) async {
    try {
      isLoadingGetWeatherLatLon(true);
      unFocus();
      final result = await _weatherAPI.getWeatherLatLon(
        lat: lat,
        lon: lon,
      );
      isLoadingGetWeatherLatLon(false);
      Get.back(result: result);
    } catch (error) {
      isLoadingGetWeatherLatLon(false);
      showAlert(
        title: 'Error',
        message: (error as AppError).message,
      );
    }
  }
}
