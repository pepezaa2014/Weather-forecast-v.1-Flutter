import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_pepe/app/widgets/button.dart';
import 'package:weather_pepe/app/widgets/text.dart';

import '../controllers/find_location_controller.dart';

class FindLocationView extends GetView<FindLocationController> {
  const FindLocationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Location'),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color.fromARGB(144, 131, 190, 166),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SearchText(
                text: 'Search by City',
              ),
              TextField(
                controller: controller.searchTextController1,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'City',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SecondaryButton(
                onPressed: controller.getcity,
              ),
              const Divider(
                color: Colors.amber,
                thickness: 2,
              ),
              const SearchText(
                text: 'Search by Latitude and Longitude',
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.searchTextController2,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Latitude',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: controller.searchTextController3,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Longitude',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SecondaryButton(
                onPressed: controller.getLatLon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
