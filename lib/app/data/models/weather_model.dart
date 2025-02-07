import 'package:get/get_utils/get_utils.dart';
import 'package:weather_pepe/app/constant/weather_icon_extension.dart';

class Weather {
  Coord? coord;
  List<WeatherDetail>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  Snow? snow;
  Rain? rain;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;
  String? message;

  Weather({
    this.coord,
    this.weather,
    this.name,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? Coord?.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = <WeatherDetail>[];
      json['weather'].forEach((v) {
        weather?.add(WeatherDetail.fromJson(v));
      });
    }

    main = json['main'] != null ? Main?.fromJson(json['main']) : null;

    wind = json['wind'] != null ? Wind?.fromJson(json['wind']) : null;
    snow = json['snow'] != null ? Snow?.fromJson(json['snow']) : null;
    rain = json['rain'] != null ? Rain?.fromJson(json['rain']) : null;

    clouds = json['clouds'] != null ? Clouds?.fromJson(json['clouds']) : null;

    sys = json['sys'] != null ? Sys?.fromJson(json['sys']) : null;

    name = json['name'];
    visibility = json['visibility'];

    cod = json['cod'];
    message = json['message'];
  }
}

class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = (json['lon'] as num?)?.toDouble();
    lat = (json['lat'] as num?)?.toDouble();
  }
}

class WeatherDetail {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherDetail({this.id, this.main, this.description, this.icon});

  WeatherDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}

class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});

  Main.fromJson(Map<String, dynamic> json) {
    temp = (json['temp'] as num?)?.toDouble();
    feelsLike = (json['feels_like'] as num?)?.toDouble();
    tempMin = (json['temp_min'] as num?)?.toDouble();
    tempMax = (json['temp_max'] as num?)?.toDouble();
    pressure = (json['pressure']);
    humidity = (json['humidity']);
  }
}

class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({this.speed, this.deg});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = (json['speed'] as num?)?.toDouble();
    deg = json['deg'];
    gust = (json['gust'] as num?)?.toDouble();
  }
}

class Clouds {
  int? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }
}

class Sys {
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  Sys.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
}

class Snow {
  double? d1h;
  double? d3h;

  Snow({this.d1h, this.d3h});

  Snow.fromJson(Map<String, dynamic> json) {
    d1h = (json['1h'] as num?)?.toDouble();
    d3h = (json['3h'] as num?)?.toDouble();
  }
}

class Rain {
  double? d1h;
  double? d3h;

  Rain({this.d1h, this.d3h});

  Rain.fromJson(Map<String, dynamic> json) {
    d1h = (json['1h'] as num?)?.toDouble();
    d3h = (json['3h'] as num?)?.toDouble();
  }
}

extension WeatherIconExtension on WeatherDetail {
  WeatherIcon? get weatherIcon {
    return WeatherIcon.values.firstWhereOrNull((e) => e.keyValue == icon);
  }
}
