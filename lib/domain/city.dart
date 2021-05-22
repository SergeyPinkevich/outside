import 'package:outside/domain/location.dart';

class City {
  final int id;
  final String name;
  final String countryCode;
  final Location location;
  final int currentTemperature;

  City({
    this.id,
    this.name,
    this.countryCode,
    this.location,
    this.currentTemperature,
  });
}
