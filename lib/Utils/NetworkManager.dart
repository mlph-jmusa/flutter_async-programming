// ignore_for_file: file_names
import 'dart:convert';

import 'package:exercise_asynchronous_programming/Utils/constants.dart';

import 'recommendationResponse.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

Map<String, String> headers = {
  'x-rapidapi-key': "dd5fc86726msh6f0f5403442d9e1p103e9cjsn1f95d15e5268",
  'x-rapidapi-host': "shazam.p.rapidapi.com"
};

Future<RecommendationResponse> getRecommendations(String key) async {
  final queryString =
      Uri(queryParameters: Params.getRecommendations(key)).query;
  final endpointURL = baseURL + Endpoint.recommenations;

  String requestURL = endpointURL + '?' + queryString;

  var response = await http.get(Uri.parse(requestURL), headers: headers);

  if (response.statusCode == 200) {
    return RecommendationResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Something went wrong');
  }
}