import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_pepe/app/core/api/weather_api.dart';
import 'package:weather_pepe/app/data/models/app_error_model.dart';
import 'package:weather_pepe/app/data/models/weather_model.dart';
import 'package:weather_pepe/app/extensions/bool_extension.dart';

class HomeController extends GetxController {
  final WeatherAPI _userAPI = Get.find();
  final TextEditingController searchTextController1 = TextEditingController();
  final TextEditingController searchTextController2 = TextEditingController();
  final TextEditingController searchTextController3 = TextEditingController();

  double temp = 0;

  final Rxn<Weather> weather = Rxn();
  late final double lat;
  late final double lon;
  late final String city;
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
    _determinePosition();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void test() {}

  @override
  void changeTemp() {
    temp = temp - 273.15;
  }

  void _getWeatherCity() async {
    try {
      isLoadingGetWeather(true);
      final result = await _userAPI.getWeatherCity(
        city: searchTextCity.value,
      );
      isLoadingGetWeather(false);
      weather.value = result;
    } catch (error) {
      isLoadingGetWeather(false);
      print((error as AppError).message);
    }
  }

  void _getWeatherLatLon({
    double? lat,
    double? lon,
  }) async {
    if (lat != null && lon != null) {
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
