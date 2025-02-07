import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_pepe/app/core/api/weather_api.dart';
import 'package:weather_pepe/app/data/models/app_error_model.dart';
import 'package:weather_pepe/app/data/models/weather_model.dart';
import 'package:weather_pepe/app/extensions/bool_extension.dart';
import 'package:weather_pepe/app/routes/app_pages.dart';
import 'package:weather_pepe/app/utils/show_alert.dart';

class HomeController extends GetxController {
  final WeatherAPI _weatherAPI = Get.find();

  late final Rxn<Weather> weather = Rxn();

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

  void goNext() async {
    final result = await Get.toNamed(Routes.FIND_LOCATION);
    final tempWeather = result as Weather?;
    if (tempWeather != null) {
      weather.value = tempWeather;
    }
  }

  void getCurrentLocation() {
    _determinePosition();
  }

  void _getWeatherLatLon({
    required double lat,
    required double lon,
  }) async {
    try {
      isLoadingGetWeather(true);
      final result = await _weatherAPI.getWeatherLatLon(
        lat: lat,
        lon: lon,
      );
      isLoadingGetWeather(false);
      weather.value = result;
    } catch (error) {
      isLoadingGetWeather(false);
      showAlert(
        title: 'Error',
        message: (error as AppError).message,
      );
    }
  }

  void _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showAlert(
        title: 'Error',
        message: 'Location services are disabled.',
      );
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showAlert(
          title: 'Error',
          message: 'Location permissions are denied',
        );
      }
    }
    if (permission == LocationPermission.deniedForever) {
      showAlert(
        title: 'Error',
        message:
            'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
    final location = await Geolocator.getCurrentPosition();
    _getWeatherLatLon(
      lat: location.latitude,
      lon: location.longitude,
    );
  }
}
