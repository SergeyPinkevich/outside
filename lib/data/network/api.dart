import 'package:http/http.dart' as http;
import 'package:outside/data/network/mapper.dart';
import 'package:outside/data/network/search_city/response.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:outside/domain/city.dart';

String API_KEY = env['API_KEY'];
String URL = "https://openweathermap.org/data/2.5/find?" + "appid=" + API_KEY;

Future<List<City>> searchCityByName(String query) async {
  final response = await http.get(URL + "&q=" + query);
  if (response.statusCode == 200) {
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    SearchCityResponse parsedResponse =
        SearchCityResponse.fromJson(responseBody);
    SearchCityResponseMapper responseMapper = SearchCityResponseMapper();
    return responseMapper.map(parsedResponse.cities);
  } else {
    throw Exception('Failed to search city by name');
  }
}
