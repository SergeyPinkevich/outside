import 'package:outside/domain/location.dart';

class City {
  final int id;
  final String name;
  final Location location;
  final int currentTemperature;

  City({
    this.id,
    this.name,
    this.location,
    this.currentTemperature,
  });
}
