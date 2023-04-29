import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_pepe/app/core/api/weather_api.dart';
import 'package:weather_pepe/app/data/models/app_error_model.dart';
import 'package:weather_pepe/app/data/models/weather_model.dart';
import 'package:weather_pepe/app/extensions/bool_extension.dart';
import 'package:intl/intl.dart';
import 'package:weather_pepe/app/routes/app_pages.dart';

class HomeController extends GetxController {
  final WeatherAPI _userAPI = Get.find();

  final Rxn<Weather> weather = Rxn();

  final isLoadingGetWeather = false.obs;

  RxBool get isLoading {
    return [
      isLoadingGetWeather.value,
    ].atLeastOneTrue.obs;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _determinePosition();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String convertUnix(String unix) {
    int intUnix = int.parse(unix);
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(intUnix * 1000);
    String formattedTime = DateFormat.yMMMMd().add_jms().format(dateTime);
    return formattedTime;
  }

  void goNext() async {
    final result = await Get.toNamed(Routes.FIND_LOCATION);
    weather.value = result;
    print(weather.value);
  }

  void getcurrentlocation() {
    _determinePosition();
  }

  double changeTemp(double? temp) {
    return temp = temp! - 273.15;
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
      weather.value = result;
    } catch (error) {
      isLoadingGetWeather(false);
      print((error as AppError).message);
    }
  }

  void _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    final location = await Geolocator.getCurrentPosition();
    _getWeatherLatLon(
      lat: location.latitude,
      lon: location.longitude,
    );
  }
}
