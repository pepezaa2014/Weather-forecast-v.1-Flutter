import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_pepe/app/constant/colors.dart';
import 'package:weather_pepe/app/data/models/weather_model.dart';
import 'package:weather_pepe/app/widgets/button.dart';
import 'package:weather_pepe/app/widgets/container.dart';
import 'package:weather_pepe/app/widgets/text.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: _drawer(),
      backgroundColor: WidgetColor.themeApp,
      appBar: _appbar(),
      body: _body(),
    );
  }

  _drawer() {
    return Drawer(
      backgroundColor: WidgetColor.themeApp,
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
              title: const LatLonText(text: 'Search By City Name'),
              children: [
                TextField(
                  controller: controller.searchTextController1,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'City',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                  // onChanged: controller.searchHero,
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
            title: const LatLonText(text: 'Search By Latitude and Longitude'),
            children: [
              Row(
                children: [
                  Expanded(
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
                  Expanded(
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
                      // onChanged: controller.searchHero,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  _appbar() {
    return AppBar(
      backgroundColor: WidgetColor.appBar,
      title: const AppbarText(text: 'Forecast'),
      centerTitle: true,
    );
  }

  _body() {
    return Obx(() {
      return Center(
        child: Column(
          children: [
            TitleText(text: 'testtext'),
            TempText(text: 16.toString()),
            StatusText(text: 'Clearly'),
            LatLonText(text: '86, 86'),
            MainContainer(),
            Expanded(
              child: PrimaryButton(
                onPressed: controller.test,
              ),
            ),
          ],
        ),
      );
    });
  }
}
