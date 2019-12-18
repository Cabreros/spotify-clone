import 'dart:async';
import 'package:http/http.dart' as http;
import 'api_keys.dart';

String API_KEY = secretKey;

Future getGenres() async {
  try {
    var _baseURL =
        'https://api.spotify.com/v1/recommendations/available-genre-seeds';

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': API_KEY
    };

    var response = http.get(_baseURL, headers: headers);
    var data = response;
    return data;
  } catch (e) {
    print(e);
    return e;
  }
}
