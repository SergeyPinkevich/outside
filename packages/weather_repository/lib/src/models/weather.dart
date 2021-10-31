import 'package:weather_repository/src/models/location.dart';

class Weather {
  final Location location;
  final Forecast current;
  final List<Forecast> forecastForWeek;

  Weather({
    required this.location,
    required this.current,
    required this.forecastForWeek,
  });
}

class Forecast {
  final DateTime sunrise, sunset;
  final int pressure, humidity;
  final double windSpeed;
  final WindDirection windDirection;
  final Temperature temperature;

  const Forecast({
    required this.sunrise,
    required this.sunset,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.windDirection,
    required this.temperature,
  });
}

enum WindDirection {
  NORTH,
  NORTH_EAST,
  EAST,
  SOUTH_EAST,
  SOUTH,
  SOUTH_WEST,
  WEST,
  NORTH_WEST
}

class Temperature {
  const Temperature({
    required this.morning,
    required this.day,
    required this.evening,
    required this.night,
    required this.min,
    required this.max,
  });

  final double morning, day, evening, night;
  final double min, max;
}
