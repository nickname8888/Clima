import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper({required this.url});
  final String url;

  Future getWeatherData() async {
    var newUrl = Uri.parse(url);
    http.Response response = await http.get(newUrl);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
