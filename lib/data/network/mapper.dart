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
              location: _mapLocation(foundCity.location),
              currentTemperature: foundCity.currentTemperature.toInt(),
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
}
