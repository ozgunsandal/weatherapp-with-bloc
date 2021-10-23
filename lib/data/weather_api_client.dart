import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp_with_bloc/models/weather.dart';

class WeatherApiClient {
  static const String baseURL = 'https://www.metaweather.com/';
  final http.Client httpClient = http.Client();

  Future<int> getLocationID(String sehirAdi) async {
    final sehirURL = baseURL + '/api/location/search/?query=' + sehirAdi;
    http.Response gelenCevap = await httpClient.get(Uri.parse(sehirURL));

    if (gelenCevap.statusCode != 200) {
      throw Exception('Veri Getirilemedi');
    }
    final gelenCevapJSON = (jsonDecode(gelenCevap.body)) as List;
    return gelenCevapJSON[0]['woeid'];
  }

  Future<Weather> getWeather(int sehirID) async {
    final havaDurumuURL = baseURL + '/api/location/' + sehirID.toString();
    http.Response havaDurumuGelenCevap =
        await httpClient.get(Uri.parse(havaDurumuURL));

    if (havaDurumuGelenCevap.statusCode != 200) {
      throw Exception('Hava Durumu Getirilemedi');
    }
    final havaDurumuCevapJSON = jsonDecode(havaDurumuGelenCevap.body);
    return Weather.fromJson(havaDurumuCevapJSON);
  }
}
