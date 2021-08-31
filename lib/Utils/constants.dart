// BASE
final String baseURL = "https://shazam.p.rapidapi.com/";

class Endpoint {
  static final recommenations = "songs/list-recommendations";
  static final search = "search";
}

class Params {
  static Map<String, String> getRecommendations(String key) {
    return {'key': key};
  }

  static Map<String, String> getSearch(String term) {
    return {'term': term};
  }
}
