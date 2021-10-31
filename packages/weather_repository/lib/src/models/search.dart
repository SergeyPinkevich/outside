import 'package:weather_repository/src/models/location.dart';

class City {
  const City({
    required this.id,
    required this.name,
    required this.countryCode,
    required this.location,
    required this.currentTemperature,
  });

  final int id;
  final String name;
  final String countryCode;
  final Location location;
  final int currentTemperature;
}
