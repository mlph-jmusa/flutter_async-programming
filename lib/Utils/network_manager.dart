import 'dart:convert';
import 'package:exercise_asynchronous_programming/Utils/constants.dart';
import 'track.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

// * Headers for Shazamp API
Map<String, String> headers = {
  'x-rapidapi-key': "dd5fc86726msh6f0f5403442d9e1p103e9cjsn1f95d15e5268",
  'x-rapidapi-host': "shazam.p.rapidapi.com"
};

// * Method for getting recommendations tracks with key parameter.
Future<List<Track>> getRecommendations(String key) async {
  // * Assemble the query string (parameters in url)
  final queryString =
      Uri(queryParameters: Params.getRecommendations(key)).query;
  final endpointURL = baseURL + Endpoint.recommenations;

  String requestURL = endpointURL + '?' + queryString;

  var response = await http.get(Uri.parse(requestURL), headers: headers);

  if (response.statusCode == 200) {
    // if success map to Array tracks
    return jsonDecode(response.body)['tracks']
        .map<Track>((e) => Track.fromJson(e))
        .toList();
  } else {
    // else throw an excetion with message
    throw Exception('Something went wrong');
  }
}

// * Method for searching tracks with term parameter.
Future<List<Track>> searchTracks(String term) async {
  final queryString = Uri(queryParameters: Params.searchTracks(term)).query;
  final endpointURL = baseURL + Endpoint.search;

  String requestURL = endpointURL + '?' + queryString;

  var response = await http.get(Uri.parse(requestURL), headers: headers);

  if (response.statusCode == 200) {
    // if success map to Array tracks
    return jsonDecode(response.body)["tracks"]["hits"]
        .map<Track>((e) => Track.fromJson(e['track']))
        .toList();
  } else {
    // else throw an excetion with message
    throw Exception('Something went wrong');
  }
}
