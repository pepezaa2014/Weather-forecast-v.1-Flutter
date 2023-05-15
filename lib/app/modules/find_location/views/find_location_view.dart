import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:weather_pepe/app/constant/app_colors.dart';
import 'package:weather_pepe/app/widgets/primary_button.dart';
import 'package:weather_pepe/app/widgets/text.dart';
import '../controllers/find_location_controller.dart';

class FindLocationView extends GetView<FindLocationController> {
  const FindLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: const Text('Search Location'),
              centerTitle: true,
            ),
            body: _body(),
          ),
          Obx(
            () {
              return _loadingWidget(
                controller.isLoading.value,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _loadingWidget(
    bool loading,
  ) {
    return Visibility(
      visible: loading,
      child: Positioned.fill(
        child: Container(
          color: Colors.white70,
          child: Center(
            child: Platform.isAndroid
                ? Container(
                    width: 100,
                    height: 80,
                    color: Colors.grey,
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Loading...',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SpinKitCircle(
                          color: Colors.amberAccent,
                          size: 36,
                        ),
                      ],
                    ),
                  )
                : const CupertinoActivityIndicator(radius: 16),
          ),
        ),
      ),
    );
  }

  _body() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.backgroudFindLocation,
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const SearchText(
              text: 'Search by City',
            ),
            SizedBox(
              height: 44,
              child: TextField(
                controller: controller.searchTextCityController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'City',
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.boderColor),
                  ),
                ),
              ),
            ),
            PrimaryButton(
              onPressed: controller.getCity,
            ),
            const Divider(
              color: AppColors.dividerColor,
              thickness: 2,
            ),
            const SearchText(
              text: 'Search by Latitude and Longitude',
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: TextField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      controller: controller.searchTextLatController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,99}')),
                      ],
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Latitude',
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: AppColors.boderColor),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: Align(
                      alignment: Alignment.center,
                      child: TextField(
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,99}')),
                        ],
                        controller: controller.searchTextLonController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Longitude',
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: AppColors.boderColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            PrimaryButton(
              onPressed: controller.getLatLon,
            ),
          ],
        ),
      ),
    );
  }
}
