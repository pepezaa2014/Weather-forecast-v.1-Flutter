import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_pepe/app/constant/app_colors.dart';
import 'package:weather_pepe/app/utils/loading_indicator.dart';
import 'package:weather_pepe/app/widgets/button.dart';
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
            () => loadingIndicator(controller.isLoading.value),
          ),
        ],
      ),
    );
  }

  _body() {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.backgroudFindLocation,
        ),
        alignment: Alignment.center,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
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
                SecondaryButton(
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
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          controller: controller.searchTextLatController,
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
                            controller: controller.searchTextLonController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              hintText: 'Longitude',
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: AppColors.boderColor),
                              ),
                            ),
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
      ),
    );
  }
}
