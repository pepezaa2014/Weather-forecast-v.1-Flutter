import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_pepe/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.weather01d).existsSync(), true);
    expect(File(Images.weather01n).existsSync(), true);
    expect(File(Images.weather02d).existsSync(), true);
    expect(File(Images.weather02n).existsSync(), true);
    expect(File(Images.weather03d).existsSync(), true);
    expect(File(Images.weather03n).existsSync(), true);
    expect(File(Images.weather04d).existsSync(), true);
    expect(File(Images.weather04n).existsSync(), true);
    expect(File(Images.weather09d).existsSync(), true);
    expect(File(Images.weather09n).existsSync(), true);
    expect(File(Images.weather10d).existsSync(), true);
    expect(File(Images.weather10n).existsSync(), true);
    expect(File(Images.weather11d).existsSync(), true);
    expect(File(Images.weather11n).existsSync(), true);
    expect(File(Images.weather13d).existsSync(), true);
    expect(File(Images.weather13n).existsSync(), true);
    expect(File(Images.weather50d).existsSync(), true);
    expect(File(Images.weather50n).existsSync(), true);
  });
}
