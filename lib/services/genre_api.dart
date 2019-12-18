import 'dart:async';
import 'package:http/http.dart' as http;

Future getGenres() async {
  try {
    var _baseURL =
        'https://api.spotify.com/v1/recommendations/available-genre-seeds';

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer BQDl4je4Z30BGc60XmKiiaLtn-9xboG5gfHejwhtv30lUwYe3Pd2FhiUJoTDKR93HXYu85olm6j8iPxX86TlFCmRAEsvUASWMczaQkKbSemcwqbWkYYOoJgTmVEmUkvmKaNr7DmCyKPI7ZOmGJ_p',
    };

    var response = http.get(_baseURL, headers: headers);
    var data = response;
    return data;
  } catch (e) {
    print(e);
    return e;
  }
}
