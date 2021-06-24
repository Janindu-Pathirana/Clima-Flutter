import 'dart:convert';

import 'package:clima/utilities/constants.dart';
import 'package:http/http.dart' as http;

class Networking {
  final double latitude;
  final double longitude;

  Networking({this.latitude, this.longitude});

  Future getCity(String cityName) async {
    http.Response response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$kApiKey&units=metric'));

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print('Error Code');
      print(response.statusCode);
    }
  }

  Future getData() async {
    http.Response response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$kApiKey&units=metric'));

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print('Error Code');
      print(response.statusCode);
    }
  }
}
