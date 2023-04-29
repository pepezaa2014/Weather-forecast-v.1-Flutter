import 'package:get/get.dart';

import '../modules/find_location/bindings/find_location_binding.dart';
import '../modules/find_location/views/find_location_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.FIND_LOCATION,
      page: () => const FindLocationView(),
      binding: FindLocationBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
