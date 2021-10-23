import 'package:weatherapp_with_bloc/data/weather_api_client.dart';
import 'package:weatherapp_with_bloc/locator.dart';
import 'package:weatherapp_with_bloc/models/weather.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();
  Future<Weather> getWeather(String sehir) async {
    final int sehirID = await weatherApiClient.getLocationID(sehir);

    return await weatherApiClient.getWeather(sehirID);
  }
}
