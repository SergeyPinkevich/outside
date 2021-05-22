import 'package:outside/data/network/search_city/response.dart';
import 'package:outside/domain/city.dart';
import 'package:outside/domain/location.dart';

class SearchCityResponseMapper {
  List<City> map(List<SearchCityEntity> response) {
    if (response.isNotEmpty) {
      return response
          .map(
            (foundCity) => City(
              id: foundCity.id,
              name: foundCity.name,
              countryCode: foundCity.countryCode,
              location: _mapLocation(foundCity.location),
              currentTemperature:
                  _convertKelvenToCelsius(foundCity.currentTemperature),
            ),
          )
          .toList();
    } else {
      List.empty();
    }
  }

  Location _mapLocation(LocationEntity entity) {
    return Location(
      lattitude: entity.lattitude,
      longitude: entity.longitude,
    );
  }

  int _convertKelvenToCelsius(double kelvin) {
    return (kelvin - 273.15).toInt();
  }
}
