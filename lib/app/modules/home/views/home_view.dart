import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_pepe/app/constant/colors.dart';
import 'package:weather_pepe/app/data/models/weather_model.dart';
import 'package:weather_pepe/app/widgets/button.dart';
import 'package:weather_pepe/app/widgets/container.dart';
import 'package:weather_pepe/app/widgets/text.dart';
import 'package:weather_pepe/resources/resources.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: _drawer(),
      backgroundColor: WidgetColor.appBar,
      appBar: _appbar(),
      body: _body(),
    );
  }

  _drawer() {
    return Drawer(
      backgroundColor: WidgetColor.appBar,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 16,
            ),
            child: ExpansionTile(
              leading: const Icon(
                Icons.search,
                color: Colors.white,
                size: 24.0,
              ),
              title: const SearchLatLonText(
                text: 'Search By City Name',
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    controller: controller.searchTextController1,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'City',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SecondaryButton(
                  onPressed: controller.getcity,
                ),
              ],
            ),
          ),
          ExpansionTile(
            leading: const Icon(
              Icons.search,
              color: Colors.white,
              size: 24.0,
            ),
            title: const SearchLatLonText(
              text: 'Search By Latitude and Longitude',
            ),
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: TextField(
                        controller: controller.searchTextController2,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Latitude',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                        ),
                        // onChanged: controller.searchHero,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: TextField(
                        controller: controller.searchTextController3,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Longitude',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SecondaryButton(
                onPressed: controller.getLatLon,
              ),
            ],
          ),
          ListTile(
            title: Container(
              child: const Text(
                textAlign: TextAlign.center,
                'Get Current Location',
                style: TextStyle(
                  color: Colors.yellowAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onTap: () => controller.getcurrentlocation(),
          ),
        ],
      ),
    );
  }

  _appbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    );
  }

  _body() {
    return Obx(() {
      final weathers = controller.weather.value;

      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              weathers!.weather![0].icon.toString().contains('d')
                  ? ImageName.day
                  : ImageName.night,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              weathers.weather![0].icon.toString().contains('d')
                  ? onTheTopDay(
                      title: weathers.name.toString(),
                      country: weathers.sys!.country.toString(),
                      temp: controller
                          .changeTemp(weathers.main!.temp)
                          .toStringAsFixed(1),
                      high: controller
                          .changeTemp(weathers.main!.tempMax)
                          .toStringAsFixed(1),
                      low: controller
                          .changeTemp(weathers.main!.tempMin)
                          .toStringAsFixed(1),
                      status: weathers.weather![0].description.toString(),
                      lat: weathers.coord!.lat.toString(),
                      lon: weathers.coord!.lon.toString(),
                    )
                  : onTheTopNight(
                      title: weathers.name.toString(),
                      country: weathers.sys!.country.toString(),
                      temp: controller
                          .changeTemp(weathers.main!.temp)
                          .toStringAsFixed(1),
                      high: controller
                          .changeTemp(weathers.main!.tempMax)
                          .toStringAsFixed(1),
                      low: controller
                          .changeTemp(weathers.main!.tempMin)
                          .toStringAsFixed(1),
                      status: weathers.weather![0].description.toString(),
                      lat: weathers.coord!.lat.toString(),
                      lon: weathers.coord!.lon.toString(),
                    ),
              MainContainer(
                sunrise:
                    controller.convertUnix(weathers.sys!.sunrise.toString()),
                sunset: controller.convertUnix(weathers.sys!.sunset.toString()),
                pressure: weathers.main!.pressure.toString(),
                humidity: weathers.main!.humidity.toString(),
                windDeg: weathers.wind!.speed.toString(),
                windSpeed: weathers.wind!.deg.toString(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
