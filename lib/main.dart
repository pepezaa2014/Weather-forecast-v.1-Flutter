import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_pepe/app/core/api/weather_api.dart';
import 'package:weather_pepe/app/core/dio_client.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await _setupInstance();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Future<void> _setupInstance() async {
  Get.put(Dio());

  final Dio dio = Get.find();
  Get.put(
    DioClient(
      dio,
    ),
  );

  final DioClient dioClient = Get.find();
  Get.put(WeatherAPI(dioClient));

  return;
}
