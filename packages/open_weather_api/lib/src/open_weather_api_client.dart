import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;
import 'package:open_weather_api/open_weather_api.dart';

/// Exception thrown when locationSearch fails.
class LocationIdRequestFailure implements Exception {}

/// Exception thrown when the provided location is not found.
class LocationNotFoundFailure implements Exception {}

/// Exception thrown when getWeather fails.
class WeatherRequestFailure implements Exception {}

/// Exception thrown when weather for provided location is not found.
class WeatherNotFoundFailure implements Exception {}

/// Exception thrown when API_KEY variable is not in .env file
class ApiKeyNotFound implements Exception {}

/// {@template open_weather_api_client}
/// Dart API Client which wraps the [Open Weather API](https://openweathermap.org/api).
/// {@endtemplate}
class OpenWeatherApiClient {
  /// {@macro open_weather_api_client}
  OpenWeatherApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'www.openweathermap.org';
  final http.Client _httpClient;

  final String? apiKey = dotenv.env['API_KEY'];

  /// Finds a [SearchCityResponse] `data/2.5/find?q=(cityName)`.
  Future<SearchCityResponse> searchCityByName(String cityName) async {
    if (apiKey == null) {
      throw ApiKeyNotFound();
    }
    final searchCityRequest = Uri.https(
      _baseUrl,
      '/data/2.5/find',
      <String, String>{
        'q': cityName,
        'sort': 'population',
        'cnt': '30',
        'appid': apiKey ?? ""
      },
    );
    final searchCityResponse = await _httpClient.get(searchCityRequest);

    if (searchCityResponse.statusCode != 200) {
      throw LocationIdRequestFailure();
    }

    final searchCityJson = jsonDecode(
      searchCityResponse.body,
    ) as Map<String, dynamic>;

    if (searchCityJson.isEmpty) {
      throw LocationNotFoundFailure();
    }

    return SearchCityResponse.fromJson(searchCityJson);
  }

  /// Fetches [ForecastResponse] for a given [lattitude, longitude].
  Future<ForecastResponse> getForecast(
    double lattitude,
    double longitude,
  ) async {
    if (apiKey == null) {
      throw ApiKeyNotFound();
    }
    final forecastRequest = Uri.https(
      _baseUrl,
      '/data/2.5/onecall',
      <String, String>{
        'lat': lattitude.toString(),
        'lon': longitude.toString(),
        'exclude': 'minutely',
        'units': 'metric',
        'appid': apiKey ?? ""
      },
    );
    final forecstResponse = await _httpClient.get(forecastRequest);

    if (forecstResponse.statusCode != 200) {
      throw WeatherRequestFailure();
    }

    final bodyJson = jsonDecode(forecstResponse.body) as Map<String, dynamic>;

    if (bodyJson.isEmpty) {
      throw WeatherNotFoundFailure();
    }

    if (bodyJson.isEmpty) {
      throw WeatherNotFoundFailure();
    }

    return ForecastResponse.fromJson(bodyJson as Map<String, dynamic>);
  }
}
