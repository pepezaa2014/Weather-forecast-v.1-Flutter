import 'package:dio/dio.dart';
import 'package:weather_pepe/app/core/dio_client.dart';
import 'package:weather_pepe/app/core/handle_exceptions.dart';
import 'package:weather_pepe/app/core/routers/weather_router.dart';

import 'package:weather_pepe/app/data/models/weather_model.dart';

class WeatherAPI {
  final DioClient _dioClient;
  static const appId = '0eafb021692ca4ef0023a949b154692d';
  WeatherAPI(this._dioClient);

  Future<Weather> getWeatherLatLon({
    required double lat,
    required double lon,
  }) async {
    try {
      final Response response = await _dioClient.get(
        WeatherRouter.getWeather,
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'appid': appId,
        },
      );

      return Weather.fromJson(response.data);
    } catch (e) {
      throw HandleExceptions.handleError(e);
    }
  }

  Future<Weather> getWeatherCity({
    required String city,
  }) async {
    try {
      final Response response = await _dioClient.get(
        WeatherRouter.getWeather,
        queryParameters: {
          'q': city,
          'appid': appId,
        },
      );

      return Weather.fromJson(response.data);
    } catch (e) {
      throw HandleExceptions.handleError(e);
    }
  }
}
