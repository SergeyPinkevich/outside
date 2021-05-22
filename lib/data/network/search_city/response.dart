class SearchCityResponse {
  final List<SearchCityEntity> cities;

  SearchCityResponse({this.cities});

  factory SearchCityResponse.fromJson(Map<String, dynamic> json) {
    return SearchCityResponse(
      cities: (json["list"] as List)
          .map((foundCity) => SearchCityEntity.fromJson(foundCity))
          .toList(),
    );
  }
}

class SearchCityEntity {
  final int id;
  final String name;
  final String countryCode;
  final LocationEntity location;
  final double currentTemperature;

  SearchCityEntity({
    this.id,
    this.name,
    this.countryCode,
    this.location,
    this.currentTemperature,
  });

  factory SearchCityEntity.fromJson(Map<String, dynamic> json) {
    return SearchCityEntity(
      id: json["id"] as int,
      name: json["name"] as String,
      countryCode: json["sys"]["country"],
      location: LocationEntity.fromJson(json["coord"]),
      currentTemperature: json["main"]["temp"] as double,
    );
  }
}

class LocationEntity {
  final double lattitude, longitude;

  LocationEntity({
    this.lattitude,
    this.longitude,
  });

  factory LocationEntity.fromJson(Map<String, dynamic> json) {
    return LocationEntity(
      lattitude: json["lat"] as double,
      longitude: json["lon"] as double,
    );
  }
}
