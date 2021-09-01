// Constants file
const String baseURL = "https://shazam.p.rapidapi.com/";

class Endpoint {
  static const recommenations = "songs/list-recommendations";
  static const search = "search";
}

// * Parameters for each endpoints
class Params {
  static Map<String, String> getRecommendations(String key) {
    return {'key': key};
  }

  static Map<String, String> searchTracks(String term) {
    return {'term': term};
  }
}
