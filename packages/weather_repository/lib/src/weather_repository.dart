import 'dart:async';

import 'package:open_weather_api/open_weather_api.dart';
import 'package:open_weather_api/src/open_weather_api_client.dart';
import 'package:weather_repository/src/models/location.dart';
import 'package:weather_repository/weather_repository.dart';

class WeatherFailure implements Exception {}

class WeatherRepository {
  WeatherRepository({OpenWeatherApiClient? weatherApiClient})
      : _weatherApiClient = weatherApiClient ?? OpenWeatherApiClient();

  final OpenWeatherApiClient _weatherApiClient;

  Future<List<City>> searchCityByName(String cityName) async {
    SearchCityResponse searchCityResponse =
        await _weatherApiClient.searchCityByName(cityName);
    var cities = <City>[];
    searchCityResponse.cities?.forEach((element) {
      City city = City(
        id: element.id ?? 0,
        name: element.name ?? "",
        countryCode: element.countryCode?.country ?? "",
        location: Location(
          lattitude: element.location?.lattitude ?? 0.0,
          longitude: element.location?.longitude ?? 0.0,
        ),
        currentTemperature:
            _convertKelvinToCelsius(element.currentTemperature?.temp ?? 0.0),
      );
      cities.add(city);
    });
    return cities;
  }

  int _convertKelvinToCelsius(double kelvin) {
    return (kelvin - 273.15).toInt();
  }
}
