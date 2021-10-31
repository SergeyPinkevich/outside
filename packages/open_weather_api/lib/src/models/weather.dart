class ForecastResponse {
  const ForecastResponse({
    required this.location,
    required this.currentWeather,
    required this.dailyForecast,
  });

  final LocationResponse location;
  final CurrentResponse currentWeather;
  final List<DailyForecastResponse> dailyForecast;

  factory ForecastResponse.fromJson(Map<String, dynamic> json) {
    return ForecastResponse(
      location: LocationResponse.fromJson(json),
      currentWeather: CurrentResponse.fromJson(json["current"]),
      dailyForecast: List.empty(),
    );
  }
}

class LocationResponse {
  const LocationResponse({
    required this.lattitude,
    required this.longitude,
    required this.timezone,
  });

  final double lattitude, longitude;
  final String timezone;

  factory LocationResponse.fromJson(Map<String, dynamic> json) {
    return LocationResponse(
      lattitude: double.tryParse(json['lat']) ?? 0,
      longitude: double.tryParse(json['lon']) ?? 0,
      timezone: json["timezone"],
    );
  }
}

class CurrentResponse {
  const CurrentResponse({
    required this.sunrise,
    required this.sunset,
    required this.pressure,
    required this.humidity,
    required this.temperature,
    required this.feelsLike,
  });

  final int sunrise, sunset;
  final int pressure, humidity;
  final int temperature;
  final double feelsLike;

  factory CurrentResponse.fromJson(Map<String, dynamic> json) {
    return CurrentResponse(
      sunrise: int.tryParse(json['sunrise']) ?? 0,
      sunset: int.tryParse(json['sunset']) ?? 0,
      pressure: int.tryParse(json['pressure']) ?? 0,
      humidity: int.tryParse(json['humidity']) ?? 0,
      temperature: double.tryParse(json['sunset'])?.toInt() ?? 0,
      feelsLike: double.tryParse(json['feels_like']) ?? 0,
    );
  }
}

class TemperatureResponse {
  const TemperatureResponse({
    required this.morning,
    required this.day,
    required this.evening,
    required this.night,
    required this.min,
    required this.max,
  });

  final double morning, day, evening, night;
  final double min, max;

  factory TemperatureResponse.fromJson(Map<String, dynamic> json) {
    return TemperatureResponse(
      morning: double.tryParse(json['morn']) ?? 0,
      day: double.tryParse(json['day']) ?? 0,
      evening: double.tryParse(json['eve']) ?? 0,
      night: double.tryParse(json['night']) ?? 0,
      min: double.tryParse(json['min']) ?? 0,
      max: double.tryParse(json['max']) ?? 0,
    );
  }
}

class DailyForecastResponse {
  const DailyForecastResponse({
    required this.temperature,
    required this.feels,
    required this.weather,
    required this.sunrise,
    required this.sunset,
  });

  final TemperatureResponse temperature;
  final FeelsResponse feels;
  final WeatherDescriptionResponse weather;
  final num sunrise, sunset;

  List<DailyForecastResponse> fromJson(Map<String, dynamic> json) {
    // TODO fix it
    return List<DailyForecastResponse>.empty();
  }
}

class FeelsResponse {
  const FeelsResponse({
    required this.morning,
    required this.day,
    required this.evening,
    required this.night,
  });

  final double morning, day, evening, night;

  factory FeelsResponse.fromJson(Map<String, dynamic> json) {
    return FeelsResponse(
      morning: double.tryParse(json['morn']) ?? 0,
      day: double.tryParse(json['day']) ?? 0,
      evening: double.tryParse(json['eve']) ?? 0,
      night: double.tryParse(json['night']) ?? 0,
    );
  }
}

class WeatherDescriptionResponse {
  const WeatherDescriptionResponse({
    required this.id,
    required this.main,
    required this.description,
  });

  final int id;
  final String main, description;

  factory WeatherDescriptionResponse.fromJson(Map<String, dynamic> json) {
    return WeatherDescriptionResponse(
      id: int.tryParse(json["id"]) ?? 0,
      main: json["main"] ?? "",
      description: json["description"] ?? "",
    );
  }
}
