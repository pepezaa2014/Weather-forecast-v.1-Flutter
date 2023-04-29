import 'package:weather_pepe/resources/resources.dart';

enum WeatherIcon {
  weather01d,
  weather01n,
  weather02n,
  weather02d,
  weather03n,
  weather03d,
  weather04n,
  weather04d,
  weather09n,
  weather09d,
  weather10n,
  weather10d,
  weather11n,
  weather11d,
  weather13n,
  weather13d,
  weather50n,
  weather50d,
}

extension WeatherExtension on WeatherIcon {
  String get imageName {
    switch (this) {
      case WeatherIcon.weather01d:
        return ImageName.weather01d;
      case WeatherIcon.weather01n:
        return ImageName.weather01n;
      case WeatherIcon.weather02d:
        return ImageName.weather02d;
      case WeatherIcon.weather02n:
        return ImageName.weather02n;
      case WeatherIcon.weather03d:
        return ImageName.weather03d;
      case WeatherIcon.weather03n:
        return ImageName.weather03n;
      case WeatherIcon.weather04d:
        return ImageName.weather04d;
      case WeatherIcon.weather04n:
        return ImageName.weather04n;
      case WeatherIcon.weather09d:
        return ImageName.weather09d;
      case WeatherIcon.weather09n:
        return ImageName.weather09n;
      case WeatherIcon.weather10d:
        return ImageName.weather10d;
      case WeatherIcon.weather10n:
        return ImageName.weather10n;
      case WeatherIcon.weather11d:
        return ImageName.weather11d;
      case WeatherIcon.weather11n:
        return ImageName.weather11n;
      case WeatherIcon.weather13d:
        return ImageName.weather13d;
      case WeatherIcon.weather13n:
        return ImageName.weather13n;
      case WeatherIcon.weather50d:
        return ImageName.weather50d;
      case WeatherIcon.weather50n:
        return ImageName.weather50n;
    }
  }
}

class Weather {
  Coord? coord;
  List<WeatherDetail>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  Weather(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  Weather.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? Coord?.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = <WeatherDetail>[];
      json['weather'].forEach((v) {
        weather?.add(WeatherDetail.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? Main?.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? Wind?.fromJson(json['wind']) : null;
    clouds = json['clouds'] != null ? Clouds?.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? Sys?.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (coord != null) {
      data['coord'] = coord?.toJson();
    }
    if (weather != null) {
      data['weather'] = weather?.map((v) => v.toJson()).toList();
    }
    data['base'] = base;
    if (main != null) {
      data['main'] = main?.toJson();
    }
    data['visibility'] = visibility;
    if (wind != null) {
      data['wind'] = wind?.toJson();
    }
    if (clouds != null) {
      data['clouds'] = clouds?.toJson();
    }
    data['dt'] = dt;
    if (sys != null) {
      data['sys'] = sys?.toJson();
    }
    data['timezone'] = timezone;
    data['id'] = id;
    data['name'] = name;
    data['cod'] = cod;
    return data;
  }
}

class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
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

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
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
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    return data;
  }
}

class Wind {
  double? speed;
  int? deg;

  Wind({this.speed, this.deg});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    return data;
  }
}

class Clouds {
  int? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['all'] = all;
    return data;
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

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['country'] = country;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}
