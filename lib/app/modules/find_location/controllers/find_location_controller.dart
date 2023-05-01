import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weather_pepe/app/extensions/bool_extension.dart';

import 'package:weather_pepe/app/core/api/weather_api.dart';
import 'package:weather_pepe/app/data/models/app_error_model.dart';
import 'package:weather_pepe/app/utils/show_alert.dart';

class FindLocationController extends GetxController {
  final WeatherAPI _weatherAPI = Get.find();

  final TextEditingController searchTextControllerCity =
      TextEditingController();
  final TextEditingController searchTextControllerLat = TextEditingController();
  final TextEditingController searchTextControllerLon = TextEditingController();

  final RxString searchTextCity = ''.obs;
  final RxString searchTextLat = ''.obs;
  final RxString searchTextLon = ''.obs;

  final isLoadingGetWeatherLatLon = false.obs;
  final isLoadingGetWeatherCity = false.obs;

  FocusNode focusNodeCity = FocusNode();
  FocusNode focusNodeLat = FocusNode();
  FocusNode focusNodeLon = FocusNode();

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

  RxBool get isLoading {
    return [
      isLoadingGetWeatherCity.value,
      isLoadingGetWeatherLatLon.value,
    ].atLeastOneTrue.obs;
  }

  @override
  void onInit() {
    super.onInit();
    searchTextControllerCity.addListener(() {
      searchTextCity.value = searchTextControllerCity.text;
    });
    searchTextControllerLat.addListener(() {
      searchTextLat.value = searchTextControllerLat.text;
    });
    searchTextControllerLon.addListener(() {
      searchTextLon.value = searchTextControllerLon.text;
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
    if (searchTextCity.isNotEmpty) {
      _getWeatherCity(searchTextCity.value);
    } else {
      showAlert(title: 'Error', message: 'Please fill the text field.');
    }
  }

  void getLatLon() {
    if (searchTextLat.isNotEmpty && searchTextLon.isNotEmpty) {
      _getWeatherLatLon(
        lat: double.tryParse(searchTextLat.toString()),
        lon: double.tryParse(searchTextLon.toString()),
      );
    } else {
      showAlert(title: 'Error', message: 'Please fill the text field.');
    }
  }

  void unFocusCity() {
    focusNodeCity.unfocus();
  }

  void unFocusLat() {
    focusNodeLat.unfocus();
  }

  void unFocusLon() {
    focusNodeLon.unfocus();
  }

  void unFocusMain() {
    focusNodeLon.unfocus();
    focusNodeLat.unfocus();
    focusNodeCity.unfocus();
  }

  void _getWeatherCity(
    String city,
  ) async {
    try {
      isLoadingGetWeatherCity(true);
      unFocusCity();
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
      unFocusCity();
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
