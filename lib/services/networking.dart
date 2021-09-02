import 'dart:convert';

import 'package:http/http.dart' as http;

const apiKey = 'e72ca729af228beabd5d20e3b7749713';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
