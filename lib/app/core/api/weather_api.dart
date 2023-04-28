import 'package:dio/dio.dart';
import 'package:weather_pepe/app/core/dio_client.dart';
import 'package:weather_pepe/app/core/handle_exceptions.dart';
import 'package:weather_pepe/app/core/routers/weather_router.dart';

import 'package:flutter/widgets.dart';
import 'package:weather_pepe/app/core/dio_client.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_pepe/app/data/models/weather_model.dart';

class WeatherAPI {
  final DioClient _dioClient;

  WeatherAPI(this._dioClient);

  Future<List<Weather>> getWeather() async {
    try {
      final Response response = await _dioClient.get(
        WeatherRouter.getWeather,
      );

      List<Weather> result = [];
      if (response.data is List) {
        response.data.forEach((e) {
          result.add(Weather.fromJson(e));
        });
      }
      return result;
    } catch (e) {
      throw HandleExceptions.handleError(e);
    }
  }
}
