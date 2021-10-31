import 'package:json_annotation/json_annotation.dart';

part 'search.g.dart';

@JsonSerializable()
class SearchCityResponse {
  const SearchCityResponse({
    required this.cities,
  });

  @JsonKey(name: 'list')
  final List<SearchCityEntity>? cities;

  factory SearchCityResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchCityResponseFromJson(json);
}

@JsonSerializable()
class SearchCityEntity {
  const SearchCityEntity({
    required this.id,
    required this.name,
    required this.countryCode,
    required this.location,
    required this.currentTemperature,
  });

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'sys')
  final CountryCode? countryCode;
  @JsonKey(name: 'coord')
  final LocationEntity? location;
  @JsonKey(name: 'main')
  final CurrentTemperature? currentTemperature;

  factory SearchCityEntity.fromJson(Map<String, dynamic> json) =>
      _$SearchCityEntityFromJson(json);
}

@JsonSerializable()
class CountryCode {
  CountryCode({
    required this.country,
  });

  @JsonKey(name: 'country')
  final String? country;

  factory CountryCode.fromJson(Map<String, dynamic> json) =>
      _$CountryCodeFromJson(json);
}

@JsonSerializable()
class LocationEntity {
  LocationEntity({
    required this.lattitude,
    required this.longitude,
  });

  @JsonKey(name: 'lat')
  final double? lattitude;
  @JsonKey(name: 'lon')
  final double? longitude;

  factory LocationEntity.fromJson(Map<String, dynamic> json) =>
      _$LocationEntityFromJson(json);
}

@JsonSerializable()
class CurrentTemperature {
  CurrentTemperature({
    required this.temp,
  });

  @JsonKey(name: 'temp')
  final double? temp;

  factory CurrentTemperature.fromJson(Map<String, dynamic> json) =>
      _$CurrentTemperatureFromJson(json);
}
