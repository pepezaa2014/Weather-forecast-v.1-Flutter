import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_pepe/app/constant/used_widget_color.dart';
import 'package:weather_pepe/app/utils/loading_indicator.dart';
import 'package:weather_pepe/app/widgets/button.dart';
import 'package:weather_pepe/app/widgets/text.dart';

import '../controllers/find_location_controller.dart';

class FindLocationView extends GetView<FindLocationController> {
  const FindLocationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Search Location'),
            centerTitle: true,
          ),
          body: _body(),
        ),
        Obx(
          () => loadingIndicator(controller.isLoadingLatLon.value),
        ),
      ],
    );
  }

  _body() {
    return GestureDetector(
      onTap: () => controller.unFocusMain,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: UseWidgetColor.backgroudFindLocation,
        ),
        alignment: Alignment.center,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            controller.unFocusMain();
          },
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
                    focusNode: controller.focusNodeCity,
                    controller: controller.searchTextControllerCity,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'City',
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SecondaryButton(
                  onPressed: controller.getCity,
                ),
                const Divider(
                  color: UseWidgetColor.dividerColor,
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
                          focusNode: controller.focusNodeLat,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          controller: controller.searchTextControllerLat,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Latitude',
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.white),
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
                            focusNode: controller.focusNodeLon,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            controller: controller.searchTextControllerLon,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              hintText: 'Longitude',
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Colors.white),
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
