// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchCityResponse _$SearchCityResponseFromJson(Map<String, dynamic> json) {
  return $checkedNew('SearchCityResponse', json, () {
    final val = SearchCityResponse(
      cities: $checkedConvert(
          json,
          'list',
          (v) => (v as List<dynamic>?)
              ?.map((e) => SearchCityEntity.fromJson(e as Map<String, dynamic>))
              .toList()),
    );
    return val;
  }, fieldKeyMap: const {'cities': 'list'});
}

SearchCityEntity _$SearchCityEntityFromJson(Map<String, dynamic> json) {
  return $checkedNew('SearchCityEntity', json, () {
    final val = SearchCityEntity(
      id: $checkedConvert(json, 'id', (v) => v as int?),
      name: $checkedConvert(json, 'name', (v) => v as String?),
      countryCode: $checkedConvert(
          json,
          'sys',
          (v) => v == null
              ? null
              : CountryCode.fromJson(v as Map<String, dynamic>)),
      location: $checkedConvert(
          json,
          'coord',
          (v) => v == null
              ? null
              : LocationEntity.fromJson(v as Map<String, dynamic>)),
      currentTemperature: $checkedConvert(
          json,
          'main',
          (v) => v == null
              ? null
              : CurrentTemperature.fromJson(v as Map<String, dynamic>)),
    );
    return val;
  }, fieldKeyMap: const {
    'countryCode': 'sys',
    'location': 'coord',
    'currentTemperature': 'main'
  });
}

CountryCode _$CountryCodeFromJson(Map<String, dynamic> json) {
  return $checkedNew('CountryCode', json, () {
    final val = CountryCode(
      country: $checkedConvert(json, 'country', (v) => v as String?),
    );
    return val;
  });
}

LocationEntity _$LocationEntityFromJson(Map<String, dynamic> json) {
  return $checkedNew('LocationEntity', json, () {
    final val = LocationEntity(
      lattitude: $checkedConvert(json, 'lat', (v) => (v as num?)?.toDouble()),
      longitude: $checkedConvert(json, 'lon', (v) => (v as num?)?.toDouble()),
    );
    return val;
  }, fieldKeyMap: const {'lattitude': 'lat', 'longitude': 'lon'});
}

CurrentTemperature _$CurrentTemperatureFromJson(Map<String, dynamic> json) {
  return $checkedNew('CurrentTemperature', json, () {
    final val = CurrentTemperature(
      temp: $checkedConvert(json, 'temp', (v) => (v as num?)?.toDouble()),
    );
    return val;
  });
}
